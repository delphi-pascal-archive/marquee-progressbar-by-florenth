unit UFrmDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,

  XPMan, // íåîáõîäèìî, èíà÷å íå áóäåò ðàáîòàòü

  ExProgressBar; // ExProgressBar: derniere déclaration des uses
                 // (enfin, l'important, c'est que ce soit APRES ExtCtrls)

type
  TForm1 = class(TForm)
    PB1: TProgressBar;
    PB2: TProgressBar;
    TimerAnim: TTimer;
    BtnActivate: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtnActivateClick(Sender: TObject);
    procedure TimerAnimTimer(Sender: TObject);
  private
    FActive: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnActivateClick(Sender: TObject);
begin
  {>> Inversion de l'état }
  FActive := not FActive;
  {>> Démarrage pour le mode classique }
  TimerAnim.Enabled := FActive;
  {>> Démarrage pour le mode "marquee" }
  PB2.Marquee := FActive;
end;

procedure TForm1.TimerAnimTimer(Sender: TObject);
begin
  {>> Animation classique }
  PB1.StepIt;
  if PB1.Position>=PB1.Max
  then PB1.Position:=PB1.Min;
end;

end.
