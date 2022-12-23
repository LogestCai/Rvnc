namespace DevManager.deviceform
{
    partial class deviceRepair
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(deviceRepair));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.txtRepairPhone = new CCWin.SkinControl.SkinTextBox();
            this.labDevName = new CCWin.SkinControl.SkinLabel();
            this.btnRepairSave = new CCWin.SkinControl.SkinButton();
            this.rtxtDescription = new CCWin.SkinControl.RtfRichTextBox();
            this.labDepart = new CCWin.SkinControl.SkinLabel();
            this.skinLabel3 = new CCWin.SkinControl.SkinLabel();
            this.txtRepairDesc = new CCWin.SkinControl.SkinWaterTextBox();
            this.combDevice = new CCWin.SkinControl.SkinComboBox();
            this.chkComputerProblem = new CCWin.SkinControl.SkinCheckBox();
            this.chkPrintProblem = new CCWin.SkinControl.SkinCheckBox();
            this.chkHISProblem = new CCWin.SkinControl.SkinCheckBox();
            this.chkOtherProblem = new CCWin.SkinControl.SkinCheckBox();
            this.chkNetworkProblem = new CCWin.SkinControl.SkinCheckBox();
            this.chkPhoneProblem = new CCWin.SkinControl.SkinCheckBox();
            this.skinLabel1 = new CCWin.SkinControl.SkinLabel();
            this.skinPanel1 = new CCWin.SkinControl.SkinPanel();
            this.btnQuickDesc = new CCWin.SkinControl.SkinButton();
            this.combRepairType = new CCWin.SkinControl.SkinComboBox();
            this.skinLabel2 = new CCWin.SkinControl.SkinLabel();
            this.dgvFrequentProblem = new CCWin.SkinControl.SkinDataGridView();
            this.skinPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvFrequentProblem)).BeginInit();
            this.SuspendLayout();
            // 
            // txtRepairPhone
            // 
            this.txtRepairPhone.BackColor = System.Drawing.Color.Transparent;
            this.txtRepairPhone.DownBack = null;
            this.txtRepairPhone.Icon = null;
            this.txtRepairPhone.IconIsButton = false;
            this.txtRepairPhone.IconMouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtRepairPhone.IsPasswordChat = '\0';
            this.txtRepairPhone.IsSystemPasswordChar = false;
            this.txtRepairPhone.Lines = new string[0];
            this.txtRepairPhone.Location = new System.Drawing.Point(144, 151);
            this.txtRepairPhone.Margin = new System.Windows.Forms.Padding(0);
            this.txtRepairPhone.MaxLength = 32767;
            this.txtRepairPhone.MinimumSize = new System.Drawing.Size(28, 28);
            this.txtRepairPhone.MouseBack = null;
            this.txtRepairPhone.MouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtRepairPhone.Multiline = true;
            this.txtRepairPhone.Name = "txtRepairPhone";
            this.txtRepairPhone.NormlBack = null;
            this.txtRepairPhone.Padding = new System.Windows.Forms.Padding(5);
            this.txtRepairPhone.ReadOnly = false;
            this.txtRepairPhone.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtRepairPhone.Size = new System.Drawing.Size(382, 29);
            // 
            // 
            // 
            this.txtRepairPhone.SkinTxt.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRepairPhone.SkinTxt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRepairPhone.SkinTxt.Font = new System.Drawing.Font("微软雅黑", 9.75F);
            this.txtRepairPhone.SkinTxt.Location = new System.Drawing.Point(5, 5);
            this.txtRepairPhone.SkinTxt.Multiline = true;
            this.txtRepairPhone.SkinTxt.Name = "BaseText";
            this.txtRepairPhone.SkinTxt.Size = new System.Drawing.Size(372, 19);
            this.txtRepairPhone.SkinTxt.TabIndex = 0;
            this.txtRepairPhone.SkinTxt.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtRepairPhone.SkinTxt.WaterText = "";
            this.txtRepairPhone.TabIndex = 14;
            this.txtRepairPhone.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtRepairPhone.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtRepairPhone.WaterText = "";
            this.txtRepairPhone.WordWrap = true;
            // 
            // labDevName
            // 
            this.labDevName.AutoSize = true;
            this.labDevName.BackColor = System.Drawing.Color.Transparent;
            this.labDevName.BorderColor = System.Drawing.Color.White;
            this.labDevName.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labDevName.Location = new System.Drawing.Point(28, 151);
            this.labDevName.Name = "labDevName";
            this.labDevName.Size = new System.Drawing.Size(110, 21);
            this.labDevName.TabIndex = 21;
            this.labDevName.Text = "上报人手机号:";
            // 
            // btnRepairSave
            // 
            this.btnRepairSave.BackColor = System.Drawing.Color.Transparent;
            this.btnRepairSave.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnRepairSave.DownBack = null;
            this.btnRepairSave.Location = new System.Drawing.Point(487, 506);
            this.btnRepairSave.MouseBack = null;
            this.btnRepairSave.Name = "btnRepairSave";
            this.btnRepairSave.NormlBack = null;
            this.btnRepairSave.Size = new System.Drawing.Size(102, 31);
            this.btnRepairSave.TabIndex = 19;
            this.btnRepairSave.Text = "保存";
            this.btnRepairSave.UseVisualStyleBackColor = false;
            this.btnRepairSave.Click += new System.EventHandler(this.btnRepairSave_Click);
            // 
            // rtxtDescription
            // 
            this.rtxtDescription.HiglightColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.White;
            this.rtxtDescription.Location = new System.Drawing.Point(144, 278);
            this.rtxtDescription.Name = "rtxtDescription";
            this.rtxtDescription.Size = new System.Drawing.Size(382, 104);
            this.rtxtDescription.TabIndex = 18;
            this.rtxtDescription.Text = "";
            this.rtxtDescription.TextColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.Black;
            // 
            // labDepart
            // 
            this.labDepart.AutoSize = true;
            this.labDepart.BackColor = System.Drawing.Color.Transparent;
            this.labDepart.BorderColor = System.Drawing.Color.White;
            this.labDepart.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labDepart.Location = new System.Drawing.Point(60, 442);
            this.labDepart.Name = "labDepart";
            this.labDepart.Size = new System.Drawing.Size(78, 21);
            this.labDepart.TabIndex = 17;
            this.labDepart.Text = "报修设备:";
            // 
            // skinLabel3
            // 
            this.skinLabel3.AutoSize = true;
            this.skinLabel3.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel3.BorderColor = System.Drawing.Color.White;
            this.skinLabel3.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel3.Location = new System.Drawing.Point(60, 278);
            this.skinLabel3.Name = "skinLabel3";
            this.skinLabel3.Size = new System.Drawing.Size(78, 21);
            this.skinLabel3.TabIndex = 16;
            this.skinLabel3.Text = "现象描述:";
            // 
            // txtRepairDesc
            // 
            this.txtRepairDesc.BackColor = System.Drawing.Color.Thistle;
            this.txtRepairDesc.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRepairDesc.Font = new System.Drawing.Font("楷体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtRepairDesc.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.txtRepairDesc.Location = new System.Drawing.Point(144, 59);
            this.txtRepairDesc.Multiline = true;
            this.txtRepairDesc.Name = "txtRepairDesc";
            this.txtRepairDesc.ReadOnly = true;
            this.txtRepairDesc.Size = new System.Drawing.Size(382, 81);
            this.txtRepairDesc.TabIndex = 23;
            this.txtRepairDesc.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtRepairDesc.WaterText = "";
            // 
            // combDevice
            // 
            this.combDevice.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.combDevice.FormattingEnabled = true;
            this.combDevice.Location = new System.Drawing.Point(144, 442);
            this.combDevice.Name = "combDevice";
            this.combDevice.Size = new System.Drawing.Size(382, 22);
            this.combDevice.TabIndex = 11;
            this.combDevice.WaterText = "";
            this.combDevice.KeyDown += new System.Windows.Forms.KeyEventHandler(this.combDevice_KeyDown);
            // 
            // chkComputerProblem
            // 
            this.chkComputerProblem.AutoSize = true;
            this.chkComputerProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkComputerProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkComputerProblem.DownBack = null;
            this.chkComputerProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkComputerProblem.Location = new System.Drawing.Point(144, 194);
            this.chkComputerProblem.MouseBack = null;
            this.chkComputerProblem.Name = "chkComputerProblem";
            this.chkComputerProblem.NormlBack = null;
            this.chkComputerProblem.SelectedDownBack = null;
            this.chkComputerProblem.SelectedMouseBack = null;
            this.chkComputerProblem.SelectedNormlBack = null;
            this.chkComputerProblem.Size = new System.Drawing.Size(75, 21);
            this.chkComputerProblem.TabIndex = 24;
            this.chkComputerProblem.Text = "电脑故障";
            this.chkComputerProblem.UseVisualStyleBackColor = false;
            this.chkComputerProblem.CheckedChanged += new System.EventHandler(this.chkComputerProblem_CheckedChanged);
            // 
            // chkPrintProblem
            // 
            this.chkPrintProblem.AutoSize = true;
            this.chkPrintProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkPrintProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkPrintProblem.DownBack = null;
            this.chkPrintProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkPrintProblem.Location = new System.Drawing.Point(268, 194);
            this.chkPrintProblem.MouseBack = null;
            this.chkPrintProblem.Name = "chkPrintProblem";
            this.chkPrintProblem.NormlBack = null;
            this.chkPrintProblem.SelectedDownBack = null;
            this.chkPrintProblem.SelectedMouseBack = null;
            this.chkPrintProblem.SelectedNormlBack = null;
            this.chkPrintProblem.Size = new System.Drawing.Size(87, 21);
            this.chkPrintProblem.TabIndex = 25;
            this.chkPrintProblem.Text = "打印机故障";
            this.chkPrintProblem.UseVisualStyleBackColor = false;
            this.chkPrintProblem.CheckedChanged += new System.EventHandler(this.chkPrintProblem_CheckedChanged);
            // 
            // chkHISProblem
            // 
            this.chkHISProblem.AutoSize = true;
            this.chkHISProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkHISProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkHISProblem.DownBack = null;
            this.chkHISProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkHISProblem.Location = new System.Drawing.Point(388, 194);
            this.chkHISProblem.MouseBack = null;
            this.chkHISProblem.Name = "chkHISProblem";
            this.chkHISProblem.NormlBack = null;
            this.chkHISProblem.SelectedDownBack = null;
            this.chkHISProblem.SelectedMouseBack = null;
            this.chkHISProblem.SelectedNormlBack = null;
            this.chkHISProblem.Size = new System.Drawing.Size(95, 21);
            this.chkHISProblem.TabIndex = 26;
            this.chkHISProblem.Text = "HIS系统故障";
            this.chkHISProblem.UseVisualStyleBackColor = false;
            this.chkHISProblem.CheckedChanged += new System.EventHandler(this.chkHISProblem_CheckedChanged);
            // 
            // chkOtherProblem
            // 
            this.chkOtherProblem.AutoSize = true;
            this.chkOtherProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkOtherProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkOtherProblem.DownBack = null;
            this.chkOtherProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkOtherProblem.Location = new System.Drawing.Point(388, 221);
            this.chkOtherProblem.MouseBack = null;
            this.chkOtherProblem.Name = "chkOtherProblem";
            this.chkOtherProblem.NormlBack = null;
            this.chkOtherProblem.SelectedDownBack = null;
            this.chkOtherProblem.SelectedMouseBack = null;
            this.chkOtherProblem.SelectedNormlBack = null;
            this.chkOtherProblem.Size = new System.Drawing.Size(75, 21);
            this.chkOtherProblem.TabIndex = 27;
            this.chkOtherProblem.Text = "其他故障";
            this.chkOtherProblem.UseVisualStyleBackColor = false;
            this.chkOtherProblem.CheckedChanged += new System.EventHandler(this.chkOtherProblem_CheckedChanged);
            // 
            // chkNetworkProblem
            // 
            this.chkNetworkProblem.AutoSize = true;
            this.chkNetworkProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkNetworkProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkNetworkProblem.DownBack = null;
            this.chkNetworkProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkNetworkProblem.Location = new System.Drawing.Point(268, 221);
            this.chkNetworkProblem.MouseBack = null;
            this.chkNetworkProblem.Name = "chkNetworkProblem";
            this.chkNetworkProblem.NormlBack = null;
            this.chkNetworkProblem.SelectedDownBack = null;
            this.chkNetworkProblem.SelectedMouseBack = null;
            this.chkNetworkProblem.SelectedNormlBack = null;
            this.chkNetworkProblem.Size = new System.Drawing.Size(75, 21);
            this.chkNetworkProblem.TabIndex = 28;
            this.chkNetworkProblem.Text = "网络故障";
            this.chkNetworkProblem.UseVisualStyleBackColor = false;
            this.chkNetworkProblem.CheckedChanged += new System.EventHandler(this.chkNetworkProblem_CheckedChanged);
            // 
            // chkPhoneProblem
            // 
            this.chkPhoneProblem.AutoSize = true;
            this.chkPhoneProblem.BackColor = System.Drawing.Color.Transparent;
            this.chkPhoneProblem.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.chkPhoneProblem.DownBack = null;
            this.chkPhoneProblem.Font = new System.Drawing.Font("微软雅黑", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.chkPhoneProblem.Location = new System.Drawing.Point(144, 221);
            this.chkPhoneProblem.MouseBack = null;
            this.chkPhoneProblem.Name = "chkPhoneProblem";
            this.chkPhoneProblem.NormlBack = null;
            this.chkPhoneProblem.SelectedDownBack = null;
            this.chkPhoneProblem.SelectedMouseBack = null;
            this.chkPhoneProblem.SelectedNormlBack = null;
            this.chkPhoneProblem.Size = new System.Drawing.Size(99, 21);
            this.chkPhoneProblem.TabIndex = 29;
            this.chkPhoneProblem.Text = "固定电话故障";
            this.chkPhoneProblem.UseVisualStyleBackColor = false;
            this.chkPhoneProblem.CheckedChanged += new System.EventHandler(this.chkPhoneProblem_CheckedChanged);
            // 
            // skinLabel1
            // 
            this.skinLabel1.AutoSize = true;
            this.skinLabel1.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel1.BorderColor = System.Drawing.Color.White;
            this.skinLabel1.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel1.Location = new System.Drawing.Point(60, 191);
            this.skinLabel1.Name = "skinLabel1";
            this.skinLabel1.Size = new System.Drawing.Size(78, 21);
            this.skinLabel1.TabIndex = 30;
            this.skinLabel1.Text = "报修问题:";
            // 
            // skinPanel1
            // 
            this.skinPanel1.BackColor = System.Drawing.Color.Transparent;
            this.skinPanel1.BorderColor = System.Drawing.Color.DeepSkyBlue;
            this.skinPanel1.Controls.Add(this.dgvFrequentProblem);
            this.skinPanel1.Controls.Add(this.btnQuickDesc);
            this.skinPanel1.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.skinPanel1.DownBack = null;
            this.skinPanel1.Location = new System.Drawing.Point(569, 59);
            this.skinPanel1.MouseBack = null;
            this.skinPanel1.Name = "skinPanel1";
            this.skinPanel1.NormlBack = null;
            this.skinPanel1.Size = new System.Drawing.Size(403, 405);
            this.skinPanel1.TabIndex = 31;
            // 
            // btnQuickDesc
            // 
            this.btnQuickDesc.BackColor = System.Drawing.Color.Transparent;
            this.btnQuickDesc.BaseColor = System.Drawing.Color.DodgerBlue;
            this.btnQuickDesc.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnQuickDesc.DownBack = null;
            this.btnQuickDesc.Font = new System.Drawing.Font("隶书", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnQuickDesc.ForeColor = System.Drawing.Color.White;
            this.btnQuickDesc.Image = ((System.Drawing.Image)(resources.GetObject("btnQuickDesc.Image")));
            this.btnQuickDesc.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnQuickDesc.ImageSize = new System.Drawing.Size(25, 25);
            this.btnQuickDesc.Location = new System.Drawing.Point(3, 3);
            this.btnQuickDesc.MouseBack = null;
            this.btnQuickDesc.Name = "btnQuickDesc";
            this.btnQuickDesc.NormlBack = null;
            this.btnQuickDesc.Padding = new System.Windows.Forms.Padding(60, 0, 0, 0);
            this.btnQuickDesc.Size = new System.Drawing.Size(397, 27);
            this.btnQuickDesc.TabIndex = 32;
            this.btnQuickDesc.Text = "双击快速选择故障描述";
            this.btnQuickDesc.UseVisualStyleBackColor = false;
            // 
            // combRepairType
            // 
            this.combRepairType.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.combRepairType.FormattingEnabled = true;
            this.combRepairType.Location = new System.Drawing.Point(144, 395);
            this.combRepairType.Name = "combRepairType";
            this.combRepairType.Size = new System.Drawing.Size(382, 22);
            this.combRepairType.TabIndex = 32;
            this.combRepairType.WaterText = "";
            this.combRepairType.SelectedIndexChanged += new System.EventHandler(this.combRepairType_SelectedIndexChanged);
            // 
            // skinLabel2
            // 
            this.skinLabel2.AutoSize = true;
            this.skinLabel2.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel2.BorderColor = System.Drawing.Color.White;
            this.skinLabel2.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel2.Location = new System.Drawing.Point(60, 396);
            this.skinLabel2.Name = "skinLabel2";
            this.skinLabel2.Size = new System.Drawing.Size(78, 21);
            this.skinLabel2.TabIndex = 33;
            this.skinLabel2.Text = "报修类型:";
            // 
            // dgvFrequentProblem
            // 
            this.dgvFrequentProblem.AllowUserToAddRows = false;
            dataGridViewCellStyle9.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(246)))), ((int)(((byte)(253)))));
            this.dgvFrequentProblem.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle9;
            this.dgvFrequentProblem.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvFrequentProblem.BackgroundColor = System.Drawing.SystemColors.Window;
            this.dgvFrequentProblem.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvFrequentProblem.ColumnFont = null;
            this.dgvFrequentProblem.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle10.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(247)))), ((int)(((byte)(246)))), ((int)(((byte)(239)))));
            dataGridViewCellStyle10.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle10.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle10.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle10.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle10.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvFrequentProblem.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle10;
            this.dgvFrequentProblem.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvFrequentProblem.ColumnSelectForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle11.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle11.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle11.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle11.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle11.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(59)))), ((int)(((byte)(188)))), ((int)(((byte)(240)))));
            dataGridViewCellStyle11.SelectionForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle11.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvFrequentProblem.DefaultCellStyle = dataGridViewCellStyle11;
            this.dgvFrequentProblem.EnableHeadersVisualStyles = false;
            this.dgvFrequentProblem.GridColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.dgvFrequentProblem.HeadFont = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.dgvFrequentProblem.HeadSelectForeColor = System.Drawing.SystemColors.HighlightText;
            this.dgvFrequentProblem.Location = new System.Drawing.Point(3, 36);
            this.dgvFrequentProblem.Name = "dgvFrequentProblem";
            this.dgvFrequentProblem.ReadOnly = true;
            this.dgvFrequentProblem.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvFrequentProblem.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle12.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle12.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle12.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            this.dgvFrequentProblem.RowsDefaultCellStyle = dataGridViewCellStyle12;
            this.dgvFrequentProblem.RowTemplate.Height = 23;
            this.dgvFrequentProblem.Size = new System.Drawing.Size(397, 366);
            this.dgvFrequentProblem.TabIndex = 33;
            this.dgvFrequentProblem.TitleBack = null;
            this.dgvFrequentProblem.TitleBackColorBegin = System.Drawing.Color.White;
            this.dgvFrequentProblem.TitleBackColorEnd = System.Drawing.Color.FromArgb(((int)(((byte)(83)))), ((int)(((byte)(196)))), ((int)(((byte)(242)))));
            this.dgvFrequentProblem.DoubleClick += new System.EventHandler(this.dgvFrequentProblem_DoubleClick);
            // 
            // deviceRepair
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1016, 599);
            this.Controls.Add(this.skinLabel2);
            this.Controls.Add(this.combRepairType);
            this.Controls.Add(this.skinPanel1);
            this.Controls.Add(this.skinLabel1);
            this.Controls.Add(this.chkPhoneProblem);
            this.Controls.Add(this.chkNetworkProblem);
            this.Controls.Add(this.chkOtherProblem);
            this.Controls.Add(this.chkHISProblem);
            this.Controls.Add(this.chkPrintProblem);
            this.Controls.Add(this.chkComputerProblem);
            this.Controls.Add(this.txtRepairDesc);
            this.Controls.Add(this.txtRepairPhone);
            this.Controls.Add(this.labDevName);
            this.Controls.Add(this.btnRepairSave);
            this.Controls.Add(this.rtxtDescription);
            this.Controls.Add(this.labDepart);
            this.Controls.Add(this.skinLabel3);
            this.Controls.Add(this.combDevice);
            this.EffectBack = System.Drawing.Color.LightGray;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "deviceRepair";
            this.Text = "设备报修";
            this.Load += new System.EventHandler(this.deviceRepair_Load);
            this.skinPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvFrequentProblem)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private CCWin.SkinControl.SkinTextBox txtRepairPhone;
        private CCWin.SkinControl.SkinLabel labDevName;
        private CCWin.SkinControl.SkinButton btnRepairSave;
        private CCWin.SkinControl.RtfRichTextBox rtxtDescription;
        private CCWin.SkinControl.SkinLabel labDepart;
        private CCWin.SkinControl.SkinLabel skinLabel3;
        private CCWin.SkinControl.SkinWaterTextBox txtRepairDesc;
        private CCWin.SkinControl.SkinComboBox combDevice;
        private CCWin.SkinControl.SkinCheckBox chkComputerProblem;
        private CCWin.SkinControl.SkinCheckBox chkPrintProblem;
        private CCWin.SkinControl.SkinCheckBox chkHISProblem;
        private CCWin.SkinControl.SkinCheckBox chkOtherProblem;
        private CCWin.SkinControl.SkinCheckBox chkNetworkProblem;
        private CCWin.SkinControl.SkinCheckBox chkPhoneProblem;
        private CCWin.SkinControl.SkinLabel skinLabel1;
        private CCWin.SkinControl.SkinPanel skinPanel1;
        private CCWin.SkinControl.SkinButton btnQuickDesc;
        private CCWin.SkinControl.SkinComboBox combRepairType;
        private CCWin.SkinControl.SkinLabel skinLabel2;
        private CCWin.SkinControl.SkinDataGridView dgvFrequentProblem;
    }
}