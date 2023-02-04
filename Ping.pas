unit Ping;

interface

uses WinSock;

function PingHost(const HostName: AnsiString; TimeoutMS: cardinal = 900): boolean;

implementation

uses Windows, SysUtils;

function IcmpCreateFile: THandle; stdcall; external 'iphlpapi.dll';
function IcmpCloseHandle(icmpHandle: THandle): boolean; stdcall;
external 'iphlpapi.dll';
function IcmpSendEcho(icmpHandle: THandle; DestinationAddress: In_Addr;
RequestData: Pointer; RequestSize: Smallint; RequestOptions: Pointer;
ReplyBuffer: Pointer; ReplySize: DWORD; Timeout: DWORD): DWORD; stdcall;
external 'iphlpapi.dll';

type
TEchoReply = packed record
Addr: In_Addr;
Status: DWORD;
RoundTripTime: DWORD;
end;

PEchoReply = ^TEchoReply;

var
WSAData: TWSAData;

procedure Startup;
begin
if WSAStartup(MAKEWORD(2, 2), WSAData) <> 0 then
raise Exception.Create('WSAStartup');
end;

procedure Cleanup;
begin
if WSACleanup <> 0 then
raise Exception.Create('WSACleanup');
end;

function PingHost(const HostName: AnsiString; TimeoutMS: cardinal = 900): boolean;
const
rSize = $400;
var
h: THandle;
d: string;
r: array [0 .. rSize - 1] of byte;
i: cardinal;
Addr: TSockAddrIn;
AddrInfo: PHostEnt;
begin
Startup;
AddrInfo := gethostbyname(PAnsiChar(HostName));
if AddrInfo = nil then
RaiseLastOSError;
try
h := IcmpCreateFile;
if h = INVALID_HANDLE_VALUE then
RaiseLastOSError;
try
d := FormatDateTime('yyyymmddhhnnsszzz', Now);
Addr.sin_addr.s_addr := PInAddr(AddrInfo^.h_addr_list^)^.S_addr;
i := IcmpSendEcho(h, Addr.sin_addr, PChar(d), Length(d), nil, @r[0], rSize, TimeoutMS);
Result := (i <> 0) and (PEchoReply(@r[0]).Status = 0);
finally
IcmpCloseHandle(h);
end;
finally
Cleanup;
end;
end;

end.

