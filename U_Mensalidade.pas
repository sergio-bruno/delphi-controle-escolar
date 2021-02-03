unit U_Mensalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls, DB;

type
  TFrm_Mensalidade = class(TForm)
    Panel1: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Btn_filtrar: TButton;
    Btn_editar: TButton;
    btn_sair: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_sairClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont:
              TFont; var Background: TColor; Highlight: Boolean);
    procedure Btn_filtrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Btn_editarClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  end;

var Frm_Mensalidade: TFrm_Mensalidade;

implementation

uses u_modulo, u_funcoes, U_Principal, U_EditaMensalidade,
     U_ApagaMensalidade, U_MensalidadePorSerie;

{$R *.dfm}

procedure TFrm_Mensalidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end
     else if key = #27 then close;
end;

procedure TFrm_Mensalidade.btn_sairClick(Sender: TObject);
begin
     close;
end;

procedure TFrm_Mensalidade.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
     if (Frm_Modulo.IBQ_Mensalidade.fieldbyname('mensdtvc').asdatetime < date)
     AND (Frm_Modulo.IBQ_Mensalidade.fieldbyname('menspago').asstring = 'N') then
     begin
          AFont.Color := clRed;
          Background  := clInfoBk;
          AFont.Style := AFont.Style + [fsBold];
     end
     else if (Frm_Modulo.IBQ_Mensalidade.fieldbyname('menspago').asstring = 'S') then
     begin
          AFont.Color := clBlue;
          Background  := clInfoBk;
          AFont.Style := AFont.Style + [fsBold];
     end;
     if Highlight then
     begin
          AFont.Color := clHighlightText;
          Background := clHighlight;
     end;
end;

procedure TFrm_Mensalidade.Btn_filtrarClick(Sender: TObject);
begin
     if Afuncoes.Localizaindice(Frm_Modulo.ibq_mensalidade,
     'SELECT M.*,A.ALUNNOME FROM TB_MENSALIDADE M, TB_ALUNO A',
     'WHERE M.MENSALUN=A.ALUNMATR AND (A.ALUNINAT ='''+
     'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC)) '+
     'AND M.MENSPAGO=:WP AND M.MENSDTVC <:WD '+
     'ORDER BY M.MENSALUN,M.MENSDTVC',['N',date]) then
end;

procedure TFrm_Mensalidade.Button1Click(Sender: TObject);
begin
     Afuncoes.Localizaindice(Frm_Modulo.ibq_mensalidade,
     'SELECT M.*,A.ALUNNOME FROM TB_MENSALIDADE M, TB_ALUNO A',
     'WHERE M.MENSALUN=A.ALUNMATR AND (A.ALUNINAT ='''+'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC)) '+
     'ORDER BY M.MENSALUN,M.MENSDTVC',[0]);
end;

procedure TFrm_Mensalidade.Btn_editarClick(Sender: TObject);
begin
     with TFrm_EditaMensalidade.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        if Frm_Modulo.IBQ_Mensalidade.IsEmpty then
             LimpaVariavel('','','')
        else AtribuiVariavel(Frm_Modulo.IBQ_Mensalidade);
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_Mensalidade.RxDBGrid1DblClick(Sender: TObject);
begin
     if not Frm_Modulo.IBQ_Mensalidade.IsEmpty then
        with TFrm_EditaMensalidade.Create(Self) do
        try
           caption := Frm_Principal.wNomeEmpresa;
           AtribuiVariavel(Frm_Modulo.IBQ_Mensalidade);
           showmodal;
        Finally
           Free;
        end;
end;

procedure TFrm_Mensalidade.Button2Click(Sender: TObject);
begin
     with TFrm_MensalidadePorSerie.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_Mensalidade.Button3Click(Sender: TObject);
var where : string;
begin
     with TFrm_ApagaMensalidade.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        if showmodal = mrok then
        with Frm_Modulo.ibq_funcoes do
        begin
          where := '';
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;

             close;
             sql.clear;
             sql.add('delete from TB_MENSALIDADE ');
             if cmb_mes.itemindex > 0 then
                where := 'WHERE MENS_MES='''+FORMATFLOAT('00',cmb_mes.itemindex)+'''';
             if trim(edt_ano.Text) <> '' then
             begin
                if trim(where) <> '' then
                     where := where + ' and '
                else where := 'where ';
                where := where + ' MENS_ANO='''+edt_ano.Text+'''';
             end;
             if trim(edt_aluno.Text) <> '' then
             begin
                if trim(where) <> '' then
                     where := where + ' and '
                else where := 'where ';
                where := where + ' MENSALUN='''+edt_aluno.Text+'''';
             end;
             sql.add(where);

             EXECSQL;
             Frm_Modulo.IBT_Transaction.CommitRetaining;

             Button1Click(Self);

          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;


        end;
     Finally
        Free;
     end;

end;

end.
