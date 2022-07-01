unit uFrame_TimestampConverter;

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
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.SpinBox,
  FMX.EditBox,
  FMX.Objects;

type
  TFrame_TimestampConverter = class(TFrame)
    layUnixTimestamp: TLayout;
    lblUnixTimestamp: TLabel;
    sbUnixTimestamp: TSpinBox;
    layYear: TLayout;
    lblYear: TLabel;
    sbYear: TSpinBox;
    layDateTime: TGridLayout;
    layMonth: TLayout;
    lblMonth: TLabel;
    sbMonth: TSpinBox;
    layDay: TLayout;
    lblDay: TLabel;
    sbDay: TSpinBox;
    layHours: TLayout;
    lblHours: TLabel;
    sbHours: TSpinBox;
    layMinutes: TLayout;
    lblMinutes: TLabel;
    sbMinutes: TSpinBox;
    laySeconds: TLayout;
    lblSeconds: TLabel;
    sbSeconds: TSpinBox;
    layTextCaseConverterInspectorInspect: TLayout;
    lblResults: TLabel;
    layResults: TRectangle;
    lblDontKnowYetTitle: TLabel;
    layIDontKnowYet: TLayout;
    lblDontKnowYet: TLabel;
    lblDontKnowYetValue: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
