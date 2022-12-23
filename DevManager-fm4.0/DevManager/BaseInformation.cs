using CCWin;
using DevManager.lib;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DevManager
{
    public partial class BaseInformation : Skin_Metro
    {
        public Device devInfo = null;
        public BaseInformation(Device dv)
        {
            devInfo = dv;
            InitializeComponent();
        }

        private void BaseInformation_Load(object sender, EventArgs e)
        {
            DoSetCombValue();
            txtUUID.Text = devInfo.UUID;
            loadDeviceInfo();
            setFormInfo(devInfo);
        }

        private void setFormInfo(Device Dev)
        {
            combDepart.SelectedValue = Dev.group;
            txtDevName.Text = Dev.deviceName;
            txtLocation.Text = Dev.location;
            rtxtMark.Text = Dev.mark;
        }


        private void loadDeviceInfo()
        {
            string data = "{\"UUID\":\"" + devInfo.UUID + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = BasComm.getIniValue("系统", "服务器地址"); // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getDeviceInfo", data, ref sOutPut, ref sErr))
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

        private void DoSetCombValue(string str="")
        {
            List<KeyValuePair<string, string>> listItem = new List<KeyValuePair<string, string>>();
            //key:前者  value:后者
            //listItem.Add(new KeyValuePair<string, int>("key", value));
            //listItem.Add(new KeyValuePair<string, string>("3", "内科"));
            //listItem.Add(new KeyValuePair<string, string>("2", "外科"));
            //listItem.Add(new KeyValuePair<string, string>("1", "骨科"));

            string data = "{\"keywords\":\"" + str + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = BasComm.getIniValue("系统", "服务器地址"); // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getGroupInfo", data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog("请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    int size = jo["data"].ToArray().Count();
                    if (size > 0)
                    {
                        for (int i = 0; i < size; i++)
                        {
                            listItem.Add(new KeyValuePair<string, string>(jo["data"][i]["id"].ToString(), jo["data"][i]["name"].ToString()));
                        }
                    }
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
            combDepart.DataSource = listItem;
            combDepart.DisplayMember = "Value";
            combDepart.ValueMember = "key";
            combDepart.SelectedIndex = 0;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            KeyValuePair<string, string> keyValue = (KeyValuePair<string, string>)combDepart.SelectedItem;
            //combDepart.SelectedText = "";
            if (txtLocation.Text == "")
            { MessageBox.Show("位置信息不能为空"); return; }
            if (txtDevName.Text == "")
            { MessageBox.Show("设备名称不能为空"); return; }
            string data = "{\"UUID\":\"" + devInfo.UUID + "\",\"device_name\":\""+txtDevName.Text+"\",\"location\":\""+txtLocation.Text+"\",";
            data += "\"ip\":\"" + devInfo.validIp + "\",";//有效ip地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
            data += "\"ips\":\"" + devInfo.ipAddress + "\",";//可能的ip地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
            data += "\"mac\":\"" + devInfo.macAddress + "\",";//MAC地址                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            data += "\"computer_name\":\"" + devInfo.hostName + "\",";//计算机名称                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
            data += "\"group\":\"" + keyValue.Key + "\",";//部门id                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            data += "\"os_version\":\"" + devInfo.OSVersion + "\",";//操作系统版本
            data += "\"mark\":\"" + rtxtMark.Text + "\"";//备注信息
            data += "}";
            devInfo.group = keyValue.Key;
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = BasComm.getIniValue("系统", "服务器地址"); // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/setDeviceInfo", data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog("请求返回信息为:"+sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    devInfo.deviceName = txtDevName.Text;
                    devInfo.location = txtLocation.Text;
                    devInfo.mark = rtxtMark.Text;                    
                    MessageBox.Show("保存成功！");
                    this.DialogResult = DialogResult.OK;
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

        private void combDepart_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                string sKeyword = combDepart.Text;
                DoSetCombValue(sKeyword);
            }
        }
    }
}
