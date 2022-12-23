namespace DevManager.deviceform
{
    partial class ReportRecord
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ReportRecord));
            this.skinPanel1 = new CCWin.SkinControl.SkinPanel();
            this.skinLabel1 = new CCWin.SkinControl.SkinLabel();
            this.skinLabel2 = new CCWin.SkinControl.SkinLabel();
            this.btnSearch = new CCWin.SkinControl.SkinButton();
            this.timeStartTime = new System.Windows.Forms.DateTimePicker();
            this.timeEndTime = new System.Windows.Forms.DateTimePicker();
            this.dgvReportRecord = new CCWin.SkinControl.SkinDataGridView();
            this.skinLabel3 = new CCWin.SkinControl.SkinLabel();
            this.combStatus = new CCWin.SkinControl.SkinComboBox();
            this.combType = new CCWin.SkinControl.SkinComboBox();
            this.skinPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReportRecord)).BeginInit();
            this.SuspendLayout();
            // 
            // skinPanel1
            // 
            this.skinPanel1.BackColor = System.Drawing.Color.Transparent;
            this.skinPanel1.Controls.Add(this.combType);
            this.skinPanel1.Controls.Add(this.combStatus);
            this.skinPanel1.Controls.Add(this.skinLabel3);
            this.skinPanel1.Controls.Add(this.dgvReportRecord);
            this.skinPanel1.Controls.Add(this.timeEndTime);
            this.skinPanel1.Controls.Add(this.timeStartTime);
            this.skinPanel1.Controls.Add(this.btnSearch);
            this.skinPanel1.Controls.Add(this.skinLabel2);
            this.skinPanel1.Controls.Add(this.skinLabel1);
            this.skinPanel1.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.skinPanel1.DownBack = null;
            this.skinPanel1.Location = new System.Drawing.Point(11, 33);
            this.skinPanel1.MouseBack = null;
            this.skinPanel1.Name = "skinPanel1";
            this.skinPanel1.NormlBack = null;
            this.skinPanel1.Size = new System.Drawing.Size(993, 615);
            this.skinPanel1.TabIndex = 0;
            // 
            // skinLabel1
            // 
            this.skinLabel1.AutoSize = true;
            this.skinLabel1.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel1.BorderColor = System.Drawing.Color.White;
            this.skinLabel1.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel1.Location = new System.Drawing.Point(20, 19);
            this.skinLabel1.Name = "skinLabel1";
            this.skinLabel1.Size = new System.Drawing.Size(46, 21);
            this.skinLabel1.TabIndex = 2;
            this.skinLabel1.Text = "时间:";
            // 
            // skinLabel2
            // 
            this.skinLabel2.AutoSize = true;
            this.skinLabel2.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel2.BorderColor = System.Drawing.Color.White;
            this.skinLabel2.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel2.Location = new System.Drawing.Point(463, 19);
            this.skinLabel2.Name = "skinLabel2";
            this.skinLabel2.Size = new System.Drawing.Size(46, 21);
            this.skinLabel2.TabIndex = 4;
            this.skinLabel2.Text = "类型:";
            // 
            // btnSearch
            // 
            this.btnSearch.BackColor = System.Drawing.Color.Transparent;
            this.btnSearch.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnSearch.DownBack = null;
            this.btnSearch.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.btnSearch.Location = new System.Drawing.Point(820, 16);
            this.btnSearch.MouseBack = null;
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.NormlBack = null;
            this.btnSearch.Size = new System.Drawing.Size(78, 29);
            this.btnSearch.TabIndex = 5;
            this.btnSearch.Text = "查找";
            this.btnSearch.UseVisualStyleBackColor = false;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // timeStartTime
            // 
            this.timeStartTime.CalendarFont = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.timeStartTime.CustomFormat = "yyyy-MM-dd HH:mm:ss";
            this.timeStartTime.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.timeStartTime.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.timeStartTime.Location = new System.Drawing.Point(63, 18);
            this.timeStartTime.Name = "timeStartTime";
            this.timeStartTime.Size = new System.Drawing.Size(196, 26);
            this.timeStartTime.TabIndex = 6;
            // 
            // timeEndTime
            // 
            this.timeEndTime.CalendarFont = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.timeEndTime.CustomFormat = "yyyy-MM-dd HH:mm:ss";
            this.timeEndTime.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.timeEndTime.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.timeEndTime.Location = new System.Drawing.Point(265, 19);
            this.timeEndTime.Name = "timeEndTime";
            this.timeEndTime.Size = new System.Drawing.Size(192, 26);
            this.timeEndTime.TabIndex = 7;
            // 
            // dgvReportRecord
            // 
            this.dgvReportRecord.AllowUserToAddRows = false;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(246)))), ((int)(((byte)(253)))));
            this.dgvReportRecord.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvReportRecord.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvReportRecord.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvReportRecord.BackgroundColor = System.Drawing.SystemColors.Window;
            this.dgvReportRecord.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvReportRecord.ColumnFont = null;
            this.dgvReportRecord.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(247)))), ((int)(((byte)(246)))), ((int)(((byte)(239)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvReportRecord.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvReportRecord.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvReportRecord.ColumnSelectForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(59)))), ((int)(((byte)(188)))), ((int)(((byte)(240)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvReportRecord.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvReportRecord.EnableHeadersVisualStyles = false;
            this.dgvReportRecord.GridColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.dgvReportRecord.HeadFont = new System.Drawing.Font("宋体", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.dgvReportRecord.HeadSelectForeColor = System.Drawing.SystemColors.HighlightText;
            this.dgvReportRecord.Location = new System.Drawing.Point(3, 51);
            this.dgvReportRecord.Name = "dgvReportRecord";
            this.dgvReportRecord.ReadOnly = true;
            this.dgvReportRecord.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvReportRecord.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            this.dgvReportRecord.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvReportRecord.RowTemplate.Height = 23;
            this.dgvReportRecord.Size = new System.Drawing.Size(987, 561);
            this.dgvReportRecord.TabIndex = 8;
            this.dgvReportRecord.TitleBack = null;
            this.dgvReportRecord.TitleBackColorBegin = System.Drawing.Color.White;
            this.dgvReportRecord.TitleBackColorEnd = System.Drawing.Color.FromArgb(((int)(((byte)(83)))), ((int)(((byte)(196)))), ((int)(((byte)(242)))));
            // 
            // skinLabel3
            // 
            this.skinLabel3.AutoSize = true;
            this.skinLabel3.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel3.BorderColor = System.Drawing.Color.White;
            this.skinLabel3.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel3.Location = new System.Drawing.Point(641, 18);
            this.skinLabel3.Name = "skinLabel3";
            this.skinLabel3.Size = new System.Drawing.Size(46, 21);
            this.skinLabel3.TabIndex = 9;
            this.skinLabel3.Text = "状态:";
            // 
            // combStatus
            // 
            this.combStatus.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.combStatus.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.combStatus.FormattingEnabled = true;
            this.combStatus.Location = new System.Drawing.Point(693, 17);
            this.combStatus.Name = "combStatus";
            this.combStatus.Size = new System.Drawing.Size(121, 27);
            this.combStatus.TabIndex = 10;
            this.combStatus.WaterText = "";
            // 
            // combType
            // 
            this.combType.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.combType.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.combType.FormattingEnabled = true;
            this.combType.Location = new System.Drawing.Point(507, 18);
            this.combType.Name = "combType";
            this.combType.Size = new System.Drawing.Size(121, 27);
            this.combType.TabIndex = 11;
            this.combType.WaterText = "";
            // 
            // ReportRecord
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1015, 659);
            this.Controls.Add(this.skinPanel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ReportRecord";
            this.Text = "报修记录";
            this.TitleColor = System.Drawing.Color.White;
            this.Load += new System.EventHandler(this.ReportRecord_Load);
            this.skinPanel1.ResumeLayout(false);
            this.skinPanel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReportRecord)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private CCWin.SkinControl.SkinPanel skinPanel1;
        private CCWin.SkinControl.SkinButton btnSearch;
        private CCWin.SkinControl.SkinLabel skinLabel2;
        private CCWin.SkinControl.SkinLabel skinLabel1;
        private CCWin.SkinControl.SkinComboBox combStatus;
        private CCWin.SkinControl.SkinLabel skinLabel3;
        private CCWin.SkinControl.SkinDataGridView dgvReportRecord;
        private System.Windows.Forms.DateTimePicker timeEndTime;
        private System.Windows.Forms.DateTimePicker timeStartTime;
        private CCWin.SkinControl.SkinComboBox combType;
    }
}