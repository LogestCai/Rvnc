using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;

namespace DevManager.lib
{
    public class OperateProcess
    {
        /// <summary>
        /// 根据名称检查进程是否存在
        /// </summary>
        /// <returns></returns>
        public static bool checkProcessExists(string processName)
        {

            Process[] myproc = Process.GetProcesses();
            foreach (Process item in myproc)
            {
                if (item.ProcessName.ToLower() == processName.ToLower())
                {
                    return true;

                }
            }
                   
            return false;
        }

        /// <summary>
        /// 关闭进程 根据进程名称关闭指定进程不需要带后缀.exe
        /// </summary>
        /// <param name="processName">进程名</param>
        public static void killProcess(string processName)
        {
           
                Process[] myproc = Process.GetProcesses();
                foreach (Process item in myproc)
                {
                    if (item.ProcessName.ToLower() == processName.ToLower())
                    {
                        item.Kill();
                        
                    }
                }
                        
        }
        /// <summary>
        /// 启动应用程序  fileName d:\app\qq.exe
        /// </summary>
        /// <param name="fileName"></param>
        public static void startQueueExe(string fileName)
        {
            //string filePath = AppDomain.CurrentDomain.BaseDirectory;           

            System.Diagnostics.Process p = new System.Diagnostics.Process();
            p.StartInfo.FileName = fileName;
            p.StartInfo.UseShellExecute = false;    //是否使用操作系统shell启动
            p.StartInfo.RedirectStandardInput = true;//接受来自调用程序的输入信息
            p.StartInfo.RedirectStandardOutput = true;//由调用程序获取输出信息
            p.StartInfo.RedirectStandardError = true;//重定向标准错误输出
            p.StartInfo.CreateNoWindow = true;//不显示程序窗口
            p.Start();//启动程序
        }

        /// <summary>
        /// 判断指定端口号是否被占用
        /// </summary>
        /// <param name="port"></param>
        /// <returns></returns>
        public static  bool isPortUsed(Int32 port)
        {
            bool result = false;
            try
            {
                System.Net.NetworkInformation.IPGlobalProperties iproperties = System.Net.NetworkInformation.IPGlobalProperties.GetIPGlobalProperties();
                System.Net.IPEndPoint[] ipEndPoints = iproperties.GetActiveTcpListeners();
                foreach (var item in ipEndPoints)
                {
                    if (item.Port == port)
                    {
                        result = true;
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return result;
        }

        public static void killProcessByPID(Int32 pid) //调用方法，传参
        {
            try
            {
                //    //  Process[] thisproc = Process.GetProcessesByName(processName);
                Process thisproc = Process.GetProcessById(pid);
                if (!thisproc.CloseMainWindow()) //尝试关闭进程 释放资源
                {
                    thisproc.Kill(); //强制关闭
                }
            }
            catch //出现异常，表明 kill 进程失败
            {
            }
            finally
            {

            }

        }
        /// <summary>
        /// 根据端口号 结束对应的进程 
        /// </summary>
        /// <param name="port"></param>
        public static void killProcessByPort(Int32 port )
        {
            Process pro = new Process();

            // 设置命令行、参数
            pro.StartInfo.FileName = "cmd.exe";
            pro.StartInfo.UseShellExecute = false;
            pro.StartInfo.RedirectStandardInput = true;
            pro.StartInfo.RedirectStandardOutput = true;
            pro.StartInfo.RedirectStandardError = true;
            pro.StartInfo.CreateNoWindow = true;
            // 启动CMD
            pro.Start();
            // 运行端口检查命令
            pro.StandardInput.WriteLine("netstat -ano|findstr "+port.ToString());
            pro.StandardInput.WriteLine("exit");

            // 获取结果
            Regex reg = new Regex(@"\s ", RegexOptions.Compiled);
            string line = null;
            while ((line = pro.StandardOutput.ReadLine()) != null)
            {
                line = line.Trim();
                if (line.StartsWith("TCP", StringComparison.OrdinalIgnoreCase))
                {
                    line = reg.Replace(line, ",");

                    string[] arr = line.Split(',');
                    if (arr[2].EndsWith(":" + port))
                    {
                        // 获取最后一个就是pid 
                        killProcessByPID(Int32.Parse(arr[arr.Length-1]));
                    }

                }
            }
        }


        /// <summary>
        /// 运行cmd命令 同在cmd窗口中输入字符串
        /// </summary>
        /// <param name="cmdStr"></param>
        public static void execCMD(string cmdStr)
        {
            Process pro = new Process();

            // 设置命令行、参数
            pro.StartInfo.FileName = "cmd.exe";
            pro.StartInfo.UseShellExecute = false;
            pro.StartInfo.RedirectStandardInput = true;
            pro.StartInfo.RedirectStandardOutput = true;
            pro.StartInfo.RedirectStandardError = true;
            pro.StartInfo.CreateNoWindow = true;
            // 启动CMD
            pro.Start();
            // 运行cmd命令
            pro.StandardInput.WriteLine(cmdStr);
            pro.StandardInput.WriteLine("exit");
           
        }



    }
}
