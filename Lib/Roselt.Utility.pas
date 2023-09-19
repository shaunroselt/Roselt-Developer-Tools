unit Roselt.Utility;

interface

uses
  {$IFDEF MSWINDOWS}
    Winapi.ShellAPI,
    Winapi.Windows,
  {$ENDIF}
  {$IFDEF ANDROID}
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.helpers,
  {$ENDIF}
  {$IFDEF MACOS}
    Posix.Stdlib,
  {$ENDIF}
  {$IFDEF IOS}
    macapi.helpers,
    iOSapi.Foundation,
    FMX.helpers.iOS,
  {$ENDIF}

  System.SysUtils,
  System.StrUtils,
  System.Classes;


procedure OpenURL(URL: string);

function RemoveNonDigits(const S: string): string;
function RemoveNonDigitsAndLetters(const S: string): string;

function RemoveEmptyLinesAndWhitespace(const S: string): string;

implementation

procedure OpenURL(URL: string);
begin
  {$IFDEF MSWINDOWS}
    ShellExecute(0, 'OPEN', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
  {$ENDIF}
  {$IFDEF ANDROID}
    var Intent := TJIntent.Create;
    Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
    Intent.setData(StrToJURI(URL));
    tandroidhelper.Activity.startActivity(Intent);
  {$ENDIF}
  {$IFDEF MACOS}
    _system(PAnsiChar('open ' + AnsiString(URL)));
  {$ENDIF}
  {$IFDEF IOS}
    SharedApplication.OpenURL(StrToNSUrl(URL));
  {$ENDIF}
end;

function RemoveNonDigits(const S: string): string;
begin
  SetLength(Result, S.Length);
  var LActualLength := 0;
  for var i := 1 to S.Length do
    if CharInSet(S[i],  ['0'..'9']) then
    begin
      Inc(LActualLength);
      Result[LActualLength] := S[i];
    end;
  SetLength(Result, LActualLength);
end;

function RemoveNonDigitsAndLetters(const S: string): string;
begin
  SetLength(Result, S.Length);
  var LActualLength := 0;
  for var i := 1 to S.Length do
    if CharInSet(S[i],  ['0'..'9']) OR CharInSet(S[i],  ['A'..'Z']) OR CharInSet(S[i],  ['a'..'z']) then
    begin
      Inc(LActualLength);
      Result[LActualLength] := S[i];
    end;
  SetLength(Result, LActualLength);
end;

function RemoveEmptyLinesAndWhitespace(const S: string): string;
begin
  var SL := TStringList.Create;
  SL.Text := S;

  for var i := SL.Count - 1 downto 0 do
  begin
    SL[i] := Trim(SL[i]);
    if SL[i] = '' then SL.Delete(i);
  end;

  Result := SL.Text;
  SL.Free;
end;

end.
