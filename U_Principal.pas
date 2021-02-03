unit U_Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Menus, Buttons, ToolWin,ShellApi, RXCtrls,
  Gauges, DBTables, StdCtrls, Db, Mask, Grids, DBGrids, jpeg;

type
  TFrm_principal = class(TForm)
    Tlb_Principal: TToolBar;
    Pmm_Principal: TMainMenu;
    Mnp_Arquivo: TMenuItem;
    Mni_ArqCadastro: TMenuItem;
    Fornecedor1: TMenuItem;
    N3: TMenuItem;
    Smb_Usuario: TMenuItem;
    Tabelas1: TMenuItem;
    Mni_ArqSair: TMenuItem;
    Mnp_Relaotrios: TMenuItem;
    Mnp_Utilitarios: TMenuItem;
    Mni_UtilitarioCopiadeSeguranca: TMenuItem;
    Mni_UtilitarioRestauraCopiadeSeguranca: TMenuItem;
    N1: TMenuItem;
    Calendrio1: TMenuItem;
    Calculadora1: TMenuItem;
    N2: TMenuItem;
    Sobre1: TMenuItem;
    Stb_Principal: TStatusBar;
    N21: TMenuItem;
    Ajuda1: TMenuItem;
    CoolBar3: TCoolBar;
    Spb_GravaCopia: TSpeedButton;
    Spb_RestauraCopia: TSpeedButton;
    Spb_Calendario: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Spb_Ajuda: TSpeedButton;
    Spb_Sobre: TSpeedButton;
    CoolBar4: TCoolBar;
    Spb_Sair: TSpeedButton;
    N4: TMenuItem;
    Panel1: TPanel;
    Clientes1: TMenuItem;
    Disciplina1: TMenuItem;
    Sries1: TMenuItem;
    NvelEscolar1: TMenuItem;
    RequerimentodeMatrcula1: TMenuItem;
    FichaCadastraldeSade1: TMenuItem;
    N6: TMenuItem;
    GerenciamentodoAluno1: TMenuItem;
    N7: TMenuItem;
    Mensalidade1: TMenuItem;
    MensalidadesemAtraso1: TMenuItem;
    Aniversariantes1: TMenuItem;
    Boletim1: TMenuItem;
    AtadeResultadoFinal1: TMenuItem;
    BoletodeCobrana1: TMenuItem;
    Img_LogoMarca: TImage;
    ComPreenchimento1: TMenuItem;
    SemPreenchimento1: TMenuItem;
    ComPreenchimento2: TMenuItem;
    SemPreenchimento2: TMenuItem;
    RenovaodeMatr1: TMenuItem;
    Notas1: TMenuItem;
    Conceito1: TMenuItem;
    Notas2: TMenuItem;
    Conceito2: TMenuItem;
    Suquencial1: TMenuItem;
    Alternado1: TMenuItem;
    Seqncial1: TMenuItem;
    Preenchido4: TMenuItem;
    SemPreenchimento5: TMenuItem;
    Alternado2: TMenuItem;
    Seqncial2: TMenuItem;
    Alternado3: TMenuItem;
    Preenchido1: TMenuItem;
    SemPreenchimento3: TMenuItem;
    N5: TMenuItem;
    CancelarMatrcula1: TMenuItem;
    Gerenciamento1: TMenuItem;
    Baixa1: TMenuItem;
    Individual1: TMenuItem;
    Geral1: TMenuItem;
    procedure Mni_ArqSairClick(Sender: TObject);
    procedure Mni_UtilitarioCopiadeSegurancaClick(Sender: TObject);
    procedure Mni_UtilitarioRestauraCopiadeSegurancaClick(Sender: TObject);
    procedure Calendrio1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Ajuda1Click(Sender: TObject);
    function  VerificarSenha: boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Clientes1Click(Sender: TObject);
    procedure Disciplina1Click(Sender: TObject);
    procedure Sries1Click(Sender: TObject);
    function  TestaArquivoVazio(WPSelect, WPTexto : string): boolean;
    procedure NvelEscolar1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Aniversariantes1Click(Sender: TObject);
    procedure Smb_UsuarioClick(Sender: TObject);
    procedure AtadeResultadoFinal1Click(Sender: TObject);
    procedure MensalidadesemAtraso1Click(Sender: TObject);
    procedure ComPreenchimento1Click(Sender: TObject);
    procedure SemPreenchimento1Click(Sender: TObject);
    procedure ComPreenchimento2Click(Sender: TObject);
    procedure SemPreenchimento2Click(Sender: TObject);
    procedure RenovaodeMatr1Click(Sender: TObject);
    procedure Notas1Click(Sender: TObject);
    procedure Conceito1Click(Sender: TObject);
    procedure Suquencial1Click(Sender: TObject);
    procedure Alternado1Click(Sender: TObject);
    procedure Imp_BoletimNota(WPMostra,WPPedeAno: boolean;WPTipo: integer);
    procedure Imp_BoletimConceito(WPMostra,WPPedeAno: boolean;WPTipo: integer);
    procedure FiltraBoletimConceito(WPTip: integer;WPAno, WPSerie: string);
    procedure Alternado2Click(Sender: TObject);
    procedure Preenchido4Click(Sender: TObject);
    procedure SemPreenchimento5Click(Sender: TObject);
    procedure Preenchido1Click(Sender: TObject);
    procedure SemPreenchimento3Click(Sender: TObject);
    procedure FiltraBoletimNota(WPTip: integer;WPAno, WPSerie: string);
    procedure Alternado3Click(Sender: TObject);
    procedure CancelarMatrcula1Click(Sender: TObject);
    procedure Gerenciamento1Click(Sender: TObject);
    procedure Individual1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
  public
    wLogoPasso: TBitMap;
    wNomeEmpresa, wEnderecoFone, wCnpjIE, wVersao : string;
    wAcessoTotal : boolean;
    wMEDIA_ESCOLA : real;
    wDIA_VENCIMENTO : integer;
    wLogin  : string;
    wcadeiraSerie : array of string;
    wPREENCHE_REL_BOLETIM : boolean;
  end;

