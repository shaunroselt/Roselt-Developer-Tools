unit Roselt.AppInfo;

interface

uses System.SysUtils;

function GetAppInfo: String; // Need to get all of the App Info dynamically in the future

implementation

function GetAppInfo: String;
  function GetAppArchitectureInfo: String;
  begin
    Result := 'Unknown Architecture';
    {$IFDEF MSWINDOWS} Result := 'X64'; {$ENDIF}
    {$IFDEF IOS} Result := 'X64'; {$ENDIF}
    {$IFDEF MACOS} Result := 'X64'; {$ENDIF}
    {$IFDEF LINUX} Result := 'X64'; {$ENDIF}
    {$IFDEF ANDROID} Result := 'X64'; {$ENDIF}
    {$IFDEF WEBLIB} Result := 'Web'; {$ENDIF}
  end;
var
  Version, Architecture, BuildType, CompiledDate: String;
begin
  Version := 'Version 3.0.0.0 Beta 4';
  Architecture := GetAppArchitectureInfo;
  BuildType := 'RELEASE';
  {$IFDEF DEBUG}
    BuildType := 'DEBUG';
  {$ENDIF}
  CompiledDate := DateToStr(Date);

  Result := Version + ' | ' + Architecture + ' | ' + BuildType + ' | ' + CompiledDate;
end;

end.
