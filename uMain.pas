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

  Roselt.Clipboard,
  Roselt.AppInfo,
  Roselt.Menu,
  Roselt.Utility,

  uStyles,
  uBootstrapIcons,

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
    MultiViewScrollBox: TVertScrollBox;
    layNavTesting: TLayout;
    btnTesting: TRectangle;
    imgTesting: TSkSvg;
    lblTesting: TLabel;
    layTesting: TLayout;
    lblTestingStuff: TLabel;
    memTesting: TMemo;
    layNavSettings: TLayout;
    btnSettings: TRectangle;
    imgSettings: TSkSvg;
    lblSettings: TLabel;
    layNavTestingMoreStuff: TLayout;
    layNavExpandCollapseTestingMoreStuff: TLayout;
    btnExpandCollapseTestingMoreStuff: TRectangle;
    imgExpandCollapseTestingMoreStuff: TSkSvg;
    lblExpandCollapseTestingMoreStuff: TLabel;
    imgExpandCollapseIconTestingMoreStuff: TSkSvg;
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
    edtSearchAllTools: TEdit;
    SearchEditButton1: TSearchEditButton;
    btnAllToolsTesting: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Rectangle2: TRectangle;
    SkSvg2: TSkSvg;
    layStuffThatWillNeverShow: TLayout;
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
    layNameList: TRectangle;
    cbNameList: TComboBox;
    layTitleDescriptionNameList: TLayout;
    lblTitleNameList: TLabel;
    lblDescriptionNameList: TLabel;
    imgNameList: TSkSvg;
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    layLicenseLink: TLayout;
    btnLicenseLink: TRectangle;
    SkSvg1: TSkSvg;
    Label5: TLabel;
    layReportAProblemLink: TLayout;
    btnReportAProblemLink: TRectangle;
    SkSvg3: TSkSvg;
    Label6: TLabel;
    layFullScreen: TRectangle;
    imgFullScreen: TSkSvg;
    layFullScreenTitleDescription: TLayout;
    lblFullScreenTitle: TLabel;
    lblFullScreenDescription: TLabel;
    lblSwitchFullScreen: TLabel;
    SwitchFullScreen: TSwitch;
    layTop: TLayout;
    lblTitle: TLabel;
    btnBackChangeLog: TButton;
    imgBackChangeLog: TSkSvg;
    SearchDelayTimer: TTimer;
    layAllToolsGrid: TFlowLayout;
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnAllToolsSearchClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnToolHelpClick(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure SwitchWordWrapSwitch(Sender: TObject);
    procedure SwitchLineNumbersSwitch(Sender: TObject);
    procedure AllToolsButtonClick(Sender: TObject);
    procedure edtSearchAllToolsKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSearchAllToolsChange(Sender: TObject);
    procedure btnChangeLogClick(Sender: TObject);
    procedure btnSteamLinkClick(Sender: TObject);
    procedure btnSourceCodeLinkClick(Sender: TObject);
    procedure btnSettingsMouseEnter(Sender: TObject);
    procedure btnLicenseLinkClick(Sender: TObject);
    procedure btnReportAProblemLinkClick(Sender: TObject);
    procedure SwitchFullScreenSwitch(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnAppInfoCopyToClipboardClick(Sender: TObject);
    procedure btnBackChangeLogClick(Sender: TObject);
    procedure lblTitleClick(Sender: TObject);
    procedure SearchDelayTimerTimer(Sender: TObject);
  private
    { Private declarations }
    ToolsSearchCount: UInt64;
    HamburgerMenuWidth: Single;
    procedure SelectTool(ToolLayoutName: String);
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
    for var Tool in RoseltMenuArray do
      if IsMenuParent(Tool) and Tool.visible then
      begin
        var ToolContainer := TControl(MultiViewScrollBox.FindComponent('layNav' + Tool.name));
        var ToolButtonContainer := ToolContainer.FindComponent('layNavExpandCollapse' + Tool.name);
        var ToolButton := TControl(ToolButtonContainer.FindComponent('btnExpandCollapse' + Tool.name));
        var ToolButtonExpandCollapseIcon := TControl(ToolButtonContainer.FindComponent('imgExpandCollapseIcon' + Tool.name));

        ToolButton.OnClick := NavMouseHelper.ExpandCollapseNavItem;
        ToolButton.OnDblClick := NavMouseHelper.ExpandCollapseNavItem;

        ToolButtonExpandCollapseIcon.Visible := True;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsClick;
  end else
  begin
    HamburgerMenuWidth := MultiView.Width;
    MultiView.Width := 50;
    for var Tool in RoseltMenuArray do
      if IsMenuParent(Tool) and Tool.visible then
      begin
        var ToolContainer := TControl(MultiViewScrollBox.FindComponent('layNav' + Tool.name));
        var ToolButtonContainer := ToolContainer.FindComponent('layNavExpandCollapse' + Tool.name);
        var ToolButton := TControl(ToolButtonContainer.FindComponent('btnExpandCollapse' + Tool.name));
        var ToolButtonExpandCollapseIcon := TControl(ToolButtonContainer.FindComponent('imgExpandCollapseIcon' + Tool.name));

        ToolButton.OnClick := btnAllToolsSearchClick;
        ToolButton.OnDblClick := nil;

        if (ToolContainer.Height <> TControl(ToolButton.Parent).Height) then
          NavMouseHelper.ExpandCollapseNavItem(ToolButton);

        ToolButtonExpandCollapseIcon.Visible := False;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsSearchClick;
  end;
end;

procedure TfrmMain.btnLicenseLinkClick(Sender: TObject);
begin
  OpenURL('https://github.com/shaunroselt/Roselt-Developer-Tools/blob/master/LICENSE');
end;

procedure TfrmMain.btnReportAProblemLinkClick(Sender: TObject);
begin
  OpenURL('https://github.com/shaunroselt/Roselt-Developer-Tools/issues');
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
  SearchDelayTimer.Enabled := False;
  SearchDelayTimer.Enabled := True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
  procedure CreateHomeButtons();
  begin
    ToolsSearchCount := 0;
    for var Tool in RoseltMenuArray do
    begin
      if (IsMenuParent(Tool) OR (Tool.Visible = False)) then continue;
      inc(ToolsSearchCount);

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
  procedure AssignStaticMouseEvents();
  begin
    // assign shared nav mouse handlers to specific controls
    btnSourceCodeLink.OnMouseEnter := btnSettingsMouseEnter;
    btnSourceCodeLink.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnSteamLink.OnMouseEnter := btnSettingsMouseEnter;
    btnSteamLink.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnLicenseLink.OnMouseEnter := btnSettingsMouseEnter;
    btnLicenseLink.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnReportAProblemLink.OnMouseEnter := btnSettingsMouseEnter;
    btnReportAProblemLink.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnAllTools.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnAllTools.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnTesting.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnTesting.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnExpandCollapseTestingMoreStuff.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnExpandCollapseTestingMoreStuff.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnExpandCollapseTestingMoreStuff.OnClick := NavMouseHelper.ExpandCollapseNavItem;
    btnExpandCollapseTestingMoreStuff.OnDblClick := NavMouseHelper.ExpandCollapseNavItem;
    btnTesting1.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnTesting1.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnTesting2.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnTesting2.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnTesting3.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnTesting3.OnMouseLeave := NavMouseHelper.NavMouseLeave;
    btnSettings.OnMouseEnter := NavMouseHelper.NavMouseEnter;
    btnSettings.OnMouseLeave := NavMouseHelper.NavMouseLeave;
  end;
  procedure CreateFrame(Frame: TFrame; FrameName: String);
  begin
    Frame.Name := FrameName;
    Frame.Visible := False;
    Frame.Parent := LayoutContainer;
    Frame.Align := TAlignLayout.Client;
  end;
begin
  btnAllToolsTesting.Parent := layStuffThatWillNeverShow; // Hide Testing Button
  layNavTesting.Parent := layStuffThatWillNeverShow; // Hide Testing Button
  layNavTestingMoreStuff.Parent := layStuffThatWillNeverShow; // Hide Testing Button
  CreateHomeButtons();

  var MenuOptions: TBuildMenuOptions;
  MenuOptions.NavContainer := MultiViewScrollBox;
  MenuOptions.OnExpandCollapse := NavMouseHelper.ExpandCollapseNavItem;
  MenuOptions.OnNavItemClick := btnAllToolsClick;
  BuildMenu(MenuOptions);
  AssignStaticMouseEvents();
  HamburgerMenuWidth := 400; // Default Hamburger Menu Width
  SplitterNavContent.Position.X := HamburgerMenuWidth * 2; // Make sure Splitter is in the correct place
  lblAppInfoDescription.Text := GetAppInfo;

  btnAllTools.OnClick(btnAllTools);


  // Dynamically create Frames using RoseltMenuArray definitions
  for var Tool in RoseltMenuArray do
  begin
    if IsMenuParent(Tool) then
      Continue; // skip category parents
    if (Tool.visible = False) or (Tool.active = False) then
      Continue; // only create for active and visible tools
    if Tool.frame = nil then
      Continue; // skip tools without a frame assigned
    CreateFrame(Tool.frame.Create(Self), 'lay' + Tool.name);
  end;


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
  var ToolsInRow := Round(layAllToolsGrid.Width / (185+12))+1 ;
  layAllToolsGrid.Height := (Round(ToolsSearchCount / ToolsInRow) * (240+12));
end;

procedure TfrmMain.lblTitleClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Text);
end;

procedure TfrmMain.SearchDelayTimerTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  AllToolsSearch;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
begin
  for var I := 0 to LayoutContainer.Children.Count-1 do // Loop through all tools and hide them
    TControl(LayoutContainer.Children.Items[I]).Visible := False;

  var cmpLayoutName := FindComponent(ToolLayoutName); // Find the selected tool
  if (cmpLayoutName <> nil) then
  begin
    TControl(cmpLayoutName).Visible := True; // Show the selected tool
    if (cmpLayoutName is TFrame) then // Check if the tool is a Frame
    begin
      var OnResizeEvent := TNotifyEvent(TFrame(cmpLayoutName).OnResize);
      var NilEvent := TNotifyEvent(nil);
      if (TMethod(OnResizeEvent) <> TMethod(NilEvent)) then
        TFrame(cmpLayoutName).OnResize(nil); // Call onResize Event if it's a Frame
    end;
  end else ShowMessage('This tool is not available');
end;

procedure TfrmMain.SwitchFullScreenSwitch(Sender: TObject);
begin
  frmMain.FullScreen := not(frmMain.FullScreen); // This sometimes works, but is a bit buggy
  if frmMain.FullScreen then
    lblSwitchFullScreen.Text := 'FullScreen'
  else
    lblSwitchFullScreen.Text := 'Normal';
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
begin
  if (edtSearchAllTools.Text.IsEmpty = False) then
  begin
    ToolsSearchCount := 0;
    for var Tool in RoseltMenuArray do
    begin
      if IsMenuParent(Tool) then continue; // Skip parent tools as they don't have buttons to filter
      if (Tool.visible = False) then continue; // Skip tools that aren't visible
      inc(ToolsSearchCount);

      var ToolButtonVisible := False;
      if Tool.text_short.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.text_long.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.description.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;
      if Tool.parent.ToLower.Contains(edtSearchAllTools.Text.ToLower) then ToolButtonVisible := True;

      TButton(layAllToolsGrid.FindComponent('btnAllTools' + Tool.name)).Visible := ToolButtonVisible;
    end;
  end else
  begin
    for var Tool in RoseltMenuArray do
    begin
      if IsMenuParent(Tool) then continue; // Skip parent tools as they don't have buttons to filter
      if (Tool.visible = False) then continue; // Skip tools that aren't visible
      inc(ToolsSearchCount);

      TButton(layAllToolsGrid.FindComponent('btnAllTools' + Tool.name)).Visible := True;
    end;
  end;
  FormResize(nil);
end;

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
begin
  var ToolNavItem := TLabel(TRectangle(Sender).Children.Items[1]);
  lblNavTitle.Text := ToolNavItem.Text;
  SelectTool('lay'+String(ToolNavItem.Name).Replace('lbl',''));
end;

procedure TfrmMain.btnAllToolsSearchClick(Sender: TObject);
begin
  btnAllToolsClick(btnAllTools);

  var SearchText := String(TControl(Sender).Name).Replace('btn','').Replace('ExpandCollapse','');
  if (TControl(Sender).Name = 'btnAllTools') then SearchText := '';

  edtSearchAllTools.Text := SearchText;
end;

procedure TfrmMain.btnAppInfoCopyToClipboardClick(Sender: TObject);
begin
  CopyToClipboard(lblAppInfoTitle.Text + sLineBreak + sLineBreak + lblAppInfoDescription.Text);
end;

procedure TfrmMain.btnBackChangeLogClick(Sender: TObject);
begin
  lblNavTitle.Text := 'Settings';
  SelectTool('laySettings');
end;

procedure TfrmMain.btnChangeLogClick(Sender: TObject);
begin
  lblNavTitle.Text := 'Change Log';
  SelectTool('layChangeLog');
end;

end.
