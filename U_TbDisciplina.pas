unit U_TbDisciplina;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls,
     DBTables;
     
type
  TFrm_TbDisciplina = class(TForm)
    Pnl_CentroCusto: TPanel;
    Lbl_Descricao: TLabel;
    Btn_Gravar: TButton;
    Btn_Excluir: TButton;
    Btn_Sair: TButton;
    Lbl_Titulo: TLabel;
    Edt_discdesc: TEdit;
    Btn_cancela: TButton;
    Btn_Pesquisa: TButton;
    Tlb_Navegador: TToolBar;
    SPB_help: TSpeedButton;
    Grb_CentroCusto: TGroupBox;
    Label1: TLabel;
    Edt_disccodg: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Btn_GravarClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure Atribuiregistro;
    procedure limpavariavel(WCodigo: string);
    procedure Btn_cancelaClick(Sender: TObject);
    procedure Btn_PesquisaClick(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VerAlteracoes(Sender: TObject);
    procedure SPB_helpClick(Sender: TObject);
    procedure Edt_disccodgExit(Sender: TObject);
  end;

var Frm_TbDisciplina: TFrm_TbDisciplina;
    wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_Principal, U_PesqIncremento;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LimpaVariavel('');
     Edt_disccodg.setfocus;
end;

procedure TFrm_TbDisciplina.Edt_disccodgExit(Sender: TObject);
begin
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_DISCIPLINA','where disccodg=:wdisccodg',
     [Edt_disccodg.Text]) then Atribuiregistro
     else Limpavariavel(Edt_disccodg.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if TestaCampoVazio then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação da disciplina ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro;
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
               end;
               wAlterouReg:=false;
               Edt_disccodg.SetFocus;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.GravaRegistro;
//------------------------------------------------------------------------------
var wacessohistorico : string;
begin
     with Frm_Modulo.IBQ_funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from TB_DISCIPLINA','where disccodg=:wdisccodg',
          [Edt_disccodg.Text]) then
          begin
               //wacessohistorico := '0025';
               close;
               Sql.clear;
               Sql.add('insert into TB_DISCIPLINA (disccodg,discdesc)');
               Sql.add('values (:wdisccodg,:wdiscdesc)');
          end
          else
          begin
               //wacessohistorico := '0026';
               close;
               Sql.clear;
               Sql.add('update TB_DISCIPLINA set discdesc=:wdiscdesc');
               Sql.add('where disccodg=:wdisccodg');
          end;
          parambyname('wdisccodg').AsString := Edt_disccodg.text;
          parambyname('wdiscdesc').AsString := Edt_discdesc.Text;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Edt_disccodg.text) = '' then
     begin
          aFuncoes.MessageDlgDef('É necessário selecionar uma disciplina...',
          mtInformation,[mbOk], mrok, 0);
          Edt_disccodg.setfocus;
     end
     else if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_DISCIPLINA','where disccodg=:wdisccodg',
     [Edt_disccodg.Text]) then
          aFuncoes.MessageDlgDef(
          'Esta disciplina não está registrada você pode cancelá-la...',
          mtInformation,[mbOk], mrok, 0)
     else If aFuncoes.MessageDlgDef('Confirma a exclusão desta disciplina ?',
     mtConfirmation, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB(
             'delete from TB_DISCIPLINA where disccodg=:wchave',
             [Edt_disccodg.Text]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             Limpavariavel('');
             Edt_disccodg.SetFocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_disccodg.setfocus;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbDisciplina.limpavariavel(WCodigo: string);
//------------------------------------------------------------------------------
begin
     Edt_disccodg.text:=WCodigo;
     Edt_discdesc.Text  :='';
     if WCodigo = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Frm_PesqIncremento.AbrePesquisa(
     'select disccodg,discdesc from TB_DISCIPLINA where ',
     ['Código','Disciplina'],'oa',[0],['disccodg','discdesc'],1,
     ['S','S'],'') = mrOk) and (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_funcoes,'Select * from TB_DISCIPLINA',
     'where disccodg=:wdisccodg',[Frm_PesqIncremento.Retorno])) then
     begin
          Atribuiregistro;
          Edt_disccodg.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure TFrm_TbDisciplina.Atribuiregistro;
//------------------------------------------------------------------------------
begin
    With Frm_Modulo.IBQ_funcoes do
    Begin
       Edt_disccodg.Text := Fieldbyname('disccodg').AsString;
       Edt_discdesc.Text := Fieldbyname('discdesc').AsString;
    end;
    wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Close;
end;

//------------------------------------------------------------------------------
function TFrm_TbDisciplina.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_disccodg.text,'o código da disciplina') then
          Edt_disccodg.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_discdesc.text,
     'a descrição da disciplina') then
          Edt_discdesc.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.VerAlteracoes(Sender: TObject);
//------------------------------------------------------------------------------
begin wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.FormCloseQuery(Sender:TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente da disciplina foi alterado, se você sair as '+
          #13+'alterações não serão salvas. Deseja sair ?', mtConfirmation,
             [mbNo, mbYes], mrNo, 0) = mrNo then
             canclose:=false;
     end;
     if canclose then
     begin
          Frm_Modulo.IBQ_funcoes.close;
          Frm_PesqIncremento.Qry_Pesquisa.close;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_TbDisciplina.SPB_helpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_CentroCusto.Handle,'Ajuda.Hlp',HELP_CONTEXT,10);
end;

end.