var Frm_principal: TFrm_principal;

implementation

uses U_Login, U_Calendario, U_GravaCopia, U_RestauraCopia,  U_Sobre, U_FiltData,
     U_TbDisciplina, U_CdFuncionario, U_Funcoes, U_Modulo,U_TbSerie,U_CdDicente,
     U_FiltMes,  U_GerenciaAluno,  U_RelAlu002,  U_RelAlu001,  U_TbNivelEscolar,
     U_SelecionaSerieAno, U_SelecionaBoletim,U_RelAlu003,U_Usuario, U_PedeSenha,
     U_FiltMesAno,U_Mensalidade,U_RelAlu007,U_RelAlu004,U_RelAlu005,U_RelAlu006,
     U_GerenciaAlunoConceito,U_RelAlu009, U_RelAlu010, U_RelAlu008, U_RelAlu011,
     U_BoletimAlternadoConceito,   U_BoletimAlternadoNota,    U_BoletoAlternado,
     U_BaixaMensalidadeGeral, U_BaixaMensalidade, U_SelecionaSerieAnoAluno,
     U_RelAlu012;

{$R *.DFM}
{$R bitpasso.RES}

//------------------------------------------------------------------------------
procedure TFrm_Principal.Mni_ArqSairClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     close;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.FormActivate(Sender: TObject);
//------------------------------------------------------------------------------
var wHD, wHdPar, wPedirPass : string;
begin
     wVersao := 'D6-1.01.7';
     Frm_Principal.caption := 'Acadêmico - Sistema Integrado de Gerenciamento Escolar '+
                              '[versão '+wVersao+']';

     with Frm_Modulo.IBQ_Funcoes do
     begin
          close;
          sql.Clear;
          sql.add('SELECT * FROM TB_PARAMETROS');
          prepare;
          open;
     end;
     {
     if Frm_Modulo.Tbl_parametrosWPar09.value then
     begin
          wHdPar := Frm_Modulo.Tbl_parametrosWPar02.value;
          if wHdPar <> NumeroSerie then Application.Terminate;
     end;
     }
     wNomeEmpresa   := Frm_Modulo.IBQ_Funcoes.fieldbyname('Par01').asstring;
     Frm_Modulo.IBQ_Funcoes.close;

     if not Frm_Principal.Enabled then
     begin
          wAcessoTotal := false;
          Frm_Login:=TFrm_Login.create(self);
          Frm_login.show;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.FormCreate(Sender: TObject);
//------------------------------------------------------------------------------
begin
     Application.OnHint           := ShowHint;
     wMEDIA_ESCOLA                := 7.0;
     wDIA_VENCIMENTO              := 5;
     LongDateFormat               :='dd/mm/yyyy';
     DateSeparator                := '/';
     wLogoPasso                   := TBitMap.Create;
     wLogoPasso.Handle            := LoadBitMap(hInstance, 'LogoPasso');
     //Img_LogoMarca.Picture.BitMap := wLogoPasso;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.Calculadora1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
     ShellExecute(0, nil, 'calc.exe', nil, nil, SW_NORMAL);
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.Calendrio1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
     with TFrm_Calendario.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.Mni_UtilitarioCopiadeSegurancaClick(Sender: TObject);
//------------------------------------------------------------------------------
begin
     with TFrm_GravaCopia.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.Mni_UtilitarioRestauraCopiadeSegurancaClick(Sender:
          TObject);
//------------------------------------------------------------------------------
begin
     with TFrm_RestauraCopia.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.Sobre1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
     with TFrm_Sobre.Create(Self) do
     try
        Lbl_Licensa.caption := 'Este produto está licenciado para: '+wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_Principal.ShowHint(Sender: TObject);
//------------------------------------------------------------------------------
begin
     if Length(Application.Hint) > 0 then
          Stb_Principal.Panels[0].Text := Application.Hint
     else Stb_Principal.Panels[0].Text := '';
end;

