unit Roselt.SystemInformation;

interface

uses
  {$IFDEF MACOS}
    MacApi.CoreFoundation,
    MacApi.Foundation,
    System.Sensors,
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    Winapi.Windows,
    Winapi.ActiveX,
    Winapi.WinSock,
    System.Win.ComObj,
    System.Sensors,
  {$ENDIF}
  {$IFDEF ANDROID}
    Androidapi.Helpers,
    Androidapi.JNIBridge,
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.JNI.App,
    Androidapi.JNI.Net,
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI,
    Androidapi.JNI.Java.Net,
    Androidapi.JNI.Os,
    FMX.Helpers.Android,
    System.Sensors,
  {$ENDIF}

  FMX.Forms,
  FMX.Platform,
  System.SysUtils,
  System.Classes,
  System.Variants,
  System.TypInfo;

  {$IFDEF ANDROID}
    type
      JWifiManagerClass = interface(JObjectClass)
      ['{69F35EA7-3EB9-48AA-B7FC-4FFD0E7D712F}']
        function _GetACTION_PICK_WIFI_NETWORK: JString;
        function _GetEXTRA_WIFI_INFO: JString;
        function _GetWIFI_STATE_CHANGED_ACTION: JString;
        property ACTION_PICK_WIFI_NETWORK: JString read _GetACTION_PICK_WIFI_NETWORK;
        property EXTRA_WIFI_INFO: JString read _GetEXTRA_WIFI_INFO;
        property WIFI_STATE_CHANGED_ACTION: JString read _GetWIFI_STATE_CHANGED_ACTION;
      end;

      [JavaSignature('android/net/wifi/WifiInfo')]
      JWifiInfo = interface(JObject)
      ['{4F09E865-DB04-4E64-8C81-AEFB36DABC45}']
        function getBSSID:jString; cdecl;
        function getHiddenSSID:Boolean; cdecl;
        function getIpAddress:Integer; cdecl;
        function getLinkSpeed:integer; cdecl;
        function getMacAddress:JString; cdecl;
        function getNetworkId:integer; cdecl;
        function getRssi:integer; cdecl;
        function GetSSID:jString; cdecl;
      end;

      JWifiInfoClass = interface(JObjectClass)
      ['{2B1CE79F-DE4A-40D9-BB2E-7F9F118D8C08}']
        function _GetLINK_SPEED_UNITS:JString;
        property LINK_SPEED_UNITS: JString read _GetLINK_SPEED_UNITS;
      end;

      TJWifiInfo= class(TJavaGenericImport<JWifiInfoClass, JWifiInfo>) end;

      [JavaSignature('android/net/wifi/WifiManager')]
      JWifiManager = interface(JObject)
      ['{DA7107B9-1FAD-4A9E-AA09-8D5B84614E60}']
        function isWifiEnabled:Boolean;cdecl;
        function setWifiEnabled(enabled:Boolean):Boolean; cdecl;
        function getConnectionInfo :JWifiInfo; cdecl;
        function getWifiState :Integer; cdecl;
        function disconnect :Boolean; cdecl;
      end;

      TJWifiManager = class(TJavaGenericImport<JWifiManagerClass, JWifiManager>) end;
  {$ENDIF}

Type
  TSystemLocation = record
    Latitude: Double;
    Longitude: Double;
  end;

  TSystemInformation = class
  private
    FVideoCard: String;
    FMacAddress: String;
    FComputerName: String;
    FOperatingSystem: String;
    FApplicationType: String;
    FTotalMemory: String;
    FSystemLocation: TSystemLocation;
    FUserName: String;
    function GetSystemLanguage: String;
    function GetSystemTotalMemory: String;
    function GetScreenResolution: String;
    function GetIPAddress: String;
    function GetAppVersion: String;
    function GetSystemLocation: TSystemLocation;
    function GetUserName: String;
    function GetMacAddress: String;
    function GetVideoCardName: String;
  Public
    constructor Create;
    property VideoCard: String read FVideoCard;
    property MacAddress: String read FMacAddress;
    property SystemLanguage: String read GetSystemLanguage;
    property ComputerName: String read FComputerName;
    property IPAddress: String read GetIPAddress;
    property ScreenResolution: String read GetScreenResolution;
    property OperatingSystem: String read FOperatingSystem;
    property ApplicationType: String read FApplicationType;
    property TotalMemory: String read FTotalMemory;
    property AppVersion: String read GetAppVersion;
    property SystemLocation: TSystemLocation read GetSystemLocation;
    property UserName: String read FUserName write FUserName;
  end;

implementation

{ TSystemInformation }

{$IFDEF MACOS}
function NSUserName: Pointer; cdecl; external '/System/Library/Frameworks/Foundation.framework/Foundation' name '_NSUserName';
{$ENDIF}

