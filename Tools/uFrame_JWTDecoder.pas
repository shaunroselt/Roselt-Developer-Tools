unit uFrame_JWTDecoder;

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
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_JWTDecoder = class(TFrame)
    layBottom: TLayout;
    layHeader: TLayout;
    memTitleHeader: TLabel;
    memHeader: TMemo;
    layPayload: TLayout;
    memTitlePayload: TLabel;
    memPayload: TMemo;
    layTop: TLayout;
    layJWTToken: TLayout;
    lblJWTToken: TLabel;
    memJWTToken: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
