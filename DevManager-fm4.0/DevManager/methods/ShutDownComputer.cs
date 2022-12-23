using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DevManager.methods
{
    public class ShutDownComputer:BaseMethod
    {
        public override int run(ref string outData, ref string Msg)
        {
            outData = "";
            Msg = "";
            BasComm.shutdownComputer();
            return 1;
        }
    }
}
