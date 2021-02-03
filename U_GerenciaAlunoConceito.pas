unit U_GerenciaAlunoConceito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Menus, Db,
  RXDBCtrl;

type
  TFrm_GerenciaAlunoConceito = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Btn_filtrar: TButton;
    Btn_editar: TButton;
    btn_sair: TButton;
    btn_matricula: TButton;
    PopupMenu1: TPopupMenu;
    abela1: TMenuItem;
    Srie1: TMenuItem;
    Disciplina1: TMenuItem;
    NvelEscolar1: TMenuItem;
    Cadastro1: TMenuItem;
    Docente1: TMenuItem;
    Dicente1: TMenuItem;
    RxDBGrid1: TRxDBGrid;
    Btn_AlunoSerie: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_matriculaClick(Sender: TObject);
    procedure Btn_filtrarClick(Sender: TObject);
    procedure Btn_editarClick(Sender: TObject);
    procedure NvelEscolar1Click(Sender: TObject);
    procedure Disciplina1Click(Sender: TObject);
    procedure Srie1Click(Sender: TObject);
    procedure Docente1Click(Sender: TObject);
    procedure Dicente1Click(Sender: TObject);
    procedure Btn_AlunoSerieClick(Sender: TObject);
  end;

var Frm_GerenciaAlunoConceito: TFrm_GerenciaAlunoConceito;
const wSelect1 = 'SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,TRN.TURNDESC,';
      wSelect2 = 'AGE.AGENNOME ,DIS.DISCDESC,ALU.ALUNINAT FROM TB_MATRCONCEITO MAT ';
      wSelect3 = 'LEFT OUTER JOIN TB_ALUNO ALU ON MAT.MATRALUN=ALU.ALUNMATR ';
      wSelect4 = 'LEFT OUTER JOIN TB_SERIE SER ON MAT.MATRSERI=SER.SERICODG ';
      wSelect5 = 'LEFT OUTER JOIN TB_TURNO TRN ON SER.SERITURN=TRN.TURNCODG ';
      wSelect6 = 'LEFT OUTER JOIN TB_FUNCIONARIO AGE ON MAT.MATRAGEN=AGE.AGENCODG ';
      wSelect7 = 'LEFT OUTER JOIN TB_DISCIPLINA DIS ON MAT.MATRDISC=DIS.DISCCODG ';
      wOrdem   = 'ORDER BY MAT.MATR_ANO DESC,SER.SERICODG,MAT.MATRALUN';

implementation

uses U_FiltroGerenciamentoAluno, u_modulo, u_funcoes, U_SelecionaAlunoMatriculaC,
     u_AlunosPorSerie, U_TbSerie, U_EditaGerenciamentoAlunoC, U_Principal,
     U_PedeSenhaFuncUsua;

{$R *.dfm}

procedure TFrm_GerenciaAlunoConceito.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_GerenciaAlunoConceito.Button1Click(Sender: TObject);
begin
     close;
end;

procedure TFrm_GerenciaAlunoConceito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Frm_Modulo.IBQ_MatrConceito.close;
     Frm_Modulo.IBQ_Funcoes.close;
end;

procedure TFrm_GerenciaAlunoConceito.btn_matriculaClick(Sender: TObject);
begin
     with TFrm_SelecionaAlunoMatriculaC.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_GerenciaAlunoConceito.Btn_filtrarClick(Sender: TObject);
var wselect8 : string;
begin
     with TFrm_FiltroGerenciamentoAluno.Create(Self) do
     try
        caption := Frm_principal.wNomeEmpresa;
        if showmodal = mrok then
        begin
             if (trim(edt_ano.Text) = '') and
             (trim(edt_serie.Text) = '') and
             (trim(edt_aluno.Text) = '') and
             (trim(edt_disciplina.Text) = '') and
             (trim(edt_professor.Text) = '') then
                 afuncoes.AbreQuery(Frm_Modulo.IBQ_MatrConceito,wSelect1+wSelect2+wSelect3+
                 wSelect4+wSelect5+wSelect6+wSelect7+wOrdem)
             else
             begin
                  wselect8 := 'WHERE ';
                  if (trim(edt_ano.Text) <> '') then
                     wselect8 := wselect8  + 'MATR_ANO='''+edt_ano.Text+''' AND ';
                  if (trim(edt_serie.Text) <> '') then
                     wselect8 := wselect8  + 'MATRSERI='''+edt_serie.Text+''' AND ';
                  if (trim(edt_aluno.Text) <> '') then
                     wselect8 := wselect8  + 'MATRALUN='''+edt_aluno.Text+''' AND ';
                  if (trim(edt_disciplina.Text) <> '') then
                     wselect8 := wselect8  + 'MATRDISC='''+edt_disciplina.Text+''' AND ';
                  if (trim(edt_professor.Text) <> '') then
                     wselect8 := wselect8  + 'MATRAGEN='''+edt_professor.Text+''' AND ';
                  wselect8 := copy(wselect8,1,length(wselect8) - 4);
                  afuncoes.AbreQuery(Frm_Modulo.IBQ_MatrConceito,wSelect1+wSelect2+wSelect3+
                  wSelect4+wSelect5+wSelect6+wSelect7+wSelect8+wOrdem);
             end;
        end;
     Finally
        Free;
     end;
end;

procedure TFrm_GerenciaAlunoConceito.Btn_editarClick(Sender: TObject);
begin
     //if not (Frm_PedeSenhaFuncUsua.ShowModal = mrOk) then exit;

     with TFrm_EditaGerenciamentoAlunoC.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        if Frm_Modulo.IBQ_MatrConceito.IsEmpty then
             LimpaVariavel('','','','')
        else if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
        'Select * from TB_MatrConceito',
        'where matr_ano=:wa and matrseri=:ws and matralun=:wd and matrdisc=:wc',
        [Frm_Modulo.IBQ_MatrConceito.fieldbyname('matr_ano').asstring,
        Frm_Modulo.IBQ_MatrConceito.fieldbyname('matrseri').asstring,
        Frm_Modulo.IBQ_MatrConceito.fieldbyname('matralun').asstring,
        Frm_Modulo.IBQ_MatrConceito.fieldbyname('matrdisc').asstring]) then
             AtribuiVariavel
        else LimpaVariavel('','','','');
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_GerenciaAlunoConceito.NvelEscolar1Click(Sender: TObject);
begin
     Frm_principal.NvelEscolar1Click(Sender);
end;

procedure TFrm_GerenciaAlunoConceito.Disciplina1Click(Sender: TObject);
begin
     Frm_principal.Disciplina1Click(Sender);
end;

procedure TFrm_GerenciaAlunoConceito.Srie1Click(Sender: TObject);
begin
     with TFrm_TbSerie.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

procedure TFrm_GerenciaAlunoConceito.Docente1Click(Sender: TObject);
begin
     Frm_Principal.Clientes1Click(Sender);
end;

procedure TFrm_GerenciaAlunoConceito.Dicente1Click(Sender: TObject);
begin
     Frm_Principal.Fornecedor1Click(Sender);
end;

procedure TFrm_GerenciaAlunoConceito.Btn_AlunoSerieClick(Sender: TObject);
begin
     with TFrm_AlunosPorSerie.Create(Self) do
     try
        wTipoMatricula := 'C';
        caption := Frm_Principal.wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

end.
