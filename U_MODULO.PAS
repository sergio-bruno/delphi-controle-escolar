unit U_Modulo;

interface

uses SysUtils, Classes, DB, DBTables, IBCustomDataSet, IBQuery, IBDatabase,
     MaskUtils, IniFiles, Forms, Controls, Messages, IBSQL, Dialogs;

type
  TFrm_Modulo = class(TDataModule)
    Dtb_Academico: TIBDatabase;
    IBT_Transaction: TIBTransaction;
    IBQ_Funcoes: TIBQuery;
    IBQ_Funcoes2: TIBQuery;
    Opd_dialogo: TOpenDialog;
    IBQ_Funcionario: TIBQuery;
    IBQ_FuncionarioAGENCODG: TIBStringField;
    IBQ_FuncionarioAGENNOME: TIBStringField;
    IBQ_FuncionarioAGENIDEN: TIBStringField;
    IBQ_FuncionarioAGENCPFS: TIBStringField;
    IBQ_FuncionarioAGENENDR: TIBStringField;
    IBQ_FuncionarioAGENBAIR: TIBStringField;
    IBQ_FuncionarioAGENCIDA: TIBStringField;
    IBQ_FuncionarioAGENCEPS: TIBStringField;
    IBQ_FuncionarioAGENUFED: TIBStringField;
    IBQ_FuncionarioAGENFON1: TIBStringField;
    IBQ_FuncionarioAGENFON2: TIBStringField;
    IBQ_FuncionarioAGENFAXS: TIBStringField;
    IBQ_FuncionarioAGENCELU: TIBStringField;
    IBQ_FuncionarioAGENDTNC: TDateTimeField;
    IBQ_FuncionarioAGENEMAI: TIBStringField;
    IBQ_FuncionarioAGENSEXO: TIBStringField;
    IBQ_FuncionarioAGENOBSV: TMemoField;
    IBQ_FuncionarioAGENFOTO: TBlobField;
    IBQ_DisciplinaSerie: TIBQuery;
    IBQ_DisciplinaSerieDISSSERI: TIBStringField;
    IBQ_DisciplinaSerieDISSDISC: TIBStringField;
    IBQ_DisciplinaSerieDISCDESC: TIBStringField;
    Dts_DisciplinaSerie: TDataSource;
    IBQ_Aluno: TIBQuery;
    IBQ_AlunoALUNMATR: TIBStringField;
    IBQ_AlunoALUNNOME: TIBStringField;
    IBQ_AlunoALUNSEXO: TIBStringField;
    IBQ_AlunoALUNENDE: TIBStringField;
    IBQ_AlunoALUNBAIR: TIBStringField;
    IBQ_AlunoALUNCIDA: TIBStringField;
    IBQ_AlunoALUNESTA: TIBStringField;
    IBQ_AlunoALUNFONE: TIBStringField;
    IBQ_AlunoALUNNASC: TDateTimeField;
    IBQ_AlunoALUNCDNS: TIBStringField;
    IBQ_AlunoALUNUFNS: TIBStringField;
    IBQ_AlunoALUNCADA: TDateTimeField;
    IBQ_AlunoALUNCTNM: TIBStringField;
    IBQ_AlunoALUNCTRG: TIBStringField;
    IBQ_AlunoALUNCTLV: TIBStringField;
    IBQ_AlunoALUNCTFL: TIBStringField;
    IBQ_AlunoALUNCTCD: TIBStringField;
    IBQ_AlunoALUNCTUF: TIBStringField;
    IBQ_AlunoALUNCTEM: TDateTimeField;
    IBQ_AlunoALUNFLPA: TIBStringField;
    IBQ_AlunoALUNFLFP: TIBStringField;
    IBQ_AlunoALUNFLTP: TIBStringField;
    IBQ_AlunoALUNFLPF: TIBStringField;
    IBQ_AlunoALUNFLPB: TIBStringField;
    IBQ_AlunoALUNFLPC: TIBStringField;
    IBQ_AlunoALUNFLMA: TIBStringField;
    IBQ_AlunoALUNFLFM: TIBStringField;
    IBQ_AlunoALUNFLTM: TIBStringField;
    IBQ_AlunoALUNFLMF: TIBStringField;
    IBQ_AlunoALUNFLMB: TIBStringField;
    IBQ_AlunoALUNFLMC: TIBStringField;
    IBQ_AlunoALUN_CEP: TIBStringField;
    IBQ_AlunoALUNNOM1: TIBStringField;
    IBQ_AlunoALUNNOM2: TIBStringField;
    IBQ_AlunoALUNFON2: TIBStringField;
    IBQ_AlunoALUNFON1: TIBStringField;
    IBQ_AlunoALUNPBSD: TMemoField;
    IBQ_AlunoALUNALER: TMemoField;
    IBQ_AlunoALUNMEDI: TMemoField;
    IBQ_AlunoALUNCIRU: TMemoField;
    IBQ_AlunoALUNPLSD: TIBStringField;
    IBQ_AlunoALUNTPSG: TIBStringField;
    IBQ_AlunoALUNFOTO: TBlobField;
    IBQ_Matricula: TIBQuery;
    Dts_Matricula: TDataSource;
    IBQ_MatriculaMATR_ANO: TIBStringField;
    IBQ_MatriculaMATRDISC: TIBStringField;
    IBQ_MatriculaMATRALUN: TIBStringField;
    IBQ_MatriculaMATRSERI: TIBStringField;
    IBQ_MatriculaMATR1BFT: TIntegerField;
    IBQ_MatriculaMATR1BAU: TFloatField;
    IBQ_MatriculaMATR1BTB: TFloatField;
    IBQ_MatriculaMATR1BPB: TFloatField;
    IBQ_MatriculaMATR1BMD: TFloatField;
    IBQ_MatriculaMATR2BAU: TFloatField;
    IBQ_MatriculaMATR2BTB: TFloatField;
    IBQ_MatriculaMATR2BPB: TFloatField;
    IBQ_MatriculaMATR2BMD: TFloatField;
    IBQ_MatriculaMATR3BAU: TFloatField;
    IBQ_MatriculaMATR3BTB: TFloatField;
    IBQ_MatriculaMATR3BPB: TFloatField;
    IBQ_MatriculaMATR3BMD: TFloatField;
    IBQ_MatriculaMATR4BAU: TFloatField;
    IBQ_MatriculaMATR4BTB: TFloatField;
    IBQ_MatriculaMATR4BPB: TFloatField;
    IBQ_MatriculaMATR4BMD: TFloatField;
    IBQ_MatriculaMATRMDAN: TFloatField;
    IBQ_MatriculaMATRRSFN: TIBStringField;
    IBQ_MatriculaMATROBSV: TMemoField;
    IBQ_MatriculaMATRAGEN: TIBStringField;
    IBQ_MatriculaALUNNOME: TIBStringField;
    IBQ_MatriculaSERITURN: TIBStringField;
    IBQ_MatriculaTURNDESC: TIBStringField;
    IBQ_MatriculaAGENNOME: TIBStringField;
    IBQ_MatriculaDISCDESC: TIBStringField;
    IBQ_MatriculaMATR2BFT: TIntegerField;
    IBQ_MatriculaMATR3BFT: TIntegerField;
    IBQ_MatriculaMATR4BFT: TIntegerField;
    IBQ_MatriculaSERIDESC: TIBStringField;
    Dts_Aluno: TDataSource;
    IBQ_DisciplinaSerieDISSAGEN: TIBStringField;
    IBQ_DisciplinaSerieAGENNOME: TIBStringField;
    IBQ_AlunoALUNDINS: TIBStringField;
    IBQ_TmpAtaFinal: TIBQuery;
    IBQ_TmpAtaFinalATFNALUN: TIBStringField;
    IBQ_TmpAtaFinalATFN0001: TFloatField;
    IBQ_TmpAtaFinalATFN0002: TFloatField;
    IBQ_TmpAtaFinalATFN0003: TFloatField;
    IBQ_TmpAtaFinalATFN0004: TFloatField;
    IBQ_TmpAtaFinalATFN0005: TFloatField;
    IBQ_TmpAtaFinalATFN0006: TFloatField;
    IBQ_TmpAtaFinalATFN0007: TFloatField;
    IBQ_TmpAtaFinalATFN0008: TFloatField;
    IBQ_TmpAtaFinalATFNMFIM: TFloatField;
    IBQ_TmpAtaFinalALUNNOME: TIBStringField;
    IBQ_TmpAtaFinalATFNRSFN: TIBStringField;
    IBQ_FuncionarioAGENSENH: TIBStringField;
    IBQ_AlunoALUNFLPP: TIBStringField;
    IBQ_AlunoALUNFLMP: TIBStringField;
    IBQ_Mensalidade: TIBQuery;
    IBQ_MensalidadeMENS_ANO: TIBStringField;
    IBQ_MensalidadeMENS_MES: TIBStringField;
    IBQ_MensalidadeMENSALUN: TIBStringField;
    IBQ_MensalidadeMENSDTPG: TDateTimeField;
    IBQ_MensalidadeMENSVLPG: TFloatField;
    IBQ_MensalidadeMENSPAGO: TIBStringField;
    IBQ_MensalidadeMENSDTVC: TDateTimeField;
    IBQ_MensalidadeALUNNOME: TIBStringField;
    Dts_Mensalidade: TDataSource;
    IBQ_Boleto: TIBQuery;
    IBQ_BoletoMENS_ANO: TIBStringField;
    IBQ_BoletoMENS_MES: TIBStringField;
    IBQ_BoletoMENSALUN: TIBStringField;
    IBQ_BoletoMENSDTPG: TDateTimeField;
    IBQ_BoletoMENSVLPG: TFloatField;
    IBQ_BoletoMENSPAGO: TIBStringField;
    IBQ_BoletoMENSDTVC: TDateTimeField;
    IBQ_BoletoALUNNOME: TIBStringField;
    IBQ_BoletoMATRSERI: TIBStringField;
    IBQ_BoletoSERIDESC: TIBStringField;
    IBQ_Boletim: TIBQuery;
    IBQ_BoletimMATR_ANO: TIBStringField;
    IBQ_BoletimMATRSERI: TIBStringField;
    IBQ_BoletimMATRALUN: TIBStringField;
    IBQ_BoletimMATRDISC: TIBStringField;
    IBQ_BoletimMATR1BFT: TIntegerField;
    IBQ_BoletimMATR1BAU: TFloatField;
    IBQ_BoletimMATR1BTB: TFloatField;
    IBQ_BoletimMATR1BPB: TFloatField;
    IBQ_BoletimMATR1BMD: TFloatField;
    IBQ_BoletimMATR2BFT: TIntegerField;
    IBQ_BoletimMATR2BAU: TFloatField;
    IBQ_BoletimMATR2BTB: TFloatField;
    IBQ_BoletimMATR2BPB: TFloatField;
    IBQ_BoletimMATR2BMD: TFloatField;
    IBQ_BoletimMATR3BFT: TIntegerField;
    IBQ_BoletimMATR3BAU: TFloatField;
    IBQ_BoletimMATR3BTB: TFloatField;
    IBQ_BoletimMATR3BPB: TFloatField;
    IBQ_BoletimMATR3BMD: TFloatField;
    IBQ_BoletimMATR4BFT: TIntegerField;
    IBQ_BoletimMATR4BAU: TFloatField;
    IBQ_BoletimMATR4BTB: TFloatField;
    IBQ_BoletimMATR4BPB: TFloatField;
    IBQ_BoletimMATR4BMD: TFloatField;
    IBQ_BoletimMATRMDAN: TFloatField;
    IBQ_BoletimMATROBSV: TMemoField;
    IBQ_BoletimMATRAGEN: TIBStringField;
    IBQ_BoletimMATRRSFN: TIBStringField;
    IBQ_BoletimALUNNOME: TIBStringField;
    IBQ_BoletimSERITURN: TIBStringField;
    IBQ_BoletimSERIDESC: TIBStringField;
    IBQ_BoletimTURNDESC: TIBStringField;
    IBQ_BoletimDISCDESC: TIBStringField;
    IBQ_BoletimNIVEDESC: TIBStringField;
    IBQ_BoletoALUNMATR: TIBStringField;
    IBQ_AlunoALUNINAT: TIBStringField;
    IBQ_AlunoALUNDTIN: TDateTimeField;
    IBQ_MatriculaALUNINAT: TIBStringField;
    IBQ_MatrConceito: TIBQuery;
    Dts_MatrConceito: TDataSource;
    IBQ_MatrConceitoMATR_ANO: TIBStringField;
    IBQ_MatrConceitoMATRSERI: TIBStringField;
    IBQ_MatrConceitoMATRALUN: TIBStringField;
    IBQ_MatrConceitoMATRDISC: TIBStringField;
    IBQ_MatrConceitoMATR1BCT: TIBStringField;
    IBQ_MatrConceitoMATR2BCT: TIBStringField;
    IBQ_MatrConceitoMATR3BCT: TIBStringField;
    IBQ_MatrConceitoMATR4BCT: TIBStringField;
    IBQ_MatrConceitoMATROBSV: TMemoField;
    IBQ_MatrConceitoMATRAGEN: TIBStringField;
    IBQ_MatrConceitoALUNNOME: TIBStringField;
    IBQ_MatrConceitoSERITURN: TIBStringField;
    IBQ_MatrConceitoSERIDESC: TIBStringField;
    IBQ_MatrConceitoTURNDESC: TIBStringField;
    IBQ_MatrConceitoAGENNOME: TIBStringField;
    IBQ_MatrConceitoDISCDESC: TIBStringField;
    IBQ_MatrConceitoALUNINAT: TIBStringField;
    IBQ_MatrTabConceito: TIBQuery;
    Dts_MatrTabConceito: TDataSource;
    IBQ_MatrTabConceitoMATR_ANO: TIBStringField;
    IBQ_MatrTabConceitoMATRSERI: TIBStringField;
    IBQ_MatrTabConceitoMATRALUN: TIBStringField;
    IBQ_MatrTabConceitoMATRCONC: TIBStringField;
    IBQ_MatrTabConceitoCONCDESC: TIBStringField;
    IBQ_MatrTabConceitoMATR1BNT: TIBStringField;
    IBQ_MatrTabConceitoMATR2BNT: TIBStringField;
    IBQ_MatrTabConceitoMATR3BNT: TIBStringField;
    IBQ_MatrTabConceitoMATR4BNT: TIBStringField;
    IBQ_TmpAtaFinalATFN0009: TFloatField;
    procedure Apagadata(Sender:TField;var Text:String;DisplayText: Boolean);
    procedure IBQ_CaixaLjSITUACAOGetText(Sender: TField; var Text: String;
              DisplayText: Boolean);
    procedure IBQ_ChequesSITUACAOGetText(Sender: TField; var Text: String;
              DisplayText: Boolean);
    procedure IBQ_ContaPagarSITUACAOGetText(Sender: TField; var Text: String;
              DisplayText: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure ConectaBanco(WPPath: string);
    function  RegistraBanco(var WPPath: string): Boolean;
    procedure FONEGetText(Sender: TField;var Text:String;DisplayText: Boolean);
    procedure IBQ_AlunoALUNSEXOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IBQ_MatriculaMATRRSFNGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  end;

var Frm_Modulo: TFrm_Modulo;

implementation

uses u_funcoes;

{$R *.dfm}

//------------------------------------------------------------------------------
procedure TFrm_Modulo.Apagadata(Sender:TField;var Text:String;DisplayText:
          Boolean);
//------------------------------------------------------------------------------
begin
     if DisplayText then
     begin
        if Sender.asdatetime <= strtodate('31/12/1900')  then
             Text := ''
        else Text := datetostr(Sender.asdatetime);
     end;
end;

procedure TFrm_Modulo.IBQ_CaixaLjSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
        if Sender.asinteger = 1 then
             Text := 'FECHADO'
        else Text := 'ABERTO';
     end;
end;

procedure TFrm_Modulo.IBQ_ChequesSITUACAOGetText(Sender:TField;var Text: String;
          DisplayText: Boolean);
begin
     if DisplayText then
     begin
          if Sender.asstring = 'C' then
               Text := 'CANCELADO'
          else if Sender.asstring = 'D' then
               Text := 'DEVOLVIDO'
          else if Sender.asstring = 'F' then
               Text := 'FECHADO'
          else Text := 'ABERTO';
     end;
end;

procedure TFrm_Modulo.IBQ_ContaPagarSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
          if Sender.asstring = 'C' then
               Text := 'CANCELADO'
          else if Sender.asstring = 'F' then
               Text := 'FECHADO'
          else Text := 'ABERTO';
     end;
end;

procedure TFrm_Modulo.DataModuleDestroy(Sender: TObject);
begin
     DTB_Academico.Connected   := False;
     IBT_Transaction.Active := False;
end;

procedure TFrm_Modulo.DataModuleCreate(Sender: TObject);
var DataFile: string;
    wIniEmpresat : TIniFile;
begin
  wIniEmpresat := TIniFile.create(ExtractFilePath(ParamStr(0))+'\'+'empresat.ini');
  DataFile     := wIniEmpresat.ReadString('configuracao','path','');
  // verificar se o arquivo empresat.ini foi criado
  if Trim(DataFile) = '' then RegistraBanco(DataFile);

  // inserir a variavel path no arquivo empresat.ini
  wIniEmpresat.WriteString('configuracao','path',DataFile);

  try
     ConectaBanco(DataFile);
  except
     if RegistraBanco(DataFile) then
     try
        wIniEmpresat.WriteString('configuracao','path',DataFile);
        ConectaBanco(DataFile);
     except
        if afuncoes.MessageDlgDef(
        'O banco de dados não foi localizado ACADEMICO.GDB. Se faz necessária a localização'
        +#13+'deste arquivo para usar o sistema, verifique o arquivo EMPRESAT.INI',
        mtError, [mbYes, mbNo], mryes, 0) = mrYes then
        Application.Terminate;
     end;
  end;
  wIniEmpresat.free;
end;

procedure TFrm_Modulo.ConectaBanco(WPPath: string);
begin
     DTB_Academico.DatabaseName := WPPath;
     DTB_Academico.Connected    := True;
     IBT_Transaction.Active  := True;
end;

function TFrm_Modulo.RegistraBanco(var WPPath: string): boolean;
begin
    result := false;
    if afuncoes.MessageDlgDef(
    'O banco de dados não foi localizado ACADEMICO.GDB. Se faz necessária a localização'
    +#13+'deste arquivo para usar o sistema, deseja localizá-lo ?',
    mtError, [mbYes, mbNo], mryes, 0) = mrYes then
    begin
         if Opd_dialogo.Execute then
         begin
              if UpperCase(ExtractFileName(Opd_dialogo.FileName)) = 'ACADEMICO.GDB' then
              begin
                   WPPath := Opd_dialogo.FileName;
                   result := true;
              end
              else
              begin
                   raise Exception.Create('Nome de arquivo inválido: ' +
                   Opd_dialogo.FileName+#13+'O aplicativo será encerrado.');
                   Application.Terminate;
              end;
         end
         else
         begin
              raise Exception.Create('O sistema não localizou o arquivo: ACADEMICO.GDB'
              +#13+'O aplicativo será encerrado.');
              Application.terminate;
         end;
    end
    else Application.terminate;
end;

//------------------------------------------------------------------------------
procedure TFrm_Modulo.FONEGetText(Sender: TField;var Text:String;DisplayText:
          Boolean);
//------------------------------------------------------------------------------
begin
     if DisplayText then
          Text := FormatMaskText('(99)9999-9999;0;',sender.asstring)
     else Text := Sender.asstring;
end;

procedure TFrm_Modulo.IBQ_AlunoALUNSEXOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
          if Sender.asstring = 'M' then
               Text := 'MASCULINO'
          else if Sender.asstring = 'F' then
               Text := 'FEMININO'
          else Text := Sender.asstring;
     end
     else Text := Sender.asstring;
end;

procedure TFrm_Modulo.IBQ_MatriculaMATRRSFNGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
     if DisplayText then
     begin
          if IBQ_MatriculaALUNINAT.Value = 'N' then
          begin
               if Sender.asstring = 'C' then
                    Text := 'CURSANDO'
               else if Sender.asstring = 'A' then
                    Text := 'APROVADO'
               else if Sender.asstring = 'R' then
                    Text := 'REPROVADO'
               else if Sender.asstring = 'T' then
                    Text := 'TRANCADO'
               else Text := Sender.asstring;
          end
          else Text := 'INATIVO';
     end
     else Text := Sender.asstring;
end;

end.
