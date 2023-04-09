using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CCWin;
using FSLib.App.SimpleUpdater;
using DevManager.lib;
using Newtonsoft.Json.Linq;
using System.Collections;
using DevManager.deviceform;
using DevManager.httpserver;
using System.Threading;
using DevManger;
using System.Runtime.InteropServices;

namespace DevManager
{
    public partial class FmMain : ResponsiveForm
    {
       
        // 控制界面是否显示
        private bool iShowWindow = false;
        // 必须运行的程序  系统会定时检测是否启动
        private List<string> mustRunProcess = new List<string>();
        // 不允许运行的程序  系统会定时检测是否运行
        private List<string> preventedProcess = new List<string>();
        private Queue queueTask = new Queue();
        // 服务端地址
        private string serverURL = "";
        // 自动更新地址
        private string autoUpdateURL = "";
        // 禁用阻止启动程序功能
        private bool forbiddenPreventedProcess = false;
        public Device devInfo = new Device();

        private bool isUpdate = true;
        private bool isRunning = false;
        private bool runAsServiceVnc = false;
        // 获取配置参数


        ///=====================================以下功能为截图所需要的功能=============================================
        ///

        void ScreenCapture()
        {
            DLL.PrScrn();
        }
        protected override void WndProc(ref Message m)
        {
            base.WndProc(ref m);
            Hotkey.ProcessHotKey(m);
        }

        private void RegisterHotKey()
        {
            Hotkey.Regist(Handle, HotkeyModifiers.MOD_ALT, Keys.F1, ScreenCapture);
        }

        private void btnCutScreen_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
            
            this.ShowInTaskbar = false;
            RegisterHotKey();
            ScreenCapture();
        }

        // =========================定义热键功能结束==========================================
        
            
                   
        private void setMustRunProcessInfo()
        {
           // this.mustRunProcess.Add("tvnserver");
            
        }

        private void loadMusPreventProcessFromServer()
        {
            string data = "{\"id\":\"" + devInfo.id + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = serverURL; // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getGlobalPreventProcess", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("获取全局禁止进程数据为：" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {
                    int len = jo["data"].ToArray().Count();
                    for (int i = 0; i < len; i++)
                    {
                        if(!this.preventedProcess.Exists(x=>x==jo["data"][i]["key"].ToString()))
                        this.preventedProcess.Add(jo["data"][i]["key"].ToString());
                    }
                }
                else
                {
                    BasComm.writeError("【主窗体】获取禁止应用程序数据为空！:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("【主窗体】获取禁止应用程序数据发生异常：" + sErr);
            }
        }
        private void setIniConfig()
        {
            serverURL = BasComm.getIniValue("系统", "服务器地址");
            autoUpdateURL = BasComm.getIniValue("系统", "自动更新地址");
            forbiddenPreventedProcess = BasComm.getIniValue("系统", "禁用程序阻止").ToString().Equals("1");// 是否禁用程序阻止
        }

        private void setDeviceInfo()
        {           
            try{ devInfo.UUID = BasComm.getUUID(); } catch (Exception ex) { BasComm.writeError("获取uuid失败！" + ex.Message); };
            devInfo.ipAddress = BasComm.getIpAddr();
            devInfo.macAddress = BasComm.getMacAddr();
            devInfo.OSVersion = BasComm.getOSVersion();
            devInfo.hostName = BasComm.getHostName();
            devInfo.ServerUrl= BasComm.getIniValue("系统", "服务器地址");
            // 如果uuid 为空则启用备用uuid地址
            if (devInfo.UUID == "") { try { devInfo.UUID = BasComm.getUUIDOlder(); } catch (Exception e) { } }
            if (devInfo.UUID == "") devInfo.UUID = devInfo.ipAddress.Split('|')[0];
            if (devInfo.UUID == "") devInfo.UUID = devInfo.macAddress.Split('|')[0];
        }

        private void setDisplayInfo()
        {
            string s基础信息 = "";
            if (string.IsNullOrEmpty(devInfo.validIp))
            {
                btnStatus.Text = "连接管理中心失败！";
                s基础信息 += "【有效IP地址】:未获取到有效ip \n";
            }
            else
            {
                btnStatus.Text = "已连接管理中心："+serverURL;
                s基础信息 += "【有效IP地址】:" + devInfo.validIp + "\n";
            }
           
            s基础信息 += "【UUID】:" + devInfo.UUID + "\n";
            s基础信息 += "【所有IP】:" + devInfo.ipAddress + "\n";
            s基础信息 += "【MAC】:" + devInfo.macAddress + "\n";
            s基础信息 += "【设备ID】:" + devInfo.id + "\n";
            s基础信息 += "【设备名称】:" + devInfo.deviceName + "\n";
            txtRich.Text = s基础信息;
        }

