{ TODO: Need to properly test on latest MacOS and Windows }
{ TODO: Need to add Android Screenshot, especially useful for when on Samsung DeX }
{ TODO: Need to test and finish Linux Screenshot }
{ TODO: Need to add iOS Screenshot }
unit Roselt.Screenshot;

interface

uses
  FMX.Types,
  FMX.Graphics,
  System.SysUtils,
{$IFDEF MSWINDOWS}
  Windows,
  VCL.Forms,
  VCL.Graphics,
  FMX.Platform.Win,
{$ENDIF}
{$IFDEF MACOS}
  Macapi.CoreFoundation,
  Macapi.CocoaTypes,
  Macapi.CoreGraphics,
  Macapi.ImageIO,
{$ENDIF MACOS}
{$IFDEF LINUX}
  FMX.Canvas.Linux,
{$ENDIF}
  System.Classes;

  procedure TakeScreenshot(Dest: FMX.Graphics.TBitmap);
  procedure TakeWindowShot(h: TWindowHandle; Dest: FMX.Graphics.TBitmap);

{$IFDEF MSWINDOWS}
  procedure TakeWindowShotFromHWND(h: HWND; Dest: FMX.Graphics.TBitmap);
{$ENDIF MSWINDOWS}

implementation

{$IFDEF LINUX}
procedure TakeScreenshot(Dest: FMX.Graphics.TBitmap);
begin
  // Have not been tested for Linux yet
  Dest := FMX.Canvas.Linux.TakeScreenshot;
end;

procedure TakeWindowShot(h: TWindowHandle; Dest: FMX.Graphics.TBitmap);
begin
  // Have not been implemented for Linux yet
end;
{$ENDIF LINUX}

{$IFDEF ANDROID}
procedure TakeScreenshot(Dest: FMX.Graphics.TBitmap);
begin
  // Have not been implemented for Android yet
end;

procedure TakeWindowShot(h: TWindowHandle; Dest: FMX.Graphics.TBitmap);
begin
  // Have not been implemented for Android yet
end;
{$ENDIF}

{$IFDEF MSWINDOWS}

// get window width and height
procedure GetWinSz(han: HWND; out w: integer; out h: integer);
var
  rect: TRect;
begin
  GetClientRect(han, rect);
  w := rect.Width;
  h := rect.Height;
end;

procedure WriteWindowsToStream(AStream: TStream; h: HWND);
var
  dc: HDC;
  lpPal: PLOGPALETTE;
  bm: TBitmap;
  WinWidth, WinHeight: integer;
begin
  bm := TBitmap.Create;

  // full screenshot if h = 0
  if h = 0 then
  begin
    bm.Width := Screen.Width;
    bm.Height := Screen.Height;
  end else
  begin // else a window shot, not full screen
    GetWinSz(h, WinWidth, WinHeight);
    bm.Width := WinWidth;
    bm.Height := WinHeight;
  end;

  // get the window handle dc (full screen is 0)
  dc := GetDc(h);
  if (dc = 0) then
    exit;
  // do we have a palette device?
  if (GetDeviceCaps(dc, RASTERCAPS) AND RC_PALETTE = RC_PALETTE) then
  begin
    // allocate memory for a logical palette
    GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
    // zero it out to be neat
    FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0);
    // fill in the palette version
    lpPal^.palVersion := $300;
    // grab the system palette entries
    lpPal^.palNumEntries := GetSystemPaletteEntries(dc, 0, 256, lpPal^.palPalEntry);
    if (lpPal^.palNumEntries <> 0) then
      bm.Palette := CreatePalette(lpPal^); // create the palette
    FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
  end;
  // copy from the screen to the bitmap
  BitBlt(bm.Canvas.Handle, 0, 0, bm.Width, bm.Height, dc, 0, 0, SRCCOPY);

  bm.SaveToStream(AStream);

  FreeAndNil(bm);
  // release the screen dc
  ReleaseDc(0, dc);
end;

procedure TakeWindowShotFromHWND(h: HWND; Dest: FMX.Graphics.TBitmap);
var
  Stream: TMemoryStream;
