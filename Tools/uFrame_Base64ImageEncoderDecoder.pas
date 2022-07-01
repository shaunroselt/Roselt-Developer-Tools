unit uFrame_Base64ImageEncoderDecoder;

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
  FMX.ExtCtrls,
  FMX.Memo.Types,
  FMX.Objects,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_Base64ImageEncoderDecoder = class(TFrame)
    layContainer: TLayout;
    layBase64: TLayout;
    memTitleBase64: TLabel;
    memBase64: TMemo;
    layImage: TLayout;
    lblImage: TLabel;
    Splitter: TSplitter;
    DropImage: TDropTarget;
    imgImage: TImage;
    btnDropImage: TButton;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_Base64ImageEncoderDecoder.FrameResize(Sender: TObject);
begin
  layBase64.Width := (layContainer.Width - layContainer.Padding.Left - layContainer.Padding.Right - Splitter.Width) / 2;
end;

end.
