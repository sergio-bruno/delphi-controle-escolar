unit U_EditaGerenciamentoAlunoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Spin, FnpNumericEdit, Grids,
  DBGrids;

type
  TFrm_EditaGerenciamentoAlunoC = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Edt_Ano: TEdit;
    Label2: TLabel;
    Edt_serie: TEdit;
    Spb_LocalizaSerie: TSpeedButton;
    Pnl_descricaoserie: TPanel;
    Label3: TLabel;
    edt_aluno: TEdit;
    Spb_localizaaluno: TSpeedButton;
    pnl_nomealuno: TPanel;
    Label4: TLabel;
    edt_disciplina: TEdit;
    spb_localizadisciplina: TSpeedButton;
    pnl_descricaodisciplina: TPanel;
    Label5: TLabel;
    edt_professor: TEdit;
    spb_localizaprofessor: TSpeedButton;
    pnl_nomeprofessor: TPanel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edt_matr1bct: TEdit;
    edt_matr2bct: TEdit;
    edt_matr3bct: TEdit;
    edt_matr4bct: TEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    edt_matrconc: TEdit;
    SpeedButton1: TSpeedButton;
    Pnl_DescricaoConceito: TPanel;
    edt_matr1bnt: TEdit;
    Button3: TButton;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edt_matr2bnt: TEdit;
    Label11: TLabel;
    edt_matr3bnt: TEdit;
    Label12: TLabel;
    edt_matr4bnt: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_alunoExit(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
    procedure edt_disciplinaExit(Sender: TObject);
    procedure spb_localizadisciplinaClick(Sender: TObject);
    procedure LocalizaDisciplina(WPPrimLetra: string);
    procedure edt_professorExit(Sender: TObject);
    procedure spb_localizaprofessorClick(Sender: TObject);
    procedure LocalizaProfessor(WPPrimLetra: string);
    procedure RetornaSaidas;
    procedure AtribuiVariavel;
    procedure LimpaVariavel(WPAno, WPSerie,WPAluno, WPDisciplina : string);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro(WPTipo: integer);
    procedure Button4Click(Sender: TObject);
    procedure edt_matr1bctKeyPress(Sender: TObject; var Key: Char);
    procedure edt_matr1bntKeyPress(Sender: TObject; var Key: Char);
    procedure FiltraTabelaConceito(WPAno, WPSerie, WPAluno : string);
    procedure Button3Click(Sender: TObject);
    procedure GravaRegistroC(WPTipo: integer);
    procedure LocalizaConceito(WPPrimLetra: string);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LimpavariavelConceito;
    procedure edt_matrconcExit(Sender: TObject);
  end;

var Frm_EditaGerenciamentoAlunoC: TFrm_EditaGerenciamentoAlunoC;
    wprofAtual : string;

implementation

uses U_Modulo, U_PesqIncremento, U_Funcoes, U_Principal,
     U_PedeSenhaFuncUsua;

{$R *.dfm}

procedure TFrm_EditaGerenciamentoAlunoC.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS
     else RetornaSaidas;
end;

procedure TFrm_EditaGerenciamentoAlunoC.RetornaSaidas;
begin
     if (trim(edt_ano.text) <> '') and (trim(edt_serie.text) <> '') and
     (trim(edt_aluno.text) <> '') and (trim(edt_disciplina.text) <> '') then
     begin
          if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from tb_MatrConceito',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
          [Edt_ano.text,Edt_serie.Text,Edt_aluno.text,edt_disciplina.text]) then
               AtribuiVariavel
          else LimpaVariavel(Edt_ano.text,Edt_serie.Text,Edt_aluno.text,
               edt_disciplina.text);
     end;
end;