        // 定义全局定时器
        private System.Windows.Forms.Timer timerGetTime;
        public FmMain()
        {
            InitializeComponent();
        }

        private void skinWaterTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void execQueueTask()
        {
            string data = "{\"id\":\"" + devInfo.id + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = serverURL; // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getTask", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("获取设备信息成功返回" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {
                    int len = jo["data"].ToArray().Count();
                    for (int i = 0; i < len; i++)
                    {
                        Task tt = new Task();
                        tt.id = Convert.ToInt32(jo["data"][i]["id"]);
                        tt.type = Convert.ToInt32(jo["data"][i]["type"]);
                        tt.command = jo["data"][i]["command"].ToString();
                        tt.name = jo["data"][i]["id"].ToString();
                        tt.receive = Convert.ToInt32(jo["data"][i]["receive"]);
                        tt.deviceId = Convert.ToInt32(jo["data"][i]["deceive_id"]);
                        //queueTask.Enqueue(tt);
                        if (tt.type == 1)
                        {
                            //系统内置命令
                            if (tt.command.Equals("1"))
                            {
                                //重启电脑
                                BasComm.restartComputer();
                            }
                            else if (tt.command.Equals("2"))
                            {
                                // 重启远程模块！
                                BasComm.restartVNC();
                            }

                        }
                        else if (tt.type == 2)
                        {
                            // Cmd命令
                            BasComm.execCMD(tt.command);
                        }
                        else if (tt.type==3) //结束任务指定进程
                        {
                            BasComm.killProcessByName(tt.command);
                        }
                        data = "{\"id\":\"" + tt.id.ToString() + "\"}";
                        Tools.httpPost(url + "/admin/test/setTask", data, ref sOutPut, ref sErr);
                        BasComm.writeLog("更新任务状态:" + sOutPut+"\n异常为:"+sErr);//打印对象字符串     

                    }

                    
                }
                else
                {
                    BasComm.writeError("【主窗体】获取任务数据为空！:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("【主窗体】获取任务数据异常：" + sErr);
            }
        }

        /// <summary>
        /// 获取有效的ip地址
        /// </summary>
        /// <param name="url"></param>
        protected void setValidIp(string url)
        {
            string data = "{\"ips\":\""+devInfo.ipAddress+"\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            if (Tools.httpPost(url + "/admin/test/getValidIp", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("验证ip返回!" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    BasComm.writeLog("有效ip 为:"+ jo["data"]["ip"].ToString());
                    devInfo.validIp = jo["data"]["ip"].ToString();
                }
                else
                {
                    BasComm.writeError("验证ip失败:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("请求发生了错误："+sErr);
            }
        }
        /// <summary>
        /// 加来服务端设备信息
        /// </summary>
        private void loadDeviceInfo()
        {
            string data = "{\"UUID\":\"" + devInfo.UUID + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = serverURL; // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getDeviceInfo", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("获取设备信息成功返回" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {
                    devInfo.id = jo["data"]["id"].ToString();
                    devInfo.group = jo["data"]["id"].ToString();
                    devInfo.deviceName = jo["data"]["device_name"].ToString();
                    devInfo.OSVersion = jo["data"]["device_name"].ToString();
                    devInfo.location = jo["data"]["device_name"].ToString();
                    devInfo.mark = jo["data"]["mark"].ToString();
                    //BasComm.writeLog("发送成功！:" + devInfo.UUID);
                }
                else
                {
                    BasComm.writeError("【主窗体】获取设备信息失败！:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("【主窗体】获取设备请求信息异常：" + sErr);
            }
        }
        /// <summary>
        /// 发送本机参数至redis服务器
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>

