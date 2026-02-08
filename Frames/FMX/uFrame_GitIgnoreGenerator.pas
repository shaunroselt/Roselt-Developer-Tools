unit uFrame_GitIgnoreGenerator;

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
  FMX.ListBox,
  FMX.Layouts,
  FMX.Objects,

  System.Skia,
  FMX.Skia,

  Roselt.Clipboard,
  Roselt.GitIgnoreGenerator;

type
  TFrame_GitIgnoreGenerator = class(TFrame)
    layBottom: TLayout;
    memTitleOutput: TLabel;
    btnOutputCopyToClipboard: TButton;
    imgOutputCopyToClipboard: TSkSvg;
    lblOutputCopyToClipboard: TLabel;
    memOutput: TMemo;
    layTop: TLayout;
    lblConfiguration: TLabel;
    layTemplate: TRectangle;
    imgTemplate: TSkSvg;
    layTemplateTitleDescription: TLayout;
    lblTemplateTitle: TLabel;
    lblTemplateDescription: TLabel;
    cbTemplate: TComboBox;
    layCategory: TRectangle;
    imgCategory: TSkSvg;
    layCategoryTitleDescription: TLayout;
    lblCategoryTitle: TLabel;
    lblCategoryDescription: TLabel;
    cbCategory: TComboBox;
    procedure cbCategoryChange(Sender: TObject);
    procedure cbTemplateChange(Sender: TObject);
    procedure btnOutputCopyToClipboardClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadCategories;
    procedure LoadTemplatesByCategory(const ACategory: String);
    procedure GenerateGitIgnore;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

constructor TFrame_GitIgnoreGenerator.Create(AOwner: TComponent);
begin
  inherited;
  LoadCategories;
end;

procedure TFrame_GitIgnoreGenerator.LoadCategories;
var
  Categories: TArray<String>;
  Category: String;
begin
  cbCategory.Clear;
  Categories := GetTemplateCategories;
  for Category in Categories do
    cbCategory.Items.Add(Category);
  
  if cbCategory.Items.Count > 0 then
  begin
    cbCategory.ItemIndex := 0;
    LoadTemplatesByCategory(cbCategory.Items[0]);
  end;
end;

procedure TFrame_GitIgnoreGenerator.LoadTemplatesByCategory(const ACategory: String);
var
  Templates: TArray<TGitIgnoreTemplate>;
  Template: TGitIgnoreTemplate;
begin
  cbTemplate.Clear;
  Templates := GetTemplatesByCategory(ACategory);
  for Template in Templates do
    cbTemplate.Items.Add(Template.Name);
  
  if cbTemplate.Items.Count > 0 then
  begin
    cbTemplate.ItemIndex := 0;
    GenerateGitIgnore;
  end;
end;

procedure TFrame_GitIgnoreGenerator.GenerateGitIgnore;
var
  TemplateName: String;
  Content: String;
begin
  if cbTemplate.ItemIndex >= 0 then
  begin
    TemplateName := cbTemplate.Items[cbTemplate.ItemIndex];
    Content := GetGitIgnoreTemplateByName(TemplateName);
    memOutput.Text := Content;
  end
  else
    memOutput.Text := '';
end;

procedure TFrame_GitIgnoreGenerator.cbCategoryChange(Sender: TObject);
begin
  if cbCategory.ItemIndex >= 0 then
    LoadTemplatesByCategory(cbCategory.Items[cbCategory.ItemIndex]);
end;

procedure TFrame_GitIgnoreGenerator.cbTemplateChange(Sender: TObject);
begin
  GenerateGitIgnore;
end;

procedure TFrame_GitIgnoreGenerator.btnOutputCopyToClipboardClick(Sender: TObject);
begin
  CopyToClipboard(memOutput.Text);
end;

end.
