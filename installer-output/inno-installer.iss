; ==========================================
; T766 Checkin - Inno Setup Installer Script
; Portable, per-user, self-contained install
; ==========================================

#define MyAppName "T766Checkin"
#define MyAppVersion "1.0"
#define MyAppPublisher "Team 766"
#define MyAppURL "https://www.team766.com/"
#define MyAppExeName "T766-Checkin.exe"

#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; Unique application ID (DO NOT reuse for other apps)
AppId={{532802B5-6525-4F06-88B7-80A6B044A4EA}

AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

; Per-user install (no admin required)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

; Install location
DefaultDirName={localappdata}\Programs\{#MyAppName}
CreateAppDir=yes

; Output
OutputDir=installer-output
OutputBaseFilename=T766CheckinSetup

; Compression / UI
SolidCompression=yes
WizardStyle=classic

; File associations
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Self-contained .NET publish output
Source: "..\T766-Checkin\bin\Release\net10.0-windows\win-x64\publish\*"; \
    DestDir: "{app}"; \
    Flags: recursesubdirs ignoreversion; \
    Excludes: "*.pdb"

[Icons]
Name: "{group}\T766Checkin"; Filename: "{app}\{#MyAppExeName}"
Name: "{userdesktop}\T766Checkin"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"

[Registry]
; File association (.myp)
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; \
    ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; \
    ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; \
    ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; \
    ValueType: string; ValueName: ""; \
    ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Run]
; Optional: launch app after install
Filename: "{app}\{#MyAppExeName}"; Description: "Launch T766Checkin"; Flags: nowait postinstall skipifsilent