        private void sendRedisValue(string key,string ip)
        {
            string data = "{\"ip\":\"" + ip + "\",\"key\":\""+key+"\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            if (Tools.httpPost(serverURL + "/admin/test/setRedis", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("验证ip返回!" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {
                    BasComm.writeLog("发送成功！:" +devInfo.UUID);
                }
                else
                {
                    BasComm.writeError("验证ip失败:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError(serverURL + "/admin/test/setRedis"+"发送redis请求发生了错误：" + sErr);
            }
        }
        private void showMainWindow()
        {
            if (iShowWindow)
            {
                //还原窗体显示    
                WindowState = FormWindowState.Normal;
                ////激活窗体并给予它焦点
                //this.Activate();
                //任务栏区显示图标
                this.ShowInTaskbar = true;
                //this.notifyIcon1.Visible = false;
               
            }
            else
            {
                WindowState = FormWindowState.Minimized;
                this.ShowInTaskbar = false;
                this.notifyIcon1.Visible = true;
                

            }
        }

        public  void DoUpdate()
        {
            var updater = Updater.CreateUpdaterInstance(autoUpdateURL+"/newUpdate/{0}", "update.xml");
            updater.Error += (s, e) =>
            {
                MessageBox.Show("更新发生了错误：" + updater.Context.Exception.Message);
            };
            updater.UpdatesFound += (s, e) =>
            {
                MessageBox.Show("发现了新版本：" + updater.Context.UpdateInfo.AppVersion);
                //确认更新？
                updater.StartExternalUpdater();
            };
            updater.NoUpdatesFound += (s, e) =>
            {
                MessageBox.Show("没有新版本！");
            };
            updater.MinmumVersionRequired += (s, e) =>
            {
                MessageBox.Show("当前版本过低无法使用自动更新！");
            };
            updater.Context.EnableEmbedDialog = false;
            updater.BeginCheckUpdateInProcess();
        }

        /// <summary>
        /// 运行指定要运行的程序 
        /// </summary>
        private void runMustProcess()
        {
            if (this.mustRunProcess.Count() > 0)
            {
                if (!OperateProcess.isPortUsed(5901))
                {
                    //BasComm.startProcessByName(AppDomain.CurrentDomain.BaseDirectory + "\\tvnserver.exe");
                    //continue;
                    BasComm.restartVNC();
                }
                foreach (string item in this.mustRunProcess)
                {
                    // 如果不存在  在运行该程序！该程序必须放在程序根目录下
                   
                    if (!OperateProcess.checkProcessExists(item))
                        BasComm.startProcessByName(AppDomain.CurrentDomain.BaseDirectory + "\\" + item + ".exe");
                }
            }
        }
        /// <summary>
        /// 停止指定要运行的程序 
        /// </summary>
        private void stopMustProcess()
        {
            if (this.preventedProcess.Count() > 0)
            {
                foreach (string item in this.preventedProcess)
                {
                    //停止该程序！                    
                       BasComm.killProcessByName(item);
                }
            }
            
        }

