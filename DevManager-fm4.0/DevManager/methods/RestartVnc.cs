using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.methods
{
    public class RestartVnc:BaseMethod
    {
        public override int run(ref string outData, ref string Msg)
        {
            Msg = "";
            outData = "";
            BasComm.restartVNCForce();
            return 1;
        }
    }
}
