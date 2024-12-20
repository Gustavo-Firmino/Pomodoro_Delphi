unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    Tempo: TTimer;
    LbMinutos: TLabel;
    LbSegundos: TLabel;
    MdPlayer: TMediaPlayer;
    LbSeparador: TLabel;
    SpBtnIniciar: TSpeedButton;
    Panel1: TPanel;
    SpBtnPausar: TSpeedButton;
    OpenDialog: TOpenDialog;
    SpBtnAudio: TSpeedButton;
    TxtTempo: TEdit;
    procedure TempoTimer(Sender: TObject);
    procedure SpBtnIniciarClick(Sender: TObject);
    procedure SpBtnAudioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpBtnAudioClick(Sender: TObject);
begin
     if OpenDialog.Execute then
      begin
           MdPlayer.FileName := OpenDialog.FileName;
      end;
end;

procedure TForm1.SpBtnIniciarClick(Sender: TObject);
begin
     Tempo.Enabled := True;
end;

procedure TForm1.TempoTimer(Sender: TObject);
Var Min, Seg, Contador : Integer;
begin
     Min := strToInt(LbMinutos.Caption);
     Seg := strToInt(LbSegundos.Caption);

     Contador := Seg + 1;

     LbSegundos.Caption := intToStr(Contador);

     if LbSegundos.Caption = '60' then
      begin
           LbSegundos.Caption := '0';
           LbMinutos.Caption  := intToStr(strToInt(LbMinutos.Caption) + 1);
      end;

     if LbSegundos.Caption = TxtTempo.Text then
      begin
           Tempo.Enabled := False;
           MdPlayer.Open;
           MdPlayer.Play;
      end;


end;

end.