begin
  try
    Stream := TMemoryStream.Create;
    WriteWindowsToStream(Stream, h);
    Stream.Position := 0;
    Dest.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TakeWindowShot(h: TWindowHandle; Dest: FMX.Graphics.TBitmap);
begin
  TakeWindowShotFromHWND(WindowHandleToPlatform(h).wnd, Dest);
end;

procedure TakeScreenshot(Dest: FMX.Graphics.TBitmap);
begin
  // 0 parameter means full screen shot
  TakeWindowShotFromHWND(0, Dest);
end;

{$ENDIF MSWINDOWS}
{$IFDEF MACOS}
{$IF NOT DECLARED(CGRectInfinite)}

const
  CGRectInfinite: CGRect = (origin: (x: - 8.98847E+30; y: - 8.98847E+307);
  size: (Width: 1.79769E+308; Height: 1.79769E+308));
{$IFEND}

function PutBytesCallback(Stream: TStream; NewBytes: Pointer; Count: LongInt): LongInt; cdecl;
begin
  Result := Stream.Write(NewBytes^, Count);
end;

procedure ReleaseConsumerCallback(Dummy: Pointer); cdecl;
begin

end;

procedure WriteCGImageToStream(const AImage: CGImageRef; AStream: TStream; const AType: string = 'public.png';
  AOptions: CFDictionaryRef = nil);
var
  Callbacks: CGDataConsumerCallbacks;
  Consumer: CGDataConsumerRef;
  ImageDest: CGImageDestinationRef;
  TypeCF: CFStringRef;
begin
  Callbacks.putBytes := @PutBytesCallback;
  Callbacks.releaseConsumer := ReleaseConsumerCallback;
  ImageDest := nil;
  TypeCF := nil;
  Consumer := CGDataConsumerCreate(AStream, @Callbacks);
  if Consumer = nil then
    RaiseLastOSError;
  try
    TypeCF := CFStringCreateWithCharactersNoCopy(nil, PChar(AType), Length(AType), kCFAllocatorNull);
    // wrap the Delphi string in a CFString shell
    ImageDest := CGImageDestinationCreateWithDataConsumer(Consumer, TypeCF, 1, AOptions);
    if ImageDest = nil then
      RaiseLastOSError;
    CGImageDestinationAddImage(ImageDest, AImage, nil);
    if CGImageDestinationFinalize(ImageDest) = 0 then
      RaiseLastOSError;
  finally
    if ImageDest <> nil then
      CFRelease(ImageDest);
    if TypeCF <> nil then
      CFRelease(TypeCF);
    CGDataConsumerRelease(Consumer);
  end;
end;

procedure TakeScreenshot(Dest: TBitmap);
var
  Screenshot: CGImageRef;
  Stream: TMemoryStream;
begin
  Stream := nil;
  Screenshot := CGWindowListCreateImage(CGRectInfinite, kCGWindowListOptionOnScreenOnly, kCGNullWindowID,
    kCGWindowImageDefault);
  if Screenshot = nil then
    RaiseLastOSError;
  try
    Stream := TMemoryStream.Create;
    WriteCGImageToStream(Screenshot, Stream);
    Stream.Position := 0;
    Dest.LoadFromStream(Stream);
  finally
    CGImageRelease(Screenshot);
    Stream.Free;
  end;
end;

procedure TakeWindowShot(h: TWindowHandle; Dest: FMX.Graphics.TBitmap);
var
  Screenshot: CGImageRef;
  Stream: TMemoryStream;
begin
  Stream := nil;
  // todo: window handle if logic
  Screenshot := CGWindowListCreateImage(CGRectInfinite, kCGWindowListOptionOnScreenOnly, kCGNullWindowID,
    kCGWindowImageDefault);
  if Screenshot = nil then
    RaiseLastOSError;
  try
    Stream := TMemoryStream.Create;
    WriteCGImageToStream(Screenshot, Stream);
    Stream.Position := 0;
    Dest.LoadFromStream(Stream);
  finally
    CGImageRelease(Screenshot);
    Stream.Free;
  end;
end;

{$ENDIF MACOS}

end.
