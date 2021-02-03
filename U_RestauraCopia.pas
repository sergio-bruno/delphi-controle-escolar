unit U_RestauraCopia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, FileCtrl, StdCtrls, backup, Gauges, DBTables, Buttons;

type
  TFrm_RestauraCopia = class(TForm)
    Pnl_Titulo: TPanel;
    Lbl_NomeBackup: TLabel;
    Edt_NomeBackup: TEdit;
    Dcb_Destino: TDriveComboBox;
    Dlb_Origem: TDirectoryListBox;
    Edt_Conteudo: TEdit;
    Mem_Arquivos: TMemo;
    Btn_Cancelar: TButton;
    Btn_restaurar: TButton;
    Flb_NomeArquivo: TFileListBox;
    Lbl_Conteudo: TLabel;
    Lbl_Destino: TLabel;
    Grb_Progresso: TGroupBox;
    Gag_Progresso: TGauge;
    Pnl_NomeArquivo: TPanel;
    Bck_Acc2000: TBackupFile;
    Grb_Diretorio: TGroupBox;
    Rdb_DiretorioOriginal: TRadioButton;
    Rdb_OutroDiretorio: TRadioButton;
    Edt_Diretorio: TEdit;
    Btn_Sair: TButton;
    SPB_help: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LimpaVariavel;
    procedure ProgressoBackup(Sender: TObject; Filename: String;
              Percent: TPercentage; var Continue: Boolean);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_restaurarClick(Sender: TObject);
    procedure Flb_NomeArquivoClick(Sender: TObject);
    procedure DiretorioRestauracaoClique(Sender: TObject);
    procedure Btn_SairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure Dcb_DestinoChange(Sender: TObject);
    procedure SPB_helpClick(Sender: TObject);
  end;

var
  Frm_RestauraCopia: TFrm_RestauraCopia;

implementation

uses U_Modulo, U_Funcoes, U_Principal;

{$R *.DFM}

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.FormShow(Sender: TObject);
//---------------------------------------------------------------------
begin
     LimpaVariavel;
     try
        Dlb_Origem.Directory := 'C:\D6Academico';
     except
        Dlb_Origem.Directory := 'C:';
     end;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.LimpaVariavel;
//---------------------------------------------------------------------
begin
     Mem_Arquivos.Lines.Clear;
     Rdb_DiretorioOriginal.Checked := true;
     Btn_Cancelar.Enabled          := false;
     Edt_NomeBackup.Text           := '';
     Edt_Conteudo.Text             := '';
     Pnl_NomeArquivo.Caption       := '';
     Edt_Diretorio.Text            := '';
     Gag_Progresso.Progress        := 0;
     Dcb_Destino. Drive            := 'C';
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.ProgressoBackup(Sender: TObject; Filename: String;
          Percent: TPercentage; var Continue: Boolean);
//---------------------------------------------------------------------
begin
     Gag_Progresso.progress := Percent;
     if Percent < 100 then Pnl_NomeArquivo.caption := Filename else Pnl_NomeArquivo.caption := '';
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.Btn_CancelarClick(Sender: TObject);
//---------------------------------------------------------------------
begin
     if not Bck_Acc2000.busy then close
     else if MessageDlg('Deseja abortar a operação ?',mtConfirmation, [mbYes,mbNo], 0) = mrYes then Bck_Acc2000.Stop;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.Btn_restaurarClick(Sender: TObject);
