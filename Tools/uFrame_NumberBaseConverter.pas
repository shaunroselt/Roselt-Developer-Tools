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
  FMX.Controls.Presentation,
  FMX.Layouts;

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
    imgFormatValues: TImage;
    layFormatValuesTitleDescription: TLayout;
    lblFormatValuesTitle: TLabel;
    lblFormatValuesDescription: TLabel;
    SwitchFormatValues: TSwitch;
    lblFormatValues: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