//------------------------------------------------------------------------------
procedure TFrm_principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//------------------------------------------------------------------------------
begin
     if afuncoes.MessageDlgdef('Deseja abandonar o sistema ?', mtConfirmation,
     [mbYes,mbNo],mryes,0) = mrYes then
          CanClose := true
     else CanClose := false;
end;

//------------------------------------------------------------------------------
function TFrm_principal.VerificarSenha: boolean;
//------------------------------------------------------------------------------
begin
     Result := false;
     if (Frm_PedeSenha.ShowModal = mrOk) then
     begin
          Result := Frm_PedeSenha.wAcessoTemporario;
          if not Result then MessageDlg(Frm_PedeSenha.Mke_Login.Text+
          ', você não tem acesso a esta opção...', mtInformation,[mbOk], 0);
     end;
end;

//------------------------------------------------------------------------------
procedure TFrm_principal.Ajuda1Click(Sender: TObject);
//------------------------------------------------------------------------------
begin
     //WinHelp(Frm_Principal.Handle,'Ajuda.Hlp',HELP_CONTENTS,0);
end;

procedure TFrm_principal.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #27) then Close;
end;

procedure TFrm_principal.Clientes1Click(Sender: TObject);
begin
     with TFrm_CdFuncionario.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Disciplina1Click(Sender: TObject);
begin
     with TFrm_TbDisciplina.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Sries1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_NIVELESCOLAR',
     'os níveis escolares...') then exit;
     if not TestaArquivoVazio('SELECT * FROM TB_DISCIPLINA',
     'as disciplinas...') then exit;

     with TFrm_TbSerie.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

function TFrm_principal.TestaArquivoVazio(WPSelect, WPTexto : string): boolean;
begin
     result := true;
     afuncoes.AbreQuery(Frm_Modulo.IBQ_funcoes,WPSelect);
     if Frm_Modulo.IBQ_funcoes.isempty then
     begin
          MessageDlg('É necessário cadastrar '+WPTexto,mtInformation,[mbOk],0);
          result := false;
     end;
     Frm_Modulo.IBQ_funcoes.close;
end;

procedure TFrm_principal.NvelEscolar1Click(Sender: TObject);
begin
     with TFrm_TbNivelEscolar.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Fornecedor1Click(Sender: TObject);
