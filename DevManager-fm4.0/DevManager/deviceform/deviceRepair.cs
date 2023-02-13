using CCWin;
using DevManager.lib;
using DevManger;
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

namespace DevManager.deviceform
{
    public partial class deviceRepair : ResponsiveForm
    {
        public Device deviceInfo = new Device();
        public deviceRepair(Device dv )
        {
            deviceInfo = dv;
            InitializeComponent();
        }

        private void setReportDeviceInfo()
        {
            txtRepairDesc.Text = "上报设备ID为:" + deviceInfo.id.ToString()+"  " ;
            txtRepairDesc.Text += "设备名称为:" + deviceInfo.deviceName.ToString()+"  " ;
            txtRepairDesc.Text += "设备位置为:" + deviceInfo.location.ToString()+"  " ;
            txtRepairDesc.Text += "设备uuid为:" + deviceInfo.UUID.ToString()+"  ";
        }
        private void setRepairType()
        {
            combRepairType.Items.Add("当前设备");
            combRepairType.Items.Add("同组设备");
            combRepairType.Items.Add("所有设备");
            combRepairType.SelectedIndex = 0;
        }

        private void setGridInfo()
        {
           
            string problem_type = "";
            if (chkComputerProblem.Checked == true) problem_type += "1,";
            if (chkPrintProblem.Checked == true) problem_type += "2,";
            if (chkHISProblem.Checked == true) problem_type += "3,";
            if (chkPhoneProblem.Checked == true) problem_type += "4,";
            if (chkNetworkProblem.Checked == true) problem_type += "5,";
            if (chkOtherProblem.Checked == true) problem_type += "6,";
            if (problem_type.Length == 0)
            {
                ///MessageBox.Show("报修问题不能为空！");
                return;
            }
            problem_type = problem_type.Substring(0, problem_type.Length - 1); // 去除最后一个分号 
            // 赋值前先清楚一遍记录  
            dgvFrequentProblem.Rows.Clear();
            string data = "{\"repair_type\":\"" + problem_type + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = deviceInfo.ServerUrl + "/admin/test/getOftenProblem"; // 获取服务器地址
            if (Tools.httpPost(url, data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog(url + "s请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    int len = jo["data"].ToArray().Count();
                    if (len > 0)
                    {
                        for (int i = 0; i < len; i++)
                        {
                            dgvFrequentProblem.Rows.Add(jo["data"][i]["name"].ToString());
                        }
                    }
                }
                else
                {
                    MessageBox.Show("请求发生了错误！" + jo["msg"].ToString());
                    BasComm.writeError(url + "请求发生了错误！");
                    return;
                }
            }
            else
            {
                MessageBox.Show(url + "请求发生了错误！" + sErr);
                BasComm.writeError(url + "请求发生了错误：" + sErr);
                return;
            }



        }

        private void DoSetCombDeviceValue(string str = "")
        {

            string type = combRepairType.SelectedItem.ToString();
            string data =  "{\"keywords\":\"" + str + "\",\"id\":\"" + deviceInfo.id + "\"}";
            switch (type)
            {
                case "当前设备": data = "{\"keywords\":\"" + str + "\",\"id\":\""+deviceInfo.id+"\"}";
                    break;
                case "同组设备": data = "{\"keywords\":\"" + str + "\",\"group\":\"" + deviceInfo.group + "\"}";
                    break;
                case "所有设备":
                    data = "{\"keywords\":\"" + str + "\",\"expect_id\":\"" + deviceInfo.id + "\"}";
                    break;
                default:
                    data = "{\"keywords\":\"" + str + "\",\"id\":\"" + deviceInfo.id + "\"}";
                    break;
            }
               

            List<KeyValuePair<string, string>> listItem = new List<KeyValuePair<string, string>>();
            //key:前者  value:后者
            //listItem.Add(new KeyValuePair<string, int>("key", value));
            //listItem.Add(new KeyValuePair<string, string>("3", "内科"));
            //listItem.Add(new KeyValuePair<string, string>("2", "外科"));
            //listItem.Add(new KeyValuePair<string, string>("1", "骨科"));
            BasComm.writeLog("请求数据为:"+data);
            //data = "{\"keywords\":\"" + str + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = BasComm.getIniValue("系统", "服务器地址"); // 获取服务器地址
            if (Tools.httpPost(url + "/admin/test/getDeviceInfos", data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog(url+"/admin/test/getDeviceInfos请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    int size = jo["data"].ToArray().Count();
                    if (size > 0)
                    {
                        for (int i = 0; i < size; i++)
                        {
                            listItem.Add(new KeyValuePair<string, string>(jo["data"][i]["id"].ToString(), jo["data"][i]["location"].ToString()+jo["data"][i]["device_name"].ToString()));
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
            combDevice.DataSource = listItem;
            combDevice.DisplayMember = "Value";
            combDevice.ValueMember = "key";
            if(listItem.Count()>0) combDevice.SelectedIndex = 0;

        }
        private void deviceRepair_Load(object sender, EventArgs e)
        {
            setRepairType();
            setReportDeviceInfo();

            this.dgvFrequentProblem.Columns.Add("常见问题", "常见问题");
        }

        private void combRepairType_SelectedIndexChanged(object sender, EventArgs e)
        {
            DoSetCombDeviceValue();
        }

        private void combDevice_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyCode == Keys.Enter)
            {
                string sKeyword = combDevice.Text;
                DoSetCombDeviceValue(sKeyword);
                //combDevice.DroppedDown = true;
            }
        }

        private void btnRepairSave_Click(object sender, EventArgs e)
        {
            KeyValuePair<string, string> keyValue = (KeyValuePair<string, string>)combDevice.SelectedItem;
            string data = "";
            string dataType = "";
            string sReportPhone = txtRepairPhone.Text;
            if (string.IsNullOrEmpty(sReportPhone))
            {
                MessageBox.Show("上报人联系电话不能为空！");
                txtRepairPhone.Focus();
                return;
            }
            if (chkComputerProblem.Checked == true) dataType += "{\"problem_type\":\"1\"},";
            if (chkPrintProblem.Checked == true) dataType += "{\"problem_type\":\"2\"},";
            if (chkHISProblem.Checked == true) dataType += "{\"problem_type\":\"3\"},";
            if (chkPhoneProblem.Checked == true) dataType += "{\"problem_type\":\"4\"},";
            if (chkNetworkProblem.Checked == true) dataType += "{\"problem_type\":\"5\"},";
            if (chkOtherProblem.Checked == true) dataType += "{\"problem_type\":\"6\"},";
            if (dataType.Length == 0)
            {
                MessageBox.Show("报修问题不能为空！");
                return;              
            }
            dataType = dataType.Substring(0, dataType.Length - 1); // 去除最后一个分号 
            data += "\"report_device_id\":\"" + deviceInfo.id + "\",";//上报终端id       
            data += "\"repair_device_id\":\"" + keyValue.Key + "\",";//上报终端id       
            data += "\"problem_description\":\"" + rtxtDescription.Text+ "\",";//上报终端id       
            data += "\"report_user_phone\":\"" + sReportPhone + "\",";//上报终端id       
            data += "\"problem_type\":[{0}]";//上报终端id   
            data = "{"+string.Format(data, dataType)+"}";  
            BasComm.writeLog("请求数据为:" + data);
            //data = "{\"keywords\":\"" + str + "\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url =deviceInfo.ServerUrl + "/admin/test/sendDeviceRepair"; // 获取服务器地址
            if (Tools.httpPost(url , data, ref sOutPut, ref sErr))
            {
                BasComm.writeLog(url + "s请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求设备信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    this.DialogResult = DialogResult.OK;
                    MessageBox.Show(jo["msg"].ToString());
                }
                else
                {
                    MessageBox.Show("请求发生了错误！"+jo["msg"].ToString());
                    BasComm.writeError(url+"请求发生了错误！");
                    return;
                }
            }
            else
            {
                MessageBox.Show(url + "请求发生了错误！" + sErr);
                BasComm.writeError(url+"请求发生了错误：" + sErr);
                return;
            }

        }

        private void dgvFrequentProblem_DoubleClick(object sender, EventArgs e)
        {
            if (dgvFrequentProblem.CurrentRow != null)
            {
                string problemStr = "";
                problemStr = dgvFrequentProblem.CurrentRow.Cells["常见问题"].Value.ToString();
                if (rtxtDescription.Text.Length > 0)
                {
                    rtxtDescription.Text += "," + problemStr;
                }
                else
                {
                    rtxtDescription.Text = problemStr;
                }
            }
        }

        private void chkComputerProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }

        private void chkPrintProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }

        private void chkHISProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }

        private void chkPhoneProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }

        private void chkNetworkProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }

        private void chkOtherProblem_CheckedChanged(object sender, EventArgs e)
        {
            setGridInfo();
        }
    }
}
