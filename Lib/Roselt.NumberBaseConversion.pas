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

{
  Can use these sites to fact check my results:

  https://calculator.name/baseconvert/decimal/duodecimal/0822004431
  https://trustconverter.com/en/base-number-conversion/decimal/decimal-to-duodecimal.html
}

unit Roselt.NumberBaseConversion;

interface

uses
  System.SysUtils,
  System.StrUtils;

function IntToBin(Value: Cardinal; Digits: Integer): String;  // old... need to deprecate
function IntToOct(Value: Integer): String;  // old... need to deprecate

function HexadecimalToDecimal(Value: String): Int64;
function DecimalToOctal(Value: Int64): String;
function OctalToDecimal(Value: String): Int64;
function DecimalToBinary(Value: Int64): String;
function BinaryToDecimal(Value: String): Int64;
function DecimalToDuodecimal(decimal: Int64): string;
function DuodecimalToDecimal(duodecimal: String): Int64;


function FormatNumberString(Value: String; Spaces: Cardinal = 4): String;

function RemoveNonDecimalDigits(const S: string): string; // Removes all characters except numbers and negative -
function RemoveNonDuodecimalDigits(const S: string): string; // Removes all characters except 0123456789ABab
function RemoveNonHexadecimalCharacters(const S: string): string; // Removes all characters except 0123456789ABCDEFabcdef
function RemoveNonBinaryDigits(const Value: string): string; // Removes all characters except 0 and 1



function ConvertNumberBase(const input: string; fromBase, toBase: Integer): string; // One function to rule them all :D
// Need to properly test ConvertNumberBase() function and see if it works for everything


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

function IntToOct(Value: Integer): String;
const
  tt: array [0 .. 7] of char = ('0', '1', '2', '3', '4', '5', '6', '7');
var
  tempval: Integer;
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

function HexadecimalToDecimal(Value: string): Int64;
var
  HexValue: Int64;  
  I: UInt64;
begin
  Result := 0;
  for I := 1 to Length(Value) do
  begin
    HexValue := StrToInt('$' + Value[I]);
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
  I: UInt64;
begin
  Result := 0;
  for I := 1 to Length(Value) do
  begin
    OctValue := StrToInt('$' + Value[I]);
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
  I: UInt64;
begin
  Result := 0;
  for I := 1 to Length(Value) do
  begin
    BinValue := StrToInt('$' + Value[I]);
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
  I: UInt64;
begin
  decimal := 0;
  for I := 1 to Length(duodecimal) do
  begin
    if (duodecimal[I] >= '0') and (duodecimal[I] <= '9') then
      decimal := decimal * 12 + (Ord(duodecimal[I]) - Ord('0'))
    else if (duodecimal[I] >= 'A') and (duodecimal[I] <= 'B') then
      decimal := decimal * 12 + (Ord(duodecimal[I]) - Ord('A') + 10);
  end;
  Result := decimal;
end;

function FormatNumberString(Value: String; Spaces: Cardinal): String;   
var
  I: UInt64;
begin
  Result := '';
  Value := ReverseString(Value);
  for I := 1 to Value.Length do
  begin
    Result := Result + Value[I];
    if (I mod Spaces) = 0 then
      Result := Result + ' ';
  end;
  Result := Trim(ReverseString(Result));
end;

function RemoveNonDecimalDigits(const S: string): string;     
begin         
  {$IFNDEF WEBLIB}
    SetLength(Result, S.Length);
    var LActualLength := 0;
    for var I := 1 to S.Length do
      if CharInSet(S[I],  ['0'..'9']) OR (S[I] = '-') then
      begin
        Inc(LActualLength);
        Result[LActualLength] := S[I];
      end;
    SetLength(Result, LActualLength); 
  {$ENDIF}
  {$IFDEF WEBLIB}
    asm
      Result = S.replace(/[^0-9.-]/g,'');
    end;
  {$ENDIF}
end;

function RemoveNonDuodecimalDigits(const S: string): string;  
begin         
  {$IFNDEF WEBLIB}
    SetLength(Result, S.Length);
    var LActualLength := 0;
    for var I := 1 to S.Length do
      if CharInSet(S[I],  ['0'..'9']) OR CharInSet(S[I],  ['A'..'B']) OR CharInSet(S[I],  ['a'..'b']) then
      begin
        Inc(LActualLength);
        Result[LActualLength] := S[I];
      end;
    SetLength(Result, LActualLength);  
  {$ENDIF}
  {$IFDEF WEBLIB}
    asm
      Result = S.replace(/[^a-bA-B0-9]/g,'');
    end;
  {$ENDIF}
end;

function RemoveNonHexadecimalCharacters(const S: string): string;
begin       
  {$IFNDEF WEBLIB}
    SetLength(Result, S.Length);
    var LActualLength := 0;
    for var I := 1 to S.Length do
      if CharInSet(S[I],  ['0'..'9']) OR CharInSet(S[I],  ['A'..'F']) OR CharInSet(S[I],  ['a'..'f']) then
      begin
        Inc(LActualLength);
        Result[LActualLength] := S[I];
      end;
    SetLength(Result, LActualLength);  
  {$ENDIF}
  {$IFDEF WEBLIB}
    asm
      Result = S.replace(/[^a-fA-F0-9]/g,'');
    end;
  {$ENDIF}
end;

function RemoveNonBinaryDigits(const Value: string): string;  
var
  LActualLength, I: UInt64;
begin
  SetLength(Result, Value.Length);
  LActualLength := 0;
  for I := 1 to Value.Length do
    if (Value[I] = '0') OR (Value[I] = '1') then
    begin
      Inc(LActualLength);
      Result[LActualLength] := Value[I];
    end;
  SetLength(Result, LActualLength);
end;

function ConvertNumberBase(const input: string; fromBase, toBase: Integer): string;
var
  num, remainder: Int64;  
  I: UInt64;
begin
  num := 0;
  for I := 1 to input.Length do
  begin
    if (Ord(input[I]) >= Ord('0')) and (Ord(input[I]) <= Ord('9')) then
      num := num * fromBase + (Ord(input[I]) - Ord('0'))
    else if (Ord(input[I]) >= Ord('A')) and (Ord(input[I]) <= Ord('Z')) then
      num := num * fromBase + (Ord(input[I]) - Ord('A') + 10)
    else if (Ord(input[I]) >= Ord('a')) and (Ord(input[I]) <= Ord('z')) then
      num := num * fromBase + (Ord(input[I]) - Ord('a') + 10);
  end;
  result := '';
  while num > 0 do
  begin
    remainder := num mod toBase;
    if remainder < 10 then
      result := Chr(remainder + Ord('0')) + result
    else
      result := Chr(remainder - 10 + Ord('A')) + result;
    num := num div toBase;
  end;
  if result = '' then result := '0';
end;


end.
