using DevManager.lib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DevManager
{
    public  class BasComm
    {
        public static object HttpUtility { get; private set; }

        public static string getUUIDOlder()
        {
            return UuidOlder.getValue();
        }
        /// <summary>
        /// 获取本机唯一特征码 
        /// </summary>
        /// <returns></returns>
        public static string getUUID()
        {
            
            return UniqueKey.Value();
        }
        /// <summary>
        /// 获取本机ip地址  多个地址用"|" 分割
        /// </summary>
        /// <returns></returns>
        public static string getIpAddr()
        {
            return HostInfo.getLocalIp();
        }
        /// <summary>
        ///  获取本机mac地址  多个地址用"|" 分割
        /// </summary>
        /// <returns></returns>
        public static string getMacAddr()
        {
            return HostInfo.getLocalMac();
        }
        /// <summary>
        /// 日志记录 
        /// </summary>
        /// <param name="msg"></param>
        public static void writeLog(string msg)
        {
            try { Log.WriteInfo(msg, true); } catch (Exception ex) { }
            
        }
        /// <summary>
        /// 错误日志
        /// </summary>
        /// <param name="msg"></param>
        public static void writeError(string msg)
        {
            try { Log.WriteError(msg, true); } catch (Exception ex) { }
            //Log.WriteError(msg, true);
        }
        /// <summary>
        /// 警告日志
        /// </summary>
        /// <param name="msg"></param>
        public static void writeWarn(string msg)
        {
            try { Log.WriteWarn(msg, true); } catch (Exception ex) { }
            //.WriteWarn(msg, true);
        }

        /// <summary>
        /// 设置配置文件参数值 格式 【区域】 名称 值
        /// </summary>
        /// <param name="area"></param>
        /// <param name="name"></param>
        /// <param name="value"></param>
        public static void setIniValue(string area, string name, string value)
        {
            ReadINI.SetValue(area, name, value);
        }
        /// <summary>
        /// 获取系统配置文件值 格式 【区域】 名称
        /// </summary>
        /// <param name="area"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public static string getIniValue(string area, string name)
        {
            return ReadINI.GetValue(area, name);
        }

        /// <summary>
        /// 获取操作系统版本
        /// </summary>
        /// <returns></returns>
        public static string getOSVersion()
        {
            return HostInfo.getOSVersion();
        }

        /// <summary>
        /// 获取本机主机名称
        /// </summary>
        /// <returns></returns>
        public static string getHostName()
        {
            return HostInfo.getLocalHostname();
        }
        /// <summary>
        /// 执行关机命令
        /// </summary>
        public static void shutdownComputer()
        {
            OperateProcess.execCMD("shutdown -s -f -t 0");
        }

        /// <summary>
        /// 执行重启命令
        /// </summary>
        public static void restartComputer()
        {
            OperateProcess.execCMD("shutdown -r -f -t 0");
        }

        public static void execCMD(string command)
        {
            OperateProcess.execCMD(command);
        }
        /// <summary>
        /// 根据端口 结束进程
        /// </summary>
        /// <param name="port"></param>
        public static void killProcessByPort(int port)
        {
            OperateProcess.killProcessByPort(port);
        }
        /// <summary>
        /// 结束程序 根据程序名称
        /// </summary>
        /// <param name="proName"></param>
        public static void killProcessByName(string proName)
        {
            OperateProcess.killProcess(proName);
        }

        public static bool portIsUsed(int port)
        {
            return OperateProcess.isPortUsed(port);
        }

        public static bool IsProcessExists(string processName)
        {
            return OperateProcess.checkProcessExists(processName);
        }
        /// <summary>
        /// 启动程序  传入绝对路径
        /// </summary>
        /// <param name="processName"></param>
        public static void startProcessByName(string processName)
        {
            OperateProcess.startQueueExe(processName);
        }

        public static void restartVNC()
        {
            //if (OperateProcess.isPortUsed(5901))
            //{
            //    OperateProcess.killProcessByPort(5901);
            //    //continue;
            //}            
            //OperateProcess.startQueueExe(AppDomain.CurrentDomain.BaseDirectory + "\\tvnserver.exe");
            WinService.ServiceStop("tvnserver");
            WinService.ServiceStar("tvnserver");
        }

        public static bool StopVncService()
        {
            return WinService.ServiceStop("tvnserver");
        }

        public static void InstallVncService()
        {
            // 写入注册表信息 
            OperateProcess.execCMD("reg add HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System /v SoftwareSASGeneration /t REG_DWORD /d 1 /f");
            OperateProcess.execCMD(AppDomain.CurrentDomain.BaseDirectory + "\\tvnserver -reinstall -silent");
            BasComm.writeLog(AppDomain.CurrentDomain.BaseDirectory + "\\tvnserver -reinstall -silent");
        }

        public static bool ServiceExists(string serverName)
        {
            return WinService.ServicesExists(serverName);
        }

        /// <summary>
        /// url 解码工具
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string urlDecode(string url)
        {
            //return UrlCoding.UrlDecode();
            return System.Web.HttpUtility.UrlDecode(url);

            //HttpUtility.UrlEncode(text);  //utf-8 编码

            //HttpUtility.UrlDecode(text);  //utf-8 解码

            //HttpUtility.UrlEncode(text, System.Text.Encoding.GetEncoding(936));  //gb2312编码

            //HttpUtility.UrlDecode(text, System.Text.Encoding.GetEncoding(936));  //gb2312解码
        }

    }
}
