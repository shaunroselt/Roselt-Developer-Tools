unit uFrame_NumberBaseConverter;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Edit,
  FMX.Platform,
  FMX.Controls.Presentation,
  FMX.Layouts,
  Skia,
  Skia.FMX,
  Roselt.NumberBaseConversion;

type
  TFrame_NumberBaseConverter = class(TFrame)
    layBottom: TLayout;
    layHexadecimal: TLayout;
    lblHexadecimal: TLabel;
    edtHexadecimal: TEdit;
    edtHexadecimalCopyToClipboard: TEditButton;
    layDecimal: TLayout;
    lblDecimal: TLabel;
    edtDecimal: TEdit;
    edtDecimalCopyToClipboard: TEditButton;
    layOctal: TLayout;
    lblOctal: TLabel;
    edtOctal: TEdit;
    edtOctalCopyToClipboard: TEditButton;
    layBinary: TLayout;
    lblBinary: TLabel;
    edtBinary: TEdit;
    edtBinaryCopyToClipboard: TEditButton;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layFormatValues: TRectangle;
    imgFormatValues: TSkSvg;
    layFormatValuesTitleDescription: TLayout;
    lblFormatValuesTitle: TLabel;
    lblFormatValuesDescription: TLabel;
    SwitchFormatValues: TSwitch;
    lblSwitchFormatValues: TLabel;
    imgHexadecimalCopyToClipboard: TSkSvg;
    imgDecimalCopyToClipboard: TSkSvg;
    imgOctalCopyToClipboard: TSkSvg;
    imgBinaryCopyToClipboard: TSkSvg;
    procedure CopyOutputToClipboard(Sender: TObject);
    procedure edtHexadecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtDecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtOctalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBinaryKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure SwitchFormatValuesSwitch(Sender: TObject);
  private
    { Private declarations }
    procedure FormatValues;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_NumberBaseConverter.CopyOutputToClipboard(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(TEdit(TControl(Sender).ParentControl).Text);
end;

procedure TFrame_NumberBaseConverter.edtBinaryKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var BinaryValue := Trim(edtBinary.Text);
  if (BinaryValue.Length <> 0) then
  begin
    var DecimalValue := BinaryToDecimal(BinaryValue);
    var HexValue := DecimalValue.ToHexString;
    while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
    var OctalValue := DecimalToOctal(DecimalValue);

    edtHexadecimal.Text := HexValue;
    edtOctal.Text := OctalValue;
    edtDecimal.Text := DecimalValue.ToString;

    FormatValues;
  end else
  begin
    edtHexadecimal.Text := '';
    edtOctal.Text := '';
    edtDecimal.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.edtDecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var DecimalValue := Trim(edtDecimal.Text);
  if (DecimalValue.Length <> 0) then
  begin
    var HexValue := DecimalValue.ToInt64.ToHexString;
    while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
    var OctalValue := DecimalToOctal(DecimalValue.ToInt64);
    var BinaryValue := DecimalToBinary(DecimalValue.ToInt64);

    edtHexadecimal.Text := HexValue;
    edtOctal.Text := OctalValue;
    edtBinary.Text := BinaryValue;

    FormatValues;
  end else
  begin
    edtHexadecimal.Text := '';
    edtOctal.Text := '';
    edtBinary.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.edtHexadecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var HexString := Trim(edtHexadecimal.Text);
  if (HexString.Length <> 0) then
  begin
    var DecimalValue := HexadecimalToDecimal(HexString);
    var OctalValue := DecimalToOctal(DecimalValue);
    var BinaryValue := DecimalToBinary(DecimalValue);

    edtDecimal.Text := DecimalValue.ToString;
    edtOctal.Text := OctalValue;
    edtBinary.Text := BinaryValue;

    FormatValues;
  end else
  begin
    edtDecimal.Text := '';
    edtOctal.Text := '';
    edtBinary.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.edtOctalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var OctalValue := Trim(edtOctal.Text);
  if (OctalValue.Length <> 0) then
  begin
    var DecimalValue := OctalToDecimal(OctalValue);
    var HexValue := DecimalValue.ToHexString;
    while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
    var BinaryValue := DecimalToBinary(DecimalValue);

    edtHexadecimal.Text := HexValue;
    edtDecimal.Text := DecimalValue.ToString;
    edtBinary.Text := BinaryValue;

    FormatValues;
  end else
  begin
    edtHexadecimal.Text := '';
    edtDecimal.Text := '';
    edtBinary.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.FormatValues;
begin
  if (SwitchFormatValues.IsChecked) then
  begin
//    var TempString := '';
//    var TempRemainder := edtHexadecimal.Text.Length mod 4;
//    for var I := 1 to edtHexadecimal.Text.Length do
//    begin
//      TempString := TempString + edtHexadecimal.Text[I];
//      if (I = TempRemainder) then TempString := TempString + ' ';
//    end;

    lblHexadecimal.Text := FormatHexadecimal(edtHexadecimal.Text,2);
    lblDecimal.Text := FormatHexadecimal(edtHexadecimal.Text,4);

  end else
  begin

  end;
end;

procedure TFrame_NumberBaseConverter.SwitchFormatValuesSwitch(Sender: TObject);
begin
  if (lblSwitchFormatValues.Text = 'On') then
  begin
    lblSwitchFormatValues.Text := 'Off';
    SwitchFormatValues.IsChecked := False;
  end else
  begin
    lblSwitchFormatValues.Text := 'On';
    SwitchFormatValues.IsChecked := True;
  end;

  FormatValues;
end;

end.