//---------------------------------------------------------------------
var wCaminho: string;
begin
     if Rdb_DiretorioOriginal.Checked then
          wCaminho := ''
     else
     begin
          wCaminho := Edt_Diretorio.Text;
          if trim(wCaminho) = '' then
          begin
               MessageDlg('Necessário informar o caminho para gravar a restauração',mtWarning,[mbOk],0);
               exit;
          end;
     end;
     if (Trim(Flb_NomeArquivo.filename) = '') or not (Flb_NomeArquivo.Selected[0]) then
     begin
          MessageDlg('Necessário selecionar o arquivo de cópia de segurança.',
          mtWarning,[mbOk],0);
          exit;
     end;
     if aFuncoes.ConectabancoDeDados(false) then
     begin
          Btn_Cancelar.Enabled        := true;
          Bck_Acc2000.Restoremode     := TRestoreMode(0);
          Bck_Acc2000.restoreFullpath := false;
          try
             if Bck_Acc2000.restore(Flb_NomeArquivo.filename, wCaminho) then
                MessageDlg('Restauração bem sucedida, '+
                inttostr(Bck_Acc2000.FilesProcessed)+' arquivo(s) de '+
                inttostr(Bck_Acc2000.FilesTotal)+' restaurado(s).',
                mtInformation,[mbOk],0)
          except
                MessageDlg('Falha na restauração ou processo cancelado.'#13+
                'É necessário repetir a operação.',mtWarning, [mbOk], 0);
          end;
          Pnl_NomeArquivo.caption := '';
          aFuncoes.ConectabancoDeDados(true);
          LimpaVariavel;
     end;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.Flb_NomeArquivoClick(Sender: TObject);
//---------------------------------------------------------------------
var wArquivos: tstringlist;
    I: integer;
    S, FA, SZ: string;
begin
     wArquivos := TStringlist.create;
     Mem_Arquivos.lines.clear;
     Edt_NomeBackup.text := Bck_Acc2000.getArchiveTitle(Flb_NomeArquivo.filename,
     wArquivos);
     if Edt_NomeBackup.text = '' then Edt_Conteudo.text := ''
     else
     begin
          Edt_Conteudo.text := inttostr(Bck_Acc2000.FilesTotal)+' Arquivos, '+inttostr(round(Bck_Acc2000.SizeTotal/1024))+' KB total';
          Mem_Arquivos.lines.beginupdate;
          for I := 0 to wArquivos.count-1 do
          begin
               S  := copy(wArquivos[i],1,pos(#9,wArquivos[i])-1);
               FA := copy(wArquivos[i],pos(#9,wArquivos[i])+1,pos('=',wArquivos[i])-pos(#9,wArquivos[i])-1);
               FA := DateToStr(FileDateToDateTime(StrtoInt(FA)));
               SZ := copy(wArquivos[i],pos('=',wArquivos[i])+1, length(wArquivos[i])-pos('=',wArquivos[i]));
               Mem_Arquivos.lines.add(S + ' from ' + FA + ', ' + SZ + ' bytes');
          end;
          if wArquivos.count = 0 then Mem_Arquivos.lines.add(
          'Nenhuma informação do arquivo neste backup');
          Mem_Arquivos.lines.endupdate;
     end;
     wArquivos.free;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.DiretorioRestauracaoClique(Sender: TObject);
//---------------------------------------------------------------------
begin
     Edt_Diretorio.Enabled := Rdb_OutroDiretorio.checked;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.Btn_SairClick(Sender: TObject);
//---------------------------------------------------------------------
begin
     close;
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//---------------------------------------------------------------------
begin
     if Key = 27 then close
     else if key = 112 then WinHelp(TFrm_RestauraCopia.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,22);
end;

//---------------------------------------------------------------------
procedure TFrm_RestauraCopia.Dcb_DestinoChange(Sender: TObject);
//---------------------------------------------------------------------
begin
     if aFuncoes.VerDiscoDrive(PChar(Dcb_Destino.Drive+':\')) then
          Dlb_Origem.Drive  := Dcb_Destino.Drive
     else
     begin
          Dcb_Destino.Drive := 'c';
          Dlb_Origem.Drive  := 'c';
     end;
end;

procedure TFrm_RestauraCopia.SPB_helpClick(Sender: TObject);
begin
     WinHelp(TFrm_RestauraCopia.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,22);
end;

end.
