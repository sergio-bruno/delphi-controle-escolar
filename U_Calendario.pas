unit U_Calendario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TFrm_Calendario = class(TForm)
    Pnl_Calendario: TPanel;
    Btn_Sair: TButton;
    Panel1: TPanel;
    SPB_help: TSpeedButton;
    Panel2: TPanel;
    Mtc_Acc200: TMonthCalendar;
    procedure Btn_SairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SPB_helpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Calendario: TFrm_Calendario;

implementation

uses U_Principal;

{$R *.DFM}

//-----------------------------------------------------------------------
procedure TFrm_Calendario.Btn_SairClick(Sender: TObject);
//-----------------------------------------------------------------------
begin
     close;
end;

//-----------------------------------------------------------------------
procedure TFrm_Calendario.FormKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
//-----------------------------------------------------------------------
begin
     if Key = 27 then close
     else if key = 112 then WinHelp(TFrm_calendario.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,23);
end;

procedure TFrm_Calendario.FormShow(Sender: TObject);
begin
     Mtc_Acc200.Date := Date;
     Frm_calendario.Caption := Frm_Principal.wNomeEmpresa;
end;

procedure TFrm_Calendario.SPB_helpClick(Sender: TObject);
begin
     WinHelp(TFrm_calendario.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,23);
end;

end.
