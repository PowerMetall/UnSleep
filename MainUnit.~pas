unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, XPMan;

type
  TNoSleep = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button3: TButton;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure MyMessage(var Msg: TMessage); message WM_USER + 1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NoSleep: TNoSleep;
  // t: integer;
  NotifyIconData: TNotifyIconDataA;

implementation

{$R *.dfm}
//****************************************************************************************

procedure TNoSleep.MyMessage(var Msg: TMessage);
begin
   if Msg.WParam = 1 then
      // ¬осстанавливаем по двойному щелчку по иконке
      if Msg.LParam = WM_LBUTTONDBLCLK then begin
         Application.Restore;
         Application.BringToFront;
         ShowWindow(Application.Handle, SW_SHOW);
         Shell_NotifyIcon(NIM_DELETE, @NotifyIconData);
      end;
end;
//****************************************************************************************
procedure TNoSleep.Button1Click(Sender: TObject);
  var lLastInpInfo: TLastInputInfo;
begin
    Timer1.Enabled:=True;
   // t:=0;
end;
//****************************************************************************************
procedure TNoSleep.Button2Click(Sender: TObject);
begin
    Timer1.Enabled:=False;
   // t:=StrToInt(Edit1.Text);
end;
//****************************************************************************************
procedure TNoSleep.Timer1Timer(Sender: TObject);
  var lLastInpInfo: TLastInputInfo;
      Pt: TPoint;
begin
  ZeroMemory( @lLastInpInfo, SizeOf( lLastInpInfo ));
  lLastInpInfo.cbSize := SizeOf( lLastInpInfo );
  if GetLastInputInfo(lLastInpInfo) then
      begin
        Edit2.Text:=IntToStr(GetTickCount - lLastInpInfo.dwTime);
      end;
  if (GetTickCount - lLastInpInfo.dwTime) >= StrToInt(Edit1.Text) then
      begin
        GetCursorPos(Pt);
        Mouse_Event(0, pt.x, pt.y, 0, 0);
      end;
  if StrToInt(Edit2.Text) < StrToInt(Edit1.Text) then
      begin
      end;
  //t:=t+Timer1.Interval;
  //Edit3.Text:=IntToStr(t);
end;
//****************************************************************************************
procedure TNoSleep.FormCreate(Sender: TObject);
begin
   with NotifyIconData do begin
      cbSize := SizeOf(NotifyIconData);
      Wnd := NoSleep.Handle;
      uID := 1;
      uFlags := NIF_MESSAGE or  NIF_ICON or NIF_TIP;
      uCallbackMessage := WM_USER + 1;
      hIcon := Application.Icon.Handle;
      szTip := 'ƒвойной клик - восстановить окно';
   end;
end;

procedure TNoSleep.Button3Click(Sender: TObject);
begin
   Application.Minimize;
   ShowWindow(Application.Handle, SW_HIDE);
   Shell_NotifyIcon(NIM_ADD, @NotifyIconData);
end;
//****************************************************************************************
end.
