unit U_BaixaMensalidadeGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, FnpNumericEdit, DB;

type
  TFrm_BaixaMensalidadeGeral = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edt_mens_ano: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    edt_mens_mes: TEdit;
    Label2: TLabel;
    Fne_mensvlpg: TFnpNumericEdit;
    Label4: TLabel;
    Label5: TLabel;
    mke_mensdtpg: TMaskEdit;
    procedure edt_mens_mesKeyPress(Sender: TObject; var Key: Char);
    procedure LimpaVariavel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mke_mensdtvcExit(Sender: TObject);
    procedure edt_mens_anoExit(Sender: TObject);
    procedure edt_mens_mesExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro;
  end;

var
  Frm_BaixaMensalidadeGeral: TFrm_BaixaMensalidadeGeral;

implementation

uses u_funcoes, U_Modulo, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_BaixaMensalidadeGeral.edt_mens_mesKeyPress(Sender: TObject; var Key:
          Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_BaixaMensalidadeGeral.LimpaVariavel;
begin
     Edt_mens_mes.Text  := '';
     Edt_mens_ano.Text  := formatfloat('0000',YearOf(Date));
     Fne_mensvlpg.value := 0;
     mke_mensdtpg.text  := datetostr(date);
end;


procedure TFrm_BaixaMensalidadeGeral.FormShow(Sender: TObject);
begin
     LimpaVariavel;
     edt_mens_mes.SetFocus;
end;

procedure TFrm_BaixaMensalidadeGeral.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_BaixaMensalidadeGeral.FormClose(Sender: TObject; var Action:
          TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
end;

procedure TFrm_BaixaMensalidadeGeral.Mke_mensdtvcExit(Sender: TObject);
begin
     if not aFuncoes.ValidaData( (Sender as TMaskEdit).text ) then
        (Sender as TMaskEdit).setfocus;
end;

procedure TFrm_BaixaMensalidadeGeral.edt_mens_anoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(edt_mens_ano.Text) THEN
        edt_mens_ano.SETFOCUS;
end;

procedure TFrm_BaixaMensalidadeGeral.edt_mens_mesExit(Sender: TObject);
begin
     if not aFuncoes.ValidaMes(edt_mens_mes.Text) THEN
        edt_mens_mes.SETFOCUS;
end;

procedure TFrm_BaixaMensalidadeGeral.Button1Click(Sender: TObject);
begin
     if TestaCampoVazio then
     begin
          // alterar este registro
          If (aFuncoes.MessageDlgDef('Confirma a baixa dados desta mensalidade ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             GravaRegistro;
             Frm_Modulo.IBT_Transaction.CommitRetaining;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_BaixaMensalidadeGeral.GravaRegistro;
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          begin
               close;
               Sql.clear;
               Sql.add('UPDATE TB_MENSALIDADE SET MENSDTPG=:WMENSDTPG,');
               Sql.add('MENSVLPG=:WMENSVLPG,MENSPAGO=:WMENSPAGO');
               Sql.add('WHERE MENS_ANO=:WMENS_ANO AND MENS_MES=:WMENS_MES');
          end;
          parambyname('WMENS_ANO').asstring   := edt_mens_ano.Text;
          parambyname('WMENS_MES').asstring   := edt_mens_mes.Text;
          parambyname('WMENSVLPG').asfloat    := fne_mensvlpg.value;
          parambyname('WMENSDTPG').asdatetime := aFuncoes.ResultaDataGravar(
                                                 mke_mensdtpg.Text);
          parambyname('WMENSPAGO').asstring   := 'S';
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
function TFrm_BaixaMensalidadeGeral.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_mens_mes.text,'o mês da mensalidade') then
          Edt_mens_mes.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_mens_ano.text,'o ano da mensalidade') then
          Edt_mens_ano.SetFocus
     else if not aFuncoes.TestaCampoVazio(Mke_mensdtpg.text,'a data de pagamento') then
          Mke_mensdtpg.SetFocus
     else Result:=True;
end;

end.
