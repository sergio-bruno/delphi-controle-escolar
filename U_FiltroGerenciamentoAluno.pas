unit U_FiltroGerenciamentoAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls;

type
  TFrm_FiltroGerenciamentoAluno = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
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
  end;

var Frm_FiltroGerenciamentoAluno: TFrm_FiltroGerenciamentoAluno;

implementation

uses U_Modulo, U_PesqIncremento, U_Funcoes;

{$R *.dfm}

procedure TFrm_FiltroGerenciamentoAluno.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_FiltroGerenciamentoAluno.FormShow(Sender: TObject);
begin
     Edt_Ano.Text := '';
     Edt_serie.Text := '';
     Pnl_descricaoserie.caption := '';
     edt_aluno.Text := '';
     pnl_nomealuno.caption := '';
     edt_disciplina.Text := '';
     pnl_descricaodisciplina.caption := '';
     edt_professor.Text := '';
     pnl_nomeprofessor.caption := '';
     Edt_Ano.setfocus;
end;

procedure TFrm_FiltroGerenciamentoAluno.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_FiltroGerenciamentoAluno.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_FiltroGerenciamentoAluno.Edt_serieExit(Sender: TObject);
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
          else Pnl_descricaoserie.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                             'seridesc').AsString;
     end
     else Pnl_descricaoserie.caption := '';
end;

procedure TFrm_FiltroGerenciamentoAluno.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltroGerenciamentoAluno.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_FiltroGerenciamentoAluno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
end;

procedure TFrm_FiltroGerenciamentoAluno.edt_alunoExit(Sender: TObject);
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
          else Pnl_nomealuno.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                        'alunnome').AsString;
     end
     else Pnl_nomealuno.caption := '';
end;

procedure TFrm_FiltroGerenciamentoAluno.Spb_localizaalunoClick(
  Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltroGerenciamentoAluno.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_aluno.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_FiltroGerenciamentoAluno.edt_disciplinaExit(
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
          else Pnl_descricaodisciplina.caption := Frm_Modulo.IBQ_Funcoes.fieldbyname(
                                                  'discdesc').AsString;
     end
     else Pnl_descricaodisciplina.caption := '';
end;

procedure TFrm_FiltroGerenciamentoAluno.spb_localizadisciplinaClick(Sender:
          TObject);
begin
     LocalizaDisciplina('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltroGerenciamentoAluno.LocalizaDisciplina(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_disciplina.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select disccodg,discdesc from tb_disciplina where ',
     ['Código','Disciplina'],'oa',[0],['disccodg','discdesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_disciplina.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_FiltroGerenciamentoAluno.edt_professorExit(Sender: TObject);
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

procedure TFrm_FiltroGerenciamentoAluno.spb_localizaprofessorClick(Sender:
          TObject);
begin
     LocalizaProfessor('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltroGerenciamentoAluno.LocalizaProfessor(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     edt_professor.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select agencodg,agennome from tb_funcionario where ',
     ['Código','Professor'],'oo',[0],['agencodg','agennome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          edt_professor.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

end.
