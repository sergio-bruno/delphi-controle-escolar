unit U_Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, RXCtrls, jpeg;

type
  TFrm_Splash = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
  end;

var
  Frm_Splash: TFrm_Splash;

implementation

uses U_Principal;

{$R *.DFM}

end.
