namespace DevManager
{
    partial class BaseInformation
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BaseInformation));
            this.combDepart = new CCWin.SkinControl.SkinComboBox();
            this.labUUID = new CCWin.SkinControl.SkinLabel();
            this.txtUUID = new CCWin.SkinControl.SkinTextBox();
            this.skinLabel3 = new CCWin.SkinControl.SkinLabel();
            this.labDepart = new CCWin.SkinControl.SkinLabel();
            this.rtxtMark = new CCWin.SkinControl.RtfRichTextBox();
            this.btnSave = new CCWin.SkinControl.SkinButton();
            this.labLocation = new CCWin.SkinControl.SkinLabel();
            this.txtLocation = new CCWin.SkinControl.SkinTextBox();
            this.labDevName = new CCWin.SkinControl.SkinLabel();
            this.txtDevName = new CCWin.SkinControl.SkinTextBox();
            this.SuspendLayout();
            // 
            // combDepart
            // 
            this.combDepart.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.combDepart.FormattingEnabled = true;
            this.combDepart.Location = new System.Drawing.Point(115, 97);
            this.combDepart.Name = "combDepart";
            this.combDepart.Size = new System.Drawing.Size(382, 22);
            this.combDepart.TabIndex = 0;
            this.combDepart.WaterText = "";
            this.combDepart.KeyDown += new System.Windows.Forms.KeyEventHandler(this.combDepart_KeyDown);
            // 
            // labUUID
            // 
            this.labUUID.AutoSize = true;
            this.labUUID.BackColor = System.Drawing.Color.Transparent;
            this.labUUID.BorderColor = System.Drawing.Color.White;
            this.labUUID.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labUUID.Location = new System.Drawing.Point(57, 58);
            this.labUUID.Name = "labUUID";
            this.labUUID.Size = new System.Drawing.Size(55, 21);
            this.labUUID.TabIndex = 4;
            this.labUUID.Text = "UUID:";
            // 
            // txtUUID
            // 
            this.txtUUID.BackColor = System.Drawing.Color.Transparent;
            this.txtUUID.DownBack = null;
            this.txtUUID.Icon = null;
            this.txtUUID.IconIsButton = false;
            this.txtUUID.IconMouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtUUID.IsPasswordChat = '\0';
            this.txtUUID.IsSystemPasswordChar = false;
            this.txtUUID.Lines = new string[0];
            this.txtUUID.Location = new System.Drawing.Point(115, 51);
            this.txtUUID.Margin = new System.Windows.Forms.Padding(0);
            this.txtUUID.MaxLength = 32767;
            this.txtUUID.MinimumSize = new System.Drawing.Size(28, 28);
            this.txtUUID.MouseBack = null;
            this.txtUUID.MouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtUUID.Multiline = false;
            this.txtUUID.Name = "txtUUID";
            this.txtUUID.NormlBack = null;
            this.txtUUID.Padding = new System.Windows.Forms.Padding(5);
            this.txtUUID.ReadOnly = true;
            this.txtUUID.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtUUID.Size = new System.Drawing.Size(382, 28);
            // 
            // 
            // 
            this.txtUUID.SkinTxt.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtUUID.SkinTxt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtUUID.SkinTxt.Font = new System.Drawing.Font("微软雅黑", 9.75F);
            this.txtUUID.SkinTxt.Location = new System.Drawing.Point(5, 5);
            this.txtUUID.SkinTxt.Name = "BaseText";
            this.txtUUID.SkinTxt.ReadOnly = true;
            this.txtUUID.SkinTxt.Size = new System.Drawing.Size(372, 18);
            this.txtUUID.SkinTxt.TabIndex = 0;
            this.txtUUID.SkinTxt.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtUUID.SkinTxt.WaterText = "";
            this.txtUUID.TabIndex = 2;
            this.txtUUID.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtUUID.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtUUID.WaterText = "";
            this.txtUUID.WordWrap = true;
            // 
            // skinLabel3
            // 
            this.skinLabel3.AutoSize = true;
            this.skinLabel3.BackColor = System.Drawing.Color.Transparent;
            this.skinLabel3.BorderColor = System.Drawing.Color.White;
            this.skinLabel3.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.skinLabel3.Location = new System.Drawing.Point(63, 239);
            this.skinLabel3.Name = "skinLabel3";
            this.skinLabel3.Size = new System.Drawing.Size(46, 21);
            this.skinLabel3.TabIndex = 5;
            this.skinLabel3.Text = "备注:";
            // 
            // labDepart
            // 
            this.labDepart.AutoSize = true;
            this.labDepart.BackColor = System.Drawing.Color.Transparent;
            this.labDepart.BorderColor = System.Drawing.Color.White;
            this.labDepart.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labDepart.Location = new System.Drawing.Point(63, 98);
            this.labDepart.Name = "labDepart";
            this.labDepart.Size = new System.Drawing.Size(46, 21);
            this.labDepart.TabIndex = 6;
            this.labDepart.Text = "部门:";
            // 
            // rtxtMark
            // 
            this.rtxtMark.HiglightColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.White;
            this.rtxtMark.Location = new System.Drawing.Point(115, 239);
            this.rtxtMark.Name = "rtxtMark";
            this.rtxtMark.Size = new System.Drawing.Size(382, 123);
            this.rtxtMark.TabIndex = 7;
            this.rtxtMark.Text = "";
            this.rtxtMark.TextColor = CCWin.SkinControl.RtfRichTextBox.RtfColor.Black;
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.Transparent;
            this.btnSave.ControlState = CCWin.SkinClass.ControlState.Normal;
            this.btnSave.DownBack = null;
            this.btnSave.Location = new System.Drawing.Point(242, 385);
            this.btnSave.MouseBack = null;
            this.btnSave.Name = "btnSave";
            this.btnSave.NormlBack = null;
            this.btnSave.Size = new System.Drawing.Size(102, 31);
            this.btnSave.TabIndex = 8;
            this.btnSave.Text = "保存";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // labLocation
            // 
            this.labLocation.AutoSize = true;
            this.labLocation.BackColor = System.Drawing.Color.Transparent;
            this.labLocation.BorderColor = System.Drawing.Color.White;
            this.labLocation.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labLocation.Location = new System.Drawing.Point(63, 142);
            this.labLocation.Name = "labLocation";
            this.labLocation.Size = new System.Drawing.Size(46, 21);
            this.labLocation.TabIndex = 9;
            this.labLocation.Text = "位置:";
            // 
            // txtLocation
            // 
            this.txtLocation.BackColor = System.Drawing.Color.Transparent;
            this.txtLocation.DownBack = null;
            this.txtLocation.Icon = null;
            this.txtLocation.IconIsButton = false;
            this.txtLocation.IconMouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtLocation.IsPasswordChat = '\0';
            this.txtLocation.IsSystemPasswordChar = false;
            this.txtLocation.Lines = new string[0];
            this.txtLocation.Location = new System.Drawing.Point(115, 135);
            this.txtLocation.Margin = new System.Windows.Forms.Padding(0);
            this.txtLocation.MaxLength = 32767;
            this.txtLocation.MinimumSize = new System.Drawing.Size(28, 28);
            this.txtLocation.MouseBack = null;
            this.txtLocation.MouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtLocation.Multiline = false;
            this.txtLocation.Name = "txtLocation";
            this.txtLocation.NormlBack = null;
            this.txtLocation.Padding = new System.Windows.Forms.Padding(5);
            this.txtLocation.ReadOnly = false;
            this.txtLocation.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtLocation.Size = new System.Drawing.Size(382, 28);
            // 
            // 
            // 
            this.txtLocation.SkinTxt.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtLocation.SkinTxt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtLocation.SkinTxt.Font = new System.Drawing.Font("微软雅黑", 9.75F);
            this.txtLocation.SkinTxt.Location = new System.Drawing.Point(5, 5);
            this.txtLocation.SkinTxt.Name = "BaseText";
            this.txtLocation.SkinTxt.Size = new System.Drawing.Size(372, 18);
            this.txtLocation.SkinTxt.TabIndex = 0;
            this.txtLocation.SkinTxt.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtLocation.SkinTxt.WaterText = "";
            this.txtLocation.TabIndex = 3;
            this.txtLocation.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtLocation.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtLocation.WaterText = "";
            this.txtLocation.WordWrap = true;
            // 
            // labDevName
            // 
            this.labDevName.AutoSize = true;
            this.labDevName.BackColor = System.Drawing.Color.Transparent;
            this.labDevName.BorderColor = System.Drawing.Color.White;
            this.labDevName.Font = new System.Drawing.Font("微软雅黑", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.labDevName.Location = new System.Drawing.Point(66, 188);
            this.labDevName.Name = "labDevName";
            this.labDevName.Size = new System.Drawing.Size(46, 21);
            this.labDevName.TabIndex = 10;
            this.labDevName.Text = "名称:";
            // 
            // txtDevName
            // 
            this.txtDevName.BackColor = System.Drawing.Color.Transparent;
            this.txtDevName.DownBack = null;
            this.txtDevName.Icon = null;
            this.txtDevName.IconIsButton = false;
            this.txtDevName.IconMouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtDevName.IsPasswordChat = '\0';
            this.txtDevName.IsSystemPasswordChar = false;
            this.txtDevName.Lines = new string[0];
            this.txtDevName.Location = new System.Drawing.Point(115, 188);
            this.txtDevName.Margin = new System.Windows.Forms.Padding(0);
            this.txtDevName.MaxLength = 32767;
            this.txtDevName.MinimumSize = new System.Drawing.Size(28, 28);
            this.txtDevName.MouseBack = null;
            this.txtDevName.MouseState = CCWin.SkinClass.ControlState.Normal;
            this.txtDevName.Multiline = false;
            this.txtDevName.Name = "txtDevName";
            this.txtDevName.NormlBack = null;
            this.txtDevName.Padding = new System.Windows.Forms.Padding(5);
            this.txtDevName.ReadOnly = false;
            this.txtDevName.ScrollBars = System.Windows.Forms.ScrollBars.None;
            this.txtDevName.Size = new System.Drawing.Size(382, 28);
            // 
            // 
            // 
            this.txtDevName.SkinTxt.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtDevName.SkinTxt.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtDevName.SkinTxt.Font = new System.Drawing.Font("微软雅黑", 9.75F);
            this.txtDevName.SkinTxt.Location = new System.Drawing.Point(5, 5);
            this.txtDevName.SkinTxt.Name = "BaseText";
            this.txtDevName.SkinTxt.Size = new System.Drawing.Size(372, 18);
            this.txtDevName.SkinTxt.TabIndex = 0;
            this.txtDevName.SkinTxt.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtDevName.SkinTxt.WaterText = "";
            this.txtDevName.TabIndex = 4;
            this.txtDevName.TextAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.txtDevName.WaterColor = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(127)))), ((int)(((byte)(127)))));
            this.txtDevName.WaterText = "";
            this.txtDevName.WordWrap = true;
            // 
            // BaseInformation
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CanResize = false;
            this.ClientSize = new System.Drawing.Size(602, 436);
            this.Controls.Add(this.txtDevName);
            this.Controls.Add(this.labDevName);
            this.Controls.Add(this.txtLocation);
            this.Controls.Add(this.labLocation);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.rtxtMark);
            this.Controls.Add(this.labDepart);
            this.Controls.Add(this.skinLabel3);
            this.Controls.Add(this.txtUUID);
            this.Controls.Add(this.labUUID);
            this.Controls.Add(this.combDepart);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BaseInformation";
            this.Text = "基础信息";
            this.Load += new System.EventHandler(this.BaseInformation_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private CCWin.SkinControl.SkinComboBox combDepart;
        private CCWin.SkinControl.SkinLabel labUUID;
        private CCWin.SkinControl.SkinTextBox txtUUID;
        private CCWin.SkinControl.SkinLabel skinLabel3;
        private CCWin.SkinControl.SkinLabel labDepart;
        private CCWin.SkinControl.RtfRichTextBox rtxtMark;
        private CCWin.SkinControl.SkinButton btnSave;
        private CCWin.SkinControl.SkinLabel labLocation;
        private CCWin.SkinControl.SkinTextBox txtLocation;
        private CCWin.SkinControl.SkinLabel labDevName;
        private CCWin.SkinControl.SkinTextBox txtDevName;
    }
}