function TSystemInformation.GetUserName: String;
begin
  Result := '';
  {$IFDEF MACOS}
    Result := TNSString.Wrap(NSUserName).UTF8String;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    // GetEnvironmentVariable('USERNAME') works on Windows, but is not safe as this can be modified by apps and isn't always accurate
    var nSize: DWord := 1024;
    SetLength(Result, nSize);
    if Winapi.Windows.GetUserName(PChar(Result), nSize) then
    begin
      SetLength(Result, nSize - 1)
    end
    else
    begin
      RaiseLastOSError;
    end
  {$ENDIF}
  {$IFDEF LINUX}
    Result := GetEnvironmentVariable('USERNAME');
  {$ENDIF}
end;

function TSystemInformation.GetVideoCardName: String;
{$IFDEF MSWINDOWS}
  const
    WbemUser = '';
    WbemPassword = '';
    WbemComputer = 'localhost';
    wbemFlagForwardOnly = $00000020;
  var
    FSWbemLocator: OLEVariant;
    FWMIService: OLEVariant;
    FWbemObjectSet: OLEVariant;
    FWbemObject: OLEVariant;
    oEnum: IEnumvariant;
    iValue: LongWord;
{$ENDIF}
begin;
  result := '';
  {$IFDEF MSWINDOWS}
    try
      FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
      FWMIService := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);
      FWbemObjectSet := FWMIService.ExecQuery('SELECT Name,PNPDeviceID FROM Win32_VideoController', 'WQL', wbemFlagForwardOnly);
      oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumvariant;
      while oEnum.Next(1, FWbemObject, iValue) = 0 do
      begin
        result := String(FWbemObject.Name);
        FWbemObject := Unassigned;
      end;
    except

    end;
  {$ENDIF}
end;

constructor TSystemInformation.Create;
begin
  FMacAddress := GetMacAddress;
  FComputerName := GetEnvironmentVariable('COMPUTERNAME');
  FOperatingSystem := TOSVersion.ToString;
  FApplicationType := 'Application';
  FTotalMemory := GetSystemTotalMemory;
  FUserName := GetUserName;
  FVideoCard := GetVideoCardName;
end;

function TSystemInformation.GetAppVersion: String;
var
  wMajor, wMinor, wRelease, wBuild: Word;
  VersionSuccess: Boolean;

  {$IF Defined(ANDROID)}
    PackageManager: JPackageManager;
    PackageInfo : JPackageInfo;
    VersionString: String;
  {$ENDIF}
  {$IF Defined(MSWINDOWS)}
    Size, Size2: DWord;
    Pt, Pt2: Pointer;
  {$ENDIF}
