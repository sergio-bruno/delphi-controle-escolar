unit U_CdFuncionario;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls,
     IBQuery, DBTables, FnpNumericEdit, ExtDlgs, IBCustomDataSet;

type
  TFrm_CdFuncionario = class(TForm)
    Pnl_01: TPanel;
    Lbl_Descricao: TLabel;
    Btn_Gravar: TButton;
    Btn_Excluir: TButton;
    Btn_Sair: TButton;
    Lbl_Titulo: TLabel;
    Edt_agennome: TEdit;
    Btn_cancela: TButton;
    Btn_Pesquisa: TButton;
    Tlb_Navegador: TToolBar;
    Edt_AgenCodg: TEdit;
    Grb_1: TGroupBox;
    Lbl_CodCentroCusto: TLabel;
    Edt_ageniden: TEdit;
    Mke_Agencpfs: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Grb_3: TGroupBox;
    Edt_agenendr: TEdit;
    Label5: TLabel;
    Edt_agenbair: TEdit;
    Label6: TLabel;
    Edt_agencida: TEdit;
    Label8: TLabel;
    Mke_agenceps: TMaskEdit;
    Label9: TLabel;
    Edt_agenufed: TEdit;
    Spb_LocalizaEstado: TSpeedButton;
    Grb_2: TGroupBox;
    Mke_agenfon1: TMaskEdit;
    Label10: TLabel;
    Mke_agenfon2: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    Mke_agenfaxs: TMaskEdit;
    Label15: TLabel;
    Mke_agencelu: TMaskEdit;
    Label16: TLabel;
    Mke_agendtnc: TMaskEdit;
    Label19: TLabel;
    Edt_agenemai: TEdit;
    Rdg_agensexo: TRadioGroup;
    Grb_4: TGroupBox;
    Mem_agenobsv: TMemo;
    Lbl_Endereco: TLabel;
    SPB_help: TSpeedButton;
    Panel1: TPanel;
    Img_agenfoto: TImage;
    SpeedButton1: TSpeedButton;
    Opd_imagem: TOpenPictureDialog;
    Label3: TLabel;
    Edt_agensenh: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edt_AgenCodgExit(Sender: TObject);
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
    procedure Edt_agenufedExit(Sender: TObject);
    procedure Spb_LocalizaEstadoClick(Sender: TObject);
    procedure LocalizaEstado(WPPrimLetra: string);
    procedure Edt_agenemaiExit(Sender: TObject);
    procedure Mke_AgencpfsExit(Sender: TObject);
    procedure Mke_agendtncExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  end;

