unit U_BaixaMensalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, FnpNumericEdit, DB;

type
  TFrm_BaixaMensalidade = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Spb_localizaaluno: TSpeedButton;
    edt_mens_ano: TEdit;
    edt_mensalun: TEdit;
    pnl_nomealuno: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    edt_mens_mes: TEdit;
    Label2: TLabel;
    Fne_mensvlpg: TFnpNumericEdit;
    Mke_mensdtvc: TMaskEdit;
    Label16: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mke_mensdtpg: TMaskEdit;
    chk_menspago: TCheckBox;
    Edt_serie: TEdit;
    Label6: TLabel;
    Spb_LocalizaSerie: TSpeedButton;
    procedure edt_mens_mesKeyPress(Sender: TObject; var Key: Char);
    procedure AtribuiVariavel(WPQuery : TDataSet);
    procedure LimpaVariavel(WPAno, WPMes, WPAluno : string);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Mke_mensdtvcExit(Sender: TObject);
    procedure edt_mens_anoExit(Sender: TObject);
    procedure edt_mens_mesExit(Sender: TObject);
    procedure edt_mensalunExit(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
    procedure RetornaSaidas;
    procedure Button1Click(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro(WPTipo: integer);
    procedure Button4Click(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
  end;

var
  Frm_BaixaMensalidade: TFrm_BaixaMensalidade;

implementation

uses u_funcoes, U_Modulo, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_BaixaMensalidade.edt_mens_mesKeyPress(Sender: TObject; var Key:
          Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_BaixaMensalidade.AtribuiVariavel(WPQuery : TDataSet);
begin
     with WPQuery do
     begin
          Edt_mens_mes.Text     := fieldbyname('mens_mes').asstring;
          Edt_mens_ano.Text     := fieldbyname('mens_ano').asstring;
          if trim(Edt_mens_ano.Text) = '' then
             Edt_mens_ano.Text := formatfloat('0000',YearOf(Date));
          Edt_mensalun.Text     := fieldbyname('mensalun').asstring;
          Pnl_nomealuno.caption := afuncoes.RetornaDescricao(
                                   'select * from tb_aluno',
                                   'where alunmatr=:wc',Edt_mensalun.Text,
                                   'alunnome');
          Fne_mensvlpg.value    := fieldbyname('mensvlpg').asfloat;
          mke_mensdtvc.text     := aFuncoes.RetornaDataStr(Fieldbyname(
                                   'mensdtvc').Asdatetime);


          mke_mensdtpg.text     := aFuncoes.RetornaDataStr(Fieldbyname(
                                   'mensdtpg').Asdatetime);
          if trim(mke_mensdtpg.text) = '/  /' then
             mke_mensdtpg.text  := datetostr(date);

          chk_menspago.checked  := afuncoes.EntraSN_RetVF(fieldbyname(
                                   'menspago').asstring);
     end;
end;

procedure TFrm_BaixaMensalidade.LimpaVariavel(WPAno, WPMes, WPAluno : string);
begin
     Edt_mens_mes.Text     := WPMes;
     Edt_mens_ano.Text     := WPAno;
     if trim(Edt_mens_ano.Text) = '' then
        Edt_mens_ano.Text := formatfloat('0000',YearOf(Date));
     Edt_mensalun.Text     := WPAluno;
     Pnl_nomealuno.caption := afuncoes.RetornaDescricao(
                              'select * from tb_aluno','where alunmatr=:wc',
                              Edt_mensalun.Text,'alunnome');
     Fne_mensvlpg.value    := 0;
     mke_mensdtvc.text     := '';
     mke_mensdtpg.text     := datetostr(date);
     chk_menspago.checked  := true;
     edt_serie.Text        := '';
end;


procedure TFrm_BaixaMensalidade.FormShow(Sender: TObject);
begin
     if trim(edt_mens_mes.Text) <> '' then
          fne_mensvlpg.SetFocus
     else edt_mens_mes.SetFocus;
end;

procedure TFrm_BaixaMensalidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_BaixaMensalidade.FormClose(Sender: TObject; var Action:
          TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
     // ATUALIZAR A LISTA DE MATRICULA
     Frm_Modulo.IBQ_Mensalidade.close;
     Frm_Modulo.IBQ_Mensalidade.open;
end;

procedure TFrm_BaixaMensalidade.Mke_mensdtvcExit(Sender: TObject);
begin
     if not aFuncoes.ValidaData( (Sender as TMaskEdit).text ) then
        (Sender as TMaskEdit).setfocus;
end;

procedure TFrm_BaixaMensalidade.edt_mens_anoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(edt_mens_ano.Text) THEN
        edt_mens_ano.SETFOCUS
     else RetornaSaidas;
end;

procedure TFrm_BaixaMensalidade.edt_mens_mesExit(Sender: TObject);
begin
     if not aFuncoes.ValidaMes(edt_mens_mes.Text) THEN
        edt_mens_mes.SETFOCUS
     else RetornaSaidas;
end;

procedure TFrm_BaixaMensalidade.edt_mensalunExit(Sender: TObject);
begin
     if (Trim(Edt_mensalun.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_aluno','where alunmatr=:wcodg',[Edt_mensalun.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do aluno informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_mensalun.setfocus;
          end
          else
          begin
               Pnl_nomealuno.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                        'alunnome').AsString;
               RetornaSaidas;
          end;
     end
     else Pnl_nomealuno.caption := '';
end;

procedure TFrm_BaixaMensalidade.Spb_localizaalunoClick(Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_BaixaMensalidade.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
var wselect : string;
begin
     edt_mensalun.Setfocus;
     if trim(edt_serie.text) = '' then
     begin
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          edt_mensalun.text := Frm_PesqIncremento.Retorno;
     end
     else
     begin
        wselect := 'SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRICULA, TB_ALUNO';
        if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
        wselect,'where MATRALUN=ALUNMATR AND MATRSERI=:W1',
        [edt_serie.Text]) then
           wselect := 'SELECT DISTINCT MATRALUN,ALUNNOME FROM TB_MATRCONCEITO, TB_ALUNO';
        if Frm_PesqIncremento.AbrePesquisa(wselect+
        ' WHERE MATRALUN=ALUNMATR AND MATRSERI='''+edt_serie.Text+''' AND ',
        ['Código','Aluno'],'oo',[0],['MATRALUN','ALUNNOME'],1,['S','S'],
        WPPrimLetra) = mrOk then
          edt_mensalun.text := Frm_PesqIncremento.Retorno;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_BaixaMensalidade.RetornaSaidas;
begin
     if (trim(edt_mens_ano.text) <> '') and (trim(edt_mens_mes.text) <> '') and
     (trim(edt_mensalun.text) <> '') then
     begin
          if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from TB_MENSALIDADE',
          'where MENS_ANO=:WA and MENS_MES=:WM and MENSALUN=:WD',
          [edt_mens_ano.text,edt_mens_mes.Text,edt_mensalun.text]) then
               AtribuiVariavel(Frm_Modulo.IBQ_funcoes)
          else LimpaVariavel(edt_mens_ano.Text,edt_mens_mes.text,Edt_mensalun.text);
     end;
end;

procedure TFrm_BaixaMensalidade.Button1Click(Sender: TObject);
begin
     if TestaCampoVazio then
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.ibq_funcoes,
          'Select * from tb_mensalidade',
          'where mens_ano=:wa and mens_mes=:wm and mensalun=:wd',
          [Edt_mens_ano.Text,Edt_mens_mes.text,edt_mensalun.text]) then
          begin
               // incluir este registro
               If (aFuncoes.MessageDlgDef('Estes dados não constam nos registros deseja acrescentá-los ?',
               mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro(0);
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
          end
          else
          // alterar este registro
          If (aFuncoes.MessageDlgDef('Confirma a alteração nos dados desta mensalidade ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             GravaRegistro(1);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_BaixaMensalidade.GravaRegistro(WPTipo: integer);
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          case WPTipo of
          0:
          begin
               close;
               Sql.clear;
               Sql.add('INSERT INTO TB_MENSALIDADE (MENS_ANO,MENS_MES,MENSALUN,');
               Sql.add('MENSDTPG,MENSVLPG,MENSDTVC,MENSPAGO)');
               Sql.add('values (:WMENS_ANO,:WMENS_MES,:WMENSALUN,');
               Sql.add(':WMENSDTPG,:WMENSVLPG,:WMENSDTVC,:WMENSPAGO)');
          end;
          1:
          begin
               close;
               Sql.clear;
               Sql.add('UPDATE TB_MENSALIDADE SET MENSDTPG=:WMENSDTPG,');
               Sql.add('MENSVLPG=:WMENSVLPG,MENSDTVC=:WMENSDTVC,MENSPAGO=:WMENSPAGO');
               Sql.add('WHERE MENS_ANO=:WMENS_ANO AND MENS_MES=:WMENS_MES AND MENSALUN=:WMENSALUN');
          end;
          end;
          parambyname('WMENS_ANO').asstring   := edt_mens_ano.Text;
          parambyname('WMENS_MES').asstring   := edt_mens_mes.Text;
          parambyname('WMENSALUN').asstring   := edt_mensalun.Text;
          parambyname('WMENSVLPG').asfloat    := fne_mensvlpg.value;
          parambyname('WMENSDTVC').asdatetime := aFuncoes.ResultaDataGravar(
                                                 mke_mensdtvc.Text);
          parambyname('WMENSDTPG').asdatetime := aFuncoes.ResultaDataGravar(
                                                 mke_mensdtpg.Text);
          parambyname('WMENSPAGO').asstring   := afuncoes.EntraVF_RetSN(
                                                 chk_menspago.checked);
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
function TFrm_BaixaMensalidade.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_mens_mes.text,'o mês da mensalidade') then
          Edt_mens_mes.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_mens_ano.text,'o ano da mensalidade') then
          Edt_mens_ano.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_mensalun.text,'a matrícula do aluno') then
          Edt_mensalun.SetFocus
     else if not aFuncoes.TestaCampoVazio(Mke_mensdtvc.text,'a data de vencimento') then
          Mke_mensdtvc.SetFocus
     else Result:=True;
end;

procedure TFrm_BaixaMensalidade.Button4Click(Sender: TObject);
begin
     if (TestaCampoVazio) and (aFuncoes.MessageDlgDef(
     'Confirma a exclusão desta mensalidade ?',mtConfirmation,[mbCancel,
     mbYes], mryes, 0) = mrYes) then
     try
        If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
           Frm_Modulo.IBT_Transaction.StartTransaction;
        afuncoes.STOperaRegistrosIB(
        'delete from tb_mensalidade where mens_ano=:wa and mens_mes=:wm and mensalun=:wd',
        [Edt_mens_ano.Text,Edt_mens_mes.text,edt_mensalun.text]);
        Frm_Modulo.IBT_Transaction.CommitRetaining;
        Limpavariavel('','','');
        Edt_mens_ano.SetFocus;
     except
        Frm_Modulo.IBT_Transaction.rollback;
        aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
        mtWarning, [mbok],mrok, 0);
     end;
end;

procedure TFrm_BaixaMensalidade.Edt_serieExit(Sender: TObject);
begin
     if (Trim(Edt_serie.text) <> '') and not (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_Funcoes,'Select * from tb_serie','where sericodg=:wcodg',
     [Edt_serie.Text])) then
     begin
          aFuncoes.MessageDlgDef('Código da série informado inválido...',
          mtInformation,[mbok],mrok,0);
          Edt_serie.setfocus;
     end;
end;

end.
