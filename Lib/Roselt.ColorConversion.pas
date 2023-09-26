// Note to self, look at https://github.com/mbirabhadra/ColorRecHelper/blob/master/ColorRecHelper.pas
unit Roselt.ColorConversion;

interface

uses
  System.Math,
  System.UITypes,
  System.UIConsts;

procedure RGBToXYZ(R, G, B: Byte; out X, Y, Z: Single); overload;
procedure RGBToXYZ(aColor: TAlphaColor; out X, Y, Z: Single); overload;

procedure RGBToYxy(R, G, B: Byte; out Y1, X, Y2: Single); overload;
procedure RGBToYxy(aColor: TAlphaColor; out Y1, X, Y2: Single); overload;

procedure RGBToHunterLab(R, G, B: Byte; out HunterL, Huntera, Hunterb: Single); overload;
procedure RGBToHunterLab(aColor: TAlphaColor; out HunterL, Huntera, Hunterb: Single); overload;

procedure RGBToCIELab(R, G, B: Byte; out CIEL, CIEa, CIEb: Single); overload;
procedure RGBToCIELab(aColor: TAlphaColor; out CIEL, CIEa, CIEb: Single); overload;

procedure RGBToHSV(R, G, B: Byte; out H, S, V: Single); overload;
procedure RGBToHSV(aColor: TAlphaColor; out H, S, V: Single); overload;

procedure RGBToCMYK(R, G, B: Byte; out C, M, Y, K: Single); overload;
procedure RGBToCMYK(aColor: TAlphaColor; out C, M, Y, K: Single); overload;

procedure RGBtoHSL(aColor: TAlphaColor; out H, S, L: Single);

procedure HSVToRGB(H, S, V: Double; out R, G, B: Byte);

procedure HSLtoRGB(H, S, L: Single; out R, G, B: Byte); overload;
procedure HSLtoRGB(H, S, L: Single; out aColor: TAlphaColor); overload;

procedure XYZtoRGB(X, Y, Z: Single; out R, G, B: Byte); overload;
procedure XYZtoRGB(X, Y, Z: Single; out aColor: TAlphaColor); overload;

procedure CMYKToRGB(C, M, Y, K: Single; out R, G, B: Byte);

implementation

procedure RGBToXYZ(R, G, B: Byte; out X, Y, Z: Single);
var
  var_R, var_G, var_B: Single;
  var_X, var_Y, var_Z: Single;
begin
  var_R := (R / 255); // R = From 0 to 255
  var_G := (G / 255); // G = From 0 to 255
  var_B := (B / 255); // B = From 0 to 255
  if (var_R > 0.04045) then
    var_R := Power(((var_R + 0.055) / 1.055), 2.4)
  else
    var_R := var_R / 12.92;
  if (var_G > 0.04045) then
    var_G := Power(((var_G + 0.055) / 1.055), 2.4)
  else
    var_G := var_G / 12.92;
  if (var_B > 0.04045) then
    var_B := Power(((var_B + 0.055) / 1.055), 2.4)
  else
    var_B := var_B / 12.92;
  var_R := var_R * 100;
  var_G := var_G * 100;
  var_B := var_B * 100;
  X := var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805;
  Y := var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722;
  Z := var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505;
end;

procedure RGBToXYZ(aColor: TAlphaColor; out X, Y, Z: Single);
var
  var_R, var_G, var_B: Single;
  var_X, var_Y, var_Z: Single;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  var_R := (R / 255); // R = From 0 to 255
  var_G := (G / 255); // G = From 0 to 255
  var_B := (B / 255); // B = From 0 to 255
  if (var_R > 0.04045) then
    var_R := Power(((var_R + 0.055) / 1.055), 2.4)
  else
    var_R := var_R / 12.92;
  if (var_G > 0.04045) then
    var_G := Power(((var_G + 0.055) / 1.055), 2.4)
  else
    var_G := var_G / 12.92;
  if (var_B > 0.04045) then
    var_B := Power(((var_B + 0.055) / 1.055), 2.4)
  else
    var_B := var_B / 12.92;
  var_R := var_R * 100;
  var_G := var_G * 100;
  var_B := var_B * 100;
  X := var_R * 0.4124 + var_G * 0.3576 + var_B * 0.1805;
  Y := var_R * 0.2126 + var_G * 0.7152 + var_B * 0.0722;
  Z := var_R * 0.0193 + var_G * 0.1192 + var_B * 0.9505;
