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

namespace DevManager.deviceform
{
    public partial class ReportRecord :  Skin_Metro
    {
        private Device deviceInfo = new Device();
        public ReportRecord(Device dv)
        {
            deviceInfo = dv;
            InitializeComponent();
        }

        private void setGridHeader()
        {
            dgvReportRecord.Columns.Add("id","id");
            dgvReportRecord.Columns.Add("problem_name", "问题类型");   
            dgvReportRecord.Columns.Add("report_device_name", "上报终端名称");
            dgvReportRecord.Columns.Add("repair_device_name", "故障终端名称");
            dgvReportRecord.Columns.Add("problem_description", "问题描述");
            dgvReportRecord.Columns.Add("status_name", "状态");
            dgvReportRecord.Columns.Add("create_time", "申请时间");
            dgvReportRecord.Columns.Add("report_user_phone", "申请人电话");
            dgvReportRecord.Columns.Add("accepted_user", "技术员");
            dgvReportRecord.Columns.Add("accepted_time", "接收时间");
            dgvReportRecord.Columns.Add("finish_time", "完成时间");
            dgvReportRecord.Columns.Add("deprecated_time", "作废时间");
        }

        private void setCombType()
        {
            List<KeyValuePair<string, string>> listItem = new List<KeyValuePair<string, string>>();
            //key:前者  value:后者
            //listItem.Add(new KeyValuePair<string, int>("key", value));
            listItem.Add(new KeyValuePair<string, string>("1", "电脑故障"));
            listItem.Add(new KeyValuePair<string, string>("2", "打印机故障"));
            listItem.Add(new KeyValuePair<string, string>("3", "HIS系统故障"));
            listItem.Add(new KeyValuePair<string, string>("4", "固定电话故障"));
            listItem.Add(new KeyValuePair<string, string>("5", "网络故障"));
            listItem.Add(new KeyValuePair<string, string>("6", "其他故障"));
            combType.DataSource = listItem;
            combType.DisplayMember = "Value";
            combType.ValueMember = "key";
            combType.SelectedIndex = 0;

        }

        private void setCombStatus()
        {
            List<KeyValuePair<string, string>> listItem = new List<KeyValuePair<string, string>>();
            //key:前者  value:后者
            //listItem.Add(new KeyValuePair<string, int>("key", value));
            listItem.Add(new KeyValuePair<string, string>("0", "已申请"));
            listItem.Add(new KeyValuePair<string, string>("1", "已安排"));
            listItem.Add(new KeyValuePair<string, string>("2", "处理完成"));
            listItem.Add(new KeyValuePair<string, string>("-1", "作废"));
            combStatus.DataSource = listItem;
            combStatus.DisplayMember = "Value";
            combStatus.ValueMember = "key";
            combStatus.SelectedIndex = 0;
        }

        private void ReportRecord_Load(object sender, EventArgs e)
        {
            setGridHeader();
            timeStartTime.Text = DateTime.Now.ToString("yyyy-MM-dd")+" 00:00:00";
            timeEndTime.Text = DateTime.Now.ToString("yyyy-MM-dd")+" 23:59:59";
            setCombStatus();
            setCombType();


        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string startTime = timeStartTime.Text;
            string endTime = timeEndTime.Text;
            KeyValuePair<string, string> kvStatus = (KeyValuePair<string, string>)combStatus.SelectedItem;
            KeyValuePair<string, string> kvType = (KeyValuePair<string, string>)combType.SelectedItem;
            string data = "{\"report_device_id\":\"" + deviceInfo.id + "\",";
            data += "\"start_time\":\""+startTime+"\",";
            data += "\"end_time\":\""+endTime+"\",";
            data += "\"status\":\""+kvStatus.Key+"\",";
            data += "\"type\":\""+kvType.Key+"\"}";
            string sOutPut = string.Empty;
            string sErr = string.Empty;
            string url = BasComm.getIniValue("系统", "服务器地址")+ "/admin/test/getRepairRecord"; // 获取服务器地址
            if (Tools.httpPost(url  , data, ref sOutPut, ref sErr))
            {
                // 加载前先清空原来数据
                dgvReportRecord.Rows.Clear();
                BasComm.writeLog("请求返回信息为:" + sOutPut);
                JObject jo = JObject.Parse(sOutPut);
                BasComm.writeLog("请求报修记录信息返回！" + jo.ToString());//打印对象字符串               
                if (jo["code"].ToString().Equals("1"))
                {
                    int size = jo["data"].ToArray().Count();
                    if (size > 0)
                    {
                       
                        for (int i = 0; i < size; i++)
                        {
                            dgvReportRecord.Rows.Add(
                                jo["data"][i]["id"].ToString(),
                                jo["data"][i]["problem_name"].ToString(),
                                jo["data"][i]["report_device_name"].ToString(),
                                jo["data"][i]["repair_device_name"].ToString(),
                                jo["data"][i]["problem_description"].ToString(),
                                jo["data"][i]["status_name"].ToString(),
                                jo["data"][i]["create_time"].ToString(),
                                jo["data"][i]["report_user_phone"].ToString(),
                                jo["data"][i]["accepted_user"].ToString(),
                                jo["data"][i]["accepted_time"].ToString(),
                                jo["data"][i]["finish_time"].ToString(),
                                jo["data"][i]["deprecated_time"].ToString()
                                );
                        }
                    }
                }
                else
                {
                    MessageBox.Show(url+"请求返回数据为空！");
                    BasComm.writeError("请求发生了错误！");
                }
            }
            else
            {
                MessageBox.Show(url + "请求发生异常！");
                BasComm.writeError("请求发生了错误：" + sErr);
            }
        }
    }
}
