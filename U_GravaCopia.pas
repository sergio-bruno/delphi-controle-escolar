unit U_GravaCopia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Gauges, backup, FileCtrl, Buttons;

type
  TFrm_GravaCopia = class(TForm)
    Pnl_Titulo: TPanel;
    Btn_Backup: TButton;
    Btn_Cancelar: TButton;
    Btn_Sair: TButton;
    Bck_Acc2000: TBackupFile;
    SPB_help: TSpeedButton;
    Panel1: TPanel;
    Lbl_Destino: TLabel;
    Dcb_Destino: TDriveComboBox;
    Dlb_Origem: TDirectoryListBox;
    Flb_NomeArquivo: TFileListBox;
    Grb_ConfiguracaoBackup: TGroupBox;
    Lbl_DriveDestino: TLabel;
    Cmb_DriveDestino: TComboBox;
    Grb_Progresso: TGroupBox;
    Gag_Progresso: TGauge;
    Pnl_NomeArquivo: TPanel;
    Button1: TButton;
    procedure Btn_SairClick(Sender: TObject);
    procedure Btn_BackupClick(Sender: TObject);
    procedure ProgressoBackup(Sender: TObject; Filename: String;
              Percent: TPercentage; var Continue: Boolean);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function  VerDiscoDrive_A(WPDrive: string): boolean;
    procedure FormShow(Sender: TObject);
    procedure LimpaVariavel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
              Shift: TShiftState);
    procedure Dcb_DestinoChange(Sender: TObject);
    procedure SPB_helpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var Frm_GravaCopia: TFrm_GravaCopia;

implementation

Uses U_Funcoes,
     U_Principal;

const SHFMT_ID_DEFAULT = $FFFF;
// Formating options
SHFMT_OPT_QUICKFORMAT = $0000;
SHFMT_OPT_FULL = $0001;
SHFMT_OPT_SYSONLY = $0002;
// Error codes
SHFMT_ERROR = $FFFFFFFF;
SHFMT_CANCEL = $FFFFFFFE;
SHFMT_NOFORMAT = $FFFFFFFD;

function SHFormatDrive(Handle: HWND; Drive, ID, Options: Word): LongInt; stdcall;
         external 'shell32.dll' name 'SHFormatDrive';

{$R *.DFM}

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.FormShow(Sender: TObject);
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
procedure TFrm_GravaCopia.LimpaVariavel;
//---------------------------------------------------------------------
begin
     Cmb_DriveDestino.ItemIndex := Cmb_DriveDestino.Items.IndexOf('A:');
     Gag_progresso.Progress     := 0;
     Pnl_NomeArquivo.Caption    := '';
     Btn_Cancelar.Enabled       := false;
     Dcb_Destino. Drive         := 'C';
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.Btn_SairClick(Sender: TObject);
//---------------------------------------------------------------------
begin
     close;
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.Btn_BackupClick(Sender: TObject);
//---------------------------------------------------------------------
var wCaminhoBackup: TStringList;
    wLetraDrive : string;
    wCaminho: string;
    wI : integer;