end;

procedure RGBToYxy(R, G, B: Byte; out Y1, X, Y2: Single);
var
  var_X, var_Y, var_Z: Single;
begin
  RGBToXYZ(R, G, B, var_X, var_Y, var_Z); // You need to convert RGB to XYZ before you can convert it to Yxy

  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    X := 0;
    Y2 := 0;
  end
  else
  begin
    X := var_X / (var_X + var_Y + var_Z);
    Y2 := var_Y / (var_X + var_Y + var_Z);
  end;
  Y1 := var_Y;
end;

procedure RGBToYxy(aColor: TAlphaColor; out Y1, X, Y2: Single);
var
  var_X, var_Y, var_Z: Single;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  RGBToXYZ(R, G, B, var_X, var_Y, var_Z); // You need to convert RGB to XYZ before you can convert it to Yxy

  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    X := 0;
    Y2 := 0;
  end
  else
  begin
    X := var_X / (var_X + var_Y + var_Z);
    Y2 := var_Y / (var_X + var_Y + var_Z);
  end;
  Y1 := var_Y;
end;

procedure RGBToHunterLab(R, G, B: Byte; out HunterL, Huntera, Hunterb: Single);
var
  var_Ka, var_Kb: Single;
  var_X, var_Y, var_Z: Single;
  X, Y, Z: Single;
begin
  RGBToXYZ(R, G, B, X, Y, Z); // You need to convert RGB to XYZ before you can convert it to HunterLab
  var_X := 95.047;
  var_Y := 100.000;
  var_Z := 108.883;
  var_Ka := (175.0 / 198.04) * (var_Y + var_X);
  var_Kb := (70.0 / 218.11) * (var_Y + var_Z);
  HunterL := 100.0 * sqrt(Y / var_Y);
  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    Huntera := 0;
    Hunterb := 0;
  end
  else
  begin
    Huntera := var_Ka * (((X / var_X) - (Y / var_Y)) / sqrt(Y / var_Y));
    Hunterb := var_Kb * (((Y / var_Y) - (Z / var_Z)) / sqrt(Y / var_Y));
  end;
end;

procedure RGBToHunterLab(aColor: TAlphaColor; out HunterL, Huntera, Hunterb: Single);
var
  var_Ka, var_Kb: Single;
  var_X, var_Y, var_Z: Single;
  X, Y, Z: Single;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  RGBToXYZ(R, G, B, X, Y, Z); // You need to convert RGB to XYZ before you can convert it to HunterLab
  var_X := 95.047;
  var_Y := 100.000;
  var_Z := 108.883;
  var_Ka := (175.0 / 198.04) * (var_Y + var_X);
  var_Kb := (70.0 / 218.11) * (var_Y + var_Z);
  HunterL := 100.0 * sqrt(Y / var_Y);
  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    Huntera := 0;
    Hunterb := 0;
  end
  else
  begin
    Huntera := var_Ka * (((X / var_X) - (Y / var_Y)) / sqrt(Y / var_Y));
    Hunterb := var_Kb * (((Y / var_Y) - (Z / var_Z)) / sqrt(Y / var_Y));
  end;
end;

procedure RGBToCIELab(R, G, B: Byte; out CIEL, CIEa, CIEb: Single);
var
  var_X, var_Y, var_Z: Single;
  X, Y, Z: Single;
