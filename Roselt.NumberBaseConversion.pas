{
  In the future, I want functions to convert from and to for all of these:


  Decimal (base 10)
  Binary (base 2)
  Hexadecimal (base 16)
  Octal (base 8)
  Sexagesimal (base 60)
  Vigesimal (base 20)
  Duodecimal (base 12)
  Base 36
  Balanced ternary (base 3)
  Senary (base 6)
  Quaternary (base 4)
  Ternary (base 3)
  Quinary (base 5)
  Duotrigesimal (base 32)
  Tridecimal (base 13)
  Septenary (base 7)
  Nonary (base 9)
  Pentadecimal (base 15)
  Hexatridecimal (base 23)
  Base 64
}

unit Roselt.NumberBaseConversion;

interface

uses
  System.SysUtils,
  System.StrUtils;

function IntToBin(Value: Cardinal; Digits: Integer): String;
function IntToOct(invalue: Integer): ShortString;

function HexadecimalToDecimal(Value: String): Int64;
function DecimalToOctal(Value: Int64): String;
function OctalToDecimal(Value: String): Int64;
function DecimalToBinary(Value: Int64): String;
function BinaryToDecimal(Value: String): Int64;
function DecimalToDuodecimal(decimal: Int64): string;
function DuodecimalToDecimal(duodecimal: String): Int64;


function FormatHexadecimal(Value: String; Spaces: Cardinal = 4): String;

function RemoveNonDecimalDigits(const S: string): string; // Removes all characters except numbers and negative -
function RemoveNonDuodecimalDigits(const S: string): string; // Removes all characters except 0123456789ABab
function RemoveNonHexadecimalCharacters(const S: string): string; // Removes all characters except 0123456789ABCDEFabcdef
function RemoveNonBinaryDigits(const Value: string): string; // Removes all characters except 0 and 1


implementation

function IntToBin(Value: Cardinal; Digits: Integer): String;
var
  S: String;
begin
  S := '';
  While Digits > 0 do
  begin
    if Odd(Value) then
      S := '1' + S
    Else
      S := '0' + S;
    Value := Value shr 1;
    Digits := Digits - 1;
  end;
  Result := S;
end;

function IntToOct(invalue: Integer): ShortString;
const
  tt: array [0 .. 7] of char = ('0', '1', '2', '3', '4', '5', '6', '7');
var
  tempval: Integer;
begin
  Result := '';
  tempval := invalue;
  if tempval = 0 then
    Result := '0'
  else
    while (tempval <> 0) do
    begin
      Result := tt[(tempval and $7)] + Result;
      tempval := (tempval shr 3);
    end;
end;

function HexadecimalToDecimal(Value: string): Int64;
var
  HexValue: Int64;
begin
  Result := 0;
  for var i := 1 to Length(Value) do
  begin
    HexValue := StrToInt('$' + Value[i]);
    Result := Result * 16 + HexValue;
  end;
end;

function DecimalToOctal(Value: Int64): string;
const
  tt: array [0 .. 7] of char = ('0', '1', '2', '3', '4', '5', '6', '7');
var
  tempval: Int64;
begin
  Result := '';
  tempval := Value;
  if tempval = 0 then
    Result := '0'
  else
    while (tempval <> 0) do
    begin
      Result := tt[(tempval and $7)] + Result;
      tempval := (tempval shr 3);
    end;
end;

function OctalToDecimal(Value: String): Int64;
var
  OctValue: Int64;
begin
  Result := 0;
  for var i := 1 to Length(Value) do
  begin
    OctValue := StrToInt('$' + Value[i]);
    Result := Result * 8 + OctValue;
  end;
end;

function DecimalToBinary(Value: Int64): string;
const
  tt: array [0 .. 1] of char = ('0', '1');
var
  tempval: Int64;
begin
  Result := '';
  tempval := Value;
  if tempval = 0 then
    Result := '0'
  else
    while (tempval <> 0) do
    begin
      Result := tt[(tempval and $1)] + Result;
      tempval := (tempval shr 1);
    end;
end;

function BinaryToDecimal(Value: String): Int64;
var
  BinValue: Int64;
begin
  Result := 0;
  for var i := 1 to Length(Value) do
  begin
    BinValue := StrToInt('$' + Value[i]);
    Result := Result * 2 + BinValue;
  end;
end;

function DecimalToDuodecimal(decimal: Int64): string;
var
  remainder: Int64;
  duodecimal: string;
begin
  duodecimal := '';
  while decimal > 0 do
  begin
    remainder := decimal mod 12;
    if remainder >= 10 then
      duodecimal := Chr(Ord('A') + remainder - 10) + duodecimal
    else
      duodecimal := remainder.ToString + duodecimal;
    decimal := decimal div 12;
  end;
  Result := duodecimal;
end;

function DuodecimalToDecimal(duodecimal: String): Int64;
var
  decimal: Int64;
begin
  decimal := 0;
  for var i := 1 to Length(duodecimal) do
  begin
    if (duodecimal[i] >= '0') and (duodecimal[i] <= '9') then
      decimal := decimal * 12 + (Ord(duodecimal[i]) - Ord('0'))
    else if (duodecimal[i] >= 'A') and (duodecimal[i] <= 'B') then
      decimal := decimal * 12 + (Ord(duodecimal[i]) - Ord('A') + 10);
  end;
  Result := decimal;
end;

function FormatHexadecimal(Value: String; Spaces: Cardinal): String;
begin
  Result := '';
  for var I := Length(Value) downto 1 do
  begin
    if (I mod Spaces) = 0 then
      Result := Result + ' ';
    Result := Result + Value[I];
  end;
  Result := ReverseString(Result);
end;

function RemoveNonDecimalDigits(const S: string): string;
begin
  SetLength(Result, S.Length);
  var LActualLength := 0;
  for var i := 1 to S.Length do
    if CharInSet(S[i],  ['0'..'9']) OR (S[i] = '-') then
    begin
      Inc(LActualLength);
      Result[LActualLength] := S[i];
    end;
  SetLength(Result, LActualLength);
end;

function RemoveNonDuodecimalDigits(const S: string): string;
begin
  SetLength(Result, S.Length);
  var LActualLength := 0;
  for var i := 1 to S.Length do
    if CharInSet(S[i],  ['0'..'9']) OR CharInSet(S[i],  ['A'..'B']) OR CharInSet(S[i],  ['a'..'b']) then
    begin
      Inc(LActualLength);
      Result[LActualLength] := S[i];
    end;
  SetLength(Result, LActualLength);
end;

function RemoveNonHexadecimalCharacters(const S: string): string;
begin
  SetLength(Result, S.Length);
  var LActualLength := 0;
  for var i := 1 to S.Length do
    if CharInSet(S[i],  ['0'..'9']) OR CharInSet(S[i],  ['A'..'F']) OR CharInSet(S[i],  ['a'..'f']) then
    begin
      Inc(LActualLength);
      Result[LActualLength] := S[i];
    end;
  SetLength(Result, LActualLength);
end;

function RemoveNonBinaryDigits(const Value: string): string;
begin
  SetLength(Result, Value.Length);
  var LActualLength := 0;
  for var i := 1 to Value.Length do
    if (Value[i] = '0') OR (Value[i] = '1') then
    begin
      Inc(LActualLength);
      Result[LActualLength] := Value[i];
    end;
  SetLength(Result, LActualLength);
end;

end.