var Frm_CdFuncionario: TFrm_CdFuncionario;
    wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_Principal, U_PesqIncremento;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     If (Key = #13) and not (ActiveControl is TMemo)  then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LimpaVariavel('');
     Edt_agencodg.setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Edt_AgenCodgExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcionario,
     'Select * from tb_funcionario','where agencodg=:wagencodg',
     [Edt_agencodg.Text]) then Atribuiregistro
     else Limpavariavel(Edt_agencodg.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if TestaCampoVazio then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação do funcionário ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro;
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
                  Opd_Imagem.filename := '';
                  wAlterouReg:=false;
                  Edt_agennome.SetFocus;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.GravaRegistro;
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcionario,
          'Select * from tb_funcionario','where agencodg=:wagencodg',
          [Edt_agencodg.Text]) then
          begin
               close;
               Sql.clear;
               Sql.add('insert into tb_funcionario (agencodg,agencpfs,');
               Sql.add('ageniden,agennome,agenendr,agenbair,agencida,');
               Sql.add('agenceps,agenufed,agenfon1,agenfon2,agenfaxs,');
               Sql.add('agencelu,agenemai,agendtnc,agensexo,agensenh,');
               if Opd_Imagem.filename <> '' then Sql.add('agenfoto,');
               Sql.add('agenobsv)');
               Sql.add('values (:wagencodg,:wagencpfs,:wageniden,');
               Sql.add(':wagennome,:wagenendr,:wagenbair,:wagencida,');
               Sql.add(':wagenceps,:wagenufed,:wagenfon1,:wagenfon2,');
               Sql.add(':wagenfaxs,:wagencelu,:wagenemai,:wagendtnc,');
               Sql.add(':wagensexo,:wagensenh,');
               if Opd_Imagem.filename <> '' then Sql.add(':wagenfoto,');
               Sql.add(':wagenobsv)');
          end
          else
          begin
               close;
               Sql.clear;
               Sql.add('update tb_funcionario set agencpfs=:wagencpfs,');
               Sql.add('ageniden=:wageniden,agennome=:wagennome,');
               Sql.add('agenendr=:wagenendr,agenbair=:wagenbair,');
               Sql.add('agencida=:wagencida,agenceps=:wagenceps,');
               Sql.add('agenufed=:wagenufed,agenfon1=:wagenfon1,');
               Sql.add('agenfon2=:wagenfon2,agenfaxs=:wagenfaxs,');
               Sql.add('agencelu=:wagencelu,agenemai=:wagenemai,');
               Sql.add('agendtnc=:wagendtnc,agensexo=:wagensexo,');
               Sql.add('agenobsv=:wagenobsv,agensenh=:wagensenh');
               if Opd_Imagem.filename <> '' then Sql.add(',agenfoto=:wagenfoto');
               Sql.add('where agencodg=:wagencodg');
          end;
          parambyname('wagendtnc').Asdatetime := aFuncoes.ResultaDataGravar(
                                                 Mke_agendtnc.text);
          parambyname('wagencodg').AsString   := Edt_agencodg.text;
          parambyname('wagennome').AsString   := Edt_agennome.Text;
          parambyname('wageniden').AsString   := Edt_ageniden.Text;
          parambyname('wagencpfs').AsString   := Mke_Agencpfs.Text;
          parambyname('wagenendr').AsString   := Edt_agenendr.Text;
          parambyname('wagenbair').AsString   := Edt_agenbair.Text;
          parambyname('wagencida').AsString   := Edt_agencida.Text;
          parambyname('wagenceps').AsString   := Mke_agenceps.Text;
          parambyname('wagenufed').AsString   := Edt_agenufed.Text;
          parambyname('wagenfon1').AsString   := Mke_agenfon1.Text;
          parambyname('wagenfon2').AsString   := Mke_agenfon2.Text;
          parambyname('wagencelu').AsString   := Mke_agencelu.Text;
          parambyname('wagenemai').AsString   := Edt_agenemai.Text;
          parambyname('wagenfaxs').AsString   := Mke_agenfaxs.Text;
          parambyname('wagensenh').AsString   := Edt_agensenh.Text;
          parambyname('wagenobsv').Asmemo     := TRIM(Mem_agenobsv.Text);
          if Opd_Imagem.filename <> '' then
             parambyname('wagenfoto').LoadFromFile(Opd_imagem.filename,ftBlob);
          case Rdg_agensexo.itemindex of
               0: parambyname('wagensexo').AsString := 'M';
               1: parambyname('wagensexo').AsString := 'F';
          end;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Edt_agencodg.text) = '' then
     begin
          aFuncoes.MessageDlgDef('É necessário selecionar um funcionário...',
          mtInformation,[mbOk], mrok, 0);
          Edt_agencodg.setfocus;
     end
     else if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcionario,
     'Select * from tb_funcionario','where agencodg=:wagencodg',
     [Edt_agencodg.Text]) then
          aFuncoes.MessageDlgDef(
          'Este funcionário não está registrado você pode cancelá-lo...',
          mtInformation,[mbOk], mrok, 0)
     else If aFuncoes.MessageDlgDef('Confirma a exclusão deste funcionário ?',
     mtConfirmation, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB(
             'delete from tb_funcionario where agencodg=:wchave',
             [Edt_agencodg.Text]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             Limpavariavel('');
             Edt_agencodg.SetFocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_agencodg.setfocus;
end;

//------------------------------------------------------------------------------
Procedure TFrm_CdFuncionario.limpavariavel(WCodigo: string);
//------------------------------------------------------------------------------
begin
     Edt_agencodg.text := WCodigo;
     Edt_agennome.Text :='';
     Edt_ageniden.Text :='';
     Mke_Agencpfs.Text :='';
     Edt_agenendr.Text :='';
     Edt_agenbair.Text :='';
     Edt_agencida.Text :='';
     Mke_agenceps.Text :='';
     Edt_agenufed.Text :='';
     Mke_agenfon1.Text :='';
     Mke_agenfon2.Text :='';
     Mke_agencelu.Text :='';
     Edt_agensenh.Text :='';
     Mke_agenfaxs.Text :='';
     Mke_agendtnc.Text :='';
     Rdg_agensexo.itemindex := 0;
     Edt_agenemai.Text :='';
     Mem_agenobsv.lines.clear;
     Img_agenfoto.picture.Bitmap := nil;
     Opd_Imagem.filename := '';
     if WCodigo = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Frm_PesqIncremento.AbrePesquisa(
     'select agencodg,agennome from tb_funcionario where ',['Código',
     'Funcionário'],'oa',[0],['agencodg','agennome'],1,['S','S'],'') = mrOk) and
     (Afuncoes.Localizaindice(Frm_Modulo.IBQ_Funcionario,
     'Select * from tb_funcionario','where agencodg=:wagencodg',
     [Frm_PesqIncremento.Retorno])) then
     begin
          Atribuiregistro;
          Edt_agennome.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure TFrm_CdFuncionario.Atribuiregistro;
//------------------------------------------------------------------------------
begin
    With Frm_Modulo.IBQ_Funcionario do
    Begin
       Edt_agencodg.Text := Fieldbyname('agencodg').AsString;
       Edt_agennome.Text := Fieldbyname('agennome').AsString;
       Edt_ageniden.Text := Fieldbyname('ageniden').AsString;
       Mke_Agencpfs.Text := Fieldbyname('agencpfs').AsString;
       Edt_agenendr.Text := Fieldbyname('agenendr').AsString;
       Edt_agenbair.Text := Fieldbyname('agenbair').AsString;
       Edt_agencida.Text := Fieldbyname('agencida').AsString;
       Mke_agenceps.Text := Fieldbyname('agenceps').AsString;
       Edt_agenufed.Text := Fieldbyname('agenufed').AsString;
       Mke_agenfon1.Text := Fieldbyname('agenfon1').AsString;
       Mke_agenfon2.Text := Fieldbyname('agenfon2').AsString;
       Mke_agencelu.Text := Fieldbyname('agencelu').AsString;
       Edt_agensenh.Text := Fieldbyname('agensenh').AsString;
       Mke_agenfaxs.Text := Fieldbyname('agenfaxs').AsString;
       Mke_agendtnc.Text := aFuncoes.RetornaDataStr(Fieldbyname(
                            'agendtnc').Asdatetime);
       if Fieldbyname('agensexo').AsString = 'M' then
            Rdg_agensexo.itemindex := 0
       else if Fieldbyname('agensexo').AsString = 'F' then
            Rdg_agensexo.itemindex := 1
       else Rdg_agensexo.itemindex := -1;
       Edt_agenemai.Text := Fieldbyname('agenemai').AsString;
       Mem_agenobsv.Text := Fieldbyname('agenobsv').AsString;

       if Frm_modulo.IBQ_FuncionarioAGENFOTO.IsNull then
            Img_agenfoto.picture.Assign(nil)
       else Img_agenfoto.picture.Assign(Frm_modulo.IBQ_FuncionarioAGENFOTO);
    end;
    wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Close;
end;

//------------------------------------------------------------------------------
function TFrm_CdFuncionario.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_agencodg.text,
     'o código do funcionário') then
          Edt_agencodg.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_agennome.text,'o nome do funcionário') then
          Edt_agennome.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_agensenh.text,'a senha do professor') then
          Edt_agensenh.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.VerAlteracoes(Sender: TObject);
