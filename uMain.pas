{ TODO: Finish everything 😂 }
unit uMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.IOUtils,
  System.Variants,
  System.ImageList,
  System.DateUtils,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.MultiView,
  FMX.Objects,
  FMX.ImgList,
  FMX.Ani, 
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.ListBox,
  FMX.Edit,
  FMX.SearchBox,
  FMX.TabControl,
  FMX.Printer,
  FMX.EditBox,
  FMX.SpinBox,

  Roselt.Tools,
  Roselt.Utility,

  uStyles,
  uBootstrapIcons,

  uFrame_Base64TextEncoderDecoder,
  uFrame_JsonYamlConverter,
  uFrame_HashGenerator,
  uFrame_HTMLEncoderDecoder,
  uFrame_JsonFormatter,
  uFrame_LoremIpsumGenerator,
  uFrame_TextCaseConverterInspector,
  uFrame_ColorPicker,
  uFrame_ImageEffects,
  uFrame_TimestampConverter,
  uFrame_NumberBaseConverter,
  uFrame_URLEncoderDecoder,
  uFrame_GZipCompressDecompress,
  uFrame_JWTDecoder,
  uFrame_Base64ImageEncoderDecoder,
  uFrame_DelphiFormatter,
  uFrame_SQLFormatter,
  uFrame_HTMLFormatter,
  uFrame_CSSFormatter,
  uFrame_PHPFormatter,
  uFrame_XMLFormatter,
  uFrame_JavaScriptFormatter,
  uFrame_UUIDGenerator,
  uFrame_JWTTokenGenerator,
  uFrame_PasswordGenerator,
  uFrame_TextEscapeUnescape,
  uFrame_MarkdownPreview,
  uFrame_HTMLPreview,
  uFrame_RegexTester,
  uFrame_NameGenerator,
  uFrame_TextToArray,
  uFrame_PingIPDomain,

  System.Skia,
  FMX.Skia;