begin
     if Cmb_DriveDestino.Text = '' then
     begin
          MessageDlg('É necessário selecionar um drive...',mtWarning,[mbOk],0);
          Cmb_DriveDestino.Setfocus;
     end
     else
     if Flb_NomeArquivo.Items.Count < 0 then //or not (Flb_NomeArquivo.Selected[0]) then
     begin
          MessageDlg('Nenhum arquivo no diretório especificado.',mtWarning,[mbOk],0);
          exit;
     end
     else
     begin
          wLetraDrive := UpperCase(copy(Cmb_DriveDestino.Text, 1, 1));
          if not VerDiscoDrive_A(wLetraDrive) then
          begin
               MessageDlg('Disquete inexistente ou não formatado...',mtWarning,[mbOk],0);
               abort;
          end
          else if (wLetraDrive = 'A') and ((DiskFree(1) div 1024) < 1423) then
          begin
               MessageDlg('É necessário inserir Disquete(s) 1.44 vazio(s)...',
               mtWarning,[mbOk],0);
               abort;
          end;

          wCaminhoBackup := TStringList.Create;

          for wI := 0 to Flb_NomeArquivo.Items.Count -1 do
              wCaminhoBackup.add(Dlb_Origem.Directory+'\'+Flb_NomeArquivo.Items[wI]);

          if wLetraDrive = 'A' then
          begin
               MessageDlg('Insira um disquete vazio no drive < A >',mtInformation,[mbOk],0);
               Bck_Acc2000.maxSize := 1400000;
          end
          else Bck_Acc2000.maxSize := 0;

          Btn_Cancelar.Enabled := true;

          Bck_Acc2000.backuptitle      := 'D6Academico';
          Bck_Acc2000.backupmode       := TBackupMode(0);
          Bck_Acc2000.compressionLevel := TCompressionLevel(2);
          Bck_Acc2000.SaveFileID       := false;

          if Bck_Acc2000.backup(wCaminhoBackup,Cmb_DriveDestino.Text+'\D6Academico.bck') then
               MessageDlg('Processo de backup bem sucedido. Taxa de compressão = '+inttostr(Bck_Acc2000.compressionrate)+' %',mtInformation,[mbOk],0)
          else MessageDlg('Processo de backup cancelado',mtWarning,[mbOk],0);
          LimpaVariavel;
     end;
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.ProgressoBackup(Sender: TObject; Filename: String;
          Percent: TPercentage; var Continue: Boolean);
//---------------------------------------------------------------------
begin
     Gag_Progresso.progress := Percent;
     if Percent < 100 then Pnl_NomeArquivo.caption := Filename else Pnl_NomeArquivo.caption := '';
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.Btn_CancelarClick(Sender: TObject);
//---------------------------------------------------------------------
begin
     if not Bck_Acc2000.busy then close
     else if MessageDlg('Deseja abortar a operação ?',mtConfirmation, [mbYes,mbNo], 0) = mrYes then Bck_Acc2000.Stop;
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.FormCreate(Sender: TObject);
//---------------------------------------------------------------------
var wDrive : Char;
begin
     with Cmb_DriveDestino do
     begin
          Items.Clear;
          for wDrive := 'A' to 'Z' do
          Begin
               case GetDriveType(PChar(wDrive+':\')) of
                    DRIVE_REMOVABLE: Items.Add(wDrive+':');
                    DRIVE_FIXED    : Items.Add(wDrive+':');
               end;
          end;
     end;
end;

//-----------------------------------------------------------------------
function TFrm_GravaCopia.VerDiscoDrive_A(WPDrive: string): boolean;
//-----------------------------------------------------------------------
var wModoInicial, wNumDrive : integer;
begin
     Result := true;
     if WPDrive = 'A' then
          wNumDrive := 1
     else if WPDrive = 'B' then
          wNumDrive := 2
     else wNumDrive := 0;

     if wNumDrive > 0 then
     begin
          wModoInicial := SetErrorMode(SEM_FAILCRITICALERRORS);
          try
             Result := DiskFree(wNumDrive) >= 0;
          finally
             SetErrorMode(wModoInicial);
          end;
     end;
end;

//----------------------------------------------------------------------
procedure TFrm_GravaCopia.FormKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
//----------------------------------------------------------------------
begin
     if Key = 27 then close
     else if key = 112 then WinHelp(TFrm_GravaCopia.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,21);
end;

//---------------------------------------------------------------------
procedure TFrm_GravaCopia.Dcb_DestinoChange(Sender: TObject);
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

procedure TFrm_GravaCopia.SPB_helpClick(Sender: TObject);
begin
     WinHelp(TFrm_GravaCopia.Create(Self).Handle,
     'Ajuda.Hlp',HELP_CONTEXT,21);
end;

procedure TFrm_GravaCopia.Button1Click(Sender: TObject);
var retCode: LongInt;
begin
     retCode:= SHFormatDrive(Handle, 0, SHFMT_ID_DEFAULT, SHFMT_OPT_QUICKFORMAT);
     if retCode < 0 then ShowMessage('O disquete não foi formatado...');
end;

end.
