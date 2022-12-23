using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.methods
{
    public class ExecCmd:BaseMethod
    {
        public override int run(ref string outData, ref string Msg)
        {
            Msg = "";
            string processName = "";
            if (!string.IsNullOrEmpty(outData))
            {
                outData = BasComm.urlDecode(outData);
                string[] tmpStr = outData.Split('&');
                processName = tmpStr[0].Split('=')[1]; // 获取进程的值 只获取第一个值
            }
            BasComm.execCMD(processName);
            return 1;
        }
    }
}
