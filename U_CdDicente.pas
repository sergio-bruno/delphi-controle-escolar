unit U_CdDicente;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ExtCtrls, Buttons, DB, DBCtrls, Mask, ToolWin, ComCtrls,
     IBQuery, DBTables, FnpNumericEdit, ExtDlgs, IBCustomDataSet;

type
  TFrm_CdDicente = class(TForm)
    Pnl_01: TPanel;
    Lbl_Descricao: TLabel;
    Btn_Gravar: TButton;
    Btn_Excluir: TButton;
    Btn_Sair: TButton;
    Lbl_Titulo: TLabel;
    Edt_alunnome: TEdit;
    Btn_cancela: TButton;
    Btn_Pesquisa: TButton;
    Tlb_Navegador: TToolBar;
    Edt_alunmatr: TEdit;
    Grb_1: TGroupBox;
    Lbl_CodCentroCusto: TLabel;
    SPB_help: TSpeedButton;
    Opd_imagem: TOpenPictureDialog;
    Pgc_Principal: TPageControl;
    TabSheet1: TTabSheet;
    Grb_3: TGroupBox;
    Label10: TLabel;
    Label16: TLabel;
    SpeedButton1: TSpeedButton;
    Mke_alunfone: TMaskEdit;
    Mke_alunnasc: TMaskEdit;
    Rdg_alunsexo: TRadioGroup;
    Panel1: TPanel;
    Img_alunfoto: TImage;
    Grb_2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Spb_LocalizaEstado: TSpeedButton;
    Lbl_Endereco: TLabel;
    Edt_alunende: TEdit;
    Edt_alunbair: TEdit;
    Edt_aluncida: TEdit;
    Mke_alun_cep: TMaskEdit;
    edt_alunesta: TEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Edt_aluncdns: TEdit;
    Label4: TLabel;
    edt_alunufns: TEdit;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Edt_alunctnm: TEdit;
    Edt_alunctrg: TEdit;
    Label13: TLabel;
    edt_alunctlv: TEdit;
    Label17: TLabel;
    edt_alunctfl: TEdit;
    Label18: TLabel;
    edt_alunctcd: TEdit;
    Label20: TLabel;
    edt_alunctuf: TEdit;
    SpeedButton3: TSpeedButton;
    Label21: TLabel;
    mke_alunctem: TMaskEdit;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label26: TLabel;
    edt_alunflpa: TEdit;
    edt_alunflpb: TEdit;
    Label23: TLabel;
    mke_alunflfp: TMaskEdit;
    Label24: TLabel;
    edt_alunfltp: TEdit;
    edt_alunflpc: TEdit;
    Label25: TLabel;
    Label28: TLabel;
    mke_alunflpf: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    edt_alunfltm: TEdit;
    edt_alunflma: TEdit;
    Label31: TLabel;
    edt_alunflmb: TEdit;
    edt_alunflmc: TEdit;
    Label32: TLabel;
    mke_alunflfm: TMaskEdit;
    Label33: TLabel;
    Label35: TLabel;
    mke_alunflmf: TMaskEdit;
    GroupBox3: TGroupBox;
    Label36: TLabel;
    Label39: TLabel;
    edt_alunnom1: TEdit;
    mke_alunfon1: TMaskEdit;
    Label37: TLabel;
    edt_alunnom2: TEdit;
    Label38: TLabel;
    mke_alunfon2: TMaskEdit;
    mem_alunpbsd: TMemo;
    Label40: TLabel;
    Label41: TLabel;
    mem_alunaler: TMemo;
    Label42: TLabel;
    mem_alunmedi: TMemo;
    Label43: TLabel;
    mem_alunciru: TMemo;
    Label44: TLabel;
    edt_alunplsd: TEdit;
    Label45: TLabel;
    edt_aluntpsg: TEdit;
    Label27: TLabel;
    edt_alunflpp: TEdit;
    Label34: TLabel;
    edt_alunflmp: TEdit;
    GroupBox4: TGroupBox;
    chk_aluninat: TCheckBox;
    mke_alundtin: TMaskEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edt_alunmatrExit(Sender: TObject);
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
    procedure edt_alunestaExit(Sender: TObject);
    procedure Spb_LocalizaEstadoClick(Sender: TObject);
    procedure LocalizaEstado(WPPrimLetra: string; Sender: TObject);
    procedure Mke_alunnascExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mke_alundtinExit(Sender: TObject);
    procedure chk_aluninatExit(Sender: TObject);
    function  TestaAtividade: boolean;
  end;

