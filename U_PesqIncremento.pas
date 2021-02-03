unit U_PesqIncremento;

{
 Função para localização de registros na tabela onde são passados campo que
 são selecionados para pesquisa via sql e ordenados pelos mesmos e  retorna
 um valor selecionado para ser tratado na unit de chamado

 if Frm_PesqQuery.AbrePesquisa('select cod_cliente, cnpj_cpf, razao_social from tb_cliente',
 ['Código','CNPJ/CPF','Razão Social'],'ooa',[0],['cod_cliente','cnpj_cpf',
 'razao_social'],1) = mrOk then
 begin
      Frm_Modulo.Tbl_Cliente.FindKey([Frm_PesqQuery.Retorno]);
      Mke_Cgc.SetFocus;
 end;
}

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, Db, Grids, DBGrids, DBTables, StdCtrls, Buttons, DBCtrls, Menus,
     TypInfo, IBCustomDataSet, IBQuery;

type
  TFrm_PesqIncremento = class(TForm)
    Pnl_1: TPanel;
    Cmb_Pesquisa: TComboBox;
    Edt_Pesquisa: TEdit;
    ChB_Ordenar: TCheckBox;
    GrB_1: TGroupBox;
    GrB_2: TGroupBox;
    GrB_3: TGroupBox;
    Lbl_Pesquisa: TLabel;
    Label1: TLabel;
    BtB_Ok: TBitBtn;
    Btb_Cancela: TBitBtn;
    Dts_QryPesquisa: TDataSource;
    Dbg_Pesquisa: TDBGrid;
    Qry_pesquisa: TIBQuery;
    function  AbrePesquisa(Listasql: string; Titulo: array of string;
              Terminacao: string; WPCodigoRecebido: array of variant;
              WPCampoOrdem: array of string; WPNumOrd: integer; WPTIpoCampo:
              array of string;WPPrimLetra: variant): integer;
    procedure FormShow(Sender: TObject);
    procedure EscreveLabel;
    procedure Dbg_PesquisaDblClick(Sender: TObject);
    procedure PreencheDbGrid;
    procedure WMHotkey(var msg: TWMHotkey); message WM_HOTKEY;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Abrequery;
    procedure Cmb_PesquisaExit(Sender: TObject);
  private
    function  GetRetorno: variant;
    procedure SetRetorno(NovoRetorno: variant);
  public
    property  Retorno: variant read GetRetorno write SetRetorno;
    // variavel de retorno da pesquisa
  end;

var
  Frm_PesqIncremento:          TFrm_PesqIncremento;
  wListaSqlPesquisa:      string;          // variavel para receber os parametros da query
  wListaTerminacao:       string;          // variavel para receber se termina com A ou O
  wTituloDbGrid, wOrdens, wTipoCampo: array of string;
  wParametros:            array of variant;
  wPrimLetra: string;

implementation

uses U_Funcoes, U_Modulo, U_Principal;

{$R *.DFM}

//------------------------------------------------------------------------------
function TFrm_PesqIncremento.GetRetorno: variant;
//------------------------------------------------------------------------------
begin
     Result :=Qry_Pesquisa.Fields[0].Value;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.SetRetorno(NovoRetorno: variant);
//------------------------------------------------------------------------------
begin
     Qry_Pesquisa.Fields[0].Value;
end;

//------------------------------------------------------------------------------
Function TFrm_PesqIncremento.AbrePesquisa(Listasql: string; Titulo: array of
         string; Terminacao: string; WPCodigoRecebido: array of variant;
         WPCampoOrdem: array of string; WPNumOrd: integer;WPTIpoCampo: array
         of string;WPPrimLetra: variant): integer;
//------------------------------------------------------------------------------
var i, wTamArray: integer;   // variavel para processar dbg_pesquisa
begin
     wTamArray := length(Titulo);

     SetLength(wTituloDbGrid,length(Titulo));
     wListaSqlPesquisa:=ListaSql;
     wListaTerminacao :=terminacao;
     SetLength(wOrdens,length(Titulo));
     SetLength(wTipoCampo,length(Titulo));
     wPrimLetra := UPPERCASE(WPPrimLetra);
     SetLength(wParametros,length(wPCodigoRecebido));

     for i:=0 to high(wPCodigoRecebido) do
         wParametros[i]:=wPCodigoRecebido[i];

     Cmb_Pesquisa.Items.Clear;
     for i:= 0 to High(Titulo) do
     begin
          wTituloDbGrid[i] := Titulo[i];
          wOrdens[i]       := WPCampoOrdem[i];
          wTipoCampo[i]    := UPPERCASE(WPTipoCampo[i]);
          Cmb_Pesquisa.Items.Add(Titulo[i]);
     end;
     Cmb_Pesquisa.ItemIndex:=WPNumOrd;
     ChB_Ordenar.checked:=true;
     Result:= ShowModal;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.Abrequery;
//------------------------------------------------------------------------------
var wi: integer;
    wCampoOrdem, wcampo, wcampoaux : string;