procedure TFrm_EditaGerenciamentoAlunoC.AtribuiVariavel;
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          Edt_ano.Text        := fieldbyname('matr_ano').asstring;
          Edt_serie.Text      := fieldbyname('matrseri').asstring;
          Pnl_descricaoserie.caption := afuncoes.RetornaDescricao(
                                        'select * from tb_serie',
                                        'where sericodg=:wc',Edt_serie.Text,
                                        'seridesc');
          Edt_aluno.Text      := fieldbyname('matralun').asstring;
          Pnl_nomealuno.caption := afuncoes.RetornaDescricao(
                                   'select * from tb_aluno',
                                   'where alunmatr=:wc',Edt_aluno.Text,
                                   'alunnome');
          Edt_disciplina.Text := fieldbyname('matrdisc').asstring;
          Pnl_descricaodisciplina.caption := afuncoes.RetornaDescricao(
                                          'select * from tb_disciplina',
                                          'where disccodg=:wc',Edt_disciplina.Text,
                                          'discdesc');
          Edt_professor.Text := fieldbyname('matragen').asstring;
          Pnl_nomeprofessor.caption := afuncoes.RetornaDescricao(
                                       'select * from tb_funcionario',
                                       'where agencodg=:wc',Edt_professor.Text,
                                       'agennome');
          edt_matr1bct.text := fieldbyname('matr1bct').asstring;
          edt_matr2bct.text := fieldbyname('matr2bct').asstring;
          edt_matr3bct.text := fieldbyname('matr3bct').asstring;
          edt_matr4bct.text := fieldbyname('matr4bct').asstring;
          FiltraTabelaConceito(Edt_ano.Text,Edt_serie.Text,Edt_aluno.Text);
          LimpavariavelConceito;
     end;
end;

procedure TFrm_EditaGerenciamentoAlunoC.LimpavariavelConceito;
begin
     edt_matrconc.text             := '';
     pnl_descricaoconceito.caption := '';
     edt_matr1bnt.text             := '';
     edt_matr2bnt.text             := '';
     edt_matr3bnt.text             := '';
     edt_matr4bnt.text             := '';
end;

procedure TFrm_EditaGerenciamentoAlunoC.FiltraTabelaConceito(WPAno, WPSerie,
          WPAluno : string);
begin
     with Frm_modulo.IBQ_MatrTabConceito do
     begin
          close;
          parambyname('wmatr_ano').asstring := WPAno;
          parambyname('wmatrseri').asstring := WPSerie;
          parambyname('wmatralun').asstring := WPAluno;
          if not prepared then prepare;
          open;
     end;
end;

procedure TFrm_EditaGerenciamentoAlunoC.LimpaVariavel(WPAno, WPSerie,WPAluno,
          WPDisciplina : string);
begin
          Edt_ano.Text        := WPAno;
          Edt_serie.Text      := WPSerie;
          Pnl_descricaoserie.caption := afuncoes.RetornaDescricao(
                                        'select * from tb_serie',
                                        'where sericodg=:wc',Edt_serie.Text,
                                        'seridesc');
          Edt_aluno.Text      := WPAluno;
          Pnl_nomealuno.caption := afuncoes.RetornaDescricao(
                                   'select * from tb_aluno',
                                   'where alunmatr=:wc',Edt_aluno.Text,
                                   'alunnome');
          Edt_disciplina.Text := WPDisciplina;
          Pnl_descricaodisciplina.caption := afuncoes.RetornaDescricao(
                                          'select * from tb_disciplina',
                                          'where disccodg=:wc',Edt_disciplina.Text,
                                          'discdesc');
          Edt_professor.Text := '';
          if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes2,
          'Select * from TB_DISCIPLINASERIE','where dissseri=:ws and dissdisc=:wd',
          [Edt_serie.Text,edt_disciplina.text]) then
              Edt_professor.Text := Frm_Modulo.IBQ_funcoes2.fieldbyname('dissagen').asstring;
          Pnl_nomeprofessor.caption := afuncoes.RetornaDescricao(
                                       'select * from tb_funcionario',
                                       'where agencodg=:wc',Edt_professor.Text,
                                       'agennome');
          edt_matr1bct.text := '';
          edt_matr2bct.text := '';
          edt_matr3bct.text := '';
          edt_matr4bct.text := '';

    Frm_modulo.IBQ_funcoes2.close;
    FiltraTabelaConceito(Edt_ano.Text,Edt_serie.Text,Edt_aluno.Text);
    LimpavariavelConceito;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Edt_serieExit(Sender: TObject);