var Frm_CdDicente: TFrm_CdDicente;
    wAlterouReg : boolean;

implementation

uses U_Modulo, U_Funcoes, U_Principal, U_PesqIncremento;

{$R *.DFM}

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.FormKeyPress(Sender: TObject; var Key: Char);
//------------------------------------------------------------------------------
begin
     If (Key = #13) then
     begin
        key:= #0;
        Perform(WM_NEXTDLGCTL,0,0);
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.FormShow(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Pgc_Principal.ActivePage := TabSheet1;
     LimpaVariavel('');
     Edt_alunmatr.setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Edt_alunmatrExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Afuncoes.Localizaindice(Frm_Modulo.ibq_aluno,
     'Select * from tb_aluno','where alunmatr=:walunmatr',
     [Edt_alunmatr.Text]) then Atribuiregistro
     else Limpavariavel(Edt_alunmatr.Text);
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Btn_GravarClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (TestaCampoVazio) and (TestaAtividade) then
     begin
          If (aFuncoes.MessageDlgDef('Confirma gravação do aluno ?',
          mtConfirmation,[mbCancel, mbYes], mryes, 0) = mrYes) then
          begin
               try
                  If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                     Frm_Modulo.IBT_Transaction.StartTransaction;
                  GravaRegistro;
                  Frm_Modulo.IBT_Transaction.CommitRetaining;
                  Opd_Imagem.filename := '';
                  wAlterouReg:=false;
                  Pgc_principal.SetFocus;
               except
                  Frm_Modulo.IBT_Transaction.rollback;
                  aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
                  mtWarning, [mbok],mrok, 0);
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.GravaRegistro;
//------------------------------------------------------------------------------
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          if not Afuncoes.Localizaindice(Frm_Modulo.ibq_aluno,
          'Select * from tb_aluno','where alunmatr=:walunmatr',
          [Edt_alunmatr.Text]) then
          begin
               close;
               Sql.clear;
               Sql.add('insert into tb_aluno (alunmatr,alunnome,');
               Sql.add('alun_cep,alunsexo,alunende,alunbair,aluncida,');
               Sql.add('alunfone,alunesta,alunnasc,aluncdns,alunufns,');
               Sql.add('alunctnm,alunctrg,');
               Sql.add('alunctlv,alunctfl,alunctcd,alunctuf,alunctem,alunflpa,');
               Sql.add('alunflfp,alunfltp,alunflpf,alunflpb,alunflpc,alunflpp,');
               Sql.add('alunflma,alunflfm,alunfltm,alunflmf,alunflmb,alunflmc,');
               Sql.add('alunnom1,alunnom2,alunfon1,alunfon2,alunpbsd,alunflmp,');
               Sql.add('alunaler,alunmedi,alunciru,alunplsd,alundins,aluninat,alundtin,');
               if Opd_Imagem.filename <> '' then Sql.add('alunfoto,');
               Sql.add('aluntpsg)');
               Sql.add('values (:walunmatr,:walunnome,');
               Sql.add(':walun_cep,:walunsexo,:walunende,:walunbair,:waluncida,');
               Sql.add(':walunfone,:walunesta,:walunnasc,:waluncdns,:walunufns,');
               Sql.add(':walunctnm,:walunctrg,');
               Sql.add(':walunctlv,:walunctfl,:walunctcd,:walunctuf,:walunctem,:walunflpa,');
               Sql.add(':walunflfp,:walunfltp,:walunflpf,:walunflpb,:walunflpc,:walunflpp,');
               Sql.add(':walunflma,:walunflfm,:walunfltm,:walunflmf,:walunflmb,:walunflmc,');
               Sql.add(':walunnom1,:walunnom2,:walunfon1,:walunfon2,:walunpbsd,:walunflmp,');
               Sql.add(':walunaler,:walunmedi,:walunciru,:walunplsd,:walundins,:waluninat,:walundtin,');
               if Opd_Imagem.filename <> '' then Sql.add(':walunfoto,');
               Sql.add(':waluntpsg)');

          end
          else
          begin
               close;
               Sql.clear;
               Sql.add('update tb_aluno set alunmatr=:walunmatr,alunnome=:walunnome,');
               Sql.add('alun_cep=:walun_cep,alunsexo=:walunsexo,alunende=:walunende,alunbair=:walunbair,aluncida=:waluncida,');
               Sql.add('alunfone=:walunfone,alunesta=:walunesta,alunnasc=:walunnasc,aluncdns=:waluncdns,alunufns=:walunufns,');
               Sql.add('alunctnm=:walunctnm,alunctrg=:walunctrg,');
               Sql.add('alunctlv=:walunctlv,alunctfl=:walunctfl,alunctcd=:walunctcd,alunctuf=:walunctuf,alunctem=:walunctem,alunflpa=:walunflpa,');
               Sql.add('alunflfp=:walunflfp,alunfltp=:walunfltp,alunflpf=:walunflpf,alunflpb=:walunflpb,alunflpc=:walunflpc,alunflpp=:walunflpp,');
               Sql.add('alunflma=:walunflma,alunflfm=:walunflfm,alunfltm=:walunfltm,alunflmf=:walunflmf,alunflmb=:walunflmb,alunflmc=:walunflmc,');
               Sql.add('alunnom1=:walunnom1,alunnom2=:walunnom2,alunfon1=:walunfon1,alunfon2=:walunfon2,alunpbsd=:walunpbsd,alunflmp=:walunflmp,');
               Sql.add('alunaler=:walunaler,alunmedi=:walunmedi,alunciru=:walunciru,alunplsd=:walunplsd,aluntpsg=:waluntpsg,alundins=:walundins,aluninat=:waluninat,alundtin=:walundtin');
               if Opd_Imagem.filename <> '' then Sql.add(',alunfoto=:walunfoto');
               Sql.add('where alunmatr=:walunmatr');
          end;
          parambyname('walunmatr').asstring := edt_alunmatr.Text;
          parambyname('walunnome').asstring := edt_alunnome.Text;
          parambyname('walun_cep').asstring := mke_alun_cep.Text;
          parambyname('walunende').asstring := edt_alunende.Text;
          parambyname('walunbair').asstring := edt_alunbair.Text;
          parambyname('waluncida').asstring := edt_aluncida.Text;
          parambyname('walunfone').asstring   := mke_alunfone.Text;
          parambyname('walunesta').asstring   := edt_alunesta.Text;
          parambyname('walunnasc').asdatetime := aFuncoes.ResultaDataGravar(mke_alunnasc.Text);
          parambyname('walundtin').asdatetime := aFuncoes.ResultaDataGravar(mke_alundtin.Text);
          parambyname('waluninat').asstring   := afuncoes.EntraVF_RetSN(chk_aluninat.checked);
          if copy(mke_alunnasc.Text,7,4) > '1900' then
               parambyname('walundins').asstring := copy(mke_alunnasc.Text,4,2)
          else parambyname('walundins').asstring := '00';
          parambyname('waluncdns').asstring := edt_aluncdns.Text;
          parambyname('walunufns').asstring := edt_alunufns.Text;
          parambyname('walunctnm').asstring := edt_alunctnm.Text;
          parambyname('walunctrg').asstring := edt_alunctrg.Text;
          parambyname('walunctlv').asstring := edt_alunctlv.Text;
          parambyname('walunctfl').asstring := edt_alunctfl.Text;
          parambyname('walunctcd').asstring := edt_alunctcd.Text;
          parambyname('walunctuf').asstring := edt_alunctuf.Text;
          parambyname('walunctem').asdatetime := aFuncoes.ResultaDataGravar(
                                                 mke_alunctem.Text);
          parambyname('walunflpa').asstring := edt_alunflpa.Text;
          parambyname('walunflfp').asstring := mke_alunflfp.Text;
          parambyname('walunfltp').asstring := edt_alunfltp.Text;
          parambyname('walunflpf').asstring := mke_alunflpf.Text;
          parambyname('walunflpb').asstring := edt_alunflpb.Text;
          parambyname('walunflpc').asstring := edt_alunflpc.Text;
          parambyname('walunflma').asstring := edt_alunflma.Text;
          parambyname('walunflfm').asstring := mke_alunflfm.Text;
          parambyname('walunfltm').asstring := edt_alunfltm.Text;
          parambyname('walunflmf').asstring := mke_alunflmf.Text;
          parambyname('walunflmb').asstring := edt_alunflmb.Text;
          parambyname('walunflmc').asstring := edt_alunflmc.Text;
          parambyname('walunnom1').asstring := edt_alunnom1.Text;
          parambyname('walunnom2').asstring := edt_alunnom2.Text;
          parambyname('walunfon1').asstring := mke_alunfon1.Text;
          parambyname('walunfon2').asstring := mke_alunfon2.Text;
          parambyname('walunflpp').asstring := edt_alunflpp.Text;
          parambyname('walunflmp').asstring := edt_alunflmp.Text;
          parambyname('walunpbsd').asmemo   := trim(mem_alunpbsd.Text);
          parambyname('walunaler').asmemo   := trim(mem_alunaler.Text);
          parambyname('walunmedi').asmemo   := trim(mem_alunmedi.Text);
          parambyname('walunciru').asmemo   := trim(mem_alunciru.Text);
          parambyname('walunplsd').asstring := edt_alunplsd.Text;
          parambyname('waluntpsg').asstring := edt_aluntpsg.Text;
          if Opd_Imagem.filename <> '' then
             parambyname('walunfoto').LoadFromFile(Opd_imagem.filename,ftBlob);
          case Rdg_alunsexo.itemindex of
               0: parambyname('walunsexo').AsString := 'M';
               1: parambyname('walunsexo').AsString := 'F';
          end;
          prepare;
          execsql;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Btn_ExcluirClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Trim(Edt_alunmatr.text) = '' then
     begin
          aFuncoes.MessageDlgDef('É necessário selecionar um aluno...',
          mtInformation,[mbOk], mrok, 0);
          Edt_alunmatr.setfocus;
     end
     else if not Afuncoes.Localizaindice(Frm_Modulo.ibq_aluno,
     'Select * from tb_aluno','where alunmatr=:walunmatr',
     [Edt_alunmatr.Text]) then
          aFuncoes.MessageDlgDef(
          'Este aluno não está registrado você pode cancelá-lo...',
          mtInformation,[mbOk], mrok, 0)
     else If aFuncoes.MessageDlgDef('A exclusão deste aluno eliminará todo o seu histórico !!!'
     +#13+'Confirma a exclusão deste aluno ?',
     mtWarning, [mbCancel, mbYes], mrCancel, 0) = mrYes then
     begin
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB(
             'delete from tb_matrconceito where matralun=:wchave',
             [Edt_alunmatr.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from tb_matricula where matralun=:wchave',
             [Edt_alunmatr.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from tb_matrtabconceito where matralun=:wchave',
             [Edt_alunmatr.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from tb_mensalidade where mensalun=:wchave',
             [Edt_alunmatr.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from tb_mensalternada where mensalun=:wchave',
             [Edt_alunmatr.Text]);
             afuncoes.STOperaRegistrosIB(
             'delete from tb_aluno where alunmatr=:wchave',
             [Edt_alunmatr.Text]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
             Limpavariavel('');
             Edt_alunmatr.SetFocus;
          except
             Frm_Modulo.IBT_Transaction.rollback;
             aFuncoes.MessageDlgDef('Não foi possível registar estas alterações !',
             mtWarning, [mbok],mrok, 0);
          end;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Btn_cancelaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Limpavariavel('');
     Edt_alunmatr.setfocus;
end;

//------------------------------------------------------------------------------
Procedure TFrm_CdDicente.limpavariavel(WCodigo: string);
//------------------------------------------------------------------------------
begin
     Edt_alunmatr.text := WCodigo;
     Edt_alunnome.text := '';
     mke_alun_cep.text := '';
     Edt_alunende.text := '';
     Edt_alunbair.text := '';
     Edt_aluncida.text := '';
     mke_alunfone.text := '';
     Edt_alunesta.text := '';
     mke_alunnasc.text := '';
     chk_aluninat.checked := false;
     mke_alundtin.text := '';
     Edt_aluncdns.text := '';
     Edt_alunufns.text := '';
     Edt_alunctnm.text := '';
     Edt_alunctrg.text := '';
     Edt_alunctlv.text := '';
     Edt_alunctfl.text := '';
     Edt_alunctcd.text := '';
     Edt_alunctuf.text := '';
     mke_alunctem.text := '';
     Edt_alunflpa.text := '';
     mke_alunflfp.text := '';
     Edt_alunfltp.text := '';
     mke_alunflpf.text := '';
     Edt_alunflpb.text := '';
     Edt_alunflpc.text := '';
     Edt_alunflpp.text := '';
     Edt_alunflmp.text := '';
     Edt_alunflma.text := '';
     mke_alunflfm.text := '';
     Edt_alunfltm.text := '';
     mke_alunflmf.text := '';
     Edt_alunflmb.text := '';
     Edt_alunflmc.text := '';
     Edt_alunnom1.text := '';
     Edt_alunnom2.text := '';
     mke_alunfon1.text := '';
     mke_alunfon2.text := '';
     Mem_alunpbsd.lines.clear;
     Mem_alunaler.lines.clear;
     Mem_alunmedi.lines.clear;
     Mem_alunciru.lines.clear;
     Edt_alunplsd.text := '';
     Edt_aluntpsg.text := '';
     Rdg_alunsexo.itemindex := 0;
     Img_alunfoto.picture.Bitmap := nil;
     Opd_Imagem.filename := '';
     if WCodigo = '' then wAlterouReg:=false else wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Btn_PesquisaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Frm_PesqIncremento.AbrePesquisa(
     'select alunmatr,alunnome from tb_aluno where ',['Código',
     'Aluno'],'oa',[0],['alunmatr','alunnome'],1,['S','S'],'') = mrOk) and
     (Afuncoes.Localizaindice(Frm_Modulo.ibq_aluno,
     'Select * from tb_aluno','where alunmatr=:walunmatr',
     [Frm_PesqIncremento.Retorno])) then
     begin
          Atribuiregistro;
          Edt_alunnome.Setfocus;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
Procedure TFrm_CdDicente.Atribuiregistro;
//------------------------------------------------------------------------------
begin
    With Frm_Modulo.ibq_aluno do
    Begin
     Edt_alunmatr.text := Fieldbyname('alunmatr').AsString;
     Edt_alunnome.text := Fieldbyname('alunnome').AsString;
     mke_alun_cep.text := Fieldbyname('alun_cep').AsString;
     Edt_alunende.text := Fieldbyname('alunende').AsString;
     Edt_alunbair.text := Fieldbyname('alunbair').AsString;
     Edt_aluncida.text := Fieldbyname('aluncida').AsString;
     mke_alunfone.text := Fieldbyname('alunfone').AsString;
     Edt_alunesta.text := Fieldbyname('alunesta').AsString;
     mke_alunnasc.text := aFuncoes.RetornaDataStr(Fieldbyname(
                          'alunnasc').Asdatetime);
     mke_alundtin.text := aFuncoes.RetornaDataStr(Fieldbyname(
                          'alundtin').Asdatetime);
     chk_aluninat.checked := afuncoes.EntraSN_RetVF(fieldbyname(
                             'aluninat').asstring);
     Edt_aluncdns.text := Fieldbyname('aluncdns').AsString;
     Edt_alunufns.text := Fieldbyname('alunufns').AsString;
     Edt_alunctnm.text := Fieldbyname('alunctnm').AsString;
     Edt_alunctrg.text := Fieldbyname('alunctrg').AsString;
     Edt_alunctlv.text := Fieldbyname('alunctlv').AsString;
     Edt_alunctfl.text := Fieldbyname('alunctfl').AsString;
     Edt_alunctcd.text := Fieldbyname('alunctcd').AsString;
     Edt_alunctuf.text := Fieldbyname('alunctuf').AsString;
     mke_alunctem.text := aFuncoes.RetornaDataStr(Fieldbyname(
                          'alunctem').Asdatetime);
     Edt_alunflpa.text := Fieldbyname('alunflpa').AsString;
     mke_alunflfp.text := Fieldbyname('alunflfp').AsString;
     Edt_alunfltp.text := Fieldbyname('alunfltp').AsString;
     mke_alunflpf.text := Fieldbyname('alunflpf').AsString;
     Edt_alunflpb.text := Fieldbyname('alunflpb').AsString;
     Edt_alunflpc.text := Fieldbyname('alunflpc').AsString;
     Edt_alunflpp.text := Fieldbyname('alunflpp').AsString;
     Edt_alunflmp.text := Fieldbyname('alunflmp').AsString;
     Edt_alunflma.text := Fieldbyname('alunflma').AsString;
     mke_alunflfm.text := Fieldbyname('alunflfm').AsString;
     Edt_alunfltm.text := Fieldbyname('alunfltm').AsString;
     mke_alunflmf.text := Fieldbyname('alunflmf').AsString;
     Edt_alunflmb.text := Fieldbyname('alunflmb').AsString;
     Edt_alunflmc.text := Fieldbyname('alunflmc').AsString;
     Edt_alunnom1.text := Fieldbyname('alunnom1').AsString;
     Edt_alunnom2.text := Fieldbyname('alunnom2').AsString;
     mke_alunfon1.text := Fieldbyname('alunfon1').AsString;
     mke_alunfon2.text := Fieldbyname('alunfon2').AsString;
     Mem_alunpbsd.Text := Fieldbyname('alunpbsd').AsString;
     Mem_alunaler.Text := Fieldbyname('alunaler').AsString;
     Mem_alunmedi.Text := Fieldbyname('alunmedi').AsString;
     Mem_alunciru.Text := Fieldbyname('alunciru').AsString;
     Edt_alunplsd.text := Fieldbyname('alunplsd').AsString;
     Edt_aluntpsg.text := Fieldbyname('aluntpsg').AsString;
     if Fieldbyname('alunsexo').AsString = 'M' then
          Rdg_alunsexo.itemindex := 0
     else if Fieldbyname('alunsexo').AsString = 'F' then
          Rdg_alunsexo.itemindex := 1
     else Rdg_alunsexo.itemindex := -1;
     if Frm_modulo.ibq_alunoalunFOTO.IsNull then
          Img_alunfoto.picture.Assign(nil)
     else Img_alunfoto.picture.Assign(Frm_modulo.ibq_alunoalunFOTO);
    end;
    wAlterouReg:=false;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Btn_SairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Close;
end;

//------------------------------------------------------------------------------
function TFrm_CdDicente.TestaCampoVazio: Boolean;
//------------------------------------------------------------------------------
begin
     Result:=False;
     if not aFuncoes.TestaCampoVazio(Edt_alunmatr.text,
     'a matrícula do aluno') then
          Edt_alunmatr.SetFocus
     else if not aFuncoes.TestaCampoVazio(Edt_alunnome.text,'o nome do aluno') then
          Edt_alunnome.SetFocus
     else Result:=True;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.VerAlteracoes(Sender: TObject);
//------------------------------------------------------------------------------
begin wAlterouReg:=true;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.FormCloseQuery(Sender:TObject;var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if wAlterouReg then
     begin
          If aFuncoes.MessageDlgDef(
          'O registro corrente do aluno foi alterado, se você sair as '+
          #13+'alterações não serão salvas. Deseja sair ?', mtConfirmation,
             [mbNo, mbYes], mrNo, 0) = mrNo then
             canclose:=false;
     end;
     if canclose then
     with Frm_Modulo do
     begin
          ibq_aluno.close;
          IBQ_Funcoes.close;
          Frm_PesqIncremento.Qry_Pesquisa.close;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.SPB_helpClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_CentroCusto.Handle,'Ajuda.Hlp',HELP_CONTEXT,10);
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.edt_alunestaExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if (Trim( (Sender as TEdit).text ) <> '') and not (Afuncoes.Localizaindice(
     Frm_Modulo.IBQ_Funcoes,'Select * from tb_estado',
     'where sigla=:wsigla',[(Sender as TEdit).Text])) then
     begin
          aFuncoes.MessageDlgDef('Código do estado informado inválido...',
          mtInformation,[mbok],mrok,0);
          (Sender as TEdit).setfocus;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Spb_LocalizaEstadoClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     LocalizaEstado('',Sender);
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.LocalizaEstado(WPPrimLetra: string; Sender: TObject);
//------------------------------------------------------------------------------
var wtag : integer;
begin
     if (sender is TSpeedButton) then
          wtag := (sender as TSpeedButton).tag
     else wtag := (sender as TEdit).tag;
     case wtag of
          1: edt_alunufns.setfocus;
          2: edt_alunesta.setfocus;
          3: edt_alunctuf.setfocus;
     end;
     if Frm_PesqIncremento.AbrePesquisa('select * from tb_estado where ',['Código','Estado']
     ,'oo',[0],['sigla','descricao'],1,['S','S'],WPPrimLetra) = mrOk then
     case wtag of
          1: edt_alunufns.text := Frm_PesqIncremento.Retorno;
          2: edt_alunesta.text := Frm_PesqIncremento.Retorno;
          3: edt_alunctuf.text := Frm_PesqIncremento.Retorno;
     end;
     Frm_PesqIncremento.Qry_Pesquisa.close;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.Mke_alunnascExit(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if not aFuncoes.ValidaData( (Sender as TMaskEdit).text ) then
        (Sender as TMaskEdit).setfocus;
end;

//------------------------------------------------------------------------------
procedure TFrm_CdDicente.FormKeyDown(Sender: TObject; var Key: Word; Shift:
          TShiftState);
//------------------------------------------------------------------------------
begin
     if (Key = 119) then
     begin
          if (Edt_alunesta.Focused) then LocalizaEstado('',Edt_alunesta)
          else if (Edt_alunufns.Focused) then LocalizaEstado('',Edt_alunufns)
          else if (Edt_alunctuf.Focused) then LocalizaEstado('',Edt_alunctuf);
     end
     else if key = 27 then close;
end;

procedure TFrm_CdDicente.SpeedButton1Click(Sender: TObject);
begin
     if Opd_Imagem.execute then img_alunfoto.picture.loadfromfile(Opd_Imagem.filename);
end;

procedure TFrm_CdDicente.mke_alundtinExit(Sender: TObject);
begin
     if (trim(mke_alundtin.text) = '/  /') and (chk_aluninat.Checked) then
     begin
          aFuncoes.MessageDlgDef(
          'A data precisa ser informada para alunos inativos...',
          mtInformation,[mbok],mrok,0);
          mke_alundtin.setfocus;
     end
     else if (trim(mke_alundtin.text) <> '/  /') and not (chk_aluninat.Checked) then
          chk_aluninat.Checked := true
     else Mke_alunnascExit(mke_alundtin);
end;

procedure TFrm_CdDicente.chk_aluninatExit(Sender: TObject);
begin
     if not (chk_aluninat.Checked) then mke_alundtin.text := '';
end;

function TFrm_CdDicente.TestaAtividade: boolean;
begin
     result := true;
     if (trim(mke_alundtin.text) = '/  /') and (chk_aluninat.Checked) then
     begin
          aFuncoes.MessageDlgDef(
          'A data precisa ser informada para alunos inativos...',
          mtInformation,[mbok],mrok,0);
          mke_alundtin.setfocus;
          result := false;
     end
     else if (trim(mke_alundtin.text) <> '/  /') and not (chk_aluninat.Checked) then
          chk_aluninat.Checked := true;
end;

end.
