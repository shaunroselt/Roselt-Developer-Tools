unit Roselt.CodeFormatting;

interface

uses
  Roselt.Utility,
  System.SysUtils,
  System.Classes,
  System.StrUtils;


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
function FormatSQL(sql: String): String;
function FormatSQLByWord(sql: String; sWord:string): String;
function Occurrences(const Substring, Text: string): integer;

implementation
const
 CRLF = #13#10;

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

function FormatSQL(sql: String): String;
var
  lstWords :TStringList;
  curChar : Char;
  iPos, iComma, iCommaPrev:integer;

begin
// When From, Where, order --> then insert enter before
  sql := sql.ToUpper;
  lstWords := TStringList.Create;
  lstWords.AddStrings(['FROM', 'JOIN', 'WHERE', 'AND', 'ORDER']);
  for var sWord in lstWords do
  begin
    sql := FormatSQLByWord(sql, sWord);
  end;

  // Formatear comas
  iComma:=sql.IndexOf(',');
  iCommaPrev:=0;

  for iPos := 1 to (sql.Length) do
  begin
    if (sql[iPos] = ',') and (sql[iPos+1] <> '''') then
    begin
      if iPos <> iComma then      //Es la segunda ocurrencia
      begin
        iCommaPrev := iComma;
        iComma:=iPos;

        if (iComma - iCommaPrev) > 30 then
        begin
          sql :=sql.Insert(iCommaPrev-1, CRLF);
        end;
      end;
    end;
  end;
  sql :=sql.Insert(iComma-1, CRLF);

  Result := sql;
end;

function FormatSQLByWord(sql: String; sWord: string): String;
begin
  sql := sql.Replace(sWord, CRLF+sWord);
  Result := sql;
end;

function Occurrences(const Substring, Text: string): integer;
var
  offset: integer;
begin
  result := 0;
  offset := PosEx(Substring, Text, 1);
  while offset <> 0 do
  begin
    inc(result);
    offset := PosEx(Substring, Text, offset + length(Substring));
  end;
end;

end.