begin
     with TFrm_CdDicente.Create(Self) do
     try
        caption := wNomeEmpresa;
        ShowModal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Aniversariantes1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_FiltMes.Create(Self) do
     try
        caption := wNomeEmpresa;
        if showmodal = mrok then
        begin
             afuncoes.AbreQuery(Frm_Modulo.IBQ_aluno,
             'SELECT * FROM TB_ALUNO WHERE ALUNDINS='''+formatfloat('00',
             cmb_mes.ItemIndex + 1)+'''');
             with TQrp_RelAlu003.Create(Self) do
             try
                Qrl_nomerel.caption := 'RELAÇÃO DE ANIVERSARINATES EM: '+
                                       cmb_mes.text;
                preview;
             Finally
                Free;
             end;
             Frm_Modulo.IBQ_aluno.close;
        end;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Smb_UsuarioClick(Sender: TObject);
begin
     if VerificarSenha then
     with TFrm_Usuario.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.AtadeResultadoFinal1Click(Sender: TObject);
var wNumCadeira : integer;
    wI : integer;
    wSitAlunoReprovado, wAlunReprovado : array of string;
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_SelecionaSerieAno.Create(Self) do
     try
        caption := wNomeEmpresa;
        if showmodal = mrok then
        begin
          // APAGAR A TABELA TEMPORARIA
          try
             If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                Frm_Modulo.IBT_Transaction.StartTransaction;
             afuncoes.STOperaRegistrosIB('delete from TB_TMPATAFINAL',[0]);
             Frm_Modulo.IBT_Transaction.CommitRetaining;
          except
             Frm_Modulo.IBT_Transaction.rollback;
          end;

          with TQrp_RelAlu004.Create(Self) do
          try
             wNumCadeira := 0;
             qrl_10.caption := '';
             qrl_11.caption := '';
             qrl_20.caption := '';
             qrl_21.caption := '';
             qrl_30.caption := '';
             qrl_31.caption := '';
             qrl_40.caption := '';
             qrl_41.caption := '';
             qrl_50.caption := '';
             qrl_51.caption := '';
             qrl_60.caption := '';
             qrl_61.caption := '';
             qrl_70.caption := '';
             qrl_71.caption := '';
             qrl_80.caption := '';
             qrl_81.caption := '';
             qrdbtext3.enabled := false;
             qrdbtext4.enabled := false;
             qrdbtext5.enabled := false;
             qrdbtext6.enabled := false;
             qrdbtext7.enabled := false;
             qrdbtext8.enabled := false;
             qrdbtext9.enabled := false;
             qrdbtext10.enabled := false;
             // SELECIONAR AS CADEIRAS DA SERIE
             afuncoes.AbreQuery(Frm_Modulo.IBQ_funcoes,
             'SELECT DS.*,D.DISCDESC FROM TB_DISCIPLINASERIE DS, TB_DISCIPLINA D WHERE DISSSERI='''+Edt_serie.text+
             ''' AND DS.DISSDISC=D.DISCCODG ORDER BY DISSDISC');
             Frm_Modulo.IBQ_funcoes.first;
             while not Frm_Modulo.IBQ_funcoes.Eof do
             begin
                  wNumCadeira := wNumCadeira + 1;
                  setlength(wcadeiraSerie,wNumCadeira);
                  wcadeiraSerie[wNumCadeira  - 1] := Frm_Modulo.IBQ_funcoes.
                                                     fieldbyname('dissdisc').asstring;
                  case wNumCadeira of
                       1:
                       begin
                            qrl_10.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_11.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext3.enabled := true;
                       end;
                       2:
                       begin
                            qrl_20.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_21.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext4.enabled := true;
                       end;
                       3:
                       begin
                            qrl_30.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_31.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext5.enabled := true;
                       end;
                       4:
                       begin
                            qrl_40.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_41.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext6.enabled := true;
                       end;
                       5:
                       begin
                            qrl_50.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_51.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext7.enabled := true;
                       end;
                       6:
                       begin
                            qrl_60.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_61.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext8.enabled := true;
                       end;
                       7:
                       begin
                            qrl_70.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_71.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext9.enabled := true;
                       end;
                       8:
                       begin
                            qrl_80.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,1,12);
                            qrl_81.caption := copy(Frm_Modulo.IBQ_funcoes.
                                              fieldbyname('discdesc').asstring,13,12);
                            qrdbtext10.enabled := true;
                       end;
                  end;
                  Frm_Modulo.IBQ_funcoes.next;
             end;
             Qrl_4.caption := 'ATA DE RESULTADOS FINAIS DO RENDIMENTO ESCOLAR '+
                              'REFERENTE AO ANO LETIVO DE '+edt_ano.Text;

             // SELECIONAR AS CADEIRAS DA SERIE
             afuncoes.AbreQuery(Frm_Modulo.IBQ_funcoes,
             'SELECT MATRALUN,MATRDISC,MATRMDAN,MATRRSFN FROM TB_MATRICULA '+
             'WHERE MATR_ANO='''+edt_ano.text+''' AND MATRSERI='''+Edt_serie.text+'''');
             wNumCadeira := 0;
             Frm_Modulo.IBQ_funcoes.first;
             while not Frm_Modulo.IBQ_funcoes.Eof do
             begin
                  if Frm_Modulo.IBQ_funcoes.fieldbyname('MATRRSFN').AsString <> 'A' then
                  begin
                       wNumCadeira := wNumCadeira + 1;
                       setlength(wAlunReprovado,wNumCadeira);
                       setlength(wSitAlunoReprovado,wNumCadeira);
                       wAlunReprovado[wNumCadeira  - 1]     := Frm_Modulo.IBQ_funcoes.
                                                               fieldbyname('MATRALUN').asstring;
                       wSitAlunoReprovado[wNumCadeira  - 1] := Frm_Modulo.IBQ_funcoes.
                                                               fieldbyname('MATRRSFN').asstring;
                  end;

                  for wI := 0 to 7 do
                      if wcadeiraSerie[wi] = Frm_Modulo.IBQ_funcoes.fieldbyname(
                      'MATRDISC').AsString then break;

                  try
                     If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                        Frm_Modulo.IBT_Transaction.StartTransaction;

                     if not Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes2,
                     'Select * from TB_TMPATAFINAL','where ATFNALUN=:WA',
                     [Frm_Modulo.IBQ_funcoes.fieldbyname('matralun').asstring]) then
                     begin
                          Frm_Modulo.IBQ_funcoes2.close;
                          Frm_Modulo.IBQ_funcoes2.Sql.clear;
                          Frm_Modulo.IBQ_funcoes2.Sql.add('insert into TB_TMPATAFINAL (ATFNALUN,ATFN000'+inttostr(wI+1)+')');
                          Frm_Modulo.IBQ_funcoes2.Sql.add('values (:WATFNALUN,:WATFN000'+inttostr(wI+1)+')');
                     end
                     else
                     begin
                          Frm_Modulo.IBQ_funcoes2.close;
                          Frm_Modulo.IBQ_funcoes2.Sql.clear;
                          Frm_Modulo.IBQ_funcoes2.Sql.add('update TB_TMPATAFINAL set ATFNALUN=:WATFNALUN,ATFN000'+inttostr(wI+1)+'=:WATFN000'+inttostr(wI+1));
                          Frm_Modulo.IBQ_funcoes2.Sql.add('where ATFNALUN=:wATFNALUN');
                     end;
                     Frm_Modulo.IBQ_funcoes2.parambyname('WATFNALUN').AsString := Frm_Modulo.IBQ_funcoes.fieldbyname('matralun').asstring;
                     Frm_Modulo.IBQ_funcoes2.parambyname('WATFN000'+inttostr(wI+1)).Asfloat := Frm_Modulo.IBQ_funcoes.fieldbyname('matrmdan').asfloat;
                     Frm_Modulo.IBQ_funcoes2.prepare;
                     Frm_Modulo.IBQ_funcoes2.execsql;
                     Frm_Modulo.IBT_Transaction.CommitRetaining;
                  except
                     Frm_Modulo.IBT_Transaction.rollback;
                  end;

                  Frm_Modulo.IBQ_funcoes.next;
             end;

             if wNumCadeira > 0 then
             begin
                  for wI := 0 to high(wAlunReprovado) do
                  try
                     If Not(Frm_Modulo.IBT_Transaction.InTransaction) Then
                        Frm_Modulo.IBT_Transaction.StartTransaction;
                     afuncoes.STOperaRegistrosIB(
                     'UPDATE TB_TMPATAFINAL SET ATFNRSFN=:WR WHERE ATFNALUN=:WA',
                     [wSitAlunoReprovado[wI],wAlunReprovado[wI]]);
                     Frm_Modulo.IBT_Transaction.CommitRetaining;
                  except
                     Frm_Modulo.IBT_Transaction.rollback;
                  end;
             end;
             Frm_Modulo.IBQ_TmpAtaFinal.close;
             Frm_Modulo.IBQ_TmpAtaFinal.open;
             preview;
          Finally
             Free;
          end;
          Frm_Modulo.IBQ_funcoes.close;
          Frm_Modulo.IBQ_TmpAtaFinal.close;
          Frm_Modulo.IBQ_funcoes2.close;
        end;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.MensalidadesemAtraso1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;

     if Afuncoes.Localizaindice(Frm_Modulo.ibq_mensalidade,
     'SELECT M.*,A.ALUNNOME FROM TB_MENSALIDADE M, TB_ALUNO A',
     'WHERE M.MENSALUN=A.ALUNMATR AND M.MENSPAGO=:WP AND M.MENSDTVC <:WD '+
     'AND (A.ALUNINAT ='''+'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC)) '+
     'ORDER BY M.MENSALUN,M.MENSDTVC',['N',date]) then
     with TQrp_RelAlu005.Create(Self) do
     try
        Qrl_nomerel.caption := 'RELAÇÃO DE MENSALIDADES EM ABERTO';
        preview;
     Finally
        Free;
     end
     else afuncoes.MessageDlgDef('Nenhum registro no arquivo',mtInformation,
     [mbOk],mrok,0);

     Frm_Modulo.ibq_mensalidade.close;
