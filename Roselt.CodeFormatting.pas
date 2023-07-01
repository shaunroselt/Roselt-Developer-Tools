unit Roselt.CodeFormatting;

interface

uses
  Roselt.Utility,
  System.SysUtils,
  System.Classes,
  System.StrUtils;

type
  TCodeFormatter = record
  public type
    TIndentationType = (Spaces, Tabs);
    TIdentationCount = 0..8;
  public
    class function FormatDelphi(delphi: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatHTML(html: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatCSS(css: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatSQL(sql: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatJavaScript(js: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatXML(xml: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatPHP(php: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
    class function FormatJson(delphi: String; IndentationType: TIndentationType = TIndentationType.Spaces; IndentationCount: TIdentationCount = 2): String; static;
  end;

implementation

class function TCodeFormatter.FormatDelphi(delphi: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatSQL(sql: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatXML(xml: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatHTML(html: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin
  html := RemoveEmptyLinesAndWhitespace(html);
  html := html.Replace(#10,'',[rfReplaceAll]).Replace(#13,'',[rfReplaceAll]);


  html := html.Replace('>','>'+sLineBreak);
  html := html.Replace('<',sLineBreak+'<');
  html := RemoveEmptyLinesAndWhitespace(html);


  var SL := TStringList.Create;
  SL.Text := html;


  for var I := 0 to SL.Count-1 do
  begin
    var ElementTagName := '';
    if (SL[I][1] = '<') and (SL[I][SL[I].Length] = '>') then
    begin
      ElementTagName := SL[I].Substring(1,SL[I].Length-2);
      ElementTagName := RemoveEmptyLinesAndWhitespace(ElementTagName);
    end;

    var fsf := '';

  end;

  Result := SL.Text;
  SL.Free;
end;

class function TCodeFormatter.FormatCSS(css: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatJavaScript(js: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatJson(delphi: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

class function TCodeFormatter.FormatPHP(php: String; IndentationType: TIndentationType; IndentationCount: TIdentationCount): String;
//  Doesn't work yet. Just testing things out.
begin

end;

end.
