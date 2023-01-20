﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.IO;
using System.Net;
using System.Threading;
using DevManager.methods;
using System.Net.Sockets;

namespace DevManager.httpserver
{


        public class HttpProcessor
        {
            public TcpClient socket;
            public HttpServer srv;

            private Stream inputStream;
            public StreamWriter outputStream;

            public String http_method;
            public String http_url;
            public String http_protocol_versionstring;
            public Hashtable httpHeaders = new Hashtable();


            private static int MAX_POST_SIZE = 10 * 1024 * 1024; // 10MB

            public HttpProcessor(TcpClient s, HttpServer srv)
            {
                this.socket = s;
                this.srv = srv;
            }


            private string streamReadLine(Stream inputStream)
            {
                int next_char;
                string data = "";
                while (true)
                {
                    next_char = inputStream.ReadByte();
                    if (next_char == '\n') { break; }
                    if (next_char == '\r') { continue; }
                    if (next_char == -1) { Thread.Sleep(1); continue; };
                    data += Convert.ToChar(next_char);
                }
                return data;
            }
            public void process()
            {
                // we can't use a StreamReader for input, because it buffers up extra data on us inside it's
                // "processed" view of the world, and we want the data raw after the headers
                inputStream = new BufferedStream(socket.GetStream());

                // we probably shouldn't be using a streamwriter for all output from handlers either
                outputStream = new StreamWriter(new BufferedStream(socket.GetStream()));
                try
                {
                    parseRequest();
                    readHeaders();
                    if (http_method.Equals("GET"))
                    {
                        handleGETRequest();
                    }
                    else if (http_method.Equals("POST"))
                    {
                        handlePOSTRequest();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Exception: " + e.ToString());
                    writeFailure();
                }
                outputStream.Flush();
                // bs.Flush(); // flush any remaining output
                inputStream = null; outputStream = null; // bs = null;            
                socket.Close();
            }

            public void parseRequest()
            {
                String request = streamReadLine(inputStream);
                string[] tokens = request.Split(' ');
                if (tokens.Length != 3)
                {
                    throw new Exception("invalid http request line");
                }
                http_method = tokens[0].ToUpper();
                http_url = tokens[1];
                http_protocol_versionstring = tokens[2];

                Console.WriteLine("starting: " + request);
            }

            public void readHeaders()
            {
                Console.WriteLine("readHeaders()");
                String line;
                while ((line = streamReadLine(inputStream)) != null)
                {
                    if (line.Equals(""))
                    {
                        Console.WriteLine("got headers");
                        return;
                    }

                    int separator = line.IndexOf(':');
                    if (separator == -1)
                    {
                        throw new Exception("invalid http header line: " + line);
                    }
                    String name = line.Substring(0, separator);
                    int pos = separator + 1;
                    while ((pos < line.Length) && (line[pos] == ' '))
                    {
                        pos++; // strip any spaces
                    }

                    string value = line.Substring(pos, line.Length - pos);
                    Console.WriteLine("header: {0}:{1}", name, value);
                    httpHeaders[name] = value;
                }
            }

            public void handleGETRequest()
            {
                srv.handleGETRequest(this);
            }

            private const int BUF_SIZE = 4096;
            public void handlePOSTRequest()
            {
                // this post data processing just reads everything into a memory stream.
                // this is fine for smallish things, but for large stuff we should really
                // hand an input stream to the request processor. However, the input stream 
                // we hand him needs to let him see the "end of the stream" at this content 
                // length, because otherwise he won't know when he's seen it all! 

                Console.WriteLine("get post data start");
                int content_len = 0;
                MemoryStream ms = new MemoryStream();
                if (this.httpHeaders.ContainsKey("Content-Length"))
                {
                    content_len = Convert.ToInt32(this.httpHeaders["Content-Length"]);
                    if (content_len > MAX_POST_SIZE)
                    {
                        throw new Exception(
                            String.Format("POST Content-Length({0}) too big for this simple server",
                              content_len));
                    }
                    byte[] buf = new byte[BUF_SIZE];
                    int to_read = content_len;
                    while (to_read > 0)
                    {
                       // Console.WriteLine("starting Read, to_read={0}", to_read);

                        int numread = this.inputStream.Read(buf, 0, Math.Min(BUF_SIZE, to_read));
                       // Console.WriteLine("read finished, numread={0}", numread);
                        if (numread == 0)
                        {
                            if (to_read == 0)
                            {
                                break;
                            }
                            else
                            {
                                throw new Exception("client disconnected during post");
                            }
                        }
                        to_read -= numread;
                        ms.Write(buf, 0, numread);
                    }
                    ms.Seek(0, SeekOrigin.Begin);
                }
                Console.WriteLine("get post data end");
                srv.handlePOSTRequest(this, new StreamReader(ms));

            }

            public void writeSuccess()
            {
                outputStream.WriteLine("HTTP/1.0 200 OK");
                outputStream.WriteLine("Content-Type: text/html;charset=utf-8");
                outputStream.WriteLine("Connection: close");
                outputStream.WriteLine("");
            }

            public void writeFailure()
            {
                outputStream.WriteLine("HTTP/1.0 404 File not found");
                outputStream.WriteLine("Connection: close");
                outputStream.WriteLine("");
            }
        }

