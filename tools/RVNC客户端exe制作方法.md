## RVNC 客户端exe安装包制作



- 工具下载地址

[百度网盘：https://pan.baidu.com/s/1KrHttbu9zV0n-1ZIstkoVw ](https://pan.baidu.com/s/1KrHttbu9zV0n-1ZIstkoVw )
提取码：`44tj` 

使用`innosetup` 打包工具对项目进行打包，制作客户端exe运行程序 方便用户一键安装

![image-20230405084921895](http://img.52qcg.cn/books_markdown/image-20230405084921895.png)



按照如下图步骤操作

![image-20230405085039715](http://img.52qcg.cn/books_markdown/image-20230405085039715.png)

![image-20230405085126629](http://img.52qcg.cn/books_markdown/image-20230405085126629.png)

![image-20230405085201655](http://img.52qcg.cn/books_markdown/image-20230405085201655.png)



![image-20230405085239949](http://img.52qcg.cn/books_markdown/image-20230405085239949.png)

![image-20230405085339524](http://img.52qcg.cn/books_markdown/image-20230405085339524.png)

![image-20230405085524344](http://img.52qcg.cn/books_markdown/image-20230405085524344.png)

![image-20230405085551744](http://img.52qcg.cn/books_markdown/image-20230405085551744.png)

![image-20230405085616906](http://img.52qcg.cn/books_markdown/image-20230405085616906.png)

![image-20230405085634564](http://img.52qcg.cn/books_markdown/image-20230405085634564.png)

![image-20230405085649369](http://img.52qcg.cn/books_markdown/image-20230405085649369.png)

![image-20230405085700604](http://img.52qcg.cn/books_markdown/image-20230405085700604.png)

![image-20230405085813815](http://img.52qcg.cn/books_markdown/image-20230405085813815.png)

![image-20230405085832274](http://img.52qcg.cn/books_markdown/image-20230405085832274.png)

![image-20230405085842228](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20230405085842228.png)

![image-20230405085907104](http://img.52qcg.cn/books_markdown/image-20230405085907104.png)

修改编译文件参数  设置指定安装位置  设置开启自动启动等参数

```C++
[Tasks]
;创建快捷方式
Name: "startupicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}";
[Icons]
;设置开机启动
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks:desktopicon
[Setup]
;设置指定安装目录
;DefaultDirName={autopf}\{#MyAppName}
DefaultDirName={sd}\{#MyAppName}

```

详细script文件如下

```
; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "rvnc"
#define MyAppVersion "1.0.0.2"
#define MyAppPublisher "royee"
#define MyAppURL "https://www.example.com/"
#define MyAppExeName "DevManager.exe"
#define MyAppAssocName MyAppName + ""
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{DBF0F408-9086-48E9-8A8C-E36DF857F38F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
;DefaultDirName={autopf}\{#MyAppName}
DefaultDirName={sd}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\Administrator\Desktop\output
OutputBaseFilename=rvncexe
SetupIconFile=C:\Users\Administrator\Desktop\favicon00.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; 
Name: "startupicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "C:\Users\Administrator\Desktop\Debug\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\AutoUpdater.NET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\AutoUpdater.NET.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\AutoUpdater.NET.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\CSkin.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\DevManager.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\DevManager.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\DevManager.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\DevManager.vshost.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\DevManager.vshost.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\log4net.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\log4net.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\log4net.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\PrScrn.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\SimpleUpdater.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\SysConfig.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Administrator\Desktop\Debug\tvnserver.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks:desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


```

修改完成后点击 Build -->Compile

![image-20230405090351833](http://img.52qcg.cn/books_markdown/image-20230405090351833.png)

![image-20230405090705180](http://img.52qcg.cn/books_markdown/image-20230405090705180.png)

在output文件夹查看输出效果

![image-20230405090624745](http://img.52qcg.cn/books_markdown/image-20230405090624745.png)