begin
  try
    wMajor := 0;
    wMinor := 0;
    wRelease := 0;
    wBuild := 0;
    {$IF Defined(IOS)}
      // Hasn't been implemented yet
    {$ELSEIF Defined(ANDROID)}
      PackageManager := SharedActivity.getPackageManager;
      PackageInfo := PackageManager.getPackageInfo(SharedActivityContext.getPackageName(), TJPackageManager.JavaClass.GET_ACTIVITIES);

      VersionString := JStringToString(PackageInfo.versionName);

      wMajor := Copy(VersionString,1,VersionString.IndexOf('.')).ToInteger;
      Delete(VersionString,1,wMajor.ToString.Length+1);
      wMinor := Copy(VersionString,1,VersionString.IndexOf('.')).ToInteger;
      Delete(VersionString,1,wMinor.ToString.Length+1);
      wRelease := VersionString.ToInteger; // This assumed there isn't a Build on Android.
      wBuild := 0;
    {$ELSEIF Defined(MACOS)}
      // Hasn't been implemented yet
      // http://codeverge.com/embarcadero.delphi.firemonkey/application-version-information/1049381 Will be useful for MacOS
    {$ELSEIF Defined(MSWINDOWS)}
      Size:= GetFileVersionInfoSize(PChar(ExtractFilePath(ParamStr(0)) + ExtractFileName(ParamStr(0))), Size2);
      if Size > 0 then
      begin
        GetMem(Pt, Size);
        GetFileVersionInfo(PChar(ExtractFilePath(ParamStr(0)) + ExtractFileName(ParamStr(0))), 0, Size, Pt);
        VerQueryValue(Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo(Pt2^) do
        begin
          wMajor := HiWord(dwFileVersionMS);
          wMinor := LoWord(dwFileVersionMS);
          wRelease := HiWord(dwFileVersionLS);
          wBuild := LoWord(dwFileVersionLS);
        end;
        FreeMem(Pt, Size);
      end;
    {$ELSEIF Defined(LINUX)}
      // Hasn't been implemented yet
    {$ENDIF}
  finally
    VersionSuccess := TRUE;
  end;
  if not VersionSuccess then
  begin
    wMajor := 0;
    wMinor := 0;
    wRelease := 0;
    wBuild := 0;
  end;

  result := wMajor.ToString + '.' + wMinor.ToString + '.' + wRelease.ToString + '.' + wBuild.ToString;
end;

function TSystemInformation.GetIPAddress: String;
  {$IF Defined(MSWINDOWS)}
    type
      pu_long = ^u_long;
    var
      varTWSAData : TWSAData;
      varPHostEnt : PHostEnt;
      varTInAddr : TInAddr;
      namebuf : Array[0..255] of ansichar;
  {$ENDIF}
  {$IF Defined(ANDROID)}
    function GetWiFiManager: JWifiManager;
      var ConnectivityServiceNative: JObject;
    begin
      ConnectivityServiceNative := SharedActivityContext.getSystemService(TJContext.JavaClass.WIFI_SERVICE);
      if not Assigned(ConnectivityServiceNative) then
        raise Exception.Create('Could not locate Connectivity Service');
      Result := TJWifiManager.Wrap(
        (ConnectivityServiceNative as ILocalObject).GetObjectID);
      if not Assigned(Result) then
        raise Exception.Create('Could not access Connectivity Manager');
    end;
  {$ENDIF}
begin
  try
    {$IF Defined(IOS)}
      // Hasn't been implemented yet
    {$ELSEIF Defined(ANDROID)}
      result := GetWiFiManager.getConnectionInfo.getIpAddress.ToString;
    {$ELSEIF Defined(MACOS)}
      // Hasn't been implemented yet
    {$ELSEIF Defined(MSWINDOWS)}
      If WSAStartup($101,varTWSAData) <> 0 Then
      Result := ''
      Else Begin
        gethostname(namebuf,sizeof(namebuf));
        varPHostEnt := gethostbyname(namebuf);
        varTInAddr.S_addr := u_long(pu_long(varPHostEnt^.h_addr_list^)^);
        Result := inet_ntoa(varTInAddr);
      End;
      WSACleanup;
    {$ELSEIF Defined(LINUX)}
      // Hasn't been implemented yet
    {$ENDIF}
  except on E: Exception do
    result := '';
  end;
end;

function TSystemInformation.GetMacAddress: String;
{$IFDEF MSWINDOWS}
var
  Lib: Cardinal;
  Func: function(GUID: PGUID): Longint; stdcall;
  GUID1, GUID2: TGUID;
  {$ENDIF}
begin
  Result := EmptyStr;
{$IFDEF MSWINDOWS}
  Lib := LoadLibrary('rpcrt4.dll');
  if Lib <> 0 then
  begin
    try
      @Func := GetProcAddress(Lib, 'UuidCreateSequential');
      if Assigned(Func) then
      begin
        if (Func(@GUID1) = 0) and
           (Func(@GUID2) = 0) and
           (GUID1.D4[2] = GUID2.D4[2]) and
           (GUID1.D4[3] = GUID2.D4[3]) and
           (GUID1.D4[4] = GUID2.D4[4]) and
           (GUID1.D4[5] = GUID2.D4[5]) and
           (GUID1.D4[6] = GUID2.D4[6]) and
           (GUID1.D4[7] = GUID2.D4[7]) then
        begin
          Result :=
            IntToHex(GUID1.D4[2], 2) + '-' +
            IntToHex(GUID1.D4[3], 2) + '-' +
            IntToHex(GUID1.D4[4], 2) + '-' +
            IntToHex(GUID1.D4[5], 2) + '-' +
            IntToHex(GUID1.D4[6], 2) + '-' +
            IntToHex(GUID1.D4[7], 2);
        end;
      end;
    finally
      FreeLibrary(Lib)
    end;
  end;
{$ENDIF}
end;

function TSystemInformation.GetScreenResolution: String;
begin
  result := Screen.Width.ToString+'x'+Screen.Height.ToString;
end;

function TSystemInformation.GetSystemLanguage: String;
  {$IFDEF MACOS}
    var
      Languages: NSArray;
  {$ENDIF}
  {$IFDEF ANDROID}
    var
      LocServ: IFMXLocaleService;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    var
      buffer: MarshaledString;
      UserLCID: LCID;
      BufLen: Integer;
  {$ENDIF}
begin
  {$IFDEF MACOS}
    Languages := TNSLocale.OCClass.preferredLanguages;
    Result := TNSString.Wrap(Languages.objectAtIndex(0)).UTF8String;
  {$ENDIF}

  {$IFDEF ANDROID}
    if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, IInterface(LocServ)) then
      Result := LocServ.GetCurrentLangID;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    UserLCID := GetUserDefaultLCID;
    BufLen := GetLocaleInfo(UserLCID, LOCALE_SISO639LANGNAME, nil, 0);
    buffer := StrAlloc(BufLen);
    if GetLocaleInfo(UserLCID, LOCALE_SISO639LANGNAME, buffer, BufLen) <> 0 then
      Result := buffer
    else
      Result := 'en';
    StrDispose(buffer);
  {$ENDIF}