        private void sendDeviceInfo()
        {

            string sDevName = string.IsNullOrEmpty(devInfo.deviceName) ? devInfo.hostName : devInfo.deviceName;
            string sLocaltion = string.IsNullOrEmpty(devInfo.location) ? devInfo.hostName : devInfo.location;
            string sGroup = string.IsNullOrEmpty(devInfo.group) ? "1": devInfo.group;
            string data = "{\"UUID\":\"" + devInfo.UUID + "\",\"device_name\":\"" + sDevName + "\",\"location\":\"" +sLocaltion+ "\",";
            data += "\"ip\":\"" + devInfo.validIp + "\",";//有效ip地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            data += "\"ips\":\"" + devInfo.ipAddress + "\",";//可能的ip地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
            data += "\"mac\":\"" + devInfo.macAddress + "\",";//MAC地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            data += "\"computer_name\":\"" + devInfo.hostName + "\",";//计算机名称                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
            data += "\"group\":\"" +sGroup+"\",";//分组id                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            data += "\"os_version\":\"" + devInfo.OSVersion + "\"";//操作系统版本
            data += "}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = serverURL; // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/setDeviceInfo", data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog("请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    BasComm.writeLog("设备信息保存成功！");
                }
                else
                {
                    BasComm.writeError("请求发生了错误！");
                }
            }
            else
            {
                BasComm.writeError("请求发生了错误：" + sErr);
            }
        }
        private void loadDeviceInfoFromServer()
        {
            string data = "{\"UUID\":\"" + devInfo.UUID + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            if (Tools.httpPost(serverURL + "/admin/test/getDeviceInfo", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("获取设备信息成功返回" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {
                    devInfo.id = jo["data"]["id"].ToString();
                    devInfo.group = jo["data"]["group"].ToString();
                    devInfo.deviceName = jo["data"]["device_name"].ToString();
                    devInfo.OSVersion = jo["data"]["os_version"].ToString();
                    devInfo.location = jo["data"]["location"].ToString();
                    devInfo.mark = jo["data"]["mark"].ToString();
                    devInfo.validIp = jo["data"]["ip"].ToString();
                    //BasComm.writeLog("发送成功！:" + devInfo.UUID);
                }
                else
                {
                    BasComm.writeError("获取设备信息失败！:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("发送设备请求信息异常：" + sErr);
            }
        }

        /// <summary>
        /// 自定义停止要指定的程序
        /// </summary>
        /// <param name="stopProcess"></param>
        private void stopProcessByList(List<string> stopProcess)
        {
            if (stopProcess.Count() > 0)
            {
                foreach (string item in stopProcess)
                {
                    // 如果存在  在停止该程序！
                    if (OperateProcess.checkProcessExists(item))
                        OperateProcess.killProcess(item);
                }
            }
           
        }


        private void Init()
        {
            try
            {
                isUpdate = !BasComm.getIniValue("系统", "关闭自动更新").Equals("1");
                // 第二步 获取系统配置
                setIniConfig();
                // 第三步 设置设备信息
                setDeviceInfo();

                // 第四步  执行自动更新操作             
                if (isUpdate) Do自动更新();
                // 如果服务存在信息则加载服务端设备信息
                loadDeviceInfoFromServer();

                // setValidIp
                setValidIp(serverURL);
                // 设置必须运行的附属程序参数
                setMustRunProcessInfo();

                //第五步 获取有效ip 会调用验证接口验证ip有效性
                sendRedisValue(devInfo.UUID, devInfo.validIp);
                // 第六步 设置显示信息  
                setDisplayInfo();
                // 发送设备信息网络请求
                sendDeviceInfo();
                loadMusPreventProcessFromServer();
                isRunning = true;
            }
            catch (Exception ex)
            {

            }
            

        }
        private void Form1_Load(object sender, EventArgs e)
        {
            //定义截图程序热键  
            //注册热键(窗体句柄,热键ID,辅助键,实键)
            

            runAsServiceVnc = BasComm.getIniValue("参数", "Vnc安装").ToString().Equals("0");// 是否禁用程序阻止
            if (runAsServiceVnc)
            {
                try
                {
                    BasComm.InstallVncService();
                    BasComm.setIniValue("参数", "Vnc安装", "1");
                    // 写入注册表信息 
                    string path = @"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System";
                    string key = "SoftwareSASGeneration";
                    Tools.setRegistryKeyDWord(path, key, 1);
                    //OperateProcess.execCMD("reg add HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System /v SoftwareSASGeneration /t REG_DWORD /d 1 /f");
                }
                catch (Exception ex)
                {
                    BasComm.writeError("安装vnc 服务失败！" + ex.Message);
                }
            }
            //Updater.CheckUpdateSimple("http://10.87.230.225:7777/newUpdate/", "update.xml");
            //notifyIcon1.Visible = false;
            Init();
            //绑定右下角图标事件
            notifyIcon1.DoubleClick += new System.EventHandler(this.notifyIcon1_DoubleClick);
            notifyIcon1.MouseClick += new System.Windows.Forms.MouseEventHandler(this.notifyIcon1_MouseClick);

            Tabmain.SelectedIndex = 0;
                

               
            //第七步  创建定时器
                
            timerGetTime = new System.Windows.Forms.Timer();
            timerGetTime.Tick += new EventHandler(HandleTime);
            timerGetTime.Interval = 1000 * 60 * 1;//定时时间按照分钟计算 1分钟执行一次。
            timerGetTime.Enabled = true;
            //    开启定时器
            timerGetTime.Start();
            try
            {
                MiniHttpServer httpServer;
                BasComm.killProcessByPort(9999);
                httpServer = new MiniHttpServer(9999);
                // httpServer.listen();
                Thread thread = new Thread(new ThreadStart(httpServer.listen));
                thread.IsBackground = true;
                thread.Start();
            }
            catch (Exception ex)
            {
                BasComm.writeError("http服务启动失败" + ex.Message);
            }

            //窗体最小化显示
            this.WindowState = FormWindowState.Minimized;
            //不显示在任务栏中
            this.ShowInTaskbar = false;
            this.notifyIcon1.Visible = true;

            //最后注册热键
            //try
            //{
            //    //uint ctrHotKey = (uint)KeyModifiers.Control;
            //    //ctrHotKey = (uint)(KeyModifiers.Alt | KeyModifiers.Control);
            //    //HotKey.RegisterHotKey(Handle, 1000, ctrHotKey, Keys.D);//这时热键为Alt+CTRL+D
            //    //BasComm.writeLog("Alt +Ctrl + D 热键被设置成功！" );
            //    //Hotkey.Regist(Handle, HotkeyModifiers.MOD_ALT, Keys.F1, ScreenCapture);

            //    RegisterHotKey();
            //}
            //catch (Exception te)
            //{
            //    BasComm.writeLog("Alt + F1 热键被占用" + te.Message);
            //}


        }

        public void HandleTime(Object sender, EventArgs e)
        {
           
            BasComm.writeLog("定时任务开始时间:" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            //btn待上传批量_Click(sender, e);
            try
            {
                // to do执行具体定时任务
                // 定时运行需要指定的内部程序
                if (!BasComm.IsProcessExists("tvnserver")) BasComm.restartVNCForce();
                if (!isRunning) Init();                
                runMustProcess();
                sendRedisValue(devInfo.UUID, devInfo.validIp);
                if (!forbiddenPreventedProcess) { stopMustProcess(); }
                setDeviceInfo();
                setDisplayInfo();
                execQueueTask();      

            } catch (Exception ex)
            {
                BasComm.writeError("定时任务发生异常："+ex.Message);
            }
            BasComm.writeLog("定时任务结束时间:" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            //basComm.MsgBox("定时器启动了！");
        }

        private void skinLabel1_Click(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 窗体大小改变事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Form1_SizeChanged(object sender, EventArgs e)
        {
            
            if (this.WindowState == FormWindowState.Minimized)//最小化      
            {
                this.ShowInTaskbar = false;
                this.notifyIcon1.Visible = true;
            }

        }
        /// <summary>
        /// 关闭窗体事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //注消热键(句柄,热键ID)   
            Hotkey.UnRegist(this.Handle, ScreenCapture);
            WindowState = FormWindowState.Minimized;
            this.ShowInTaskbar = false;
            e.Cancel = true;  
        }
        /// <summary>
        /// 最小化图标鼠标事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void notifyIcon1_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                myMenu.Show();
            }
        }
        /// <summary>
        /// 退出事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
       

        private void 退出stripmenu_Click(object sender, EventArgs e)
        {
            // 关闭所有的线程
            if (timerGetTime.Enabled) timerGetTime.Stop();
            // 退出时停止附属的程序
            BasComm.StopVncService(); // 停止vnc服务
            BasComm.killProcessByName("tvnserver");// 停止vnc应用
             stopMustProcess();            

            //System.Environment.Exit(0);
            this.notifyIcon1.Visible = false;
            //注消热键(句柄,热键ID)   
            Hotkey.UnRegist(this.Handle, ScreenCapture);
            this.Dispose();
            this.Close();
            Application.Exit();
        }

        private void 显示stripmenu_Click(object sender, EventArgs e)
        {            
            //还原窗体显示    
             WindowState = FormWindowState.Normal;
            ////激活窗体并给予它焦点
            this.Activate();
            //任务栏区显示图标
            this.ShowInTaskbar = true;
           
        }

        private void notifyIcon1_DoubleClick(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Minimized)
            {
                //还原窗体显示    
                WindowState = FormWindowState.Normal;
                //激活窗体并给予它焦点
                this.Activate();
                //任务栏区显示图标
                this.ShowInTaskbar = true;               
            }
        }

        private void skinButton1_Click(object sender, EventArgs e)
        {
            //AutoUpdater.ReportErrors = true;
            //AutoUpdater.DownloadPath = Application.StartupPath;
            //AutoUpdater.Start("http://10.87.230.225:7777/newUpdate/update.xml");
            
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
          
            Do自动更新();
            
            
        }

        private void Do自动更新()
        {
            try
            {
                Updater.CheckUpdateSimple(autoUpdateURL + "/newUpdate/{0}", "update.xml");
            }
            catch (Exception ex )
            {
                BasComm.writeError("自动更新出现了异常！"+ex.Message);
            }
        }

        private void skinButton1_Click_1(object sender, EventArgs e)
        {
            
        }

        private void FmMain_KeyDown(object sender, KeyEventArgs e)
        {
            //if (e.Control && e.KeyCode == Keys.A)
            //{
            //    MessageBox.Show("按下了Ctr+A");
            //}
            //if (e.Control && KeyH && KeyB && KeyJ && KeyK)
            //{
            //    MessageBox.Show("组合按键成功了！");
            //}
            if ((int)ModifierKeys == (int)Keys.Control + (int)Keys.Alt && e.KeyCode == Keys.H)
            {
                //MessageBox.Show("组合按键成功了！");
                BaseInformation fm = new BaseInformation(this.devInfo);
                fm.ShowDialog();
                if (fm.DialogResult == DialogResult.OK)
                {
                    devInfo = fm.devInfo;
                    fm.Close();
                    fm.Dispose();
                }
            }
        }

        /// <summary>
        /// 发送远程请求按钮被点击了
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnHelp_Click(object sender, EventArgs e)
        {
            string data = "{\"UUID\":\"" + devInfo.UUID + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            if (Tools.httpPost(serverURL + "/admin/test/sendHelpInfo", data, ref sOutPut, ref sErr))
            {
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("发送远程请求成功！" + jo.ToString());//打印对象字符串                
                if (jo["code"].ToString().Equals("1"))
                {

                    MessageBox.Show("发送远程请求成功！");
                }
                else
                {
                    BasComm.writeError("获取远程请求失败！:" + jo["msg"].ToString());
                }
            }
            else
            {
                BasComm.writeError("获取远程请求异常：" + sErr);
            }
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            deviceRepair fm = new deviceRepair(devInfo);
            fm.ShowDialog();
            if (fm.DialogResult == DialogResult.OK)
            {
                fm.Close();
                fm.Dispose();
            }
        }

        private void btnReportRecord_Click(object sender, EventArgs e)
        {
            ReportRecord fm = new ReportRecord(devInfo);
            fm.ShowDialog();
           
        }

        private void btnRestartVNC_Click(object sender, EventArgs e)
        {
            BasComm.restartVNCForce();
            MessageBox.Show("重启远程服务成功！");
        }
    }


    public class DLL
    {
        [DllImport("PrScrn.dll", EntryPoint = "PrScrn")]

        public extern static int PrScrn();//与dll中一致   
    }



    public static class Hotkey
    {

        #region 系统api
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        static extern bool RegisterHotKey(IntPtr hWnd, int id, HotkeyModifiers fsModifiers, Keys vk);

        [DllImport("user32.dll")]
        static extern bool UnregisterHotKey(IntPtr hWnd, int id);
        #endregion

        /// <summary> 
        /// 注册快捷键 
        /// </summary> 
        /// <param name="hWnd">持有快捷键窗口的句柄</param> 
        /// <param name="fsModifiers">组合键</param> 
        /// <param name="vk">快捷键的虚拟键码</param> 
        /// <param name="callBack">回调函数</param> 
        public static void Regist(IntPtr hWnd, HotkeyModifiers fsModifiers, Keys vk, HotKeyCallBackHanlder callBack)
        {
            int id = keyid++;
            if (!RegisterHotKey(hWnd, id, fsModifiers, vk))
                return;
            keymap[id] = callBack;
        }

        /// <summary> 
        /// 注销快捷键 
        /// </summary> 
        /// <param name="hWnd">持有快捷键窗口的句柄</param> 
        /// <param name="callBack">回调函数</param> 
        public static void UnRegist(IntPtr hWnd, HotKeyCallBackHanlder callBack)
        {
            foreach (KeyValuePair<int, HotKeyCallBackHanlder> var in keymap)
            {
                if (var.Value == callBack)
                    UnregisterHotKey(hWnd, var.Key);
            }
        }

        /// <summary> 
        /// 快捷键消息处理 
        /// </summary> 
        public static void ProcessHotKey(System.Windows.Forms.Message m)
        {
            if (m.Msg == WM_HOTKEY)
            {
                int id = m.WParam.ToInt32();
                HotKeyCallBackHanlder callback;
                if (keymap.TryGetValue(id, out callback))
                {
                    callback();
                }
            }
        }

        const int WM_HOTKEY = 0x312;
        static int keyid = 100;
        static Dictionary<int, HotKeyCallBackHanlder> keymap = new Dictionary<int, HotKeyCallBackHanlder>();

        public delegate void HotKeyCallBackHanlder();
    }

    public enum HotkeyModifiers
    {
        MOD_ALT = 0x1,
        MOD_CONTROL = 0x2,
        MOD_SHIFT = 0x4,
        MOD_WIN = 0x8
    }

}
