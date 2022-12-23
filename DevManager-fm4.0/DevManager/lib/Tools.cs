using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.lib
{
    public class Tools
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="data">请求参数</param>
        /// <param name="output">输出参数</param>
        /// <param name="vsError">错误消息</param>
        /// <returns></returns>
        public static bool httpPost(string url, string data, ref string output, ref string vsError, string sContentType = "application/json;charset=UTF-8")
        {

            string retString = String.Empty;
            string paramData = data;
            //CookieContainer cookie = new CookieContainer();
            //HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://csb-broker.cloud.ahhb.hsip.gov.cn:8086/1.0.0/hsa-fsi-1101");
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "POST";
            //request.Referer = Referer;
            byte[] bytes = Encoding.UTF8.GetBytes(paramData);
            //request.Accept = "text/html, application/xhtml+xml, */*";
            //request.ContentType = "application/json;charset=UTF-8";
            //request.ContentType = "application/*";
            //request.ContentType = "application/x-www-form-urlencoded";
            request.ContentType = sContentType;

            //设置C# HttpWebRequest post请求头消息
            //request.Headers.Add("version", "1.0.0");
            //request.Headers.Add("ak", "45b83b3b780d46028afa1da41dcdd0a4");
            //request.Headers.Add("sk", "1+JX1Gsg3hEu4Ui+VdQvWlaz1gY=");

            request.ContentLength = bytes.Length;
            try
            {
                Stream myResponseStream = request.GetRequestStream();
                myResponseStream.Write(bytes, 0, bytes.Length);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader myStreamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
                output = myStreamReader.ReadToEnd();
                int statusCode = (int)response.StatusCode;
                if (statusCode == 200)
                {
                    // Console.WriteLine(statusCode);
                    myStreamReader.Close();
                    myResponseStream.Close();

                    if (response != null)
                    {
                        response.Close();
                    }
                    if (request != null)
                    {
                        request.Abort();
                    }
                }
                else
                {
                    vsError = "请求失败！状态码为：" + statusCode.ToString();
                    return false;
                }
            }
            catch (Exception ex)
            {
                //抛出异常返回具体错误消息
                vsError = ex.Message;
                return false;
            }
            return true;
        }

        public static bool httpPostWithHeader(string url, string data, ref string output, ref string vsError, Dictionary<string, string> dict, string sContentType = "application/json;charset=UTF-8")
        {

            string retString = String.Empty;
            string paramData = data;
            //CookieContainer cookie = new CookieContainer();
            //HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://csb-broker.cloud.ahhb.hsip.gov.cn:8086/1.0.0/hsa-fsi-1101");
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "POST";
            //request.Referer = Referer;
            byte[] bytes = Encoding.UTF8.GetBytes(paramData);
            //request.Accept = "text/html, application/xhtml+xml, */*";
            //request.ContentType = "application/json;charset=UTF-8";
            //request.ContentType = "application/*";
            //request.ContentType = "application/x-www-form-urlencoded";
            request.ContentType = sContentType;

            //设置C# HttpWebRequest post请求头消息
            if (dict.Count > 0)
            {
                foreach (string key in dict.Keys)
                {
                    request.Headers.Add(key, dict[key]);
                }
            }
            //request.Headers.Add("version", "1.0.0");
            //request.Headers.Add("ak", "45b83b3b780d46028afa1da41dcdd0a4");
            //request.Headers.Add("sk", "1+JX1Gsg3hEu4Ui+VdQvWlaz1gY=");

            request.ContentLength = bytes.Length;
            try
            {
                Stream myResponseStream = request.GetRequestStream();
                myResponseStream.Write(bytes, 0, bytes.Length);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader myStreamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
                output = myStreamReader.ReadToEnd();
                int statusCode = (int)response.StatusCode;
                if (statusCode == 200)
                {
                    // Console.WriteLine(statusCode);
                    myStreamReader.Close();
                    myResponseStream.Close();

                    if (response != null)
                    {
                        response.Close();
                    }
                    if (request != null)
                    {
                        request.Abort();
                    }
                }
                else
                {
                    vsError = "请求失败！状态码为：" + statusCode.ToString();
                    return false;
                }
            }
            catch (Exception ex)
            {
                //抛出异常返回具体错误消息
                vsError = ex.Message;
                return false;
            }
            return true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="url">请求地址</param>
        /// <param name="data">请求参数</param>
        /// <param name="output">输出参数</param>
        /// <param name="vsError">错误消息</param>
        /// <returns></returns>
        public static bool httpPostFormData(string url, Dictionary<string, string> data, ref string output, ref string vsError, string sContentType = "application/json;charset=UTF-8")
        {

            string retString = String.Empty;
            //string paramData = data;
            //CookieContainer cookie = new CookieContainer();
            //HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://csb-broker.cloud.ahhb.hsip.gov.cn:8086/1.0.0/hsa-fsi-1101");
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "POST";
            //request.Referer = Referer;

            //request.Accept = "text/html, application/xhtml+xml, */*";
            //request.ContentType = "application/json;charset=UTF-8";
            //request.ContentType = "application/*";
            //request.ContentType = "application/x-www-form-urlencoded";
            request.ContentType = sContentType;

            //设置C# HttpWebRequest post请求头消息
            //request.Headers.Add("version", "1.0.0");
            //request.Headers.Add("ak", "45b83b3b780d46028afa1da41dcdd0a4");
            //request.Headers.Add("sk", "1+JX1Gsg3hEu4Ui+VdQvWlaz1gY=");

            try
            {
                Stream myResponseStream = request.GetRequestStream();
                string formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";
                foreach (string key in data.Keys)
                {
                    // rs.Write(boundarybytes, 0, boundarybytes.Length);
                    string formitem = string.Format(formdataTemplate, key, data[key]);
                    byte[] formitembytes = System.Text.Encoding.UTF8.GetBytes(formitem);
                    myResponseStream.Write(formitembytes, 0, formitembytes.Length);
                }


                //byte[] bytes = Encoding.UTF8.GetBytes(paramData);
                //request.ContentLength = bytes.Length;
                //myResponseStream.Write(bytes, 0, bytes.Length);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                StreamReader myStreamReader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
                output = myStreamReader.ReadToEnd();
                int statusCode = (int)response.StatusCode;
                if (statusCode == 200)
                {
                    // Console.WriteLine(statusCode);
                    myStreamReader.Close();
                    myResponseStream.Close();

                    if (response != null)
                    {
                        response.Close();
                    }
                    if (request != null)
                    {
                        request.Abort();
                    }
                }
                else
                {
                    vsError = "请求失败！状态码为：" + statusCode.ToString();
                    return false;
                }
            }
            catch (Exception ex)
            {
                //抛出异常返回具体错误消息
                vsError = ex.Message;
                return false;
            }
            return true;
        }

        

    }
}