begin
  RGBToXYZ(R, G, B, X, Y, Z); // You need to convert RGB to XYZ before you can convert it to CIELab
  var_X := X / 95.047;
  var_Y := Y / 100.000;
  var_Z := Z / 108.883;
  if (var_X > 0.008856) then
    var_X := Power(var_X, (1 / 3))
  else
    var_X := (7.787 * var_X) + (16 / 116);
  if (var_Y > 0.008856) then
    var_Y := Power(var_Y, (1 / 3))
  else
    var_Y := (7.787 * var_Y) + (16 / 116);
  if (var_Z > 0.008856) then
    var_Z := Power(var_Z, (1 / 3))
  else
    var_Z := (7.787 * var_Z) + (16 / 116);
  CIEL := (116 * var_Y) - 16;
  CIEa := 500 * (var_X - var_Y);
  CIEb := 200 * (var_Y - var_Z);
end;

procedure RGBToCIELab(aColor: TAlphaColor; out CIEL, CIEa, CIEb: Single);
var
  var_X, var_Y, var_Z: Single;
  X, Y, Z: Single;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  RGBToXYZ(R, G, B, X, Y, Z); // You need to convert RGB to XYZ before you can convert it to CIELab
  var_X := X / 95.047;
  var_Y := Y / 100.000;
  var_Z := Z / 108.883;
  if (var_X > 0.008856) then
    var_X := Power(var_X, (1 / 3))
  else
    var_X := (7.787 * var_X) + (16 / 116);
  if (var_Y > 0.008856) then
    var_Y := Power(var_Y, (1 / 3))
  else
    var_Y := (7.787 * var_Y) + (16 / 116);
  if (var_Z > 0.008856) then
    var_Z := Power(var_Z, (1 / 3))
  else
    var_Z := (7.787 * var_Z) + (16 / 116);
  CIEL := (116 * var_Y) - 16;
  CIEa := 500 * (var_X - var_Y);
  CIEb := 200 * (var_Y - var_Z);
end;

procedure RGBToHSV(R, G, B: Byte; out H, S, V: Single);
var
  minRGB, maxRGB, delta: Double;
begin
  H := 0.0;
  minRGB := Min(Min(R, G), B);
  maxRGB := Max(Max(R, G), B);
  delta := (maxRGB - minRGB);
  V := maxRGB;
  if (maxRGB <> 0.0) then
    S := 255.0 * delta / maxRGB
  else
    S := 0.0;
  if (S <> 0.0) then
  begin
    if R = maxRGB then
      H := (G - B) / delta
    else
      if G = maxRGB then
        H := 2.0 + (B - R) / delta
      else
        if B = maxRGB then
          H := 4.0 + (R - G) / delta
  end
  else
    H := -1.0;
  H := H * 60;
  if H < 0.0 then
    H := H + 360.0;

  S := S * 100 / 255;
  V := B * 100 / 255;

  H := Round(H);
  S := Round(S);
  V := Round((maxRGB / 255) * 100);
end;

procedure RGBToHSV(aColor: TAlphaColor; out H, S, V: Single);
var
  minRGB, maxRGB, delta: Double;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  H := 0.0;
  minRGB := Min(Min(R, G), B);
  maxRGB := Max(Max(R, G), B);
  delta := (maxRGB - minRGB);
  V := maxRGB;
  if (maxRGB <> 0.0) then
    S := 255.0 * delta / maxRGB
  else
    S := 0.0;
  if (S <> 0.0) then
  begin
    if R = maxRGB then
      H := (G - B) / delta
    else
      if G = maxRGB then
        H := 2.0 + (B - R) / delta
      else
        if B = maxRGB then
          H := 4.0 + (R - G) / delta
  end
  else
    H := -1.0;
  H := H * 60;
  if H < 0.0 then
    H := H + 360.0;

  S := S * 100 / 255;
  V := B * 100 / 255;

  H := Round(H);
  S := Round(S);
  V := Round((maxRGB / 255) * 100);
end;

procedure RGBToCMYK(R, G, B: Byte; out C, M, Y, K: Single);
var
  cmykR, cmykG, cmykB: Single;
begin
  cmykR := R / 255;
  cmykG := G / 255;
  cmykB := B / 255;
  K := 1 - Max(cmykR, Max(cmykG, cmykB));
  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    C := 0;
    M := 0;
    Y := 0;
  end
  else
  begin
    C := (1 - cmykR - K) / (1 - K);
    M := (1 - cmykG - K) / (1 - K);
    Y := (1 - cmykB - K) / (1 - K);
  end;
