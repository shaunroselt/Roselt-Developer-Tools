unit uMain_web;

interface

uses
  System.SysUtils,
  System.Classes,

  JS,
  Web,

  Vcl.Controls,
  Vcl.StdCtrls,

  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  WEBLib.StdCtrls,
  WEBLib.ExtCtrls,
  WEBLib.WebCtrls,
  WEBLib.WebTools,

  Roselt.AppInfo,
  Roselt.Utility,
  Roselt.Tools,
  uBootstrapIcons,

  uFrame_NameGenerator, DB, WEBLib.Grids;

type
  TfrmMain = class(TWebForm)
    TopBar: TWebPanel;
    SplitterNavContent: TWebSplitter;
    layStuffThatWillNeverShow: TWebPanel;
    layNavAllTools: TWebPanel;
    btnAllTools: TWebPanel;
    lblAllTools: TWebLabel;
    imgAllTools: TWebHTMLDiv;
    layNavTestingStuff: TWebPanel;
    btnTestingStuff: TWebPanel;
    lblTestingStuff: TWebLabel;
    imgTestingStuff: TWebHTMLDiv;
    layNavTestingMoreStuff: TWebPanel;
    layNavExpandCollapseTestingMoreStuff: TWebPanel;
    btnExpandCollapseTestingMoreStuff: TWebPanel;
    lblExpandCollapseTestingMoreStuff: TWebLabel;
    imgExpandCollapseTestingMoreStuff: TWebHTMLDiv;
    imgExpandCollapseIconTestingMoreStuff: TWebHTMLDiv;
    WebPanel654: TWebPanel;
    WebPanel7532: TWebPanel;
    WebLabel1: TWebLabel;
    WebHTMLDiv1: TWebHTMLDiv;
    WebPanel8325: TWebPanel;
    WebPanel9436: TWebPanel;
    WebLabel2: TWebLabel;
    WebHTMLDiv2: TWebHTMLDiv;
    WebPanel10857: TWebPanel;
    WebPanel11345: TWebPanel;
    WebLabel3: TWebLabel;
    WebHTMLDiv3: TWebHTMLDiv;
    lblAppInfoDescription: TWebLabel;
    MultiView: TWebScrollBox;
    LayoutContainer: TWebScrollBox;
    layTesting: TWebPanel;
    WebLabel10: TWebLabel;
    layAllTools: TWebPanel;
    btnHamburger: TWebHTMLDiv;
    edtSearchAllTools: TWebEdit;
    WebTableControl1: TWebTableControl;
    procedure btnAllToolsMouseEnter(Sender: TObject);
    procedure btnAllToolsMouseLeave(Sender: TObject);
    procedure btnAllToolsClick(Sender: TObject);
    procedure btnAllToolsSearchClick(Sender: TObject);
    procedure btnHamburgerClick(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure ExpandCollapseNavItem(Sender: TObject);
    procedure WebFormShow(Sender: TObject);
  private
    { Private declarations }
    HamburgerMenuWidth: UInt64;
    procedure SelectTool(ToolLayoutName: String);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnAllToolsClick(Sender: TObject);
var
  BackendName: String;
begin
  BackendName := StringReplace(TControl(Sender).Name, 'ExpandCollapseIcon', '', [rfReplaceAll]);
  BackendName := StringReplace(BackendName, 'ExpandCollapse', '', [rfReplaceAll]);
  BackendName := StringReplace(BackendName, 'btn', '', [rfReplaceAll]);
  BackendName := StringReplace(BackendName, 'img', '', [rfReplaceAll]);
  BackendName := StringReplace(BackendName, 'lbl', '', [rfReplaceAll]);
  BackendName := StringReplace(BackendName, 'layNav', '', [rfReplaceAll]);

  TopBar.Caption := TWebLabel(FindComponent('lbl' + BackendName)).Caption;

  SelectTool('lay'+BackendName);
end;

procedure TfrmMain.btnAllToolsMouseEnter(Sender: TObject);
begin
  TWebPanel(Sender).Color := $002B2B2B;
end;

procedure TfrmMain.btnAllToolsMouseLeave(Sender: TObject);
begin
  TWebPanel(Sender).Color := clNone;
end;

procedure TfrmMain.btnAllToolsSearchClick(Sender: TObject);
var
  SearchText: String;
begin
  btnAllToolsClick(btnAllTools);

  SearchText := StringReplace(TControl(Sender).Name, 'ExpandCollapseIcon', '', [rfReplaceAll]);
  SearchText := StringReplace(SearchText, 'ExpandCollapse', '', [rfReplaceAll]);
  SearchText := StringReplace(SearchText, 'btn', '', [rfReplaceAll]);
  SearchText := StringReplace(SearchText, 'img', '', [rfReplaceAll]);
  SearchText := StringReplace(SearchText, 'lbl', '', [rfReplaceAll]);
  SearchText := StringReplace(SearchText, 'layNav', '', [rfReplaceAll]);

  if (SearchText = 'AllTools') then SearchText := '';

  edtSearchAllTools.Text := SearchText;
end;

procedure TfrmMain.btnHamburgerClick(Sender: TObject);
var
  Tool: TRoseltTool;
  ToolContainer: TControl;
  ToolButtonContainer: TControl;
  ToolButton: TControl;
  ToolButtonImg: TControl;
  ToolButtonLabel: TControl;
  ToolButtonExpandCollapseIcon: TControl;
begin
//  if (MultiView.Width > TControl(Sender).Width) then
//    MultiView.Width := TControl(Sender).Width
//  else
//    MultiView.Width := HamburgerMenuWidth;


  if (MultiView.Width = 50) then
  begin
    MultiView.Width := HamburgerMenuWidth;
    for Tool in RoseltToolsArray do
      if IsToolParent(Tool) and Tool.visible then
      begin
        ToolContainer := TControl(FindComponent('layNav' + Tool.name));
        ToolButtonContainer := TControl(FindComponent('layNavExpandCollapse' + Tool.name));
        ToolButton := TControl(FindComponent('btnExpandCollapse' + Tool.name));
        ToolButtonImg := TControl(FindComponent('imgExpandCollapse' + Tool.name));
        ToolButtonLabel := TControl(FindComponent('lblExpandCollapse' + Tool.name));
        ToolButtonExpandCollapseIcon := TControl(FindComponent('imgExpandCollapseIcon' + Tool.name));

        ToolButton.OnClick := ExpandCollapseNavItem;
        ToolButton.OnDblClick := ExpandCollapseNavItem;
        ToolButtonImg.OnClick := ExpandCollapseNavItem;
        ToolButtonImg.OnDblClick := ExpandCollapseNavItem;

        ToolButtonLabel.Visible := True;
        ToolButtonExpandCollapseIcon.Visible := True;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsClick;
  end else
  begin
    HamburgerMenuWidth := MultiView.Width;
    MultiView.Width := 50;
    for Tool in RoseltToolsArray do
      if IsToolParent(Tool) and Tool.visible then
      begin
        ToolContainer := TControl(FindComponent('layNav' + Tool.name));
        ToolButtonContainer := TControl(FindComponent('layNavExpandCollapse' + Tool.name));
        ToolButton := TControl(FindComponent('btnExpandCollapse' + Tool.name));
        ToolButtonImg := TControl(FindComponent('imgExpandCollapse' + Tool.name));
        ToolButtonLabel := TControl(FindComponent('lblExpandCollapse' + Tool.name));
        ToolButtonExpandCollapseIcon := TControl(FindComponent('imgExpandCollapseIcon' + Tool.name));

        ToolButton.OnClick := btnAllToolsSearchClick;
        ToolButton.OnDblClick := nil;
        ToolButtonImg.OnClick := btnAllToolsSearchClick;
        ToolButtonImg.OnDblClick := nil;

        if (ToolContainer.Height <> TControl(ToolButton.Parent).Height) then
          ExpandCollapseNavItem(ToolButton);

        ToolButtonLabel.Visible := False;
        ToolButtonExpandCollapseIcon.Visible := False;
      end;
    TControl(FindComponent('btnAllTools')).OnClick := btnAllToolsSearchClick;
  end;
end;

procedure TfrmMain.ExpandCollapseNavItem(Sender: TObject);
var
  ToolBackendName: String;
  Button, ButtonLayout, ExpandCollapseLayout: TControl;
  ExpandCollapseImage: TWebHTMLDiv;
  I: UInt64;
  ChildrenCount: UInt64;
  Tool: TRoseltTool;
begin
  Button := TControl(Sender);
  ToolBackendName := StringReplace(Button.Name, 'ExpandCollapseIcon', '', [rfReplaceAll]);
  ToolBackendName := StringReplace(ToolBackendName, 'ExpandCollapse', '', [rfReplaceAll]);
  ToolBackendName := StringReplace(ToolBackendName, 'btn', '', [rfReplaceAll]);
  ToolBackendName := StringReplace(ToolBackendName, 'img', '', [rfReplaceAll]);
  ToolBackendName := StringReplace(ToolBackendName, 'lbl', '', [rfReplaceAll]);
  ToolBackendName := StringReplace(ToolBackendName, 'layNav', '', [rfReplaceAll]);

  ButtonLayout := TControl(FindComponent('layNavExpandCollapse' + ToolBackendName));
  ExpandCollapseLayout := TControl(FindComponent('layNav' + ToolBackendName));
  ExpandCollapseImage := TWebHTMLDiv(FindComponent('imgExpandCollapseIcon' + ToolBackendName));


  if (ExpandCollapseLayout.Height = ButtonLayout.Height) then
  begin
    ChildrenCount := 1;
    for Tool in RoseltToolsArray do
      if ((Tool.Visible) AND (Tool.parent = ToolBackendName)) then
        inc(ChildrenCount);
    ExpandCollapseLayout.Height := ButtonLayout.Height * ChildrenCount;
    ExpandCollapseImage.HTML.Text := GetBootstrapIcon('chevron-up', 24);
  end else
  begin
    ExpandCollapseLayout.Height := ButtonLayout.Height;
    ExpandCollapseImage.HTML.Text := GetBootstrapIcon('chevron-down', 24);
  end;
end;

procedure TfrmMain.SelectTool(ToolLayoutName: String);
var
  I: UInt64;
  cmpLayoutName: TControl;
  ToolFound: Boolean;
begin
  ToolFound := False;
  for I := 0 to LayoutContainer.ControlCount-1 do // Loop through all tools and hide them
  begin
    TControl(LayoutContainer.Controls[I]).Visible := String(TControl(LayoutContainer.Controls[I]).Name).Contains(ToolLayoutName);
    if (TControl(LayoutContainer.Controls[I]).Visible) then
      ToolFound := True;
  end;

  if (ToolFound = False) then
    ShowMessage('This tool is not available');


//    if (cmpLayoutName is TFrame) then // Check if the tool is a Frame
//    begin
//      var OnResizeEvent := TNotifyEvent(TFrame(cmpLayoutName).OnResize)
//      var NilEvent := TNotifyEvent(nil);
//      if (TMethod(OnResizeEvent) <> TMethod(NilEvent)) then
//        TFrame(cmpLayoutName).OnResize(nil); // Call onResize Event if it's a Frame
//    end;
end;

procedure TfrmMain.WebFormCreate(Sender: TObject);
  procedure CreateToolNavButtons();
  var
    DynamicParents: TList;
    Tool: TRoseltTool;
    ToolParentContainer: TWebPanel;
    ToolButtonContainer: TWebPanel;
    ToolButton: TWebPanel;
    ToolButtonImg: TWebHTMLDiv;
    ToolButtonLabel: TWebLabel;
    ToolButtonImgExpandCollapseIcon: TWebHTMLDiv;
    ParentFound: Boolean;
    MainChild: JSValue;
    ParentContainer: JSValue;
    ParentChild: JSValue;
  begin
    DynamicParents := TList.Create;
    for Tool in RoseltToolsArray do
    begin
      if (Tool.Visible = False) then Continue;

      // I think these buttons will be freed from memory when the app frees frmMain 🤷
      if IsToolParent(Tool) then
      begin
        ToolParentContainer := TWebPanel.Create(frmMain);
        ToolParentContainer.Parent := MultiView;
        ToolParentContainer.Align := alBottom;
        ToolParentContainer.Height := 100;
        ToolParentContainer.Align := alTop;
        ToolParentContainer.Name := 'layNav' + Tool.name;
        ToolParentContainer.Color := $003C3C3C;
        ToolParentContainer.BorderStyle := bsNone;

        ToolButtonContainer := TWebPanel.Create(frmMain);
        ToolButtonContainer.Parent := ToolParentContainer;
        ToolButtonContainer.Align := alTop;
        ToolButtonContainer.Height := 50;
        ToolButtonContainer.Name := 'layNavExpandCollapse' + Tool.name;
        ToolButtonContainer.Enabled := Tool.active;
        ToolButtonContainer.Color := $003C3C3C;
        ToolButtonContainer.BorderStyle := bsNone;

        ToolButton := TWebPanel.Create(frmMain);
        ToolButton.Parent := ToolButtonContainer;
        ToolButton.Align := alClient;
        ToolButton.AlignWithMargins := True;
        ToolButton.Margins.Top := 5;
        ToolButton.Margins.Right := 5;
        ToolButton.Margins.Bottom := 5;
        ToolButton.Margins.Left := 5;
        ToolButton.Name := 'btnExpandCollapse' + Tool.name;
        ToolButton.Cursor := crHandPoint;
        ToolButton.Color := $003C3C3C;
        ToolButton.BorderStyle := bsNone;
        ToolButton.OnMouseEnter := btnAllToolsMouseEnter;
        ToolButton.OnMouseLeave := btnAllToolsMouseLeave;
        ToolButton.OnClick := ExpandCollapseNavItem;
        ToolButton.OnDblClick := ExpandCollapseNavItem;

        ToolButtonImg := TWebHTMLDiv.Create(frmMain);
        ToolButtonImg.Parent := ToolButton;
        ToolButtonImg.Align := alLeft;
        ToolButtonImg.AlignWithMargins := True;
        ToolButtonImg.Margins.Top := 0;
        ToolButtonImg.Margins.Right := 8;
        ToolButtonImg.Margins.Bottom := 0;
        ToolButtonImg.Margins.Left := 8;
        ToolButtonImg.Width := ToolButtonImg.Height;
        ToolButtonImg.Name := 'imgExpandCollapse' + Tool.name;
        ToolButtonImg.HTML.Text := GetBootstrapIcon(Tool.icon, 24);
        ToolButtonImg.OnClick := ExpandCollapseNavItem;
        ToolButtonImg.OnDblClick := ExpandCollapseNavItem;
        ToolButtonImg.Cursor := crHandPoint;

        ToolButtonLabel := TWebLabel.Create(frmMain);
        ToolButtonLabel.Parent := ToolButton;
        ToolButtonLabel.Align := alClient;
        ToolButtonLabel.AlignWithMargins := True;
        ToolButtonLabel.Margins.Top := 0;
        ToolButtonLabel.Margins.Left := 5;
        ToolButtonLabel.Margins.Right := 5;
        ToolButtonLabel.Margins.Bottom := 0;
        ToolButtonLabel.Name := 'lblExpandCollapse' + Tool.name;
        ToolButtonLabel.Caption := Tool.text_long;
        ToolButtonLabel.OnClick := ExpandCollapseNavItem;
        ToolButtonLabel.OnDblClick := ExpandCollapseNavItem;
        ToolButtonLabel.Cursor := crHandPoint;

        ToolButtonImgExpandCollapseIcon := TWebHTMLDiv.Create(frmMain);
        ToolButtonImgExpandCollapseIcon.Parent := ToolButton;
        ToolButtonImgExpandCollapseIcon.Align := alRight;
        ToolButtonImgExpandCollapseIcon.Margins.Top := 0;
        ToolButtonImgExpandCollapseIcon.Margins.Right := 5;
        ToolButtonImgExpandCollapseIcon.Margins.Bottom := 0;
        ToolButtonImgExpandCollapseIcon.Margins.Left := 5;
        ToolButtonImgExpandCollapseIcon.Width := ToolButtonImgExpandCollapseIcon.Height;
        ToolButtonImgExpandCollapseIcon.Name := 'imgExpandCollapseIcon' + Tool.name;
        ToolButtonImgExpandCollapseIcon.HTML.Text := GetBootstrapIcon('chevron-down', 24);
        ToolButtonImgExpandCollapseIcon.Visible := Tool.active;
        ToolButtonImgExpandCollapseIcon.OnClick := ExpandCollapseNavItem;
        ToolButtonImgExpandCollapseIcon.OnDblClick := ExpandCollapseNavItem;
        ToolButtonImgExpandCollapseIcon.Cursor := crHandPoint;

        DynamicParents.Add(ToolParentContainer);
      end else
      begin
        ToolButtonContainer := TWebPanel.Create(frmMain);


        if (Tool.parent = '') then
        begin
          ToolButtonContainer.Parent := MultiView;
        end else
        begin
          ParentFound := False;
          for MainChild in DynamicParents do
            if (TWebPanel(MainChild).Name = 'layNav' + Tool.parent) then
            begin
              ToolButtonContainer.Parent := TWebPanel(MainChild);
              TWebPanel(MainChild).Height := TWebPanel(MainChild).Height + 50;
              ParentFound := True;
              break;
            end;
          if (ParentFound = False) then
          begin
            FreeAndNil(ToolButtonContainer);
            Continue;
          end;
        end;
        ToolButtonContainer.Align := alBottom;
        ToolButtonContainer.Height := 50;
        ToolButtonContainer.Align := alTop;
        ToolButtonContainer.Name := 'layNav' + Tool.name;
        ToolButtonContainer.Enabled := Tool.active;
        ToolButtonContainer.Color := $003C3C3C;
        ToolButtonContainer.BorderStyle := bsNone;

        ToolButton := TWebPanel.Create(frmMain);
        ToolButton.Parent := ToolButtonContainer;
        ToolButton.Align := alClient;
        ToolButton.AlignWithMargins := True;
        ToolButton.Margins.Top := 5;
        ToolButton.Margins.Right := 5;
        ToolButton.Margins.Bottom := 5;
        ToolButton.Margins.Left := 5;
        ToolButton.Name := 'btn' + Tool.name;
        ToolButton.Cursor := crHandPoint;
        ToolButton.Color := $003C3C3C;
        ToolButton.BorderStyle := bsNone;
        ToolButton.OnMouseEnter := btnAllToolsMouseEnter;
        ToolButton.OnMouseLeave := btnAllToolsMouseLeave;
        ToolButton.OnClick := btnAllToolsClick;

        ToolButtonImg := TWebHTMLDiv.Create(frmMain);
        ToolButtonImg.Parent := ToolButton;
        ToolButtonImg.Align := alLeft;
        ToolButtonImg.AlignWithMargins := True;
        ToolButtonImg.Margins.Top := 0;
        ToolButtonImg.Margins.Right := 8;
        ToolButtonImg.Margins.Bottom := 0;
        if (Tool.parent = '') then
        begin
          ToolButtonImg.Margins.Left := 8;
        end else
        begin
          ToolButtonImg.Margins.Left := 32;
        end;
        ToolButtonImg.Width := ToolButtonImg.Height;
        ToolButtonImg.Name := 'img' + Tool.name;
        ToolButtonImg.HTML.Text := GetBootstrapIcon(Tool.icon, 24);
        ToolButtonImg.OnClick := btnAllToolsClick;
        ToolButtonImg.Cursor := crHandPoint;

        ToolButtonLabel := TWebLabel.Create(frmMain);
        ToolButtonLabel.Parent := ToolButton;
        ToolButtonLabel.Align := alClient;
        ToolButtonLabel.Layout := tlCenter;
        ToolButtonLabel.AlignWithMargins := True;
        ToolButtonLabel.Margins.Top := 0;
        ToolButtonLabel.Margins.Left := 5;
        ToolButtonLabel.Margins.Right := 5;
        ToolButtonLabel.Margins.Bottom := 0;
        ToolButtonLabel.Name := 'lbl' + Tool.name;
        ToolButtonLabel.Caption := Tool.text_long;
        ToolButtonLabel.OnClick := btnAllToolsClick;
        ToolButtonLabel.Cursor := crHandPoint;
      end;
    end;
    for Tool in RoseltToolsArray do
      if ((Tool.Visible) AND (IsToolParent(Tool))) then
        ExpandCollapseNavItem(TWebPanel(FindComponent('btnExpandCollapse' + Tool.name)));
    DynamicParents.Free;
  end;
  procedure CreateToolButtons();
  begin

  end;
  procedure CreateToolFrame(ToolFrame: TWebFrame; FrameName: String);
  begin
    ToolFrame.Name := FrameName;
    ToolFrame.Visible := False;
    ToolFrame.Parent := LayoutContainer;
    ToolFrame.Align := alClient;
    ToolFrame.LoadFromForm;
  end;
begin
  layNavTestingStuff.Parent := layStuffThatWillNeverShow; // Hide Testing Button
  layNavTestingMoreStuff.Parent := layStuffThatWillNeverShow; // Hide Testing Button
  CreateToolButtons();
  CreateToolNavButtons();
  HamburgerMenuWidth := 400; // Default Hamburger Menu Width
  SplitterNavContent.Left := Round(HamburgerMenuWidth * 2); // Make sure Splitter is in the correct place
  lblAppInfoDescription.Caption := GetAppInfo;

  btnAllTools.OnClick(btnAllTools);

  // Dynamically create Tool Frames
  CreateToolFrame(TFrame_NameGenerator.Create(Self),'layNameGenerator');

end;

procedure TfrmMain.WebFormShow(Sender: TObject);
var
  ToolParam: String;
begin
  ToolParam := GetQueryParam('tool');

  console.log('ToolParam: ', ToolParam);
  if (ToolParam <> '') then
  begin
    console.log('Tool Found!');
  end else
  begin
    console.log('Tool Not Found!');
  end;

  SetQueryParam('first_name', 'Shaun');
  SetQueryParam('last_name', 'Roselt');
end;

end.
