program Pomodoro;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
