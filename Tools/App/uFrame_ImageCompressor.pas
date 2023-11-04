unit uFrame_ImageCompressor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Objects, FMX.Skia, FMX.Controls.Presentation, FMX.ExtCtrls,
  FMX.Layouts, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Edit;

type
  TFrame_ImageCompressor = class(TFrame)
    lblOriginal: TLabel;
    imgInput: TImage;
    lblCompressed: TLabel;
    imgOutput: TImage;
    lblControlPanel: TLabel;
    pnlControlPanel: TPanel;
    lblMaxSize: TLabel;
    edtMaxSize: TEdit;
    lblCompressionAmount: TLabel;
    tbCompressionAmount: TTrackBar;
    btnLoad: TButton;
    btnSave: TButton;
    svgLoad: TSkSvg;
    lblLoad: TLabel;
    svgSave: TSkSvg;
    lblSave: TLabel;
    odLoad: TOpenDialog;
    sdSave: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}




end.
