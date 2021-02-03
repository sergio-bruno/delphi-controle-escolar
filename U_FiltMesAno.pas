unit U_FiltMesAno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, FnpNumericEdit;

type
  TFrm_FiltMesAno = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Cmb_mes: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edt_Ano: TEdit;
    Label3: TLabel;
    Edt_serie: TEdit;
    Spb_LocalizaSerie: TSpeedButton;
    Fne_Valor: TFnpNumericEdit;
    Label4: TLabel;
    Label5: TLabel;
    edt_aluno: TEdit;
    Spb_localizaaluno: TSpeedButton;
    pnl_nomealuno: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
    procedure edt_alunoExit(Sender: TObject);
  end;

var Frm_FiltMesAno: TFrm_FiltMesAno;
    wSairClick     : boolean; { variavel para saber se o botao sair foi clicado }

implementation

uses u_Funcoes, U_Modulo, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_FiltMesAno.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_FiltMesAno.FormShow(Sender: TObject);
begin
     wSairClick            := false;
     Cmb_mes.ItemIndex     := 0;
     Edt_ano.text          := '';
     edt_serie.text        := '';
     Edt_aluno.text        := '';
     Pnl_nomealuno.caption := '';
     Cmb_mes.setfocus;
end;

procedure TFrm_FiltMesAno.Edt_AnoKeyPress(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_FiltMesAno.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_FiltMesAno.Edt_serieExit(Sender: TObject);
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

procedure TFrm_FiltMesAno.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltMesAno.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_FiltMesAno.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
begin
     {
     if not wSairClick then
     begin
          canclose := false;
          if not aFuncoes.TestaCampoVazio(Edt_ano.text,
          'o ano da matrícula') then
             Edt_ano.SetFocus
          else if not aFuncoes.TestaCampoVazio(Edt_serie.text,
          'a série') then
             Edt_serie.SetFocus
          else canclose := true;
     end
     else canclose := true;
     }
     canclose := true;
end;

procedure TFrm_FiltMesAno.Button2Click(Sender: TObject);
begin
     wSairClick := true;
end;

procedure TFrm_FiltMesAno.Spb_localizaalunoClick(Sender: TObject);
begin
     LocalizaAluno('');
end;

//------------------------------------------------------------------------------
procedure TFrm_FiltMesAno.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
var wselect : string;
begin
     Edt_aluno.Setfocus;
     if trim(edt_serie.text) = '' then
     begin
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
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
          Edt_aluno.text := Frm_PesqIncremento.Retorno;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_FiltMesAno.edt_alunoExit(Sender: TObject);
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

end.