begin
     if ChB_Ordenar.checked then
     begin
          with Qry_Pesquisa do
          begin
               wCampoOrdem:=wOrdens[Cmb_Pesquisa.Itemindex];
               close;
               Sql.Clear;

               if (wTipoCampo[Cmb_Pesquisa.Itemindex] = 'D') then
               begin
                    wcampo := copy(edt_pesquisa.text,4,2)+'/'+
                             copy(edt_pesquisa.text,1,2)+'/'+
                             copy(edt_pesquisa.text,7,4);
                    Sql.add(wListaSqlPesquisa+wCampoOrdem+' = '+CHR(39)+
                    wcampo+CHR(39)+' order by '+wCampoOrdem)
               end
               else if (wTipoCampo[Cmb_Pesquisa.Itemindex] = 'R') then
               begin
                    edt_pesquisa.Text := trim(edt_pesquisa.Text);
                    wcampo := '';
                    // tirar o ponto da casa de milhar
                    For wI := 1 to Length(edt_pesquisa.Text) Do
                         If pos(copy(edt_pesquisa.Text,wI,1),'.') = 0 Then
                            wcampo := wcampo + copy(edt_pesquisa.Text,wI,1);

                    // substituir a virgula do decimal pelo ponto
                    wcampoaux := '';
                    For wI := 1 to Length(wcampo) Do
                         If pos(copy(wcampo,wI,1),',') = 0 Then
                              wcampoaux := wcampoaux + copy(wcampo,wI,1)
                         else wcampoaux := wcampoaux + '.';

                    Sql.add(wListaSqlPesquisa+wCampoOrdem+' = '+CHR(39)+
                    wcampoaux+CHR(39)+' order by '+wCampoOrdem)
               end
               else Sql.add(wListaSqlPesquisa+wCampoOrdem+' LIKE '+CHR(39)+'%'+
                    edt_pesquisa.text+'%'+CHR(39)+' order by '+wCampoOrdem);

               //select * from tb_fabricante WHERE fabrdesc LIKE '%VO%' order
               //by fabrdesc
               if ParamCount > 0 then
               begin
                    for wi:= 0 to ParamCount - 1 do
                        Params[wi].value:=wParametros[wi];
               end;
               prepare;
               open;
          end;
          PreencheDbGrid;
     end;
     EscreveLabel;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.PreencheDbGrid;
//------------------------------------------------------------------------------
var wi: integer;
begin
     for wi:= 0 to High(wTituloDbGrid) do
     begin
          Dbg_Pesquisa.Columns[wi].title.caption:=wTituloDbGrid[wi];
          {
            Se o campo for do tipo real 99.999,999 alinhar a direita e definir
            o tamanho da coluna para 100
            wTipoCampo
            S - string
            R - real
            I - Inteiro
            D - Data
            H - Hora
            DH - DataHora
          }
          if wTipoCampo[wI] = 'R' then
          begin
                Dbg_Pesquisa.Fields[wi].alignment :=taRightJustify;
                Dbg_Pesquisa.Columns[wi].width    :=100;
          end
          else if (wTipoCampo[wI] = 'D') or (wTipoCampo[wI] = 'H')
          or (wTipoCampo[wI] = 'DH') then Dbg_Pesquisa.Columns[wi].width :=100;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Frm_PesqIncremento.height  := 185;
     Frm_PesqIncremento.Caption := Frm_Principal.wNomeEmpresa;
     RegisterHotKey(Handle, 100, MOD_ALT, 83);
     RegisterHotKey(Handle, 200, MOD_ALT, 73);
     Edt_Pesquisa.Text:=wPrimLetra;
     Edt_Pesquisa.Setfocus;
     EscreveLabel;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.EscreveLabel;
//------------------------------------------------------------------------------
begin
     Lbl_Pesquisa.Caption := 'D&igite '+Copy(wListaTerminacao,
     Cmb_Pesquisa.Itemindex+1,1)+' '+lowercase(Cmb_Pesquisa.Text)+
     ' a ser consultado(a):';
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.Dbg_PesquisaDblClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     ModalResult:= mrOk;
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.WMHotkey(var msg : TWMHotkey);
//------------------------------------------------------------------------------
begin
      case msg.hotkey of
           100: Cmb_pesquisa.setfocus;
           200: Edt_Pesquisa.setfocus;
      end;
end;
//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.FormClose(Sender: TObject; var Action:
          TCloseAction);
//------------------------------------------------------------------------------
begin
     UnRegisterHotKey(Handle, 100);
     UnRegisterHotKey(Handle, 200);
end;

//------------------------------------------------------------------------------
procedure TFrm_PesqIncremento.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     if (key = #13) then
     begin
          key:= #0;
          Frm_PesqIncremento.height  := 424;
          if (wTipoCampo[Cmb_Pesquisa.Itemindex] = 'D') then
          begin
               if not aFuncoes.ValidaData(edt_pesquisa.text) then
                  edt_pesquisa.Setfocus
               else Abrequery;
          end
          else Abrequery;
     end;
end;

procedure TFrm_PesqIncremento.Cmb_PesquisaExit(Sender: TObject);
begin
     EscreveLabel;
end;

end.
