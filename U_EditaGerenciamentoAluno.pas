unit U_EditaGerenciamentoAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Spin, FnpNumericEdit;

type
  TFrm_EditaGerenciamentoAluno = class(TForm)
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
    GroupBox1: TGroupBox;
    Spe_matr1bft: TSpinEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Spe_matr2bft: TSpinEdit;
    Label15: TLabel;
    Spe_matr3bft: TSpinEdit;
    Label16: TLabel;
    Spe_matr4bft: TSpinEdit;
    Label18: TLabel;
    cmb_matrrsfn: TComboBox;
    Fne_matr1bau: TFnpNumericEdit;
    Fne_matr1btb: TFnpNumericEdit;
    Fne_matr1bpb: TFnpNumericEdit;
    Fne_matr1bmd: TFnpNumericEdit;
    Fne_matr2bau: TFnpNumericEdit;
    Fne_matr2btb: TFnpNumericEdit;
    Fne_matr2bpb: TFnpNumericEdit;
    Fne_matr2bmd: TFnpNumericEdit;
    Fne_matr3bau: TFnpNumericEdit;
    Fne_matr3btb: TFnpNumericEdit;
    Fne_matr3bpb: TFnpNumericEdit;
    Fne_matr3bmd: TFnpNumericEdit;
    Fne_matr4bau: TFnpNumericEdit;
    Fne_matr4btb: TFnpNumericEdit;
    Fne_matr4bpb: TFnpNumericEdit;
    Fne_matr4bmd: TFnpNumericEdit;
    Fne_matrmdan: TFnpNumericEdit;
    Button3: TButton;
    Button4: TButton;
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
    procedure CalculaMedia_1_Bimestre(Sender: TObject);
    procedure CalculaMedia_2_Bimestre(Sender: TObject);
    procedure CalculaMedia_3_Bimestre(Sender: TObject);
    procedure CalculaMedia_4_Bimestre(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Fne_matrmdanChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function  TestaCampoVazio: Boolean;
    procedure GravaRegistro(WPTipo: integer);
    procedure Button4Click(Sender: TObject);
  end;

var Frm_EditaGerenciamentoAluno: TFrm_EditaGerenciamentoAluno;
    wprofAtual : string;

implementation

uses U_Modulo, U_PesqIncremento, U_Funcoes, U_Principal, U_PedeSenhaFuncUsua;

{$R *.dfm}

procedure TFrm_EditaGerenciamentoAluno.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_EditaGerenciamentoAluno.Edt_AnoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_EditaGerenciamentoAluno.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS
     else RetornaSaidas;
end;

procedure TFrm_EditaGerenciamentoAluno.RetornaSaidas;
begin
     if (trim(edt_ano.text) <> '') and (trim(edt_serie.text) <> '') and
     (trim(edt_aluno.text) <> '') and (trim(edt_disciplina.text) <> '') then
     begin
          if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
          'Select * from TB_MATRICULA',
          'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
          [Edt_ano.text,Edt_serie.Text,Edt_aluno.text,edt_disciplina.text]) then
               AtribuiVariavel
          else LimpaVariavel(Edt_ano.text,Edt_serie.Text,Edt_aluno.text,
               edt_disciplina.text);
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.AtribuiVariavel;
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
          Spe_matr1bft.Value   := fieldbyname('matr1bft').asinteger;
          fne_matr1bau.Value   := fieldbyname('matr1bau').asfloat;
          fne_matr1btb.Value   := fieldbyname('matr1btb').asfloat;
          fne_matr1bpb.Value   := fieldbyname('matr1bpb').asfloat;
          fne_matr1bmd.Value   := fieldbyname('matr1bmd').asfloat;
          spe_matr2bft.Value   := fieldbyname('matr2bft').asinteger;
          fne_matr2bau.Value   := fieldbyname('matr2bau').asfloat;
          fne_matr2btb.Value   := fieldbyname('matr2btb').asfloat;
          fne_matr2bpb.Value   := fieldbyname('matr2bpb').asfloat;
          fne_matr2bmd.Value   := fieldbyname('matr2bmd').asfloat;
          Spe_matr3bft.Value   := fieldbyname('matr3bft').asinteger;
          fne_matr3bau.Value   := fieldbyname('matr3bau').asfloat;
          fne_matr3btb.Value   := fieldbyname('matr3btb').asfloat;
          fne_matr3bpb.Value   := fieldbyname('matr3bpb').asfloat;
          fne_matr3bmd.Value   := fieldbyname('matr3bmd').asfloat;
          Spe_matr4bft.Value   := fieldbyname('matr4bft').asinteger;
          fne_matr4bau.Value   := fieldbyname('matr4bau').asfloat;
          fne_matr4btb.Value   := fieldbyname('matr4btb').asfloat;
          fne_matr4bpb.Value   := fieldbyname('matr4bpb').asfloat;
          fne_matr4bmd.Value   := fieldbyname('matr4bmd').asfloat;
          fne_matrmdan.Value   := fieldbyname('matrmdan').asfloat;
          if fieldbyname('matrrsfn').asstring = 'A' then
             cmb_matrrsfn.itemindex := 0
          else if fieldbyname('matrrsfn').asstring = 'C' then
             cmb_matrrsfn.itemindex := 1
          else if fieldbyname('matrrsfn').asstring = 'R' then
             cmb_matrrsfn.itemindex := 2
          else if fieldbyname('matrrsfn').asstring = 'T' then
             cmb_matrrsfn.itemindex := 3
          else cmb_matrrsfn.itemindex := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.LimpaVariavel(WPAno, WPSerie,WPAluno,
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
          Spe_matr1bft.Value   := 0;
          fne_matr1bau.Value   := 0;
          fne_matr1btb.Value   := 0;
          fne_matr1bpb.Value   := 0;
          fne_matr1bmd.Value   := 0;
          Spe_matr2bft.Value   := 0;
          fne_matr2bau.Value   := 0;
          fne_matr2btb.Value   := 0;
          fne_matr2bpb.Value   := 0;
          fne_matr2bmd.Value   := 0;
          Spe_matr3bft.Value   := 0;
          fne_matr3bau.Value   := 0;
          fne_matr3btb.Value   := 0;
          fne_matr3bpb.Value   := 0;
          fne_matr3bmd.Value   := 0;
          Spe_matr4bft.Value   := 0;
          fne_matr4bau.Value   := 0;
          fne_matr4btb.Value   := 0;
          fne_matr4bpb.Value   := 0;
          fne_matr4bmd.Value   := 0;
          fne_matrmdan.Value   := 0;
          cmb_matrrsfn.itemindex := 1;

    Frm_modulo.IBQ_funcoes2.close;
end;

procedure TFrm_EditaGerenciamentoAluno.Edt_serieExit(Sender: TObject);
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

procedure TFrm_EditaGerenciamentoAluno.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAluno.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAluno.FormClose(Sender: TObject; var Action:
          TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
     Frm_Modulo.IBQ_funcoes2.close;
     // ATUALIZAR A LISTA DE MATRICULA
     Frm_Modulo.IBQ_Matricula.close;
     Frm_Modulo.IBQ_Matricula.open;
end;

procedure TFrm_EditaGerenciamentoAluno.edt_alunoExit(Sender: TObject);
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

procedure TFrm_EditaGerenciamentoAluno.Spb_localizaalunoClick(
  Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAluno.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_aluno.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAluno.edt_disciplinaExit(
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

procedure TFrm_EditaGerenciamentoAluno.spb_localizadisciplinaClick(Sender:
          TObject);
begin
     LocalizaDisciplina('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAluno.LocalizaDisciplina(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_disciplina.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select disccodg,discdesc from tb_disciplina where ',
     ['Código','Disciplina'],'oa',[0],['disccodg','discdesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_disciplina.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAluno.edt_professorExit(Sender: TObject);
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

procedure TFrm_EditaGerenciamentoAluno.spb_localizaprofessorClick(Sender:
          TObject);
begin
     LocalizaProfessor('');
end;

//------------------------------------------------------------------------------
procedure TFrm_EditaGerenciamentoAluno.LocalizaProfessor(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     edt_professor.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select agencodg,agennome from tb_funcionario where ',
     ['Código','Professor'],'oo',[0],['agencodg','agennome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          edt_professor.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_EditaGerenciamentoAluno.CalculaMedia_1_Bimestre(Sender: TObject);
begin
     try
        fne_matr1bmd.value := (fne_matr1bau.value + fne_matr1btb.value +
                              fne_matr1bpb.value) / 3;
     except
        fne_matr1bmd.value := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.CalculaMedia_2_Bimestre(Sender: TObject);
begin
     try
        fne_matr2bmd.value := (fne_matr2bau.value + fne_matr2btb.value +
                              fne_matr2bpb.value) / 3;
     except
        fne_matr2bmd.value := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.CalculaMedia_3_Bimestre(Sender: TObject);
begin
     try
        fne_matr3bmd.value := (fne_matr3bau.value + fne_matr3btb.value +
                              fne_matr3bpb.value) / 3;
     except
        fne_matr3bmd.value := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.CalculaMedia_4_Bimestre(Sender: TObject);
begin
     try
        fne_matr4bmd.value := (fne_matr4bau.value + fne_matr4btb.value +
                              fne_matr4bpb.value) / 3;
     except
        fne_matr4bmd.value := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.Button3Click(Sender: TObject);
begin
     try
        Fne_matrmdan.value := (Fne_matr1bmd.value + Fne_matr2bmd.value +
                              Fne_matr3bmd.value + Fne_matr4bmd.value) / 4;
     except
        Fne_matrmdan.value := 0;
     end;
end;

procedure TFrm_EditaGerenciamentoAluno.Fne_matrmdanChange(Sender: TObject);
begin
     if Fne_matrmdan.value >= Frm_principal.wMEDIA_ESCOLA then
          cmb_matrrsfn.itemindex := 0
     else cmb_matrrsfn.itemindex := 2;
end;

procedure TFrm_EditaGerenciamentoAluno.FormShow(Sender: TObject);
begin
     wprofAtual := '*$#@@!!!!';
     if trim(edt_ano.Text) <> '' then
          spe_matr1bft.SetFocus
     else edt_ano.SetFocus;
end;

procedure TFrm_EditaGerenciamentoAluno.Button1Click(Sender: TObject);
begin
     if TestaCampoVazio then
     begin
          wprofAtual := edt_professor.text;
          {
          if wprofAtual <> edt_professor.text then
          begin
               Frm_PedeSenhaFuncUsua.wxprofessor := edt_professor.text;
               if (Frm_PedeSenhaFuncUsua.ShowModal = mrOk) then
               begin
                    if not Frm_PedeSenhaFuncUsua.wAcessoTemporario then
                    begin
                         MessageDlg(Frm_PedeSenhaFuncUsua.Mke_Login.Text+
                         ', você não tem acesso a esta opção...', mtInformation,
                         [mbOk], 0);
                         exit;
                    end
                    ELSE wprofAtual := edt_professor.text;
               end
               else exit;
          end;
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
          'Select * from tb_matricula',
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
procedure TFrm_EditaGerenciamentoAluno.GravaRegistro(WPTipo: integer);
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          case WPTipo of
          0:
          begin
               close;
               Sql.clear;
               Sql.add('INSERT INTO TB_MATRICULA (MATR_ANO,MATRSERI,MATRALUN,');
               Sql.add('MATRDISC,MATR1BFT,MATR1BAU,MATR1BTB,MATR1BPB,');
               Sql.add('MATR1BMD,MATR2BFT,MATR2BAU,MATR2BTB,');
               Sql.add('MATR2BPB,MATR2BMD,MATR3BFT,MATR3BAU,');
               Sql.add('MATR3BTB,MATR3BPB,MATR3BMD,MATR4BFT,');
               Sql.add('MATR4BAU,MATR4BTB,MATR4BPB,MATR4BMD,');
               Sql.add('MATRMDAN,MATRAGEN,MATRRSFN)');
               Sql.add('values (:WMATR_ANO,:WMATRSERI,:WMATRALUN,');
               Sql.add(':WMATRDISC,:WMATR1BFT,:WMATR1BAU,:WMATR1BTB,:WMATR1BPB,');
               Sql.add(':WMATR1BMD,:WMATR2BFT,:WMATR2BAU,:WMATR2BTB,');
               Sql.add(':WMATR2BPB,:WMATR2BMD,:WMATR3BFT,:WMATR3BAU,');
               Sql.add(':WMATR3BTB,:WMATR3BPB,:WMATR3BMD,:WMATR4BFT,');
               Sql.add(':WMATR4BAU,:WMATR4BTB,:WMATR4BPB,:WMATR4BMD,');
               Sql.add(':WMATRMDAN,:WMATRAGEN,:WMATRRSFN)');
          end;
          1:
          begin
               close;
               Sql.clear;
               Sql.add('UPDATE TB_MATRICULA SET MATR1BFT=:WMATR1BFT,');
               Sql.add('MATR1BAU=:WMATR1BAU,MATR1BTB=:WMATR1BTB,MATR1BPB=:WMATR1BPB,');
               Sql.add('MATR1BMD=:WMATR1BMD,MATR2BFT=:WMATR2BFT,');
               Sql.add('MATR2BAU=:WMATR2BAU,MATR2BTB=:WMATR2BTB,');
               Sql.add('MATR2BPB=:WMATR2BPB,MATR2BTB=:WMATR2BTB,');
               Sql.add('MATR2BMD=:WMATR2BMD,MATR3BFT=:WMATR3BFT,MATR3BAU=:WMATR3BAU,');
               Sql.add('MATR3BTB=:WMATR3BTB,MATR3BPB=:WMATR3BPB,');
               Sql.add('MATR3BMD=:WMATR3BMD,MATR4BFT=:WMATR4BFT,');
               Sql.add('MATR4BAU=:WMATR4BAU,MATR4BTB=:WMATR4BTB,MATR4BPB=:WMATR4BPB,');
               Sql.add('MATR4BMD=:WMATR4BMD,');
               Sql.add('MATRMDAN=:WMATRMDAN,MATRAGEN=:WMATRAGEN,');
               Sql.add('MATRRSFN=:WMATRRSFN');
               Sql.add('WHERE MATR_ANO=:WMATR_ANO AND MATRSERI=:WMATRSERI AND MATRALUN=:WMATRALUN AND MATRDISC=:WMATRDISC');
          end;
          end;
          parambyname('wMATR_ANO').asstring := edt_ano.Text;
          parambyname('wMATRSERI').asstring := edt_serie.Text;
          parambyname('wMATRALUN').asstring := edt_aluno.Text;
          parambyname('wMATRDISC').asstring := edt_disciplina.Text;
          parambyname('wMATR1BFT').asinteger:= spe_matr1bft.value;
          parambyname('wMATR1BAU').asfloat  := fne_matr1bau.value;
          parambyname('wMATR1BTB').asfloat  := fne_matr1btb.value;
          parambyname('wMATR1BPB').asfloat  := fne_matr1bpb.value;
          parambyname('wMATR1BMD').asfloat  := fne_matr1bmd.value;
          parambyname('wMATR2BFT').asinteger:= spe_matr2bft.value;
          parambyname('wMATR2BAU').asfloat  := fne_matr2bau.value;
          parambyname('wMATR2BTB').asfloat  := fne_matr2btb.value;
          parambyname('wMATR2BPB').asfloat  := fne_matr2bpb.value;
          parambyname('wMATR2BMD').asfloat  := fne_matr2bmd.value;
          parambyname('wMATR3BFT').asinteger:= spe_matr3bft.value;
          parambyname('wMATR3BAU').asfloat  := fne_matr3bau.value;
          parambyname('wMATR3BTB').asfloat  := fne_matr3btb.value;
          parambyname('wMATR3BPB').asfloat  := fne_matr3bpb.value;
          parambyname('wMATR3BMD').asfloat  := fne_matr3bmd.value;
          parambyname('wMATR4BFT').asinteger:= spe_matr4bft.value;
          parambyname('wMATR4BAU').asfloat  := fne_matr4bau.value;
          parambyname('wMATR4BTB').asfloat  := fne_matr4btb.value;
          parambyname('wMATR4BPB').asfloat  := fne_matr4bpb.value;
          parambyname('wMATR4BMD').asfloat  := fne_matr4bmd.value;
          parambyname('WMATRMDAN').asfloat  := fne_matrmdan.value;
          parambyname('WMATRAGEN').asstring := edt_professor.Text;
          case cmb_matrrsfn.itemindex of
               0: parambyname('WMATRRSFN').asstring := 'A';
               1: parambyname('WMATRRSFN').asstring := 'C';
               2: parambyname('WMATRRSFN').asstring := 'R';
               3: parambyname('WMATRRSFN').asstring := 'T';
          end;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
function TFrm_EditaGerenciamentoAluno.TestaCampoVazio: Boolean;
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

procedure TFrm_EditaGerenciamentoAluno.Button4Click(Sender: TObject);
begin
     if (TestaCampoVazio) and (aFuncoes.MessageDlgDef(
     'Confirma a exclusão dos dados deste aluno ?',mtConfirmation,[mbCancel,
     mbYes], mryes, 0) = mrYes) then
     try
        If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
           Frm_Modulo.IBT_Transaction.StartTransaction;
        afuncoes.STOperaRegistrosIB(
        'delete from tb_matricula where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
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

end.