end;

procedure RGBToCMYK(aColor: TAlphaColor; out C, M, Y, K: Single);
var
  cmykR, cmykG, cmykB: Single;
  R, G, B: Byte;
begin
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
  cmykR := R / 255;
  cmykG := G / 255;
  cmykB := B / 255;
  K := 1 - Max(cmykR, Max(cmykG, cmykB));
  if (R = 0) AND (G = 0) AND (B = 0) then
  begin
    C := 0;
    M := 0;
    Y := 0;
  end
  else
  begin
    C := (1 - cmykR - K) / (1 - K);
    M := (1 - cmykG - K) / (1 - K);
    Y := (1 - cmykB - K) / (1 - K);
  end;
end;

procedure RGBtoHSL(aColor: TAlphaColor; out H, S, L: Single);
begin
  System.UIConsts.RGBtoHSL(aColor,H,S,L);
end;

procedure HSVToRGB(H, S, V: Double; out R, G, B: Byte);
var
  i: Integer;
  f, p, q, t: Double;
  procedure CopyOutput(const RV, GV, BV: Double);
  const
    RGBmax = 255;
  begin
    R:= Round(RGBmax * RV);
    G:= Round(RGBmax * GV);
    B:= Round(RGBmax * BV);
  end;
begin
  Assert(InRange(H, 0.0, 1.0));
  Assert(InRange(S, 0.0, 1.0));
  Assert(InRange(V, 0.0, 1.0));
  if S = 0.0 then begin
    // achromatic (grey)
    CopyOutput(B, B, B);
//    Result:= True;    //If you want it to be a boolean returning function
    exit;
  end;
  H := H * 6.0; // sector 0 to 5
  i := floor(H);
  f := H - i; // fractional part of H
  p := V * (1.0 - S);
  q := V * (1.0 - S * f);
  t := V * (1.0 - S * (1.0 - f));
  case i of
    0: CopyOutput(V, t, p);
    1: CopyOutput(q, V, p);
    2: CopyOutput(p, V, t);
    3: CopyOutput(p, q, V);
    4: CopyOutput(t, p, V);
    else CopyOutput(V, p, q);
  end;
//    Result:= True;    //If you want it to be a boolean returning function
end;

procedure HSLtoRGB(H, S, L: Single; out R, G, B: Byte);
var
  aColor: TAlphaColor;
begin
  aColor := System.UIConsts.HSLtoRGB(H,S,L);
  R := TAlphaColorRec(aColor).R;
  G := TAlphaColorRec(aColor).G;
  B := TAlphaColorRec(aColor).B;
end;

procedure HSLtoRGB(H, S, L: Single; out aColor: TAlphaColor);
begin
  aColor := System.UIConsts.HSLtoRGB(H,S,L);
end;

procedure XYZtoRGB(X, Y, Z: Single; out R, G, B: Byte); // Haven't tested yet. Probably doesn't work 😁
begin
  R := Round((3.2404542*X) - (1.5371385*Y) - (0.4985314*Z));
  G := Round((-0.9692660*X) + (1.8760108*Y) + (0.0415560*Z));
  B := Round((0.0556434*X) - (0.2040259*Y) + (1.0572252*Z));
end;

procedure XYZtoRGB(X, Y, Z: Single; out aColor: TAlphaColor); // Haven't tested yet. Probably doesn't work 😁
var
  R, G, B: Byte;
begin
  R := Round((3.2404542*X) - (1.5371385*Y) - (0.4985314*Z));
  G := Round((-0.9692660*X) + (1.8760108*Y) + (0.0415560*Z));
  B := Round((0.0556434*X) - (0.2040259*Y) + (1.0572252*Z));
  aColor := MakeColor(R,G,B);
end;

procedure CMYKToRGB(C, M, Y, K: Single; out R, G, B: Byte);
begin
  R := Round(255 * ((1-C)*(1-K)));
  G := Round(255 * ((1-M)*(1-K)));
  B  := Round(255 * ((1-Y)*(1-K)));
end;

end.

