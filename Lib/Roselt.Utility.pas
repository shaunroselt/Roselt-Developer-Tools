//  Helper functions used within Roselt Developer Tools
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
  {$IFDEF WEBLIB}
    Web,
  {$ENDIF}

  System.SysUtils,
  System.StrUtils,
  System.Classes;


{$IFDEF WEBLIB}
// The WEBLIB functions are only used in the Web Version of the app
procedure SetQueryParam(key, value: String; url: String = '');
function GetCookie(cookie_name: String): String;
procedure SetCookie(cookie_name, value: String; minutes: Integer);
procedure DeleteCookie(cookie_name: String);
{$IFEND}

procedure OpenURL(URL: string{$IFDEF WEBLIB}; NewTab: Boolean = True{$IFEND});

function RemoveNonDigits(const S: string): string;
function RemoveNonDigitsAndLetters(const S: string): string;

function RemoveEmptyLinesAndWhitespace(const S: string): string;

implementation

{$IFDEF WEBLIB}
procedure SetQueryParam(key, value, url: String);
begin
  if (url = '') then url := window.location.href;
  asm
    let re = new RegExp("([?&])" + key + "=.*?(&|#|$)(.*)", "gi"),hash;

    if (re.test(url))
        if (typeof value !== 'undefined' && value !== null)
            url = url.replace(re, '$1' + key + "=" + value + '$2$3');
        else {
            hash = url.split('#');
            url = hash[0].replace(re, '$1$3').replace(/(&|\?)$/, '');
            if (typeof hash[1] !== 'undefined' && hash[1] !== null) url += '#' + hash[1];
        }
    else
        if (typeof value !== 'undefined' && value !== null) {
            const separator = url.indexOf('?') !== -1 ? '&' : '?';
            hash = url.split('#');
            url = hash[0] + separator + key + '=' + value;
            if (typeof hash[1] !== 'undefined' && hash[1] !== null) url += '#' + hash[1];
        }
    window.history.pushState({ path: url }, '', url);
  end;
end;

function GetCookie(cookie_name: String): String;
begin
  asm
    const name = cookie_name + "=";
    const decodedCookie = decodeURIComponent(document.cookie);
    const ca = decodedCookie.split(';');
    for(let i = 0; i <ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1);
        if (c.indexOf(name) == 0)
            Result = c.substring(name.length, c.length);
    }
    Result = "";
  end;
end;

procedure SetCookie(cookie_name, value: String; minutes: Integer);
begin
  asm
    let expires = "";
    if (minutes) {
        let date = new Date();
        date.setTime(date.getTime()+(minutes*60*1000));
        expires = "; expires="+date.toUTCString();
    }
    document.cookie = cookie_name + "=" + value + expires + ";SameSite=Strict; path=/";
  end;
end;

procedure DeleteCookie(cookie_name: String);
begin
  asm
    document.cookie = cookie_name + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + ";SameSite=Strict; path=/";
  end;
end;
{$IFEND}

procedure OpenURL(URL: string{$IFDEF WEBLIB}; NewTab: Boolean{$IFEND});
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
  {$IFDEF WEBLIB}
    if NewTab then
      window.open(URL, '_blank')
    else
      window.open(URL, '_self');
  {$ENDIF}
end;

function RemoveNonDigits(const S: string): string;
begin
  {$IFNDEF WEBLIB}
    SetLength(Result, S.Length);
    var LActualLength := 0;
    for var I := 1 to S.Length do
      if CharInSet(S[I],  ['0'..'9']) then
      begin
        Inc(LActualLength);
        Result[LActualLength] := S[I];
      end;
    SetLength(Result, LActualLength);
  {$ENDIF}
  {$IFDEF WEBLIB}
    asm
      Result = S.replace(/[^0-9]/g,'');
    end;
  {$ENDIF}
end;

function RemoveNonDigitsAndLetters(const S: string): string;
begin
  {$IFNDEF WEBLIB}
    SetLength(Result, S.Length);
    var LActualLength := 0;
    for var I := 1 to S.Length do
      if CharInSet(S[I],  ['0'..'9']) OR CharInSet(S[I],  ['A'..'Z']) OR CharInSet(S[I],  ['a'..'z']) then
      begin
        Inc(LActualLength);
        Result[LActualLength] := S[I];
      end;
    SetLength(Result, LActualLength);
  {$ENDIF}
  {$IFDEF WEBLIB}
    asm
      Result = S.replace(/[^a-zA-Z0-9]/g,'');
    end;
  {$ENDIF}
end;

function RemoveEmptyLinesAndWhitespace(const S: string): string;
var
  SL: TStringList;
  I: UInt64;
begin
  SL := TStringList.Create;
  SL.Text := S;

  for I := SL.Count - 1 downto 0 do
  begin
    SL[I] := Trim(SL[I]);
    if SL[I] = '' then SL.Delete(I);
  end;

  Result := SL.Text;
  SL.Free;
end;

end.