begin
     if (Trim(Edt_serie.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_serie','where sericodg=:wcodg',[Edt_serie.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código da série informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_serie.setfocus;
          end
          else
          begin
               Pnl_descricaoserie.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                             'seridesc').AsString;
               RetornaSaidas;
          end;
     end
     else Pnl_descricaoserie.caption := '';
end;

procedure TFrm_EditaGerenciamentoAlunoC.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.FormClose(Sender: TObject; var Action:
          TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
     Frm_Modulo.IBQ_funcoes2.close;
     // ATUALIZAR A LISTA DE MATRICULA
     Frm_Modulo.ibQ_MatrConceito.close;
     Frm_Modulo.ibQ_MatrConceito.open;
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_alunoExit(Sender: TObject);
begin
     if (Trim(Edt_aluno.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_aluno','where alunmatr=:wcodg',[Edt_aluno.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do aluno informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_aluno.setfocus;
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

procedure TFrm_EditaGerenciamentoAlunoC.Spb_localizaalunoClick(
  Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_aluno.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_disciplinaExit(
  Sender: TObject);
begin
     if (Trim(Edt_disciplina.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_disciplina','where disccodg=:wcodg',[Edt_disciplina.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código da disciplina informado inválido...',
               mtInformation,[mbok],mrok,0);
               Edt_disciplina.setfocus;
          end
          else
          begin
               Pnl_descricaodisciplina.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                                  'discdesc').AsString;
               RetornaSaidas;
          end;
     end
     else Pnl_descricaodisciplina.caption := '';
end;

procedure TFrm_EditaGerenciamentoAlunoC.spb_localizadisciplinaClick(Sender:
          TObject);
begin
     LocalizaDisciplina('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.LocalizaDisciplina(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_disciplina.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select disccodg,discdesc from tb_disciplina where ',
     ['Código','Disciplina'],'oa',[0],['disccodg','discdesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_disciplina.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_professorExit(Sender: TObject);
begin
     if (Trim(edt_professor.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_funcionario','where agencodg=:wcodg',[edt_professor.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do professor informado inválido...',
               mtInformation,[mbok],mrok,0);
               edt_professor.setfocus;
          end
          else Pnl_nomeprofessor.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                            'agennome').AsString;
     end
     else Pnl_nomeprofessor.caption := '';
end;

procedure TFrm_EditaGerenciamentoAlunoC.spb_localizaprofessorClick(Sender:
          TObject);
begin
     LocalizaProfessor('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.LocalizaProfessor(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     edt_professor.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select agencodg,agennome from tb_funcionario where ',
     ['Código','Professor'],'oo',[0],['agencodg','agennome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          edt_professor.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.FormShow(Sender: TObject);
begin
     wprofAtual := '*$#@@!!!!';
     if trim(edt_ano.Text) <> '' then
          edt_matr1bct.SetFocus
     else edt_ano.SetFocus;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Button1Click(Sender: TObject);
begin
     if TestaCampoVazio then
     begin
          wprofAtual := edt_professor.text;
          {
          //if wprofAtual <> edt_professor.text then
          //begin
               //Frm_PedeSenhaFuncUsua.wxprofessor := edt_professor.text;
               //if (Frm_PedeSenhaFuncUsua.ShowModal = mrOk) then
               //begin
               //     if not Frm_PedeSenhaFuncUsua.wAcessoTemporario then
                    begin
                         MessageDlg(Frm_PedeSenhaFuncUsua.Mke_Login.Text+
                         ', você não tem acesso a esta opção...', mtInformation,
                         [mbOk], 0);
                         exit;
                    end
                    ELSE wprofAtual := edt_professor.text;
               end
               else exit;
          //end;
          }
          // verificar se a disciplina faz parte da serie
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_disciplinaserie','where dissseri=:ws and dissdisc=:wd',
          [edt_serie.Text,edt_disciplina.text]))
          then
          begin
               aFuncoes.MessageDlgDef('Esta disciplina não faz parte desta série...',
               mtInformation,[mbok],mrok,0);
               edt_disciplina.setfocus;
          end
          // verificar se o professor e desta disciplina
          else if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_disciplinaserie','where dissseri=:ws and dissdisc=:wd and dissagen=:wa',
          [edt_serie.Text,edt_disciplina.text,edt_professor.text]))
          then
          begin
               aFuncoes.MessageDlgDef('Este professor não consta nesta série com esta disciplina...',
               mtInformation,[mbok],mrok,0);
               edt_professor.setfocus;
          end
          else if not Afuncoes.Localizaindice(Frm_Modulo.ibq_funcoes,
          'Select * from tb_MatrConceito',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
          [Edt_ano.Text,edt_serie.text,edt_aluno.text,edt_disciplina.text]) then
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
          If (aFuncoes.MessageDlgDef('Confirma a alteração nos dados deste aluno ?',
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
procedure TFrm_EditaGerenciamentoAlunoC.GravaRegistro(WPTipo: integer);
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          case WPTipo of
          0:
          begin
               close;
               Sql.clear;
               Sql.add('INSERT INTO tb_MatrConceito (MATR_ANO,MATRSERI,MATRALUN,');
               Sql.add('MATRDISC,MATR1BCT,MATR2BCT,MATR3BCT,MATR4BCT,');
               Sql.add('MATRAGEN)');
               Sql.add('values (:WMATR_ANO,:WMATRSERI,:WMATRALUN,');
               Sql.add(':WMATRDISC,:WMATR1BCT,:WMATR2BCT,:WMATR3BCT,:WMATR4BCT,');
               Sql.add(':WMATRAGEN)');
          end;
          1:
          begin
               close;
               Sql.clear;
               Sql.add('UPDATE tb_MatrConceito SET MATR1BCT=:WMATR1BCT,');
               Sql.add('MATR2BCT=:WMATR2BCT,MATR3BCT=:WMATR3BCT,MATR4BCT=:WMATR4BCT,');
               Sql.add('MATRAGEN=:WMATRAGEN');
               Sql.add('WHERE MATR_ANO=:WMATR_ANO AND MATRSERI=:WMATRSERI AND MATRALUN=:WMATRALUN AND MATRDISC=:WMATRDISC');
          end;
          end;
          parambyname('wMATR_ANO').asstring := edt_ano.Text;
          parambyname('wMATRSERI').asstring := edt_serie.Text;
          parambyname('wMATRALUN').asstring := edt_aluno.Text;
          parambyname('wMATRDISC').asstring := edt_disciplina.Text;
          parambyname('wMATR1BCT').asstring := edt_matr1bct.text;
          parambyname('wMATR2BCT').asstring := edt_matr2bct.text;
          parambyname('wMATR3BCT').asstring := edt_matr3bct.text;
          parambyname('wMATR4BCT').asstring := edt_matr4bct.text;
          parambyname('WMATRAGEN').asstring := edt_professor.Text;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
function TFrm_EditaGerenciamentoAlunoC.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_ano.text,'o ano da matrícula do aluno') then
          Edt_ano.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_serie.text,'a série da matrícula') then
          Edt_serie.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_aluno.text,'a matrícula do aluno') then
          Edt_aluno.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_disciplina.text,'a disciplina') then
          Edt_disciplina.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_professor.text,'o professor') then
          Edt_professor.SetFocus
     else Result:=True;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Button4Click(Sender: TObject);
begin
     if (TestaCampoVazio) and (aFuncoes.MessageDlgDef(
     'Confirma a exclusão dos dados deste aluno ?',mtConfirmation,[mbCancel,
     mbYes], mryes, 0) = mrYes) then
     try
        If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
           Frm_Modulo.IBT_Transaction.StartTransaction;
        afuncoes.STOperaRegistrosIB(
        'delete from tb_MatrConceito where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
        [Edt_ano.Text,edt_serie.text,edt_aluno.text,edt_disciplina.text]);
        Frm_Modulo.IBT_Transaction.CommitRetaining;
        Limpavariavel('','','','');
        Edt_ano.SetFocus;
     except
        Frm_Modulo.IBT_Transaction.rollback;
        aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
        mtWarning, [mbok],mrok, 0);
     end;
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_matr1bctKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['A'..'C','a'..'c',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_matr1bntKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['N','S','V','n','s','v',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_EditaGerenciamentoAlunoC.Button3Click(Sender: TObject);
begin
     if TestaCampoVazio then
     begin
          // verificar se o aluno esta registrado
          if not Afuncoes.Localizaindice(Frm_Modulo.ibq_funcoes,
          'Select * from tb_MatrConceito',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
          [Edt_ano.Text,edt_serie.text,edt_aluno.text,edt_disciplina.text]) then
          begin
               // incluir este registro
               aFuncoes.MessageDlgDef(
               'Estes dados não constam nos registros é necessário gravá-los...',
               mtInformation,[mbok], mrok, 0);
               button1.setfocus;
          end
          else if not Afuncoes.Localizaindice(Frm_Modulo.ibq_funcoes,
          'Select * from tb_MatrTabConceito',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrconc=:wc',
          [Edt_ano.Text,edt_serie.text,edt_aluno.text,edt_matrconc.text]) then
          begin
               // incluir este registro
               If (aFuncoes.MessageDlgDef('Estes dados não constam nos registros deseja acrescentá-los ?',
               mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistroC(0);
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
                  FiltraTabelaConceito(Edt_ano.Text,Edt_serie.Text,Edt_aluno.Text);
                  edt_matrconc.setfocus;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
          end
          else
          // alterar este registro
          If (aFuncoes.MessageDlgDef('Confirma a alteração nos dados deste conceito ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             GravaRegistroC(1);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             FiltraTabelaConceito(Edt_ano.Text,Edt_serie.Text,Edt_aluno.Text);
             edt_matrconc.setfocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.GravaRegistroC(WPTipo: integer);
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          case WPTipo of
          0:
          begin
               close;
               Sql.clear;
               Sql.add('INSERT INTO tb_MatrTabConceito (MATR_ANO,MATRSERI,MATRALUN,');
               Sql.add('MATRCONC,MATR1BNT,,MATR2BNT,MATR3BNT,MATR4BNT)');
               Sql.add('values (:WMATR_ANO,:WMATRSERI,:WMATRALUN,');
               Sql.add(':WMATRCONC,:WMATR1BNT,:WMATR2BNT,:WMATR3BNT,:WMATR4BNT)');
          end;
          1:
          begin
               close;
               Sql.clear;
               Sql.add('UPDATE tb_MatrTabConceito SET MATR1BNT=:WMATR1BNT,');
               Sql.add('MATR2BNT=:WMATR2BNT,MATR3BNT=:WMATR3BNT,MATR4BNT=:WMATR4BNT');
               Sql.add('WHERE MATR_ANO=:WMATR_ANO AND MATRSERI=:WMATRSERI AND MATRALUN=:WMATRALUN AND MATRCONC=:WMATRCONC');
          end;
          end;
          parambyname('wMATR_ANO').asstring := edt_ano.Text;
          parambyname('wMATRSERI').asstring := edt_serie.Text;
          parambyname('wMATRALUN').asstring := edt_aluno.Text;
          parambyname('wMATRCONC').asstring := edt_matrconc.Text;
          parambyname('wMATR1BNT').asstring := edt_matr1bnt.text;
          parambyname('wMATR2BNT').asstring := edt_matr2bnt.text;
          parambyname('wMATR3BNT').asstring := edt_matr3bnt.text;
          parambyname('wMATR4BNT').asstring := edt_matr4bnt.text;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAlunoC.LocalizaConceito(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     edt_matrconc.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select conccodg,concdesc from tb_conceito where ',
     ['Código','Conceito'],'oo',[0],['conccodg','concdesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          edt_matrconc.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAlunoC.SpeedButton1Click(Sender: TObject);
begin
     LocalizaConceito('');
end;

procedure TFrm_EditaGerenciamentoAlunoC.edt_matrconcExit(Sender: TObject);
begin
     if (Trim(edt_matrconc.text) <> '') then
     begin
          if not (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcoes,
          'Select * from tb_conceito','where conccodg=:wcodg',[edt_matrconc.Text]))
          then
          begin
               aFuncoes.MessageDlgDef('Código do conceito informado inválido...',
               mtInformation,[mbok],mrok,0);
               edt_matrconc.setfocus;
          end
          else if Afuncoes.Localizaindice(Frm_Modulo.ibq_funcoes2,
          'Select * from tb_MatrTabConceito',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrconc=:wc',
          [Edt_ano.Text,edt_serie.text,edt_aluno.text,edt_matrconc.text]) then
          begin
               Pnl_descricaoconceito.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                                'concdesc').AsString;
               edt_matr1bnt.text             := Frm_Modulo.IBQ_Funcoes2.fieldbyname(
                                                'matr1bnt').AsString;
               edt_matr2bnt.text             := Frm_Modulo.IBQ_Funcoes2.fieldbyname(
                                                'matr2bnt').AsString;
               edt_matr3bnt.text             := Frm_Modulo.IBQ_Funcoes2.fieldbyname(
                                                'matr3bnt').AsString;
               edt_matr4bnt.text             := Frm_Modulo.IBQ_Funcoes2.fieldbyname(
                                                'matr4bnt').AsString;
          end
          else Pnl_descricaoconceito.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                                'concdesc').AsString;
     end
     else Pnl_descricaoconceito.caption := '';
end;

end.