end;

function TSystemInformation.GetSystemLocation: TSystemLocation;
  {$IFDEF MSWINDOWS}
    var
      MyLocationSensorArray : TSensorArray;
      MyLocationSensor : TCustomLocationSensor;
  {$ENDIF}
  {$IFDEF ANDROID}
    var
      MyLocationSensorArray : TSensorArray;
      MyLocationSensor : TCustomLocationSensor;
  {$ENDIF}
  {$IFDEF MACOS}
    var
      MyLocationSensorArray : TSensorArray;
      MyLocationSensor : TCustomLocationSensor;
  {$ENDIF}
begin
  {$IFDEF MSWINDOWS}
    try
      TSensorManager.Current.Activate;
      MyLocationSensorArray := TSensorManager.Current.GetSensorsByCategory(TSensorCategory.Location);
      if MyLocationSensorArray <> nil then
      begin
        // Location Sensor Found
        MyLocationSensor := MyLocationSensorArray[0] as TCustomLocationSensor;
        MyLocationSensor.Start;

        result.Latitude := MyLocationSensor.Latitude;
        result.Longitude := MyLocationSensor.Longitude;

        MyLocationSensor.Stop;
      end else
      begin
        // Location Sensor Not Found
        result.Latitude := 0;
        result.Longitude := 0;
      end;
    finally
      TSensorManager.Current.DeActivate
    end;
  {$ENDIF}
  {$IFDEF ANDROID}
    try
      TSensorManager.Current.Activate;
      MyLocationSensorArray := TSensorManager.Current.GetSensorsByCategory(TSensorCategory.Location);
      if MyLocationSensorArray <> nil then
      begin
        // Location Sensor Found
        MyLocationSensor := MyLocationSensorArray[0] as TCustomLocationSensor;
        MyLocationSensor.Start;

        result.Latitude := MyLocationSensor.Latitude;
        result.Longitude := MyLocationSensor.Longitude;

        MyLocationSensor.Stop;
      end else
      begin
        // Location Sensor Not Found
        result.Latitude := 0;
        result.Longitude := 0;
      end;
    finally
      TSensorManager.Current.DeActivate
    end;
  {$ENDIF}
  {$IFDEF MACOS}
    try
      TSensorManager.Current.Activate;
      MyLocationSensorArray := TSensorManager.Current.GetSensorsByCategory(TSensorCategory.Location);
      if MyLocationSensorArray <> nil then
      begin
        // Location Sensor Found
        MyLocationSensor := MyLocationSensorArray[0] as TCustomLocationSensor;
        MyLocationSensor.Start;

        result.Latitude := MyLocationSensor.Latitude;
        result.Longitude := MyLocationSensor.Longitude;

        MyLocationSensor.Stop;
      end else
      begin
        // Location Sensor Not Found
        result.Latitude := 0;
        result.Longitude := 0;
      end;
    finally
      TSensorManager.Current.DeActivate
    end;
  {$ENDIF}
end;

function TSystemInformation.GetSystemTotalMemory: String;
  {$IFDEF ANDROID}
    var
      MemoryInfo: JActivityManager_MemoryInfo;
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    var
      MemoryInfo: TMemoryStatusEx;
  {$ENDIF}
begin
  result := '';
  try
    {$IFDEF MSWINDOWS}
      MemoryInfo.dwLength := SizeOf(TMemoryStatusEx);
      GlobalMemoryStatusEx(MemoryInfo);
      result := Format('%0.1f GB', [MemoryInfo.ullTotalPhys / (1024 * 1024 * 1024)]);
    {$ENDIF}
    {$IFDEF ANDROID}
      MemoryInfo:= TJActivityManager_MemoryInfo.JavaClass.init;
      TJActivityManager.Wrap((TAndroidHelper.Context.getSystemService(TJContext.JavaClass.ACTIVITY_SERVICE) as ILocalObject)
        .GetObjectID).getMemoryInfo(MemoryInfo);
      var TotalMb := MemoryInfo.totalMem shr 20; // Total Memory
      var AvailMb := MemoryInfo.availMem shr 20; // Available Memory
      result := Format('%0.1f GB', [TotalMb]);
    {$ENDIF}
  except on E: Exception do

  end;
end;

end.
