unit Roselt.CodeFormatting;

interface

uses
  Roselt.Utility,
  System.SysUtils,
  System.Classes;


//type
//  THTMLAttribute = record
//    Name: String;
//    Value: String;
//  end;
//
//  THTMLElement = class
//    TagName: String;
//    Attributes: array of THTMLAttribute;
//    Children: array of THTMLElement;
//    Parent: THTMLElement;
//  end;

function FormatDelphi(delphi: String): String;
function FormatHTML(html: String): String;
function FormatCSS(css: String): String;
function FormatJavaScript(js: String): String;

implementation

function FormatDelphi(delphi: String): String;
begin

end;

function FormatHTML(html: String): String;
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

function FormatCSS(css: String): String;
begin

end;

function FormatJavaScript(js: String): String;
begin

end;

end.
