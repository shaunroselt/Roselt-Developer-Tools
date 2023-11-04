unit uFrame_ImageConverter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Skia, FMX.Skia, FMX.ListBox, FMX.ExtCtrls,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Objects;

type
  TFrame_ImageConverter = class(TFrame)
    odLoad: TOpenDialog;
    pnlContainer: TPanel;
    DropTarget1: TDropTarget;
    lblOrignal: TLabel;
    sdSave: TSaveDialog;
    pnMaster: TPanel;
    pnlChild: TPanel;
    lblProperties: TLabel;
    Memo1: TMemo;
    pnSlave: TPanel;
    btnSave: TButton;
    lblConvert: TLabel;
    ComboBox1: TComboBox;
    lblOutput: TLabel;
    imgInput: TImage;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
