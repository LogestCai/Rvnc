using System;
using System.Collections.Generic;
using System.Text;
using CCWin;
using System.Windows.Forms;
using System.Drawing;


namespace DevManger
{
    public class ResponsiveForm : Skin_Metro
    {
        const int WM_SYSCOMMAND = 0X112;//274
        const int SC_MAXIMIZE = 0XF030;//61488
        const int SC_MINIMIZE = 0XF020;//61472
        const int SC_RESTORE = 0XF120; //61728
        const int SC_CLOSE = 0XF060;//61536
        const int SC_RESIZE_Horizontal = 0XF002;//61442
        const int SC_RESIZE_Vertical = 0XF006;//61446
        const int SC_RESIZE_Both = 0XF008;//61448

        protected override void WndProc(ref Message m)
        {
            if (m.Msg == WM_SYSCOMMAND)
            {
                switch (m.WParam.ToInt32())
                {
                    case SC_MAXIMIZE:
                    case SC_RESTORE:
                    case SC_RESIZE_Horizontal:
                    case SC_RESIZE_Vertical:
                    case SC_RESIZE_Both:
                        if (WindowState == FormWindowState.Minimized)
                        {
                            base.WndProc(ref m);
                        }
                        else
                        {
                            Size beforeResizeSize = this.Size;
                            base.WndProc(ref m);
                            //窗口resize之后的大小
                            Size afterResizeSize = this.Size;
                            //获得变化比例
                            float percentWidth = (float)afterResizeSize.Width / beforeResizeSize.Width;
                            float percentHeight = (float)afterResizeSize.Height / beforeResizeSize.Height;
                            foreach (Control control in this.Controls)
                            {
                                //按比例改变控件大小
                                control.Width = (int)(control.Width * percentWidth);
                                control.Height = (int)(control.Height * percentHeight);
                                //为了不使控件之间覆盖 位置也要按比例变化
                                control.Left = (int)(control.Left * percentWidth);
                                control.Top = (int)(control.Top * percentHeight);
                                //改变控件字体大小
                                control.Font = new Font(control.Font.Name, control.Font.Size * Math.Min(percentHeight, percentHeight), control.Font.Style, control.Font.Unit);
                            }
                        }
                        break;
                    default:
                        base.WndProc(ref m);
                        break;
                }
            }
            else
            {
                base.WndProc(ref m);
            }
        }
    }
}