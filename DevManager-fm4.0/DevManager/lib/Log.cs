using log4net;
using log4net.Appender;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.lib
{
    public class Log
    {
        private static string filepath = AppDomain.CurrentDomain.BaseDirectory + @"\SysLog\";

        private static readonly log4net.ILog logComm = log4net.LogManager.GetLogger("AppLog");

        static Log()
        {
            log4net.Config.XmlConfigurator.Configure(new FileInfo(AppDomain.CurrentDomain.BaseDirectory+"/log4net.config"));

            if (!Directory.Exists(filepath))
            {
                Directory.CreateDirectory(filepath);
            }
        }

        /// <summary>
        /// 输出系统日志
        /// </summary>
        /// <param name="msg">信息内容</param>
        /// <param name="source">信息来源</param>
        private static void WriteLog(string msg, bool isWrite, Action<object> action)
        {
            if (isWrite)
            {
                string filename = "AppLog_" + DateTime.Now.ToString("yyyyMMdd") + ".log";
                var repository = LogManager.GetRepository();

                #region MyRegion
                var appenders = repository.GetAppenders();
                if (appenders.Length > 0)
                {
                    RollingFileAppender targetApder = null;
                    foreach (var Apder in appenders)
                    {
                        if (Apder.Name == "AppLog")
                        {
                            targetApder = Apder as RollingFileAppender;
                            break;
                        }
                    }
                    if (targetApder.Name == "AppLog")//如果是文件输出类型日志，则更改输出路径
                    {
                        if (targetApder != null)
                        {
                            if (!targetApder.File.Contains(filename))
                            {
                                targetApder.File = @"SysLog\" + filename;
                                targetApder.ActivateOptions();
                            }
                        }
                    }
                }

                #endregion
                action(msg);
                //logComm.Error(msg + "\n");
            }
        }
        public static void WriteError(string msg, bool isWrite)
        {
            WriteLog(msg, isWrite, logComm.Error);
        }
        public static void WriteInfo(string msg, bool isWrite)
        {
            WriteLog(msg, isWrite, logComm.Info);
        }
        public static void WriteWarn(string msg, bool isWrite)
        {
            WriteLog(msg, isWrite, logComm.Warn);
        }
    }
}