type
  TfrmMain = class(TForm)
    MultiView: TMultiView;
    TopBar: TRectangle;
    lblNavTitle: TLabel;
    btnHamburger: TButton;
    layAllTools: TScrollBox;
    layNavAllTools: TLayout;
    imgAllTools: TSkSvg;
    lblAllTools: TLabel;
    btnAllTools: TRectangle;
    LayoutContainer: TLayout;
    layAllToolsGrid: TFlowLayout;
    MultiViewScrollBox: TVertScrollBox;
    layNavTesting: TLayout;
    btnTesting: TRectangle;
    imgTesting: TSkSvg;
    lblTesting: TLabel;
    layTesting: TLayout;
    Label41: TLabel;
    memTesting: TMemo;
    layNavSettings: TLayout;
    btnSettings: TRectangle;
    imgSettings: TSkSvg;
    lblSettings: TLabel;
    layNavTestingMore: TLayout;
    layNavTestingMoreExpandCollapse: TLayout;
    btnTestingMoreExpandCollapse: TRectangle;
    imgTestingMoreMoreExpandCollapse: TSkSvg;
    lblTestingMoreExpandCollapse: TLabel;
    imgConvertersExpandCollapseIcon: TSkSvg;
    layNavTesting1: TLayout;
    btnTesting1: TRectangle;
    imgTesting1: TSkSvg;
    lblTesting1: TLabel;
    layNavTesting3: TLayout;
    btnTesting3: TRectangle;
    imgTesting3: TSkSvg;
    lblTesting3: TLabel;
    layNavTesting2: TLayout;
    btnTesting2: TRectangle;
    imgTesting2: TSkSvg;
    lblTesting2: TLabel;
    SplitterNavContent: TSplitter;
    btnToolHelp: TButton;
    laySettings: TScrollBox;
    layFontFamily: TRectangle;
    cbFontFamily: TComboBox;
    imgFontFamily: TSkSvg;
    layFontFamilyTitleDescription: TLayout;
    lblFontFamilyTitle: TLabel;
    lblFontFamilyDescription: TLabel;
    layLanguage: TRectangle;
    cbLanguage: TComboBox;
    imgLanguage: TSkSvg;
    layLanguageTitleDescription: TLayout;
    lblLanguageTitle: TLabel;
    lblLanguageDescription: TLabel;
    layLineNumbers: TRectangle;
    imgLineNumbers: TSkSvg;
    layLineNumbersTitleDescription: TLayout;
    lblLineNumbersTitle: TLabel;
    lblLineNumbersDescription: TLabel;
    SwitchLineNumbers: TSwitch;
    lblSwitchLineNumbers: TLabel;
    layTheme: TRectangle;
    cbTheme: TComboBox;
    imgTheme: TSkSvg;
    layThemeTitleDescription: TLayout;
    lblThemeTitle: TLabel;
    lblThemeDescription: TLabel;
    layWordWrap: TRectangle;
    imgWordWrap: TSkSvg;
    layWordWrapTitleDescription: TLayout;
    lblWordWrapTitle: TLabel;
    lblWordWrapDescription: TLabel;
    SwitchWordWrap: TSwitch;
    lblSwitchWordWrap: TLabel;
    lblTopSettings: TLabel;
    layAppInfo: TRectangle;
    imgAppInfo: TImage;
    layAppInfoTitleDescription: TLayout;
    lblAppInfoTitle: TLabel;
    lblAppInfoDescription: TLabel;
    btnAppInfoCopyToClipboard: TButton;
    imgAppInfoCopyToClipboard: TSkSvg;
    layUsefulLinks: TRectangle;
    layUsefulLinksTitle: TLayout;
    Image1: TSkSvg;
    Label1: TLabel;
    laySourceCodeLink: TLayout;
    layMicrosoftStoreLink: TLayout;
    Label3: TLabel;
    Image3: TSkSvg;
    laySteamLink: TLayout;
    Button14: TButton;
    imgToolHelp: TSkSvg;
    layAllToolsHidden: TFlowLayout;
    edtSearchAllTools: TEdit;
    SearchEditButton1: TSearchEditButton;
    btnAllToolsTesting: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Rectangle2: TRectangle;
    SkSvg2: TSkSvg;
    layStuffThatwillNeverShow: TLayout;
    btnChangeLog: TButton;
    imgChangeLog: TSkSvg;
    layChangeLog: TScrollBox;
    layMemoChangeLog: TRectangle;
    lblChangeLog: TLabel;
    memChangeLog: TMemo;
    btnSteamLink: TRectangle;
    Image5: TSkSvg;
    Label4: TLabel;
    btnSourceCodeLink: TRectangle;
    Image2: TSkSvg;
    Label2: TLabel;
    procedure btnAllToolsMouseEnter(Sender: TObject);
    procedure btnAllToolsMouseLeave(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnAllToolsSearchClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
    procedure btnToolHelpClick(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure SwitchWordWrapSwitch(Sender: TObject);
    procedure SwitchLineNumbersSwitch(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure AllToolsButtonClick(Sender: TObject);
    procedure edtSearchAllToolsKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSearchAllToolsChange(Sender: TObject);
    procedure btnChangeLogClick(Sender: TObject);
    procedure btnSteamLinkClick(Sender: TObject);
    procedure btnSourceCodeLinkClick(Sender: TObject);
    procedure btnSettingsMouseEnter(Sender: TObject);
  private
    { Private declarations }
    HamburgerMenuWidth: Single;
    procedure SelectTool(ToolLayoutName: String);
    function GetAppInfo(): String;
    procedure AllToolsSearch();
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnHamburgerClick(Sender: TObject);
begin
  if (MultiView.Width = 50) then
  begin
    MultiView.Width := HamburgerMenuWidth;
    for var Tool in RoseltToolsArray do
      if IsToolParent(Tool) and Tool.visible then
      begin
        var ToolContainer := TControl(MultiViewScrollBox.FindComponent('layNav' + Tool.name));
        var ToolButtonContainer := ToolContainer.FindComponent('layNav' + Tool.name + 'ExpandCollapse');
        var ToolButton := TControl(ToolButtonContainer.FindComponent('btn' + Tool.name + 'ExpandCollapse'));
        var ToolButtonExpandCollapseIcon := TControl(ToolButtonContainer.FindComponent('img' + Tool.name + 'ExpandCollapseIcon'));

        ToolButton.OnClick := ExpandCollapseNavItem;
        ToolButton.OnDblClick := ExpandCollapseNavItem;

        ToolButtonExpandCollapseIcon.Visible := True;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsClick;
  end else
  begin
    HamburgerMenuWidth := MultiView.Width;
    MultiView.Width := 50;
    for var Tool in RoseltToolsArray do
      if IsToolParent(Tool) and Tool.visible then
      begin
        var ToolContainer := TControl(MultiViewScrollBox.FindComponent('layNav' + Tool.name));
        var ToolButtonContainer := ToolContainer.FindComponent('layNav' + Tool.name + 'ExpandCollapse');
        var ToolButton := TControl(ToolButtonContainer.FindComponent('btn' + Tool.name + 'ExpandCollapse'));
        var ToolButtonExpandCollapseIcon := TControl(ToolButtonContainer.FindComponent('img' + Tool.name + 'ExpandCollapseIcon'));

        ToolButton.OnClick := btnAllToolsSearchClick;
        ToolButton.OnDblClick := nil;

        if (ToolContainer.Height <> TControl(ToolButton.Parent).Height) then
          ExpandCollapseNavItem(ToolButton);

        ToolButtonExpandCollapseIcon.Visible := False;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsSearchClick;
  end;
end;

procedure TfrmMain.btnSettingsMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Kind := TBrushKind.Solid;
  TRectangle(Sender).Fill.Color := $FF3C3C3C;
end;

procedure TfrmMain.btnSourceCodeLinkClick(Sender: TObject);
begin
  OpenURL('https://github.com/shaunroselt/Roselt-Developer-Tools');
end;

procedure TfrmMain.btnSteamLinkClick(Sender: TObject);
begin
  OpenURL('https://store.steampowered.com/app/1223180/Roselt_Developer_Tools/');
end;

procedure TfrmMain.btnToolHelpClick(Sender: TObject);
begin
  var ToolName := TButton(Sender).ParentControl.Name;

  if ToolName = 'Home' then
    ShowMessage('Roselt Developer Tools Boi 😎😎😎');

  if ToolName = 'JSON <> YAML' then
    ShowMessage('Convert JSON to YAML and vice versa');

  if ToolName = 'Color Picker' then
    ShowMessage('Select a Color and get the Color Code');
end;

procedure TfrmMain.cbThemeChange(Sender: TObject);
begin
  if cbTheme.ItemIndex > -1 then
    StyleBook := TStyleBook(cbTheme.ListItems[cbTheme.ItemIndex].Data);
end;

procedure TfrmMain.edtSearchAllToolsChange(Sender: TObject);
begin
  AllToolsSearch;
end;

procedure TfrmMain.edtSearchAllToolsKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  AllToolsSearch;
end;

procedure TfrmMain.ExpandCollapseNavItem(Sender: TObject);
begin
  var Button := TRectangle(Sender);
  var ButtonLayout := Button.ParentControl;
  var ExpandCollapseLayout := ButtonLayout.ParentControl;
  var ExpandCollapseImage := TSkSvg(Button.Children.Items[2]);

  if (ExpandCollapseLayout.Height = ButtonLayout.Height) then
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height * ExpandCollapseLayout.ChildrenCount;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-up');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := True;
  end else
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height;
    ExpandCollapseImage.Svg.Source := GetBootstrapIcon('chevron-down');

    for var I := 0 to ExpandCollapseLayout.ChildrenCount-1 do
      if ExpandCollapseLayout.Children.Items[I].Name <> ButtonLayout.Name then
        TControl(ExpandCollapseLayout.Children.Items[I]).Visible := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
  procedure CreateToolNavButtons();
  begin
    var DynamicParents := TList.Create;
    for var Tool in RoseltToolsArray do
    begin
      if (Tool.Visible = False) then Continue;

      // I think these buttons will be freed from memory when the app frees MultiViewScrollBox 🤷
      if IsToolParent(Tool) then
      begin
        var ToolParentContainer := TLayout.Create(MultiViewScrollBox);
        ToolParentContainer.Parent := MultiViewScrollBox;
        ToolParentContainer.Align := TAlignLayout.Bottom;
        ToolParentContainer.Height := 100;
        ToolParentContainer.Align := TAlignLayout.Top;
        ToolParentContainer.Name := 'layNav' + Tool.name;

        var ToolButtonContainer := TLayout.Create(ToolParentContainer);
        ToolButtonContainer.Parent := ToolParentContainer;
        ToolButtonContainer.Align := TAlignLayout.Top;
        ToolButtonContainer.Height := 50;
        ToolButtonContainer.Name := 'layNav' + Tool.name + 'ExpandCollapse';
        ToolButtonContainer.Enabled := Tool.active;

        var ToolButton := TRectangle.Create(ToolButtonContainer);
        ToolButton.Parent := ToolButtonContainer;
        ToolButton.Align := TAlignLayout.Client;
        ToolButton.Margins.Top := 5;
        ToolButton.Margins.Right := 5;
        ToolButton.Margins.Bottom := 5;
        ToolButton.Margins.Left := 5;
        ToolButton.Name := 'btn' + Tool.name + 'ExpandCollapse';
        ToolButton.Cursor := crHandPoint;
        ToolButton.Fill.Kind := TBrushKind.None;
        ToolButton.Sides := [];
        ToolButton.YRadius := 8;
        ToolButton.XRadius := 8;
        ToolButton.Stroke.Kind := TBrushKind.None;
        ToolButton.OnMouseEnter := btnAllToolsMouseEnter;
        ToolButton.OnMouseLeave := btnAllToolsMouseLeave;
        ToolButton.OnClick := ExpandCollapseNavItem;
        ToolButton.OnDblClick := ExpandCollapseNavItem;

        var ToolButtonImg := TSkSvg.Create(ToolButtonContainer);
        ToolButtonImg.Parent := ToolButton;
        ToolButtonImg.Align := TAlignLayout.Left;
        ToolButtonImg.Margins.Top := 8;
        ToolButtonImg.Margins.Right := 8;
        ToolButtonImg.Margins.Bottom := 8;
        ToolButtonImg.Margins.Left := 8;
        ToolButtonImg.Width := ToolButtonImg.Height;
        ToolButtonImg.Name := 'img' + Tool.name + 'ExpandCollapse';
        ToolButtonImg.Svg.Source := GetBootstrapIcon(Tool.icon);
        ToolButtonImg.Svg.OverrideColor := TAlphaColors.White;

        var ToolButtonLabel := TLabel.Create(ToolButtonContainer);
        ToolButtonLabel.Parent := ToolButton;
        ToolButtonLabel.Align := TAlignLayout.Client;
        ToolButtonLabel.Margins.Top := 5;
        ToolButtonLabel.Margins.Right := 5;
        ToolButtonLabel.Margins.Bottom := 5;
        ToolButtonLabel.Name := 'lbl' + Tool.name + 'ExpandCollapse';
        ToolButtonLabel.Text := Tool.text_long;
        ToolButtonLabel.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
        ToolButtonLabel.TextSettings.Font.Size := 20;
        if (Tool.active = False) then
          ToolButtonLabel.TextSettings.Font.Style := [TFontStyle.fsStrikeOut];

        var ToolButtonImgExpandCollapseIcon := TSkSvg.Create(ToolButtonContainer);
        ToolButtonImgExpandCollapseIcon.Parent := ToolButton;
        ToolButtonImgExpandCollapseIcon.Align := TAlignLayout.Right;
        ToolButtonImgExpandCollapseIcon.Margins.Top := 11;
        ToolButtonImgExpandCollapseIcon.Margins.Right := 5;
        ToolButtonImgExpandCollapseIcon.Margins.Bottom := 11;
        ToolButtonImgExpandCollapseIcon.Margins.Left := 5;
        ToolButtonImgExpandCollapseIcon.Width := ToolButtonImgExpandCollapseIcon.Height;
        ToolButtonImgExpandCollapseIcon.Name := 'img' + Tool.name + 'ExpandCollapseIcon';
        ToolButtonImgExpandCollapseIcon.Svg.Source := GetBootstrapIcon('chevron-down');
        ToolButtonImgExpandCollapseIcon.Svg.OverrideColor := TAlphaColors.White;
        ToolButtonImgExpandCollapseIcon.Visible := Tool.active;

        DynamicParents.Add(ToolParentContainer);
      end else
      begin
        var ToolButtonContainer := TLayout.Create(MultiViewScrollBox);

        if (Tool.parent = '') then
        begin
          ToolButtonContainer.Parent := MultiViewScrollBox;
        end else
        begin
          var ParentFound := False;
          for var MainChild in DynamicParents do
            if (TLayout(MainChild).Name = 'layNav' + Tool.parent) then
            begin
              ToolButtonContainer.Parent := TLayout(MainChild);
              TLayout(MainChild).Height := TLayout(MainChild).Height + 50;
              ParentFound := True;
              break;
            end;
          if (ParentFound = False) then
          begin
            FreeAndNil(ToolButtonContainer);
            Continue;
          end;
        end;
        ToolButtonContainer.Align := TAlignLayout.Bottom;
        ToolButtonContainer.Height := 50;
        ToolButtonContainer.Align := TAlignLayout.Top;
        ToolButtonContainer.Name := 'layNav' + Tool.name;
        ToolButtonContainer.Enabled := Tool.active;

        var ToolButton := TRectangle.Create(ToolButtonContainer);
        ToolButton.Parent := ToolButtonContainer;
        ToolButton.Align := TAlignLayout.Client;
        ToolButton.Margins.Top := 5;
        ToolButton.Margins.Right := 5;
        ToolButton.Margins.Bottom := 5;
        ToolButton.Margins.Left := 5;
        ToolButton.Name := 'btn' + Tool.name;
        ToolButton.Cursor := crHandPoint;
        ToolButton.Fill.Kind := TBrushKind.None;
        ToolButton.Sides := [];
        ToolButton.YRadius := 8;
        ToolButton.XRadius := 8;
        ToolButton.Stroke.Kind := TBrushKind.None;
        ToolButton.OnMouseEnter := btnAllToolsMouseEnter;
        ToolButton.OnMouseLeave := btnAllToolsMouseLeave;
        ToolButton.OnClick := btnAllToolsClick;

        var ToolButtonImg := TSkSvg.Create(ToolButtonContainer);
        ToolButtonImg.Parent := ToolButton;
        ToolButtonImg.Align := TAlignLayout.Left;
        ToolButtonImg.Margins.Top := 8;
        ToolButtonImg.Margins.Right := 8;
        ToolButtonImg.Margins.Bottom := 8;
        if (Tool.parent = '') then
        begin
          ToolButtonImg.Margins.Left := 8;
        end else
        begin
          ToolButtonImg.Margins.Left := 32;
        end;
        ToolButtonImg.Width := ToolButtonImg.Height;
        ToolButtonImg.Name := 'img' + Tool.name;
        ToolButtonImg.Svg.Source := GetBootstrapIcon(Tool.icon);
        ToolButtonImg.Svg.OverrideColor := TAlphaColors.White;

        var ToolButtonLabel := TLabel.Create(ToolButtonContainer);
        ToolButtonLabel.Parent := ToolButton;
        ToolButtonLabel.Align := TAlignLayout.Client;
        ToolButtonLabel.Margins.Top := 5;
        ToolButtonLabel.Margins.Right := 5;
        ToolButtonLabel.Margins.Bottom := 5;
        ToolButtonLabel.Name := 'lbl' + Tool.name;
        ToolButtonLabel.Text := Tool.text_long;
        ToolButtonLabel.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
        ToolButtonLabel.TextSettings.Font.Size := 20;
        if (Tool.active = False) then
          ToolButtonLabel.TextSettings.Font.Style := [TFontStyle.fsStrikeOut];
      end;
    end;
    for var ParentContainer in DynamicParents do
      for var ParentChild in TLayout(ParentContainer).Children do
        if (String(TLayout(ParentChild).Name).Contains('ExpandCollapse')) then
        begin
          ExpandCollapseNavItem(TRectangle(TLayout(ParentChild).Children[0]));
          break;
        end;
    DynamicParents.Free;
  end;
  procedure CreateToolButtons();
  begin
    for var Tool in RoseltToolsArray do
    begin
      if (IsToolParent(Tool) OR (Tool.Visible = False)) then continue;

      var ToolButton := TButton.Create(layAllToolsGrid);
      // I think these buttons will be freed from memory when the app frees layAllToolsGrid 🤷
      ToolButton.Parent := layAllToolsGrid;
      ToolButton.TagString := Tool.name;
      ToolButton.Name := 'btnAllTools' + Tool.name;
      ToolButton.Text := '';
      ToolButton.Hint := Tool.description;
      ToolButton.Cursor := crHandPoint;
      ToolButton.Margins.Top := 6;
      ToolButton.Margins.Right := 6;
      ToolButton.Margins.Bottom := 6;
      ToolButton.Margins.Left := 6;
      ToolButton.Padding.Top := 10;
      ToolButton.Padding.Right := 12;
      ToolButton.Padding.Bottom := 8;
      ToolButton.Padding.Left := 12;
      ToolButton.Width := 185;
      ToolButton.Height := 240;
      ToolButton.OnClick := AllToolsButtonClick;
      ToolButton.Enabled := Tool.active;

      var ToolIconContainer := TRectangle.Create(ToolButton);
      ToolIconContainer.Parent := ToolButton;
      ToolIconContainer.Name := 'btnAllToolsIconContainer' + Tool.name;
      ToolIconContainer.Align := TAlignLayout.MostTop;
      ToolIconContainer.Height := 100;
      ToolIconContainer.Margins.Top := 0;
      ToolIconContainer.Margins.Right := 26;
      ToolIconContainer.Margins.Bottom := 12;
      ToolIconContainer.Margins.Left := 26;
      ToolIconContainer.Padding.Top := 12;
      ToolIconContainer.Padding.Right := 12;
      ToolIconContainer.Padding.Bottom := 12;
      ToolIconContainer.Padding.Left := 12;
      ToolIconContainer.fill.Color := $4B000000;
      ToolIconContainer.Sides := [];
      ToolIconContainer.Stroke.Kind := TBrushKind.None;
      ToolIconContainer.HitTest := False;
      ToolIconContainer.XRadius := 8;
      ToolIconContainer.YRadius := 8;

      var ToolIcon := TSkSvg.Create(ToolButton);
      ToolIcon.Parent := ToolIconContainer;
      ToolIcon.Name := 'btnAllToolsIcon' + Tool.name;
      ToolIcon.Align := TAlignLayout.Client;
      ToolIcon.Svg.OverrideColor := TAlphaColors.White;
      ToolIcon.Svg.Source := GetBootstrapIcon(Tool.icon);

      var ToolIconTitle := TLabel.Create(ToolButton);
      ToolIconTitle.Parent := ToolButton;
      ToolIconTitle.Name := 'btnAllToolsTitle' + Tool.name;
      ToolIconTitle.Align := TAlignLayout.Top;
      ToolIconTitle.Margins.Bottom := 14;
      ToolIconTitle.Text := Tool.text_long;
      ToolIconTitle.TextSettings.Font.Size := 16;
      ToolIconTitle.TextSettings.WordWrap := True;
      ToolIconTitle.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
      ToolIconTitle.AutoSize := True;

      var ToolIconDescription := TLabel.Create(ToolButton);
      ToolIconDescription.Parent := ToolButton;
      ToolIconDescription.Name := 'btnAllToolsDescription' + Tool.name;
      ToolIconDescription.Align := TAlignLayout.Client;
      ToolIconDescription.Text := Tool.description;
      ToolIconDescription.TextSettings.Font.Size := 13;
      ToolIconDescription.TextSettings.WordWrap := True;
      ToolIconDescription.TextSettings.VertAlign := TTextAlign.Leading;
      ToolIconDescription.StyledSettings := [TStyledSetting.Family,TStyledSetting.FontColor];
    end;
  end;
  procedure CreateToolFrame(ToolFrame: TFrame; FrameName: String);
  begin
    ToolFrame.Name := FrameName;
    ToolFrame.Visible := False;
    ToolFrame.Parent := LayoutContainer;
    ToolFrame.Align := TAlignLayout.Client;
  end;
begin
  btnAllToolsTesting.Parent := layStuffThatwillNeverShow; // Hide Testing Button
  layNavTesting.Parent := layStuffThatwillNeverShow; // Hide Testing Button
  layNavTestingMore.Parent := layStuffThatwillNeverShow; // Hide Testing Button
  CreateToolButtons();
  CreateToolNavButtons();
  HamburgerMenuWidth := 400; // Default Hamburger Menu Width
  SplitterNavContent.Position.X := HamburgerMenuWidth * 2; // Make sure Splitter is in the correct place
  lblAppInfoDescription.Text := GetAppInfo;

  btnAllTools.OnClick(btnAllTools);


  // Dynamically create Tool Frames
  CreateToolFrame(TFrame_DelphiFormatter.Create(Self),'layDelphiFormatter');
  CreateToolFrame(TFrame_PHPFormatter.Create(Self),'layPHPFormatter');
  CreateToolFrame(TFrame_CSSFormatter.Create(Self),'layCSSFormatter');
  CreateToolFrame(TFrame_HTMLFormatter.Create(Self),'layHTMLFormatter');
  CreateToolFrame(TFrame_JsonFormatter.Create(Self),'layJsonFormatter');
  CreateToolFrame(TFrame_SQLFormatter.Create(Self),'laySQLFormatter');
  CreateToolFrame(TFrame_XMLFormatter.Create(Self),'layXMLFormatter');
  CreateToolFrame(TFrame_JavaScriptFormatter.Create(Self),'layJavaScriptFormatter');
  CreateToolFrame(TFrame_NumberBaseConverter.Create(Self),'layNumberBaseConverter');
  CreateToolFrame(TFrame_NameGenerator.Create(Self),'layNameGenerator');
  CreateToolFrame(TFrame_PasswordGenerator.Create(Self),'layPasswordGenerator');
  CreateToolFrame(TFrame_UUIDGenerator.Create(Self),'layUUIDGenerator');
  CreateToolFrame(TFrame_HashGenerator.Create(Self),'layHashGenerator');
  CreateToolFrame(TFrame_TimestampConverter.Create(Self),'layTimestampConverter');
  CreateToolFrame(TFrame_Base64TextEncoderDecoder.Create(Self),'layBase64EncoderDecoder');
  CreateToolFrame(TFrame_Base64ImageEncoderDecoder.Create(Self),'layBase64ImageEncoderDecoder');
  CreateToolFrame(TFrame_ColorPicker.Create(Self),'layColorPicker');
  CreateToolFrame(TFrame_ImageEffects.Create(Self),'layImageEffects');
  CreateToolFrame(TFrame_GZipCompressDecompress.Create(Self),'layGZipCompressDecompress');
  CreateToolFrame(TFrame_HTMLEncoderDecoder.Create(Self),'layHTMLEncoderDecoder');
  CreateToolFrame(TFrame_JsonYamlConverter.Create(Self),'layJsonYamlConverter');
  CreateToolFrame(TFrame_JWTDecoder.Create(Self),'layJWTDecoder');
  CreateToolFrame(TFrame_LoremIpsumGenerator.Create(Self),'layLoremIpsumGenerator');
  CreateToolFrame(TFrame_JWTTokenGenerator.Create(Self),'layJWTTokenGenerator');
  CreateToolFrame(TFrame_TextCaseConverterInspector.Create(Self),'layTextCaseConverterInspector');
  CreateToolFrame(TFrame_URLEncoderDecoder.Create(Self),'layURLEncoderDecoder');
  CreateToolFrame(TFrame_TextEscapeUnescape.Create(Self),'layTextEscapeUnescape');
  CreateToolFrame(TFrame_MarkdownPreview.Create(Self),'layMarkdownPreview');
  CreateToolFrame(TFrame_HTMLPreview.Create(Self),'layHTMLPreview');
  CreateToolFrame(TFrame_RegexTester.Create(Self),'layRegexTester');
  CreateToolFrame(TFrame_TextToArray.Create(Self),'layTextToArray');
  CreateToolFrame(TFrame_PingIPDomain.Create(Self),'layPingIPDomain');


  // Load Themes (Settings)
  cbTheme.Items.Clear;
  for var c in dmStyles do
    if c is TStyleBook then
    begin
      var Index := cbTheme.Items.Add(TStyleBook(c).StyleName);
      cbTheme.ListItems[Index].Data := TStyleBook(c);
    end;
  cbTheme.ItemIndex := 0;


  {$IFDEF WINDOWS}
  TThread.CreateAnonymousThread(
    procedure
    begin
      // Load Font Family (Settings)
      // Might not work if there isn't a printer. Need to test.
      // Probably isn't cross-platform either. Need to test.
      // The code is also super slow on Windows (That's why I have it in a TThread.Start)
      Printer.ActivePrinter;
      cbFontFamily.Items := Printer.Fonts;
      cbFontFamily.ItemIndex := 0;
    end
  ).Start;
  {$ENDIF}
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  layAllToolsGrid.Height := Round(layAllToolsGrid.ChildrenCount / (layAllToolsGrid.Width / 240)+1) * 185;  // Need to improve/change this in the future
end;

function TfrmMain.GetAppInfo: String;
// Need to get all of the App Info dynamically in the future
begin
  var Version := 'Version 1.0.0.0';
  var Architecture := 'X64';     // Get Environement Variable for this on Windows: https://superuser.com/questions/305901/possible-values-of-processor-architecture
  var BuildType := 'RELEASE';
  {$IFDEF DEBUG}
    BuildType := 'DEBUG';
  {$ENDIF}
  var CompiledDate := Date.ToString;

  Result := Version + ' | ' + Architecture + ' | ' + BuildType + ' | ' + CompiledDate;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
begin
  for var I := 0 to LayoutContainer.Children.Count-1 do // Loop through all tools and hide them
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  var cmpToolLayoutName := FindComponent(ToolLayoutName); // Find the selected tool
  if (cmpToolLayoutName <> nil) then
  begin
    TControl(cmpToolLayoutName).Visible := True; // Show the selected tool
    if (cmpToolLayoutName is TFrame) then // Check if the tool is a Frame
    begin
      var OnResizeEvent := TNotifyEvent(TFrame(cmpToolLayoutName).OnResize);
      var NilEvent := TNotifyEvent(nil);
      if (TMethod(OnResizeEvent) <> TMethod(NilEvent)) then
        TFrame(cmpToolLayoutName).OnResize(nil); // Call onResize Event if it's a Frame
    end;
  end else ShowMessage('This tool is not available');
end;

procedure TfrmMain.SwitchLineNumbersSwitch(Sender: TObject);
begin
  if (lblSwitchLineNumbers.Text = 'On') then
  begin
    lblSwitchLineNumbers.Text := 'Off';
    SwitchLineNumbers.IsChecked := True;
  end else
  begin
    lblSwitchLineNumbers.Text := 'On';
    SwitchLineNumbers.IsChecked := False;
  end;
end;

procedure TfrmMain.SwitchWordWrapSwitch(Sender: TObject);
begin
  if (lblSwitchWordWrap.Text = 'On') then
  begin
    lblSwitchWordWrap.Text := 'Off';
    SwitchWordWrap.IsChecked := True;
  end else
  begin
    lblSwitchWordWrap.Text := 'On';
    SwitchWordWrap.IsChecked := False;
  end;
end;

procedure TfrmMain.AllToolsButtonClick(Sender: TObject);
begin
  var ToolButton := TButton(Sender);
  for var I in ToolButton.Children do
    if String(I.Name).Contains('btnAllToolsTitle') then
    begin
      lblNavTitle.Text := TLabel(I).Text;
      break;
    end;
  SelectTool('lay' + ToolButton.TagString);
end;

procedure TfrmMain.AllToolsSearch();
// This doesn't work properly
begin
  if ((layAllToolsHidden.ChildrenCount > 0)) then // If there are Tools currently hidden
    for var ToolButton in layAllToolsHidden.Children do // Then move all of them to layAllToolsGrid
      ToolButton.Parent := layAllToolsGrid;
  if (edtSearchAllTools.Text.IsEmpty = False) then
    for var Tool in RoseltToolsArray do
    begin
      if IsToolParent(Tool) then continue; // Skip parent tools as they don't have buttons to filter
      var ToolButtonVisible := False;
      if Tool.text_short.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.text_long.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.description.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.parent.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if (ToolButtonVisible = False) then
        TButton(layAllToolsGrid.FindComponent('btnAllTools' + Tool.name)).Parent := layAllToolsHidden;
    end;
end;

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
begin
  var ToolNavItem := TLabel(TRectangle(Sender).Children.Items[1]);
  lblNavTitle.Text := ToolNavItem.Text;
  SelectTool('lay'+String(ToolNavItem.Name).Replace('lbl',''));
end;

procedure TfrmMain.btnAllToolsMouseEnter(Sender: TObject);
begin
  TRectangle(Sender).Fill.Kind := TBrushKind.Solid;
  TRectangle(Sender).Fill.Color := $FF2B2B2B;
end;

procedure TfrmMain.btnAllToolsMouseLeave(Sender: TObject);
begin
  TRectangle(Sender).Fill.Kind := TBrushKind.None;
end;

procedure TfrmMain.btnAllToolsSearchClick(Sender: TObject);
begin
  btnAllToolsClick(btnAllTools);

  var SearchText := String(TControl(Sender).Name).Replace('btn','').Replace('ExpandCollapse','');
  if (TControl(Sender).Name = 'btnAllTools') then SearchText := '';

  edtSearchAllTools.Text := SearchText;
end;

procedure TfrmMain.btnChangeLogClick(Sender: TObject);
begin
  lblNavTitle.Text := 'Change Log';
  SelectTool('layChangeLog');
end;

end.
