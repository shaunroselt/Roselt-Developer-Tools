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
  FMX.Calendar,
  System.Skia,
  FMX.Skia;

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
    btnInputClearUnixTimestamp: TButton;
    imgInputClearUnixTimestamp: TSkSvg;
    lblInputClearUnixTimestamp: TLabel;
    btnInputCopyToClipboardUnixTimestamp: TButton;
    imgInputCopyToClipboardUnixTimestamp: TSkSvg;
    lblInputCopyToClipboardUnixTimestamp: TLabel;
    btnNowUnixTimestamp: TButton;
    imgNowUnixTimestamp: TSkSvg;
    lblNowUnixTimestamp: TLabel;
    btnInputPasteFromClipboardUnixTimestamp: TButton;
    imgInputPasteFromClipboardUnixTimestamp: TSkSvg;
    lblInputPasteFromClipboardUnixTimestamp: TLabel;
    layCalendar: TLayout;
    lblCalendar: TLabel;
    Calendar: TCalendar;
    btnNowCalendar: TButton;
    imgNowCalendar: TSkSvg;
    lblNowCalendar: TLabel;
    layVariantTimestamp: TLayout;
    lbVariantTimestamp: TLabel;
    btnInputClearVariantTimestamp: TButton;
    imgInputClearVariantTimestamp: TSkSvg;
    lblInputClearVariantTimestamp: TLabel;
    btnInputCopyToClipboardVariantTimestamp: TButton;
    imgInputCopyToClipboardVariantTimestamp: TSkSvg;
    lblInputCopyToClipboardVariantTimestamp: TLabel;
    btnNowVariantTimestamp: TButton;
    imgNowVariantTimestamp: TSkSvg;
    lblNowVariantTimestamp: TLabel;
    btnInputPasteFromClipboardVariantTimestamp: TButton;
    imgInputPasteFromClipboardVariantTimestamp: TSkSvg;
    lblInputPasteFromClipboardVariantTimestamp: TLabel;
    sbVariantTimestamp: TSpinBox;
    procedure FrameResized(Sender: TObject);
    procedure sbUnixTimestampChange(Sender: TObject);
    procedure TimestampChange(Sender: TObject);
    procedure btnNowUnixTimestampClick(Sender: TObject);
    procedure btnInputClearUnixTimestampClick(Sender: TObject);
    procedure btnInputCopyToClipboardUnixTimestampClick(Sender: TObject);
    procedure btnInputPasteFromClipboardUnixTimestampClick(Sender: TObject);
    procedure CalendarChange(Sender: TObject);
    procedure sbVariantTimestampChange(Sender: TObject);
    procedure btnInputPasteFromClipboardVariantTimestampClick(Sender: TObject);
    procedure btnInputCopyToClipboardVariantTimestampClick(Sender: TObject);
    procedure btnInputClearVariantTimestampClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

procedure TFrame_TimestampConverter.btnInputClearUnixTimestampClick(Sender: TObject);
begin
  sbUnixTimestamp.Value := 0;
end;

procedure TFrame_TimestampConverter.btnInputClearVariantTimestampClick(
  Sender: TObject);
begin
  sbVariantTimestamp.Value := 0;
end;

procedure TFrame_TimestampConverter.btnInputCopyToClipboardUnixTimestampClick(Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(sbUnixTimestamp.Value);
end;

procedure TFrame_TimestampConverter.btnInputCopyToClipboardVariantTimestampClick(
  Sender: TObject);
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    ClipboardService.SetClipboard(sbVariantTimestamp.Value);
end;

procedure TFrame_TimestampConverter.btnInputPasteFromClipboardUnixTimestampClick(Sender: TObject);
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

procedure TFrame_TimestampConverter.btnInputPasteFromClipboardVariantTimestampClick(
  Sender: TObject);
  function RemoveNonNumericChars(const s: string): string;
  begin
    Result := '';
    for var i := 1 to s.Length do
    begin
      if s[i] in ['0'..'9','.'] then
        Result := Result + s[i];
    end;
  end;
var
  ClipboardService: IFMXClipboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardService) then
    sbVariantTimestamp.Value := RemoveNonNumericChars(ClipboardService.GetClipboard.ToString).ToDouble;
end;

procedure TFrame_TimestampConverter.btnNowUnixTimestampClick(Sender: TObject);
begin
  sbUnixTimestamp.Value := DateTimeToUnix(Now);
end;

procedure TFrame_TimestampConverter.CalendarChange(Sender: TObject);
begin
  sbUnixTimestamp.Value := DateTimeToUnix(Calendar.DateTime,True);
end;

constructor TFrame_TimestampConverter.Create(AOwner: TComponent);
begin
  inherited;
  btnNowUnixTimestamp.OnClick(btnNowUnixTimestamp);
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
  Calendar.OnChange := nil;
  sbVariantTimestamp.OnChange := nil;

  var SelectedDateTime := UnixToDateTime(Trunc(sbUnixTimestamp.Value));
  sbYear.Value := YearOf(SelectedDateTime);
  sbMonth.Value := MonthOf(SelectedDateTime);
  sbDay.Max := DaysInAMonth(Round(sbYear.Value),Round(sbMonth.Value));
  sbDay.Value := DayOf(SelectedDateTime);
  sbHours.Value := HourOf(SelectedDateTime);
  sbMinutes.Value := MinuteOf(SelectedDateTime);
  sbSeconds.Value := SecondOf(SelectedDateTime);
  Calendar.DateTime := SelectedDateTime;
  sbVariantTimestamp.Value := SelectedDateTime;

  sbYear.OnChange := TimestampChange;
  sbMonth.OnChange := TimestampChange;
  sbDay.OnChange := TimestampChange;
  sbHours.OnChange := TimestampChange;
  sbMinutes.OnChange := TimestampChange;
  sbSeconds.OnChange := TimestampChange;
  Calendar.OnChange := CalendarChange;
  sbVariantTimestamp.OnChange := sbVariantTimestampChange;
end;

procedure TFrame_TimestampConverter.sbVariantTimestampChange(Sender: TObject);
begin
  sbUnixTimestamp.Value := DateTimeToUnix(sbVariantTimestamp.Value,True);
end;

procedure TFrame_TimestampConverter.TimestampChange(Sender: TObject);
begin
  sbUnixTimestamp.OnChange := nil;
  sbVariantTimestamp.OnChange := nil;
  Calendar.OnChange := nil;

  sbDay.Max := DaysInAMonth(Round(sbYear.Value),Round(sbMonth.Value));
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
  Calendar.DateTime := UnixToDateTime(Trunc(sbUnixTimestamp.Value));

  sbUnixTimestamp.OnChange := sbUnixTimestampChange;
  sbVariantTimestamp.OnChange := sbVariantTimestampChange;
  Calendar.OnChange := CalendarChange;
end;

end.
