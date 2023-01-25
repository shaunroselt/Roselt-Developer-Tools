unit uFrame_TimestampConverter;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.DateUtils,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Platform,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts,
  FMX.SpinBox,
  FMX.EditBox,
  FMX.Objects,
  Skia,
  Skia.FMX;

type
  TFrame_TimestampConverter = class(TFrame)
    layUnixTimestamp: TLayout;
    lblUnixTimestamp: TLabel;
    sbUnixTimestamp: TSpinBox;
    layYear: TLayout;
    lblYear: TLabel;
    sbYear: TSpinBox;
    layDateTime: TGridLayout;
    layMonth: TLayout;
    lblMonth: TLabel;
    sbMonth: TSpinBox;
    layDay: TLayout;
    lblDay: TLabel;
    sbDay: TSpinBox;
    layHours: TLayout;
    lblHours: TLabel;
    sbHours: TSpinBox;
    layMinutes: TLayout;
    lblMinutes: TLabel;
    sbMinutes: TSpinBox;
    laySeconds: TLayout;
    lblSeconds: TLabel;
    sbSeconds: TSpinBox;
    btnInputClear: TButton;
    imgInputClear: TSkSvg;
    lblInputClear: TLabel;
    btnInputCopyToClipboard: TButton;
    imgInputCopyToClipboard: TSkSvg;
    lblInputCopyToClipboard: TLabel;
    btnNow: TButton;
    imgNow: TSkSvg;
    lblNow: TLabel;
    btnInputPasteFromClipboard: TButton;
    imgInputPasteFromClipboard: TSkSvg;
    lblInputPasteFromClipboard: TLabel;
    procedure FrameResized(Sender: TObject);
    procedure sbUnixTimestampChange(Sender: TObject);
    procedure TimestampChange(Sender: TObject);
    procedure btnNowClick(Sender: TObject);
    procedure btnInputClearClick(Sender: TObject);
    procedure btnInputCopyToClipboardClick(Sender: TObject);
    procedure btnInputPasteFromClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFrame_TimestampConverter.btnInputClearClick(Sender: TObject);
begin
  sbUnixTimestamp.Value := 0;
end;

procedure TFrame_TimestampConverter.btnInputCopyToClipboardClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(sbUnixTimestamp.Value);
end;

procedure TFrame_TimestampConverter.btnInputPasteFromClipboardClick(Sender: TObject);
  function RemoveNonNumericChars(const s: string): string;
  begin
    Result := '';
    for var i := 1 to s.Length do
    begin
      if s[i] in ['0'..'9'] then
        Result := Result + s[i];
    end;
  end;
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    sbUnixTimestamp.Value := RemoveNonNumericChars(ClipboardService.GetClipboard.ToString).ToDouble;
end;

procedure TFrame_TimestampConverter.btnNowClick(Sender: TObject);
begin
  sbUnixTimestamp.Value := DateTimeToUnix(Now);
end;

procedure TFrame_TimestampConverter.FrameResized(Sender: TObject);
begin
  for var i := 6 downto 1 do
    if (i > 1) then
    begin
      if layDateTime.Width > (i * 250) then
      begin
        layDateTime.ItemWidth := Trunc((sbUnixTimestamp.Width / i) * 100) / 100;
        break;
      end;
    end else layDateTime.ItemWidth := sbUnixTimestamp.Width;
end;

procedure TFrame_TimestampConverter.sbUnixTimestampChange(Sender: TObject);
begin
  sbYear.OnChange := nil;
  sbMonth.OnChange := nil;
  sbDay.OnChange := nil;
  sbHours.OnChange := nil;
  sbMinutes.OnChange := nil;
  sbSeconds.OnChange := nil;
  sbYear.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Year;
  sbMonth.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Month;
  sbDay.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Day;
  sbHours.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Hour;
  sbMinutes.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Minute;
  sbSeconds.Value := UnixToDateTime(Trunc(sbUnixTimestamp.Value)).Second;
  sbYear.OnChange := TimestampChange;
  sbMonth.OnChange := TimestampChange;
  sbDay.OnChange := TimestampChange;
  sbHours.OnChange := TimestampChange;
  sbMinutes.OnChange := TimestampChange;
  sbSeconds.OnChange := TimestampChange;
end;

procedure TFrame_TimestampConverter.TimestampChange(Sender: TObject);
begin
  sbUnixTimestamp.OnChange := nil;
  sbUnixTimestamp.Value := DateTimeToUnix(
                            EncodeDateTime(
                              Trunc(sbYear.Value),
                              Trunc(sbMonth.Value),
                              Trunc(sbDay.Value),
                              Trunc(sbHours.Value),
                              Trunc(sbMinutes.Value),
                              Trunc(sbSeconds.Value),
                              0
                            )
                           );
  sbUnixTimestamp.OnChange := sbUnixTimestampChange;
end;

end.