end;

procedure TFrm_principal.ComPreenchimento1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_NIVELESCOLAR',
     'os níveis escolares...') then exit;
     if not TestaArquivoVazio('SELECT * FROM TB_DISCIPLINA',
     'as disciplinas...') then exit;
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     afuncoes.AbreQuery(Frm_Modulo.IBQ_aluno,'SELECT * FROM TB_ALUNO');
     with TQrp_RelAlu001.Create(Self) do
     try
        preview;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.SemPreenchimento1Click(Sender: TObject);
begin
     with TQrp_RelAlu006.Create(Self) do
     try
        preview;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.ComPreenchimento2Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     afuncoes.AbreQuery(Frm_Modulo.IBQ_aluno,'SELECT * FROM TB_ALUNO');
     with TQrp_RelAlu002.Create(Self) do
     try
        preview;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.SemPreenchimento2Click(Sender: TObject);
begin
     with TQrp_RelAlu007.Create(Self) do
     try
        preview;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.RenovaodeMatr1Click(Sender: TObject);
begin
     with TQrp_RelAlu011.Create(Self) do
     try
        preview;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Notas1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_GerenciaAluno.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Conceito1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_GerenciaAlunoConceito.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Suquencial1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_FiltMesAno.Create(Self) do
     try
        caption := wNomeEmpresa;
        if showmodal = mrok then
        with Frm_Modulo.ibq_boleto do
        begin
             close;
             sql.clear;
             sql.add('SELECT DISTINCT M.*,A.ALUNNOME,T.MATRSERI,S.SERIDESC,A.ALUNMATR FROM TB_MENSALIDADE M, TB_ALUNO A, TB_MATRICULA T,TB_SERIE S');
             sql.add('WHERE M.MENSALUN=A.ALUNMATR AND M.MENSALUN=T.MATRALUN AND T.MATRSERI=S.SERICODG');
             if trim(edt_ano.Text) <> '' then
             begin
                sql.add('AND M.MENS_ANO='''+edt_ano.Text+'''');
                sql.add('AND T.MATR_ANO='''+edt_ano.Text+'''');
             end;
             sql.add('AND M.MENS_MES='''+FORMATFLOAT('00',cmb_mes.itemindex + 1)+'''');
             if trim(edt_serie.Text) <> '' then
                sql.add('AND T.MATRSERI='''+edt_serie.Text+'''');
             if trim(edt_aluno.Text) <> '' then
                sql.add('AND A.ALUNMATR='''+edt_aluno.Text+'''')
             else sql.add('AND M.MENSALUN=A.ALUNMATR AND (A.ALUNINAT ='''+'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC))');
             sql.add('ORDER BY A.ALUNNOME');
             prepare;
             open;

             if isempty then
             BEGIN
             close;
             sql.clear;
             sql.add('SELECT DISTINCT M.*,A.ALUNNOME,T.MATRSERI,S.SERIDESC,A.ALUNMATR FROM TB_MENSALIDADE M, TB_ALUNO A, TB_MATRTABCONCEITO T,TB_SERIE S');
             sql.add('WHERE M.MENSALUN=A.ALUNMATR AND M.MENSALUN=T.MATRALUN AND T.MATRSERI=S.SERICODG');
             if trim(edt_ano.Text) <> '' then
             BEGIN
                  sql.add('AND M.MENS_ANO='''+edt_ano.Text+'''');
                  sql.add('AND T.MATR_ANO='''+edt_ano.Text+'''');
             end;
             sql.add('AND M.MENS_MES='''+FORMATFLOAT('00',cmb_mes.itemindex + 1)+'''');
             if trim(edt_serie.Text) <> '' then
                sql.add('AND T.MATRSERI='''+edt_serie.Text+'''');
             if trim(edt_aluno.Text) <> '' then
                sql.add('AND A.ALUNMATR='''+edt_aluno.Text+'''')
             else sql.add('AND M.MENSALUN=A.ALUNMATR AND (A.ALUNINAT ='''+'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC))');
             sql.add('ORDER BY A.ALUNNOME');
             prepare;
             open;
             END;

             if isempty then
                  MessageDlg('Nenhum registro no arquivo...',mtInformation,[mbOk]
                  ,0)
             else
             with TQrp_RelAlu008.Create(Self) do
             try
                qrl_mes.caption := cmb_mes.text;
                qrl_valor.caption := formatfloat(',0.00',fne_valor.value);
                preview;
             Finally
                Free;
             end;
             Frm_Modulo.ibq_boleto.close;
        end;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Alternado1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_BoletoAlternado.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Imp_BoletimNota(WPMostra,WPPedeAno: boolean;WPTipo: integer);
