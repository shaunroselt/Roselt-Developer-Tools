unit uFrame_PasswordGenerator;

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
    FMX.Controls.Presentation, 
    FMX.ScrollBox, 
    FMX.Memo,
    FMX.Edit, 
    FMX.EditBox, 
    FMX.SpinBox, 
    FMX.ListBox, 
    FMX.Layouts,
    FMX.Objects, 
    
    Skia,
    Skia.FMX;

type
TFrame_PasswordGenerator = class(TFrame)
    Memo1: TMemo;
    sbMaxLength: TSpinBox;
    sbMaxAmount: TSpinBox;
    SpecialSwitch: TSwitch;
    cbLetterCase: TComboBox;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
public
    constructor Create(AOwner: TComponent); override;
    function GeneratePassword(len: Integer): string;
end;

implementation

{$R *.fmx}

procedure TFrame_PasswordGenerator.btnOutputCopyToClipboardClick(
  Sender: TObject);
begin
    Memo1.CopyToClipboard;
end;

procedure TFrame_PasswordGenerator.btnRefreshClick(Sender: TObject);
var
    Value : string;
    i : integer;
begin
    Memo1.Text := '';
    for I := 1 to StrToInt(sbMaxAmount.Text) do
        Memo1.Lines.Add(GeneratePassword(StrToInt((sbMaxLength.Text))));
end;

constructor TFrame_PasswordGenerator.Create(AOwner: TComponent);
begin
inherited;
// additional initialization code here
end;

function TFrame_PasswordGenerator.GeneratePassword(len: Integer): string;
var
    i: Integer;
    charSet: string;
begin
    if SpecialSwitch.IsChecked then
        charset := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-='
    else
        charSet := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Randomize;
    Result := '';
    for i := 1 to len do
        Result := Result + charSet[Random(Length(charSet)) + 1];

    case cbLetterCase.ItemIndex of
        0: Result := Result;
        1: Result :=  UpperCase(Result);
        2: Result := LowerCase(Result);

    end;

    Result := Result;
end;

end.
