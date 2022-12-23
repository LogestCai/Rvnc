using System;
using System.Collections.Generic;
using System.Linq;
using System.Management;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.lib
{
    public class HostInfo
    {


        public static string getLocalHostname()
        {
            return Dns.GetHostName(); //获取本地主机名
        }

        public static string getLocalIp()
        {
            string ipAddr = string.Empty;
            string hostName = Dns.GetHostName(); //获取本地主机名

            IPHostEntry hostInfo = Dns.GetHostEntry(hostName); //获取主机消息

            //打印主机名
            // Console.WriteLine("host name:\t{0}", hostInfo.HostName);

            ////打印主机关联的别名
            //foreach (string name in hostInfo.Aliases)
            //{
            //    Console.WriteLine("aliases:\t{0}", name);
            //}

            //打印ip地址消息
            foreach (IPAddress ip in hostInfo.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                    /// Console.WriteLine("ip:\t{0}", ip);
                    ipAddr += ip.ToString() + "|";
            }
            if (ipAddr.Length > 1)
            {
                ipAddr = ipAddr.Substring(0, ipAddr.Length - 1);
            }
            return ipAddr;
        }
        //获取本机的mac地址 
        //获取到的格式  mac01|mac02|mac03
        public static string getLocalMac()
        {
            string mac = string.Empty;
            try
            {
                List<string> listIP = new List<string>();
                ManagementClass mcNetworkAdapterConfig = new ManagementClass("Win32_NetworkAdapterConfiguration");
                ManagementObjectCollection moc_NetworkAdapterConfig = mcNetworkAdapterConfig.GetInstances();
                foreach (ManagementObject mo in moc_NetworkAdapterConfig)
                {
                    string mServiceName = mo["ServiceName"] as string;

                    //过滤非真实的网卡  
                    if (!(bool)mo["IPEnabled"])
                    { continue; }
                    if (mServiceName.ToLower().Contains("vmnetadapter")
                 || mServiceName.ToLower().Contains("ppoe")
                 || mServiceName.ToLower().Contains("bthpan")
                 || mServiceName.ToLower().Contains("tapvpn")
                 || mServiceName.ToLower().Contains("ndisip")
                 || mServiceName.ToLower().Contains("sinforvnic"))
                    { continue; }

                    if (mo["IPEnabled"].ToString() == "True")
                    {
                        mac += mo["MacAddress"].ToString().Replace(":", "-") + "|";
                        Console.WriteLine("有效网卡地址为：" + mac);
                        //string[] mIPAddress = mo["IPAddress"] as string[];
                        //ip = mIPAddress[0];
                        //Console.WriteLine("有效ip地址为：" + ip);
                    }
                    mo.Dispose();
                }
                if (mac.Length > 1)
                {
                    //去除最后的 竖线"|"
                    mac = mac.Substring(0, mac.Length - 1);
                }
                return mac;

            }
            catch (Exception ex)
            {
                return mac;
            }
        }

        /// <summary>
        /// 获取操作系统版本
        /// </summary>
        /// <returns></returns>
        public static string getOSVersion()
        {
            return Environment.OSVersion.VersionString;
        }
    }
}
