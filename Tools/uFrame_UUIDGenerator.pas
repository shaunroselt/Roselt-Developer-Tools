unit uFrame_UUIDGenerator;

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
  FMX.Memo.Types,
  FMX.ListBox,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_UUIDGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layLetterCase: TRectangle;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    SwitchLetterCase: TSwitch;
    lblSwitchLetterCase: TLabel;
    layUUIDVersion: TRectangle;
    imgUUIDVersion: TImage;
    cbUUIDVersion: TComboBox;
    layUUIDVersionTitleDescription: TLayout;
    lblUUIDVersionTitle: TLabel;
    lblUUIDVersionDescription: TLabel;
    layHyphens: TRectangle;
    layHyphensTitleDescription: TLayout;
    lblHyphensTitle: TLabel;
    lblHyphensDescription: TLabel;
    SwitchHyphens: TSwitch;
    lblSwitchHyphens: TLabel;
    imgHyphens: TImage;
    imgLetterCase: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
