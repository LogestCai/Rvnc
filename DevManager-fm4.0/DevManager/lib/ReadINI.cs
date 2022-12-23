using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.lib
{
    public class ReadINI
    {
        [DllImport("kernel32")]// 读配置文件方法的6个参数：所在的分区（section）、 键值、     初始缺省值、   StringBuilder、  参数长度上限 、配置文件路径
        public static extern long GetPrivateProfileString(string section, string key, string defaultValue, StringBuilder retVal, int size, string filePath);
        [DllImport("kernel32")]//写入配置文件方法的4个参数：  所在的分区（section）、  键值、     参数值、       配置文件路径
        private static extern long WritePrivateProfileString(string section, string key, string value, string filePath);

        /*读配置文件*/
        public static string GetValue(string section, string key)
        {
            // ▼ 获取当前程序启动目录
            // string strPath = Application.StartupPath + @"/config.ini"; 这里是绝对路径
            string strPath = "./SysConfig.ini";  //这里是相对路径
            if (File.Exists(strPath))  //检查是否有配置文件，并且配置文件内是否有相关数据。
            {
                StringBuilder sb = new StringBuilder(255);
                GetPrivateProfileString(section, key, "配置文件不存在，读取未成功!", sb, 255, strPath);

                return sb.ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        /*写配置文件*/
        public static void SetValue(string section, string key, string value)
        {
            // ▼ 获取当前程序启动目录
            // string strPath = Application.StartupPath + @"/config.ini";  这里是绝对路径
            string strPath = "./SysConfig.ini";      //这里是相对路径，
            WritePrivateProfileString(section, key, value, strPath);
        }
    }
}
