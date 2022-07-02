unit uFrame_HashGenerator;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Hash,
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
  FMX.Platform,
  FMX.Memo,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrame_HashGenerator = class(TFrame)
    layBottom: TLayout;
    layHashGeneratorOutputMD5: TLayout;
    lblHashGeneratorOutputMD5: TLabel;
    edtHashGeneratorOutputMD5: TEdit;
    edtHashGeneratorOutputMD5CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA1: TLayout;
    lblHashGeneratorOutputSHA1: TLabel;
    edtHashGeneratorOutputSHA1: TEdit;
    edtHashGeneratorOutputSHA1CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA256: TLayout;
    lblHashGeneratorOutputSHA256: TLabel;
    edtHashGeneratorOutputSHA256: TEdit;
    edtHashGeneratorOutputSHA256CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA512: TLayout;
    lblHashGeneratorOutputSHA512: TLabel;
    edtHashGeneratorOutputSHA512: TEdit;
    edtHashGeneratorOutputSHA512CopyToClipboard: TEditButton;
    memTitleInput: TLabel;
    memInput: TMemo;
    layHashGeneratorOutputSHA384: TLayout;
    lblHashGeneratorOutputSHA384: TLabel;
    edtHashGeneratorOutputSHA384: TEdit;
    edtHashGeneratorOutputSHA384CopyToClipboard: TEditButton;
    layHashGeneratorOutputSHA224: TLayout;
    lblHashGeneratorOutputSHA224: TLabel;
    edtHashGeneratorOutputSHA224: TEdit;
    edtHashGeneratorOutputSHA224CopyToClipboard: TEditButton;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layLetterCase: TRectangle;
    imgLetterCase: TImage;
    layLetterCaseTitleDescription: TLayout;
    lblLetterCaseTitle: TLabel;
    lblLetterCaseDescription: TLabel;
    SwitchLetterCase: TSwitch;
    lblSwitchLetterCase: TLabel;
    layOutputType: TRectangle;
    imgOutputType: TImage;
    cbOutputType: TComboBox;
    layOutputTypeTitleDescription: TLayout;
    lblOutputTypeTitle: TLabel;
    lblOutputTypeDescription: TLabel;
    imgHashGeneratorOutputSHA512CopyToClipboard: TImage;
    imgHashGeneratorOutputSHA384CopyToClipboard: TImage;
    imgHashGeneratorOutputSHA256CopyToClipboard: TImage;
    imgHashGeneratorOutputSHA224CopyToClipboard: TImage;
    imgHashGeneratorOutputSHA1CopyToClipboard: TImage;
    imgHashGeneratorOutputMD5CopyToClipboard: TImage;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TImage;
    lblInputPasteFromClipboard: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TImage;
    lblInputCopyToClipboard: TLabel;
    procedure SwitchLetterCaseSwitch(Sender: TObject);
    procedure memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure cbOutputTypeChange(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure CopyOutputToClipboard(Sender: TObject);
    procedure memInputChange(Sender: TObject);
  private
    { Private declarations }
    procedure HashGenerator();
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_HashGenerator.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(memInput.Text);
end;

procedure TFrame_HashGenerator.btnInputPasteFromClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    memInput.Text := ClipboardService.GetClipboard.ToString;
end;

procedure TFrame_HashGenerator.cbOutputTypeChange(Sender: TObject);
begin
  // Base64 Encoding is not yet implemented
  if (cbOutputType.Selected.Text = 'Base64') then
    SwitchLetterCase.Enabled := FALSE
  else
    SwitchLetterCase.Enabled := TRUE;

  HashGenerator();
end;

procedure TFrame_HashGenerator.CopyOutputToClipboard(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(TEdit(TControl(Sender).ParentControl).Text);
end;

procedure TFrame_HashGenerator.HashGenerator;
begin
  var TextToHash := memInput.Text;
  edtHashGeneratorOutputMD5.Text := THashMD5.GetHashString(TextToHash);
  edtHashGeneratorOutputSHA1.Text := THashSHA1.GetHashString(TextToHash);
  edtHashGeneratorOutputSHA224.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA224);
  edtHashGeneratorOutputSHA256.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA256);
  edtHashGeneratorOutputSHA384.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA384);
  edtHashGeneratorOutputSHA512.Text := THashSHA2.GetHashString(TextToHash,THashSHA2.TSHA2Version.SHA512);
  // Need to add THashSHA2.TSHA2Version.SHA512_224 and THashSHA2.TSHA2Version.SHA512_256



  if (SwitchLetterCase.IsChecked) then
  begin
    edtHashGeneratorOutputMD5.Text := edtHashGeneratorOutputMD5.Text.ToUpper;
    edtHashGeneratorOutputSHA1.Text := edtHashGeneratorOutputSHA1.Text.ToUpper;
    edtHashGeneratorOutputSHA224.Text := edtHashGeneratorOutputSHA224.Text.ToUpper;
    edtHashGeneratorOutputSHA256.Text := edtHashGeneratorOutputSHA256.Text.ToUpper;
    edtHashGeneratorOutputSHA384.Text := edtHashGeneratorOutputSHA384.Text.ToUpper;
    edtHashGeneratorOutputSHA512.Text := edtHashGeneratorOutputSHA512.Text.ToUpper;
  end;


  // Need to implement Base64 Encoding

end;

procedure TFrame_HashGenerator.memInputChange(Sender: TObject);
begin
  HashGenerator();
end;

procedure TFrame_HashGenerator.memInputKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  HashGenerator();
end;

procedure TFrame_HashGenerator.SwitchLetterCaseSwitch(Sender: TObject);
begin
  if (lblSwitchLetterCase.Text = 'Lowercase') then
  begin
    lblSwitchLetterCase.Text := 'Uppercase';
    SwitchLetterCase.IsChecked := True;
  end else
  begin
    lblSwitchLetterCase.Text := 'Lowercase';
    SwitchLetterCase.IsChecked := False;
  end;
  HashGenerator();
end;

end.
