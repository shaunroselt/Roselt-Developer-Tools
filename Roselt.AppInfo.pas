unit Roselt.AppInfo;

interface

uses
  System.SysUtils,
  {$IFNDEF WEBLIB}
    System.IOUtils,
  {$ENDIF}
  Roselt.SystemInformation;

function GetAppInfo: String; // Need to get all of the App Info dynamically in the future

implementation

function GetAppInfo: String;
var
  Version, OperatingSystem, Architecture, BuildType, CompiledDate: String;
begin
  Version := 'Version 3.0.0.0 Beta 5';
  Architecture := TSystemInformation.SystemArchitecture;
  OperatingSystem := TSystemInformation.OperatingSystem;
  BuildType := 'RELEASE';
  {$IFDEF DEBUG}
    BuildType := 'DEBUG';
  {$ENDIF}
  CompiledDate := TSystemInformation.AppCompiledDate;

  Result := '${Version} | ${OperatingSystem} | ${Architecture} | ${BuildType} | ${CompiledDate}';
  Result := Result.Replace('${Version}', Version)
                  .Replace('${OperatingSystem}', OperatingSystem)
                  .Replace('${Architecture}', Architecture)
                  .Replace('${BuildType}', BuildType)
                  .Replace('${CompiledDate}', CompiledDate);
end;

end.
