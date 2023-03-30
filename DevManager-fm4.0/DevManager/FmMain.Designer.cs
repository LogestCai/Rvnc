namespace DevManager
{
    partial class FmMain
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FmMain));
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.myMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.显示stripmenu = new System.Windows.Forms.ToolStripMenuItem();
            this.退出stripmenu = new System.Windows.Forms.ToolStripMenuItem();
            this.Tabmain = new CCWin.SkinControl.SkinTabControl();
            this.subTab首页 = new CCWin.SkinControl.SkinTabPage();
            this.btnStatus = new CCWin.SkinControl.SkinButton();
            this.cap一键报修 = new CCWin.SkinControl.SkinCaptionPanel();
            this.cap基本信息 = new CCWin.SkinControl.SkinCaptionPanel();
            this.btnCutScreen = new CCWin.SkinControl.SkinButton();
            this.btnHelp = new CCWin.SkinControl.SkinButton();
            this.txtRich = new CCWin.SkinControl.RtfRichTextBox();
            this.skinButton1 = new CCWin.SkinControl.SkinButton();
            this.subTab设备管理 = new CCWin.SkinControl.SkinTabPage();
            this.btnReportRecord = new CCWin.SkinControl.SkinButton();
            this.btnReport = new CCWin.SkinControl.SkinButton();
            this.subTab帮助 = new CCWin.SkinControl.SkinTabPage();
            this.btnUpdate = new CCWin.SkinControl.SkinButton();
            this.btn帮助 = new CCWin.SkinControl.SkinButton();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.myMenu.SuspendLayout();
            this.Tabmain.SuspendLayout();
            this.subTab首页.SuspendLayout();
            this.cap基本信息.SuspendLayout();
            this.subTab设备管理.SuspendLayout();
            this.subTab帮助.SuspendLayout();
            this.SuspendLayout();
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.ContextMenuStrip = this.myMenu;
            this.notifyIcon1.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon1.Icon")));
            this.notifyIcon1.Text = "RVNC";
            this.notifyIcon1.Visible = true;
            this.notifyIcon1.DoubleClick += new System.EventHandler(this.notifyIcon1_DoubleClick);
            this.notifyIcon1.MouseClick += new System.Windows.Forms.MouseEventHandler(this.notifyIcon1_MouseClick);
            // 
            // myMenu
            // 
            this.myMenu.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.myMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.显示stripmenu,
            this.退出stripmenu});
            this.myMenu.Name = "myMenu";
            this.myMenu.Size = new System.Drawing.Size(117, 60);
            // 
            // 显示stripmenu
            // 
            this.显示stripmenu.Name = "显示stripmenu";
            this.显示stripmenu.Size = new System.Drawing.Size(116, 28);
            this.显示stripmenu.Text = "显示";
            this.显示stripmenu.Click += new System.EventHandler(this.显示stripmenu_Click);
            // 
            // 退出stripmenu
            // 
            this.退出stripmenu.Name = "退出stripmenu";
            this.退出stripmenu.Size = new System.Drawing.Size(116, 28);
            this.退出stripmenu.Text = "退出";
            this.退出stripmenu.Click += new System.EventHandler(this.退出stripmenu_Click);
            // 
            // Tabmain
            // 
            this.Tabmain.AnimatorType = CCWin.SkinControl.AnimationType.HorizSlide;
            this.Tabmain.CloseRect = new System.Drawing.Rectangle(2, 2, 12, 12);
            this.Tabmain.Controls.Add(this.subTab首页);
            this.Tabmain.Controls.Add(this.subTab设备管理);
            this.Tabmain.Controls.Add(this.subTab帮助);
            this.Tabmain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tabmain.HeadBack = null;
            this.Tabmain.ImgTxtOffset = new System.Drawing.Point(0, 0);
            this.Tabmain.ItemSize = new System.Drawing.Size(70, 36);
            this.Tabmain.Location = new System.Drawing.Point(8, 30);
            this.Tabmain.Margin = new System.Windows.Forms.Padding(4);
            this.Tabmain.Name = "Tabmain";
            this.Tabmain.PageArrowDown = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageArrowDown")));
            this.Tabmain.PageArrowHover = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageArrowHover")));
            this.Tabmain.PageCloseHover = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageCloseHover")));
            this.Tabmain.PageCloseNormal = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageCloseNormal")));
            this.Tabmain.PageDown = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageDown")));
            this.Tabmain.PageHover = ((System.Drawing.Image)(resources.GetObject("Tabmain.PageHover")));
            this.Tabmain.PageImagePosition = CCWin.SkinControl.SkinTabControl.ePageImagePosition.Left;
            this.Tabmain.PageNorml = null;
            this.Tabmain.SelectedIndex = 0;
            this.Tabmain.Size = new System.Drawing.Size(983, 808);
            this.Tabmain.SizeMode = System.Windows.Forms.TabSizeMode.Fixed;
            this.Tabmain.TabIndex = 0;
            // 
            // subTab首页
            // 
            this.subTab首页.BackColor = System.Drawing.Color.White;
            this.subTab首页.Controls.Add(this.btnStatus);
            this.subTab首页.Controls.Add(this.cap一键报修);
            this.subTab首页.Controls.Add(this.cap基本信息);
            this.subTab首页.Controls.Add(this.skinButton1);
            this.subTab首页.Dock = System.Windows.Forms.DockStyle.Fill;
            this.subTab首页.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.subTab首页.Location = new System.Drawing.Point(0, 36);
            this.subTab首页.Margin = new System.Windows.Forms.Padding(4);
            this.subTab首页.Name = "subTab首页";
            this.subTab首页.Size = new System.Drawing.Size(983, 772);
            this.subTab首页.TabIndex = 0;
            this.subTab首页.TabItemImage = null;
            this.subTab首页.Text = "首页";
            this.subTab首页.UseVisualStyleBackColor = true;
            // 
            // btnStatus
            // 
            this.btnStatus.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.btnStatus.BackColor = System.Drawing.Color.Transparent;
            this.btnStatus.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnStatus.DownBack = null;
            this.btnStatus.Location = new System.Drawing.Point(0, 719);
            this.btnStatus.Margin = new System.Windows.Forms.Padding(4);
            this.btnStatus.MouseBack = null;
            this.btnStatus.Name = "btnStatus";
            this.btnStatus.NormlBack = null;
            this.btnStatus.Size = new System.Drawing.Size(983, 34);
            this.btnStatus.TabIndex = 4;
            this.btnStatus.Text = "已连接管理中心";
            this.btnStatus.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnStatus.UseVisualStyleBackColor = false;
            // 
            // cap一键报修
            // 
            this.cap一键报修.CaptionFont = new System.Drawing.Font("Microsoft YaHei UI", 9F);
            this.cap一键报修.Location = new System.Drawing.Point(474, 82);
            this.cap一键报修.Margin = new System.Windows.Forms.Padding(4);
            this.cap一键报修.Name = "cap一键报修";
            this.cap一键报修.Size = new System.Drawing.Size(496, 564);
            this.cap一键报修.TabIndex = 3;
            this.cap一键报修.Text = "打开微信扫码一键报修";
            // 
            // cap基本信息
            // 
            this.cap基本信息.CaptionFont = new System.Drawing.Font("Microsoft YaHei UI", 9F);
            this.cap基本信息.Controls.Add(this.btnCutScreen);
            this.cap基本信息.Controls.Add(this.btnHelp);
            this.cap基本信息.Controls.Add(this.txtRich);
            this.cap基本信息.Location = new System.Drawing.Point(4, 82);
            this.cap基本信息.Margin = new System.Windows.Forms.Padding(4);
            this.cap基本信息.Name = "cap基本信息";
            this.cap基本信息.Size = new System.Drawing.Size(460, 564);
            this.cap基本信息.TabIndex = 2;
            this.cap基本信息.Text = "基本信息";
            // 
            // btnCutScreen
            // 
            this.btnCutScreen.BackColor = System.Drawing.Color.Transparent;
            this.btnCutScreen.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnCutScreen.DownBack = null;
            this.btnCutScreen.Font = new System.Drawing.Font("宋体", 10.5F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnCutScreen.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btnCutScreen.Location = new System.Drawing.Point(4, 464);
            this.btnCutScreen.Margin = new System.Windows.Forms.Padding(4);
            this.btnCutScreen.MouseBack = null;
            this.btnCutScreen.Name = "btnCutScreen";
            this.btnCutScreen.NormlBack = null;
            this.btnCutScreen.Size = new System.Drawing.Size(276, 54);
            this.btnCutScreen.TabIndex = 5;
            this.btnCutScreen.Text = "按Alt+F1快捷截图";
            this.btnCutScreen.UseVisualStyleBackColor = false;
            this.btnCutScreen.Click += new System.EventHandler(this.btnCutScreen_Click);
            // 
            // btnHelp
            // 
            this.btnHelp.BackColor = System.Drawing.Color.Transparent;
            this.btnHelp.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnHelp.DownBack = null;
            this.btnHelp.Font = new System.Drawing.Font("楷体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnHelp.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btnHelp.Image = ((System.Drawing.Image)(resources.GetObject("btnHelp.Image")));
            this.btnHelp.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHelp.ImageSize = new System.Drawing.Size(30, 30);
            this.btnHelp.Location = new System.Drawing.Point(8, 387);
            this.btnHelp.Margin = new System.Windows.Forms.Padding(4);
            this.btnHelp.MouseBack = null;
            this.btnHelp.Name = "btnHelp";
            this.btnHelp.NormlBack = null;
            this.btnHelp.Radius = 50;
            this.btnHelp.Size = new System.Drawing.Size(272, 58);
            this.btnHelp.TabIndex = 5;
            this.btnHelp.Text = "  发送远程求助";
            this.btnHelp.UseVisualStyleBackColor = false;
            this.btnHelp.Click += new System.EventHandler(this.btnHelp_Click);
            // 
            // txtRich
            // 
            this.txtRich.BackColor = System.Drawing.SystemColors.WindowFrame;
            this.txtRich.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRich.Cursor = System.Windows.Forms.Cursors.No;
            this.txtRich.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtRich.ForeColor = System.Drawing.Color.White;
            this.txtRich.HiglightColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.White;
            this.txtRich.Location = new System.Drawing.Point(8, 40);
            this.txtRich.Margin = new System.Windows.Forms.Padding(4);
            this.txtRich.Name = "txtRich";
            this.txtRich.ReadOnly = true;
            this.txtRich.Size = new System.Drawing.Size(446, 324);
            this.txtRich.TabIndex = 1;
            this.txtRich.Text = "";
            this.txtRich.TextColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.Black;
            // 
            // skinButton1
            // 
            this.skinButton1.BackColor = System.Drawing.Color.Transparent;
            this.skinButton1.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.skinButton1.DownBack = null;
            this.skinButton1.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinButton1.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.skinButton1.Location = new System.Drawing.Point(0, 4);
            this.skinButton1.Margin = new System.Windows.Forms.Padding(4);
            this.skinButton1.MouseBack = null;
            this.skinButton1.Name = "skinButton1";
            this.skinButton1.NormlBack = null;
            this.skinButton1.Size = new System.Drawing.Size(975, 69);
            this.skinButton1.TabIndex = 1;
            this.skinButton1.Text = "让办公更便捷！";
            this.skinButton1.UseVisualStyleBackColor = false;
            this.skinButton1.Click += new System.EventHandler(this.skinButton1_Click_1);
            // 
            // subTab设备管理
            // 
            this.subTab设备管理.BackColor = System.Drawing.Color.White;
            this.subTab设备管理.Controls.Add(this.btnReportRecord);
            this.subTab设备管理.Controls.Add(this.btnReport);
            this.subTab设备管理.Dock = System.Windows.Forms.DockStyle.Fill;
            this.subTab设备管理.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.subTab设备管理.Location = new System.Drawing.Point(0, 36);
            this.subTab设备管理.Margin = new System.Windows.Forms.Padding(4);
            this.subTab设备管理.Name = "subTab设备管理";
            this.subTab设备管理.Size = new System.Drawing.Size(983, 772);
            this.subTab设备管理.TabIndex = 1;
            this.subTab设备管理.TabItemImage = null;
            this.subTab设备管理.Text = "设备管理";
            // 
            // btnReportRecord
            // 
            this.btnReportRecord.BackColor = System.Drawing.Color.Transparent;
            this.btnReportRecord.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnReportRecord.DownBack = null;
            this.btnReportRecord.Font = new System.Drawing.Font("楷体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnReportRecord.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btnReportRecord.Image = ((System.Drawing.Image)(resources.GetObject("btnReportRecord.Image")));
            this.btnReportRecord.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReportRecord.ImageSize = new System.Drawing.Size(25, 25);
            this.btnReportRecord.Location = new System.Drawing.Point(248, 4);
            this.btnReportRecord.Margin = new System.Windows.Forms.Padding(4);
            this.btnReportRecord.MouseBack = null;
            this.btnReportRecord.Name = "btnReportRecord";
            this.btnReportRecord.NormlBack = null;
            this.btnReportRecord.Size = new System.Drawing.Size(202, 60);
            this.btnReportRecord.TabIndex = 5;
            this.btnReportRecord.Text = "  报修记录";
            this.btnReportRecord.UseVisualStyleBackColor = false;
            this.btnReportRecord.Click += new System.EventHandler(this.btnReportRecord_Click);
            // 
            // btnReport
            // 
            this.btnReport.BackColor = System.Drawing.Color.Transparent;
            this.btnReport.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnReport.DownBack = null;
            this.btnReport.Font = new System.Drawing.Font("楷体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnReport.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btnReport.Image = ((System.Drawing.Image)(resources.GetObject("btnReport.Image")));
            this.btnReport.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnReport.ImageSize = new System.Drawing.Size(25, 25);
            this.btnReport.Location = new System.Drawing.Point(4, 4);
            this.btnReport.Margin = new System.Windows.Forms.Padding(4);
            this.btnReport.MouseBack = null;
            this.btnReport.Name = "btnReport";
            this.btnReport.NormlBack = null;
            this.btnReport.Size = new System.Drawing.Size(234, 60);
            this.btnReport.TabIndex = 4;
            this.btnReport.Text = "  设备报修";
            this.btnReport.UseVisualStyleBackColor = false;
            this.btnReport.Click += new System.EventHandler(this.btnReport_Click);
            // 
            // subTab帮助
            // 
            this.subTab帮助.BackColor = System.Drawing.Color.White;
            this.subTab帮助.Controls.Add(this.btnUpdate);
            this.subTab帮助.Controls.Add(this.btn帮助);
            this.subTab帮助.Dock = System.Windows.Forms.DockStyle.Fill;
            this.subTab帮助.Location = new System.Drawing.Point(0, 36);
            this.subTab帮助.Margin = new System.Windows.Forms.Padding(4);
            this.subTab帮助.Name = "subTab帮助";
            this.subTab帮助.Size = new System.Drawing.Size(983, 772);
            this.subTab帮助.TabIndex = 2;
            this.subTab帮助.TabItemImage = null;
            this.subTab帮助.Text = "帮助";
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.Transparent;
            this.btnUpdate.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnUpdate.DownBack = null;
            this.btnUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnUpdate.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btnUpdate.Location = new System.Drawing.Point(278, 177);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(4);
            this.btnUpdate.MouseBack = null;
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.NormlBack = null;
            this.btnUpdate.Size = new System.Drawing.Size(338, 129);
            this.btnUpdate.TabIndex = 3;
            this.btnUpdate.Text = "立即自动更新";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btn帮助
            // 
            this.btn帮助.BackColor = System.Drawing.Color.Transparent;
            this.btn帮助.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btn帮助.DownBack = null;
            this.btn帮助.Font = new System.Drawing.Font("宋体", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btn帮助.ForeColor = System.Drawing.SystemColors.HighlightText;
            this.btn帮助.Location = new System.Drawing.Point(0, 4);
            this.btn帮助.Margin = new System.Windows.Forms.Padding(4);
            this.btn帮助.MouseBack = null;
            this.btn帮助.Name = "btn帮助";
            this.btn帮助.NormlBack = null;
            this.btn帮助.Size = new System.Drawing.Size(975, 69);
            this.btn帮助.TabIndex = 2;
            this.btn帮助.Text = "点击下方【立即自动更新】按钮完成程序升级！";
            this.btn帮助.UseVisualStyleBackColor = false;
            // 
            // FmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(999, 846);
            this.Controls.Add(this.Tabmain);
            this.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "FmMain";
            this.Text = "RvncClient";
            this.TitleColor = System.Drawing.Color.White;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.SizeChanged += new System.EventHandler(this.Form1_SizeChanged);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FmMain_KeyDown);
            this.myMenu.ResumeLayout(false);
            this.Tabmain.ResumeLayout(false);
            this.subTab首页.ResumeLayout(false);
            this.cap基本信息.ResumeLayout(false);
            this.subTab设备管理.ResumeLayout(false);
            this.subTab帮助.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.ContextMenuStrip myMenu;
        private System.Windows.Forms.ToolStripMenuItem 退出stripmenu;
        private System.Windows.Forms.ToolStripMenuItem 显示stripmenu;
        private CCWin.SkinControl.SkinTabControl Tabmain;
        private CCWin.SkinControl.SkinTabPage subTab首页;
        private CCWin.SkinControl.SkinButton btnStatus;
        private CCWin.SkinControl.SkinCaptionPanel cap一键报修;
        private CCWin.SkinControl.SkinCaptionPanel cap基本信息;
        private CCWin.SkinControl.SkinButton skinButton1;
        private CCWin.SkinControl.SkinTabPage subTab设备管理;
        private CCWin.SkinControl.RtfRichTextBox txtRich;
        private CCWin.SkinControl.SkinTabPage subTab帮助;
        private CCWin.SkinControl.SkinButton btnUpdate;
        private CCWin.SkinControl.SkinButton btn帮助;
        private System.Windows.Forms.Timer timer1;
        private CCWin.SkinControl.SkinButton btnHelp;
        private CCWin.SkinControl.SkinButton btnReportRecord;
        private CCWin.SkinControl.SkinButton btnReport;
        private CCWin.SkinControl.SkinButton btnCutScreen;
    }
}