//------------------------------------------------------------------------------
begin wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.FormCloseQuery(Sender:TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente do funcionário foi alterado, se você sair as '+
          #13+'alterações não serão salvas. Deseja sair ?', mtConfirmation,
             [mbNo, mbYes], mrNo, 0) = mrNo then
             canclose:=false;
     end;
     if canclose then
     with Frm_Modulo do
     begin
          IBQ_Funcionario.close;
          IBQ_Funcoes.close;
          Frm_PesqIncremento.Qry_Pesquisa.close;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.SPB_helpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_CentroCusto.Handle,'Ajuda.Hlp',HELP_CONTEXT,10);
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Edt_agenufedExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Trim(Edt_agenufed.text) <> '') and not (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_Funcoes,'Select * from tb_estado',
     'where sigla=:wsigla',[Edt_agenufed.Text])) then
     begin
          aFuncoes.MessageDlgDef('Código do estado informado inválido...',
          mtInformation,[mbok],mrok,0);
          Edt_agenufed.setfocus;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Spb_LocalizaEstadoClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LocalizaEstado('');
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.LocalizaEstado(WPPrimLetra: string);
//------------------------------------------------------------------------------
begin
     Edt_agenufed.Setfocus;
     if Frm_PesqIncremento.AbrePesquisa('select * from tb_estado where ',['Código','Estado']
     ,'oo',[0],['sigla','descricao'],1,['S','S'],WPPrimLetra) = mrOk then
          Edt_agenufed.text := Frm_PesqIncremento.Retorno;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Edt_agenemaiExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     // verificar a existência de @
     if (Trim(Edt_agenemai.text) <> '') and (pos('@',Edt_agenemai.text) = 0)
     then
     begin
          aFuncoes.MessageDlgDef('Verifique a existência de "@" no e-mail...',
          mtInformation,[mbok],mrok,0);
          Edt_agenemai.setfocus;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Mke_AgencpfsExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if not aFuncoes.ValidaCpf(Mke_Agencpfs.text) then
        Mke_Agencpfs.setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.Mke_agendtncExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if not aFuncoes.ValidaData(Mke_agendtnc.text) then
        Mke_agendtnc.setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdFuncionario.FormKeyDown(Sender: TObject; var Key: Word; Shift:
          TShiftState);
//------------------------------------------------------------------------------
begin
     if (Key = 119) then
     begin
          if (Edt_agenufed.Focused) then LocalizaEstado('');
     end
     else if key = 27 then close;
end;

procedure TFrm_CdFuncionario.SpeedButton1Click(Sender: TObject);
begin
     if Opd_Imagem.execute then img_agenfoto.picture.loadfromfile(Opd_Imagem.filename);
end;

end.
