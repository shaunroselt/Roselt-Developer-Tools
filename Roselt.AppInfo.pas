unit Roselt.AppInfo;

interface

uses
  System.SysUtils,
  System.IOUtils;

function GetAppInfo: String; // Need to get all of the App Info dynamically in the future

implementation

function GetAppInfo: String;
  function GetAppArchitectureInfo: String; // Consider using TOSVersion.Architecture
  begin
    Result := 'Unknown Architecture';
    {$IFDEF MSWINDOWS} Result := 'X64'; {$ENDIF}
    {$IFDEF IOS} Result := 'X64'; {$ENDIF}
    {$IFDEF MACOS} Result := 'X64'; {$ENDIF}
    {$IFDEF LINUX} Result := 'X64'; {$ENDIF}
    {$IFDEF ANDROID} Result := 'X64'; {$ENDIF}
    {$IFDEF WEBLIB} Result := 'Web'; {$ENDIF}
  end;
  function GetAppCompiledDate: String;
  begin
    try
      Result := DateToStr(TFile.GetLastWriteTime(ParamStr(0)));
    except
      Result := DateToStr(Date);
    end;
  end;
var
  Version, OperatingSystem, Architecture, BuildType, CompiledDate: String;
begin
  Version := 'Version 3.0.0.0 Beta 5';
  Architecture := GetAppArchitectureInfo;
  OperatingSystem := TOSVersion.Name;
  BuildType := 'RELEASE';
  {$IFDEF DEBUG}
    BuildType := 'DEBUG';
  {$ENDIF}
  CompiledDate := GetAppCompiledDate;

  Result := '${Version} | ${OperatingSystem} | ${Architecture} | ${BuildType} | ${CompiledDate}';
  Result := Result.Replace('${Version}', Version)
                  .Replace('${OperatingSystem}', OperatingSystem)
                  .Replace('${Architecture}', Architecture)
                  .Replace('${BuildType}', BuildType)
                  .Replace('${CompiledDate}', CompiledDate);
end;

end.