        public abstract class HttpServer
        {

            protected int port;
            TcpListener listener;
            IPAddress localaddr = IPAddress.Parse("0.0.0.0");         //实例化IP地址
            bool is_active = true;

            public HttpServer(int port)
            {
                this.port = port;
            }

            public void listen()
            {
                //listener = new TcpListener(port);  //
                listener = new TcpListener(localaddr, port);
                listener.Start();
                while (is_active)
                {
                    TcpClient s = listener.AcceptTcpClient();
                    HttpProcessor processor = new HttpProcessor(s, this);
                    Thread thread = new Thread(new ThreadStart(processor.process));
                    thread.IsBackground = true;
                    thread.Start();
                    Thread.Sleep(1);
                }
            }

            public abstract void handleGETRequest(HttpProcessor p);
            public abstract void handlePOSTRequest(HttpProcessor p, StreamReader inputData);
        }


        public class MiniHttpServer : HttpServer
        {
            public MiniHttpServer(int port) : base(port)
            {

            }
            public override void handleGETRequest(HttpProcessor p)
            {
                BasComm.writeLog("服务端get请求地址为request: "+p.http_url);
                p.writeSuccess();
            string[] requestParam = p.http_url.Split('?');
            string ClassName = p.http_url.Replace("/", "");
            string urlParams = "";
            if (requestParam.Length > 0)
            {
                ClassName = requestParam[0];
                if (requestParam.Length > 1)
                    urlParams = requestParam[1];
            }
                ClassName=ClassName.Replace("/", "");
                string outData = urlParams; // 格式id=1&age=10command
                string msg = "";
                int rest = 9999;// 失败或异常
                try
                {
                    System.Type t = System.Type.GetType("DevManager.methods." + ClassName);
                //Methods.BaseMethod b1 = Activator.CreateInstance(t, "John", 1) as BaseMethod; 带有参数的构造函数调用方式
                BaseMethod b1 = Activator.CreateInstance(t) as BaseMethod;
                    rest = b1.run(ref outData, ref msg);
                }
                catch (Exception e)
                {
                    outData = "方法不存在或没有指定路径！" + e.Message;
                }

                //int rest = HsSfz.iReadSFZ_HS(ref outData);
                //           
                //string jsonstr = "{\"message\":\"ok\",\"nu\":\"367847964498\",\"ischeck\":\"1\",\"com\":\"shunfeng\",\"status\":\"200\",\"condition\":\"F00\",\"state\":\"3\",\"data\":[{\"time\":\"2020-02-18 16:03:48\",\"context\":\"查无结果\",\"ftime\":\"2020-02-18 16:03:48\"}]}";
                p.outputStream.WriteLine("这是一个json数据");

                p.outputStream.WriteLine(outData + rest.ToString());


                //p.outputStream.WriteLine("<html><body><h1>test server</h1>");
                //p.outputStream.WriteLine("Current Time: " + DateTime.Now.ToString());
                //p.outputStream.WriteLine("url : {0}", p.http_url);
                //
                //p.outputStream.WriteLine("<form method=post action=/form>");
                //p.outputStream.WriteLine("<input type=text name=foo value=foovalue>");
                //p.outputStream.WriteLine("<input type=submit name=bar value=barvalue>");
                //p.outputStream.WriteLine("</form>");
            }

            public override void handlePOSTRequest(HttpProcessor p, StreamReader inputData)
            {
                Console.WriteLine("POST request: {0}", p.http_url);
                p.writeSuccess();
                string data = inputData.ReadToEnd();
                // p.httpHeaders= "Content-Type: text/html;charset=utf-8";
                p.outputStream.WriteLine("这是一个json数据" + data);

                //p.outputStream.WriteLine("<html><body><h1>test server</h1>");
                //p.outputStream.WriteLine("<a href=/test>return</a><p>");
                //p.outputStream.WriteLine("postbody: <pre>{0}</pre>", data);


            }
        }
    
}
