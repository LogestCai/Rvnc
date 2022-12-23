using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.methods
{
    class StartProcess:BaseMethod
    {
        public override int run(ref string outData, ref string Msg)
        {
            Msg = "";
            string processName = "";
            if (!string.IsNullOrEmpty(outData))
            {
                string[] tmpStr = outData.Split('&');
                processName = tmpStr[0].Split('=')[1]; // 获取进程的值 只获取第一个值
            }
            BasComm.startProcessByName(processName);
            return 1;
        }
    }
}
