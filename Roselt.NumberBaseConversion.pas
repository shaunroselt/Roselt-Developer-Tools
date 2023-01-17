unit Roselt.NumberBaseConversion;

interface

uses
  System.SysUtils,
  System.StrUtils;

function HexadecimalToDecimal(Value: String): Int64;
function DecimalToOctal(Value: Int64): String;
function OctalToDecimal(Value: String): Int64;
function DecimalToBinary(Value: Int64): String;
function BinaryToDecimal(Value: String): Int64;

function FormatHexadecimal(Value: String; Spaces: Cardinal = 4): String;

implementation

function HexadecimalToDecimal(Value: string): Int64;
var
  i: Integer;
  HexValue: Int64;
begin
  Result := 0;
  for i := 1 to Length(Value) do
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
  i: Integer;
  OctValue: Int64;
begin
  Result := 0;
  for i := 1 to Length(Value) do
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
  i: Integer;
  BinValue: Int64;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    BinValue := StrToInt('$' + Value[i]);
    Result := Result * 2 + BinValue;
  end;
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

end.
