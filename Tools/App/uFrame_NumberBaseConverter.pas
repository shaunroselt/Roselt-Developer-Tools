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
  System.Skia,
  FMX.Skia,
  Roselt.NumberBaseConversion,
  Roselt.Utility;

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
    layDuodecimal: TLayout;
    lblDuodecimal: TLabel;
    edtDuodecimal: TEdit;
    edtDuodecimalCopyToClipboard: TEditButton;
    imgDuodecimalCopyToClipboard: TSkSvg;
    procedure CopyOutputToClipboard(Sender: TObject);
    procedure edtHexadecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtDecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtOctalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtBinaryKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure SwitchFormatValuesSwitch(Sender: TObject);
    procedure edtDuodecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
    procedure FormatValues(NotToFormat: TEdit = nil);
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_NumberBaseConverter.CopyOutputToClipboard(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
  ParentEdit: TEdit;
begin
  if (TControl(Sender).Parent) is TEdit then
    ParentEdit := TEdit(TControl(Sender).Parent) // I feel like this should be the Edit, but it's not. I am totally confused.
  else
    ParentEdit := TEdit(TControl(Sender).Parent.Parent); // Somehow going up two parents is the Edit. Wtf?

  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(ParentEdit.Text);
end;

procedure TFrame_NumberBaseConverter.edtBinaryKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var BinaryValue := RemoveNonBinaryDigits(edtBinary.Text);
  if (BinaryValue.Length <> 0) then
  begin
    if (BinaryValue.Replace('0','',[rfReplaceAll]).Length = 0) then
    begin
      edtHexadecimal.Text := '0';
      edtOctal.Text := '0';
      edtDecimal.Text := '0';
      edtDuodecimal.Text := '0';
    end else
    begin
      var DecimalValue := BinaryToDecimal(BinaryValue);
      var HexValue := DecimalValue.ToHexString;
      while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
      var OctalValue := DecimalToOctal(DecimalValue);
      var DuodecimalValue := DecimalToDuodecimal(DecimalValue);

      edtDuodecimal.Text := DuodecimalValue;
      edtHexadecimal.Text := HexValue;
      edtOctal.Text := OctalValue;
      edtDecimal.Text := DecimalValue.ToString;

      FormatValues(TEdit(Sender));
    end;
  end else
  begin
    edtHexadecimal.Text := '';
    edtOctal.Text := '';
    edtDecimal.Text := '';
    edtDuodecimal.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.edtDecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var DecimalValue := RemoveNonDecimalDigits(edtDecimal.Text);
  if (DecimalValue.Length <> 0) then
  begin
    if (DecimalValue.ToInt64 = 0) then
    begin
      edtHexadecimal.Text := '0';
      edtOctal.Text := '0';
      edtBinary.Text := '0';
      edtDuodecimal.Text := '0';
    end else
    begin
      var HexValue := DecimalValue.ToInt64.ToHexString;
      while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
      var OctalValue := DecimalToOctal(DecimalValue.ToInt64);
      var BinaryValue := DecimalToBinary(DecimalValue.ToInt64);
      var DuodecimalValue := DecimalToDuodecimal(DecimalValue.ToInt64);

      edtDuodecimal.Text := DuodecimalValue;
      edtHexadecimal.Text := HexValue;
      edtOctal.Text := OctalValue;
      edtBinary.Text := BinaryValue;

      FormatValues(TEdit(Sender));
    end;
  end else
  begin
    edtHexadecimal.Text := '';
    edtOctal.Text := '';
    edtBinary.Text := '';
    edtDuodecimal.Text := '0';
  end;
end;

procedure TFrame_NumberBaseConverter.edtDuodecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var DuodecimalValue := RemoveNonDuodecimalDigits(edtDuodecimal.Text);
  if (DuodecimalValue.Length <> 0) then
  begin
    var DecimalValue := DuodecimalToDecimal(DuodecimalValue);
    var HexValue := DecimalValue.ToHexString;
    while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
    var OctalValue := DecimalToOctal(DecimalValue);
    var BinaryValue := DecimalToBinary(DecimalValue);

    edtDecimal.Text := DecimalValue.ToString;
    edtHexadecimal.Text := HexValue;
    edtOctal.Text := OctalValue;
    edtBinary.Text := BinaryValue;

    FormatValues(TEdit(Sender));
  end else
  begin
    edtHexadecimal.Text := '';
    edtOctal.Text := '';
    edtBinary.Text := '';
    edtDecimal.Text := '0';
  end;
end;

procedure TFrame_NumberBaseConverter.edtHexadecimalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var HexString := RemoveNonHexadecimalCharacters(edtHexadecimal.Text);
  if (HexString.Length <> 0) then
  begin
    var DecimalValue := HexadecimalToDecimal(HexString);
    var OctalValue := DecimalToOctal(DecimalValue);
    var BinaryValue := DecimalToBinary(DecimalValue);
    var DuodecimalValue := DecimalToDuodecimal(DecimalValue);

    edtDuodecimal.Text := DuodecimalValue;
    edtDecimal.Text := DecimalValue.ToString;
    edtOctal.Text := OctalValue;
    edtBinary.Text := BinaryValue;

    FormatValues(TEdit(Sender));
  end else
  begin
    edtDecimal.Text := '';
    edtOctal.Text := '';
    edtBinary.Text := '';
    edtDuodecimal.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.edtOctalKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  var OctalValue := RemoveNonDigits(edtOctal.Text);
  if (OctalValue.Length <> 0) then
  begin
    if (OctalValue.ToInt64 = 0) then
    begin
      edtHexadecimal.Text := '0';
      edtDecimal.Text := '0';
      edtBinary.Text := '0';
      edtDuodecimal.Text := '0';
    end else
    begin
      var DecimalValue := OctalToDecimal(OctalValue);
      var HexValue := DecimalValue.ToHexString;
      while HexValue[1] = '0' do HexValue := HexValue.Remove(0,1);
      var BinaryValue := DecimalToBinary(DecimalValue);
      var DuodecimalValue := DecimalToDuodecimal(DecimalValue);

      edtDuodecimal.Text := DuodecimalValue;
      edtHexadecimal.Text := HexValue;
      edtDecimal.Text := DecimalValue.ToString;
      edtBinary.Text := BinaryValue;

      FormatValues(TEdit(Sender));
    end;
  end else
  begin
    edtHexadecimal.Text := '';
    edtDecimal.Text := '';
    edtBinary.Text := '';
    edtDuodecimal.Text := '';
  end;
end;

procedure TFrame_NumberBaseConverter.FormatValues(NotToFormat: TEdit);
begin
  if (SwitchFormatValues.IsChecked) then
  begin
    if (NotToFormat <> edtHexadecimal) then edtHexadecimal.Text := FormatNumberString(edtHexadecimal.Text,4);
    if (NotToFormat <> edtDecimal) then edtDecimal.Text := FormatNumberString(edtDecimal.Text,3);
    if (NotToFormat <> edtDuodecimal) then edtDuodecimal.Text := FormatNumberString(edtDuodecimal.Text,4);
    if (NotToFormat <> edtOctal) then edtOctal.Text := FormatNumberString(edtOctal.Text,3);
    if (NotToFormat <> edtBinary) then edtBinary.Text := FormatNumberString(edtBinary.Text,4);
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