var wResposta : integer;
    wAno, wSerie : string;
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_SelecionaBoletim.Create(Self) do
     try
        caption := wNomeEmpresa;
        wPREENCHE_REL_BOLETIM := WPMostra;
        wResposta := 1;
        if showmodal = mrok then
        begin
             if not WPPedeAno then
                wResposta := 0 // sim
             else
             with TFrm_SelecionaSerieAno.Create(Self) do
             try
                caption := wNomeEmpresa;
                if showmodal = mrok then
                begin
                     wResposta := 0; // sim
                     wAno      := edt_ano.Text;
                     wSerie    := edt_serie.text;
                end;
             finally
                free;
             end;

             if wResposta = 0 then
             begin
                  FiltraBoletimNota(WPTipo,wAno,wSerie);
                  if Frm_Modulo.IBQ_Boletim.isempty then
                     MessageDlg('Nenhum registro no arquivo...',mtInformation,[mbOk]
                     ,0)
                  else
                  if rdg_bimestre.itemindex <= 2 then
                  with TQrp_RelAlu009.Create(Self) do
                  try
                   wOrdemBimestre := rdg_bimestre.itemindex + 1;
                   qrl_bimestre.caption := 'NOTAS E FALTAS DO '+Rdg_bimestre.items[rdg_bimestre.itemindex];
                   preview;
                  Finally
                   Free;
                  end
                  else
                  with TQrp_RelAlu010.Create(Self) do
                  try
                   preview;
                  Finally
                   Free;
                  end;
                  Frm_Modulo.IBQ_Boletim.close;
             end;
        end;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.FiltraBoletimNota(WPTip: integer;WPAno, WPSerie: string);
begin
     with Frm_Modulo.IBQ_Boletim do
     begin
          close;
          sql.clear;
          case WPTip of
               1:
               begin
                    sql.add('SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,');
                    sql.add('TRN.TURNDESC,DIS.DISCDESC,NIV.NIVEDESC');
                    sql.add('FROM TB_MATRICULA MAT, TB_ALUNO ALU, TB_SERIE SER,');
                    sql.add('TB_TURNO TRN, TB_DISCIPLINA DIS, TB_NIVELESCOLAR NIV');
                    sql.add('WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG');
                    sql.add('AND SER.SERITURN=TRN.TURNCODG AND MAT.MATRDISC=DIS.DISCCODG');
                    sql.add('AND SER.SERINIVE=NIV.NIVECODG AND ALU.ALUNINAT='''+'N''');
                    if trim(WPAno) <> '' then
                       sql.add('AND MAT.MATR_ANO='''+WPAno+'''');
                    if trim(WPSerie) <> '' then
                       sql.add('AND MAT.MATRSERI='''+WPSerie+'''');
                    sql.add('ORDER BY ALU.ALUNNOME,MAT.MATRDISC');
               end;
               2:
               begin
                    sql.add('SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,');
                    sql.add('TRN.TURNDESC,DIS.DISCDESC,NIV.NIVEDESC');
                    sql.add('FROM TB_MATRICULA MAT, TB_ALUNO ALU, TB_SERIE SER,');
                    sql.add('TB_TURNO TRN, TB_DISCIPLINA DIS, TB_NIVELESCOLAR NIV');
                    sql.add('WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG');
                    sql.add('AND SER.SERITURN=TRN.TURNCODG AND MAT.MATRDISC=DIS.DISCCODG');
                    sql.add('AND SER.SERINIVE=NIV.NIVECODG AND ALU.ALUNINAT='''+'N''');
                    sql.add('AND MAT.MATRPRIN=''*''');
                    sql.add('ORDER BY ALU.ALUNNOME,MAT.MATRDISC');
               end;
          end;
          prepare;
          open;
     end;
