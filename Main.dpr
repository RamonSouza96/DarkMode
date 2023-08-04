program Main;

uses
  System.StartUpCopy,
  FMX.Forms,
  DarkMode in 'DarkMode.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
