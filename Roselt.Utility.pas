unit Roselt.Utility;

interface

uses
  System.SysUtils,
  System.StrUtils;


function RemoveNonDigits(const S: string): string;
function RemoveNonDigitsAndLetters(const S: string): string;

implementation

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

end.
