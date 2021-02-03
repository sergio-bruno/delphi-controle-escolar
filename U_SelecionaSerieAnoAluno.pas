unit U_SelecionaSerieAnoAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFrm_SelecionaSerieAnoAluno = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edt_Ano: TEdit;
    Edt_serie: TEdit;
    Label2: TLabel;
    Spb_LocalizaSerie: TSpeedButton;
    Label3: TLabel;
    edt_mensalun: TEdit;
    Spb_localizaaluno: TSpeedButton;
    pnl_nomealuno: TPanel;
    rdg_tipo: TRadioGroup;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure Edt_AnoExit(Sender: TObject);
    procedure Edt_serieExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Spb_LocalizaSerieClick(Sender: TObject);
    procedure LocalizaSerie(WPPrimLetra: string);
    procedure edt_mensalunExit(Sender: TObject);
    procedure Spb_localizaalunoClick(Sender: TObject);
    procedure LocalizaAluno(WPPrimLetra: string);
  end;

var Frm_SelecionaSerieAnoAluno : TFrm_SelecionaSerieAnoAluno;
    wSairClick            : boolean;

implementation

uses U_Modulo, u_funcoes, U_PesqIncremento;

{$R *.dfm}

procedure TFrm_SelecionaSerieAnoAluno.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_SelecionaSerieAnoAluno.Edt_AnoKeyPress(Sender: TObject;var Key: Char);
begin
     if not (Key in ['0'..'9',#3, #8, #22, #24]) then Key := #0;
end;

procedure TFrm_SelecionaSerieAnoAluno.Edt_AnoExit(Sender: TObject);
begin
     if not aFuncoes.ValidaAno(Edt_Ano.Text) THEN
        Edt_Ano.SETFOCUS;
end;

procedure TFrm_SelecionaSerieAnoAluno.Edt_serieExit(Sender: TObject);
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

procedure TFrm_SelecionaSerieAnoAluno.FormClose(Sender: TObject; var Action:
          TCloseAction);
begin
     Frm_Modulo.IBQ_Funcoes.close;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_SelecionaSerieAnoAluno.FormCloseQuery(Sender: TObject; var CanClose:
          Boolean);
begin
     if not wSairClick then
     begin
          Canclose := false;
          if trim(Edt_ano.text) = '' then
          begin
               aFuncoes.MessageDlgDef('É necesário informar o ano letivo...',
               mtInformation,[mbok],mrok,0);
               edt_ano.setfocus;
          end
          else Canclose := true;
     end
     else CanClose := true;
end;

procedure TFrm_SelecionaSerieAnoAluno.FormShow(Sender: TObject);
begin
     wSairClick := false;
     edt_ano.text := '';
     edt_serie.text := '';

     Edt_mensalun.text := '';
     Pnl_nomealuno.caption := '';
     rdg_tipo.ItemIndex := 0;

     edt_ano.setfocus;
end;

procedure TFrm_SelecionaSerieAnoAluno.Button2Click(Sender: TObject);
begin
     wSairClick := true;
end;

procedure TFrm_SelecionaSerieAnoAluno.Spb_LocalizaSerieClick(Sender: TObject);
begin
     LocalizaSerie('');
end;

//------------------------------------------------------------------------------
procedure TFrm_SelecionaSerieAnoAluno.LocalizaSerie(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_serie.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select sericodg,seridesc from tb_serie where ',
     ['Código','Série'],'oa',[0],['sericodg','seridesc'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_serie.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_SelecionaSerieAnoAluno.edt_mensalunExit(Sender: TObject);
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

          end;
     end
     else Pnl_nomealuno.caption := '';
end;

//------------------------------------------------------------------------------
procedure TFrm_SelecionaSerieAnoAluno.LocalizaAluno(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_mensalun.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select alunmatr,alunnome from tb_aluno where ',
     ['Código','Aluno'],'oo',[0],['alunmatr','alunnome'],1,['S','S'],
     WPPrimLetra) = mrOk then
          Edt_mensalun.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

procedure TFrm_SelecionaSerieAnoAluno.Spb_localizaalunoClick(
  Sender: TObject);
begin
     LocalizaAluno('');
end;

end.
