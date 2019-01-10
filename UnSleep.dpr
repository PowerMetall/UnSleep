program UnSleep;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {NoSleep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TNoSleep, NoSleep);
  Application.Run;
end.