end;

procedure TFrm_principal.Imp_BoletimConceito(WPMostra,WPPedeAno: boolean;WPTipo:
          integer);
var wi, wResposta : integer;
    wAno, wSerie : string;
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;

     if not WPPedeAno then
                wResposta := 0 // sim
     else
     with TFrm_SelecionaSerieAno.Create(Self) do
     try
        caption := wNomeEmpresa;
        if showmodal = mrok then
        begin
             wResposta := 0; // sim
             wAno      := edt_ano.Text;
             wSerie    := edt_serie.text;
        end;
     finally
        free;
     end;

     if wResposta = 0 then
     with Frm_Modulo.IBQ_funcoes do
     begin
          wPREENCHE_REL_BOLETIM := WPMostra;
          FiltraBoletimConceito(WPTipo,wAno,wSerie);

                if isempty then
                   MessageDlg('Nenhum registro no arquivo...',mtInformation,[mbOk]
                   ,0)
                else
                with TQrp_RelAlu012.Create(Self) do
                try
                   // DESCRICAO DOS CONCEITOS
                   qrl_c01.caption := '';
                   qrl_c02.caption := '';
                   qrl_c03.caption := '';
                   qrl_c04.caption := '';
                   qrl_c05.caption := '';
                   qrl_c06.caption := '';
                   qrl_c07.caption := '';
                   qrl_c08.caption := '';
                   qrl_c09.caption := '';
                   qrl_c10.caption := '';
                   qrl_c11.caption := '';
                   qrl_c12.caption := '';
                   qrl_c13.caption := '';
                   qrl_c14.caption := '';
                   qrl_c15.caption := '';
                   qrl_c16.caption := '';
                   qrl_c17.caption := '';
                   qrl_c18.caption := '';
                   qrl_c19.caption := '';
                   qrl_c20.caption := '';
                   qrl_c21.caption := '';
                   qrl_c22.caption := '';
                   qrl_c23.caption := '';

                   afuncoes.AbreQuery(Frm_Modulo.IBQ_funcoes2,'SELECT * FROM TB_CONCEITO ORDER BY CONCCODG');
                   Frm_Modulo.IBQ_funcoes2.first;
                   wi := 0;
                   while not Frm_Modulo.IBQ_funcoes2.eof do
                   begin
                        inc(wi);
                        case wi of
                             1: qrl_c01.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             2: qrl_c02.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             3: qrl_c03.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             4: qrl_c04.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             5: qrl_c05.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             6: qrl_c06.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             7: qrl_c07.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             8: qrl_c08.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                             9: qrl_c09.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            10: qrl_c10.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            11: qrl_c11.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            12: qrl_c12.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            13: qrl_c13.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            14: qrl_c14.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            15: qrl_c15.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            16: qrl_c16.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            17: qrl_c17.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            18: qrl_c18.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            19: qrl_c19.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            20: qrl_c20.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            21: qrl_c21.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            22: qrl_c22.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                            23: qrl_c23.caption := trim(Frm_Modulo.IBQ_funcoes2.fieldbyname('concdesc').asstring);
                        end;
                        Frm_Modulo.IBQ_funcoes2.next;
                   end;
                   Frm_Modulo.IBQ_funcoes2.close;
                   preview;
                Finally
                   Free;
                end;
                Frm_Modulo.IBQ_funcoes.close;
     end;
end;

procedure TFrm_principal.FiltraBoletimConceito(WPTip: integer;WPAno, WPSerie: string);
begin
     with Frm_Modulo.IBQ_Funcoes do
     begin
          close;
          sql.clear;
          case WPTip of
               1:
               begin
                    sql.add('SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,');
                    sql.add('TRN.TURNDESC,DIS.DISCDESC,NIV.NIVEDESC');
                    sql.add('FROM TB_MATRCONCEITO MAT, TB_ALUNO ALU, TB_SERIE SER,');
                    sql.add('TB_TURNO TRN, TB_DISCIPLINA DIS, TB_NIVELESCOLAR NIV');
                    sql.add('WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG');
                    sql.add('AND SER.SERITURN=TRN.TURNCODG AND MAT.MATRDISC=DIS.DISCCODG');
                    sql.add('AND SER.SERINIVE=NIV.NIVECODG AND ALU.ALUNINAT='''+'N''');
                    if trim(WPAno) <> '' then
                       sql.add('AND MAT.MATR_ANO='''+WPAno+'''');
                    if trim(WPSerie) <> '' then
                       sql.add('AND MAT.MATRSERI='''+WPSerie+'''');
               end;
               2:
               begin
                    sql.add('SELECT MAT.*,ALU.ALUNNOME,SER.SERITURN,SER.SERIDESC,');
                    sql.add('TRN.TURNDESC,DIS.DISCDESC,NIV.NIVEDESC');
                    sql.add('FROM TB_MATRCONCEITO MAT, TB_ALUNO ALU, TB_SERIE SER,');
                    sql.add('TB_TURNO TRN, TB_DISCIPLINA DIS, TB_NIVELESCOLAR NIV');
                    sql.add('WHERE MAT.MATRALUN=ALU.ALUNMATR AND MAT.MATRSERI=SER.SERICODG');
                    sql.add('AND SER.SERITURN=TRN.TURNCODG AND MAT.MATRDISC=DIS.DISCCODG');
                    sql.add('AND SER.SERINIVE=NIV.NIVECODG AND ALU.ALUNINAT='''+'N''');
                    sql.add('AND MAT.MATRPRIN=''*''');
               end;
          end;
          sql.add('ORDER BY ALU.ALUNNOME,MAT.MATRDISC');
          prepare;
          open;
     end;
end;

procedure TFrm_principal.Alternado2Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_BoletimAlternadoNota.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Preenchido4Click(Sender: TObject);
begin
     Imp_BoletimNota(true,true,1);
end;

procedure TFrm_principal.SemPreenchimento5Click(Sender: TObject);
begin
     Imp_BoletimNota(false,true,1);
end;

procedure TFrm_principal.Preenchido1Click(Sender: TObject);
begin
     Imp_BoletimConceito(true,true,1);
end;

procedure TFrm_principal.SemPreenchimento3Click(Sender: TObject);
begin
     Imp_BoletimConceito(false,true,1);
end;

procedure TFrm_principal.Alternado3Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_BoletimAlternadoConceito.Create(Self) do
     try
        caption := wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.CancelarMatrcula1Click(Sender: TObject);
var wAno, wSerie, waluno : string;
begin
     wAno      := '';
     wSerie    := '';
     waluno    := '';

     with TFrm_SelecionaSerieAnoAluno.Create(Self) do
     try
        caption := wNomeEmpresa;
        if (showmodal = mrok) AND (afuncoes.MessageDlgdef(
        'Deseja apagar este registro ?', mtConfirmation,
        [mbYes,mbNo],mryes,0) = mrYes) then
        begin
             wAno      := edt_ano.Text;
             wSerie    := edt_serie.text;
             waluno    := edt_mensalun.text;

                with Frm_Modulo.IBQ_Funcoes do
                begin
                case rdg_tipo.itemindex of
                0:
                begin
                close;
                sql.clear;
                sql.add('DELETE FROM TB_MATRICULA');
          sql.add('WHERE MATR_ANO='''+wAno+'''');
          IF TRIM(WSERIE) <> '' then
                sql.add('AND MATRSERI='''+wSERIE+'''');
          IF TRIM(WALUNO) <> '' then
                sql.add('AND MATRALUN='''+wALUNO+'''');
          prepare;
          EXECSQL;
          end;
          1:
          begin
          close;
          sql.clear;
          sql.add('DELETE FROM TB_MATRCONCEITO');
          sql.add('WHERE MATR_ANO='''+wAno+'''');
          IF TRIM(WSERIE) <> '' then
                sql.add('AND MATRSERI='''+wSERIE+'''');
          IF TRIM(WALUNO) <> '' then
                sql.add('AND MATRALUN='''+wALUNO+'''');
          prepare;
          EXECSQL;
          end;
          end;
        end;

        end;
     finally
        free;
     end;
end;

procedure TFrm_principal.Gerenciamento1Click(Sender: TObject);
begin
     if not TestaArquivoVazio('SELECT * FROM TB_ALUNO',
     'os alunos...') then exit;
     with TFrm_Mensalidade.Create(Self) do
     try
        caption := wNomeEmpresa;
        Afuncoes.Localizaindice(Frm_Modulo.ibq_mensalidade,
        'SELECT M.*,A.ALUNNOME FROM TB_MENSALIDADE M, TB_ALUNO A',
        'WHERE M.MENSALUN=A.ALUNMATR AND (A.ALUNINAT ='''+
        'N''  OR (A.ALUNINAT = '''+'S'' AND A.ALUNDTIN + 35 > M.MENSDTVC)) '+
        'AND M.MENSPAGO=:WP AND M.MENSDTVC <:WD '+
        'ORDER BY M.MENSALUN,M.MENSDTVC',['N',date]);
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Individual1Click(Sender: TObject);
begin
     with TFrm_BaixaMensalidade.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        LimpaVariavel('','','');
        showmodal;
     Finally
        Free;
     end;
end;

procedure TFrm_principal.Geral1Click(Sender: TObject);
begin
     with TFrm_BaixaMensalidadeGeral.Create(Self) do
     try
        caption := Frm_Principal.wNomeEmpresa;
        showmodal;
     Finally
        Free;
     end;
end;

end.



