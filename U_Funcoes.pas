unit U_Funcoes;

interface

uses SysUtils, DBTables, Dialogs, Controls, Buttons, Forms, DBCtrls,
     StdCtrls, Graphics, DB, windows, IBQuery, variants ;


type
   Funcoes = Class (TObject)
    Function  StrZero(Const Arg1: variant; Arg2: integer; Arg3: string):String;
    Function  ValidaData(StrD: string):Boolean;
    Function  ValidaHora(StrT: string): Boolean;
    procedure AbreQuery(nomeQuery: TIBQuery; Listasql: string);
    function  SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
    function  ConectabancoDeDados(WPConexao: boolean): boolean;
    function  VerDiscoDrive(WPDrive: PChar): boolean;
    Function  TestaCampoVazio(Const arg1: variant; arg2: String): Boolean;
    function  MessageDlgDef(Const Msg: string; AType: TMsgDlgType;
              AButtons: TMsgDlgButtons; DefButton: TModalResult; HelpCtx: LongInt): word;
    function  LocalizaIndice(WPQuery: TIBQuery; WPselecao,WPCondicao: String; WPchave: Array Of Variant): boolean;
    function  VerificaDatas(WPDe, WPAt: string; WPControleAtivo: integer;
              WPMen1, WPMen2: string): boolean;
    function  ResultaNomeMes(WPNumMes,wPLong:integer):string;
    function  ResultUltimoDiaMes(WPMesAno: string): integer;
    procedure STOperaRegistrosIB(WPSelect: string; WPParametros: array of
              variant);
    Function  ResultaDataGravar(WPData: String): variant;
    function  MascaraCnpjCpf(WPTam: integer): string;
    function  RetornaDataStr(WPData: TDatetime): string;
    function  ValidaCnpj(Cnpj: String):Boolean;
    Function  ValidaCpf(Cpf : String) : Boolean;
    function  RetornaDescricao(WPSelect,WPWhere: string; WPVarSeek: variant;
              WPRetorno: string): variant;
    function  SomaContaRegistros(WPSelect: string; WPParametros : array of
              variant): Variant;
    function  EntraVF_RetSN(WPArgumento : boolean): string;
    function  EntraSN_RetVF(WPArgumento : string): boolean;
    function  ValidaAno(WPAno: string): boolean;
    function  ValidaMes(WPMes: string): boolean;
    function  RetornaProximoMesAno(wMOVE_MES,wMOVE_ANO : string): string;
    function  RetornaMesmoMesAno(wMOVE_MES,wMOVE_ANO : string): string;
    function  ResultaDescricaoResultadoFinal(WPCod: string): string;
    function  DecideMatriculaDuplicada(WPAno, WPSerie, WPAluno, WPNomeAluno,
              WPNomeserie: string) : boolean;
   end;

var

aFuncoes: Funcoes;

implementation

uses U_Modulo, U_Principal;

//-----------------------------------------------------------------------
Function Funcoes.StrZero(Const Arg1: variant; Arg2: integer; Arg3: string):String;
//-----------------------------------------------------------------------
var Local1, Local2, Local4: string;
    Local3, Local5, Local6: integer;
begin
    try
     Local4:='';
     Local1:=Arg3;

     if (VarType(arg1) =  varSmallint) or (VarType(arg1) =  varInteger) then
         Local2:= Trim(IntToStr(Arg1))
     else if (VarType(arg1) =  varDouble) then Local2:=Trim(floattostr(Arg1))
     else if (VarType(arg1) =  varString) then Local2:=Trim(Arg1);

     Local5:=length(Local2);
     Local6:=arg2-Local5;
     if Local6 > 0 then
     begin
          for Local3:= 1 to Local6 do
          begin
               Local4:=Local4+Local1;
          end;
     end;
     Strzero:=Local4+Local2;
    except
        if MessageDlg('Acadêmico'+#13+'Função: STRZERO.'#13+'Deseja prosseguir ?',
        mtWarning,[mbYes,mbAbort],0) = mrAbort then
           Abort;
    end;
end;

//------------------------------------------------------------------------------
function Funcoes.RetornaDescricao(WPSelect,WPWhere: string; WPVarSeek: variant;
         WPRetorno: string): variant;
//------------------------------------------------------------------------------
var wQuery : TIBQuery;
begin
     wQuery := TIBQuery.Create(Application);
     wQuery.DataBase := Frm_Modulo.DTB_Academico;
     Result:='';
     if LocalizaIndice(wQuery,WPSelect,WPWhere,[WPVarSeek]) then
        Result:=wQuery.FieldByName(WPRetorno).value;
     wQuery.Free;
end;

//-----------------------------------------------------------------------
Function Funcoes.ValidaData(StrD: string): Boolean;
//-----------------------------------------------------------------------
begin
  Result := True;
  if Trim(StrD) <> '/  /' then
  begin
       try
          StrToDate(StrD);
       except
             on EConvertError do
             begin
                  MessageDlg('Data informada inválida !',mtError, [mbOk], 0);
                  Result:=False;
             end;
       end;
  end;
end;

//-----------------------------------------------------------------------
procedure Funcoes.AbreQuery(nomeQuery: TIBQuery; Listasql: string);
//-----------------------------------------------------------------------
begin
     with NomeQuery do
     begin
          close;
          Sql.Clear;
          Sql.add(listasql);
          prepare;
          Open;
     end;
end;

function Funcoes.SystemDateTime(tDate: TDateTime; tTime: TDateTime): Boolean;
var
   tSetDate: TDateTime;
   vDateBias: Variant;
   tSetTime: TDateTime;
   vTimeBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
GetTimeZoneInformation(tTZI);
vDateBias := tTZI.Bias / 1440;
tSetDate := tDate + vDateBias;
vTimeBias := tTZI.Bias / 1440;
tSetTime := tTime + vTimeBias;
with tST do
     begin
     wYear := StrToInt(FormatDateTime('yyyy', tSetDate));
     wMonth := StrToInt(FormatDateTime('mm', tSetDate));
     wDay := StrToInt(FormatDateTime('dd', tSetDate));
     wHour := StrToInt(FormatDateTime('hh', tSettime));
     wMinute := StrToInt(FormatDateTime('nn', tSettime));
     wSecond := StrToInt(FormatDateTime('ss', tSettime));
     wMilliseconds := 0;
     end;
SystemDateTime := SetSystemTime(tST);
end;

//------------------------------------------------------------------------------
Function Funcoes.ValidaHora(StrT: string): Boolean;
//------------------------------------------------------------------------------
begin
  Result := True;

  if (Trim(StrT) <> ':  :') and (Trim(StrT) <> ':') then
  begin
    try
       StrToTime(StrT);
    except on EConvertError do
       begin
          Result:=False;
          MessageDlg('Hora informada inválida !', mtError, [mbOk], 0);
       end;
    end;
  end;
end;

//---------------------------------------------------------------------
function Funcoes.ConectabancoDeDados(WPConexao: boolean): boolean;
//---------------------------------------------------------------------
begin
     Result := true;
     try
          if WPConexao then
               Frm_Modulo.DTb_Academico.Open
          else Frm_Modulo.DTb_Academico.Close;
     except
          MessageDlg('Não foi possível abrir o banco de dados com exclusividade.'#13+'Todas as estações da rede devem ser desconectadas para realizar esta rotina.',mtWarning,[mbOk],0);
          Result := false;
     end;
end;

//----------------------------------------------------------------------
function Funcoes.VerDiscoDrive(WPDrive: PChar): boolean;
//----------------------------------------------------------------------
var wTipoDrive : integer;
    wDrive : Char;
    wI, wNumDrive, wModoAnterior : Integer;
    wMsgCdRom, wMsgDisquete : string;
begin
     Result       := true;
     wMsgDisquete := 'Disquete inexistente ou não formatado...';
     wMsgCdRom    := 'Unidade de cdrom vazia...';
     wNumDrive    := 0;
     wI           := 0;
     wTipoDrive   := GetDriveType(WPDrive);
     if (wTipoDrive = DRIVE_REMOVABLE) or (wTipoDrive = DRIVE_CDROM) then
     begin
          For wDrive := 'a' to 'z' do
          begin
               wI := wI + 1;
               if wDrive = Copy(WPDrive,1,1) then
               begin
                    wNumDrive := wI;
                    break;
               end;
          end;
          wModoAnterior := SetErrorMode(SEM_FAILCRITICALERRORS);
          try
             Result := DiskFree(wNumDrive) >= 0;
          finally
             SetErrorMode(wModoAnterior);
          end;
          if not Result then
          begin
               if wTipoDrive = DRIVE_REMOVABLE then
                    MessageDlg(wMsgDisquete,mtWarning,[mbOk],0)
               else MessageDlg(wMsgCdRom,mtWarning,[mbOk],0);
          end;
     end;
end;

//-----------------------------------------------------------------------
Function Funcoes.TestaCampoVazio(Const arg1: variant; arg2: String): Boolean;
//-----------------------------------------------------------------------
begin
     Result:=true;
     if (VarType(arg1) =  varSmallint) or (VarType(arg1) =  varInteger)  or
        (VarType(arg1) =  varSingle)   or (VarType(arg1) =  varDouble)   or
        (VarType(arg1) =  varCurrency) then
     begin
         if arg1 <= 0 then
           Result:=false;
     end
     else
     if (VarType(arg1) = varString) then
          if (Trim(arg1) = '') or (Trim(arg1) = '/  /') then
              Result:=false
          else
          try
             if strtofloat(arg1) = 0 then result := false;
          except
          end;

     if not Result then
        MessageDlg('É necessário informar '+arg2, mtWarning,[mbOk], 0);
end;

//-----------------------------------------------------------------------
function Funcoes.ResultUltimoDiaMes(WPMesAno: string): integer;
//-----------------------------------------------------------------------
var wDataAno, wDataMes : integer;
    wModAno  : real;
begin
     Result   := 0;
     wDataAno := StrToInt(Copy(WPMesAno,4,4));
     wDataMes := StrToInt(Copy(WPMesAno,1,2));
     wModAno  := wDataAno Mod 4;
     Case wDataMes of
          1, 3, 5, 7, 8, 10, 12: Result := 31;
          4, 6, 9, 11: Result := 30;
     else
         If wModAno = 0 then Result := 29 else Result := 28;
     end;
end;


//-----------------------------------------------------------------------
function Funcoes.MessageDlgDef(Const Msg: string; AType: TMsgDlgType;
         AButtons: TMsgDlgButtons; DefButton: TModalResult; HelpCtx: LongInt): word;
//-----------------------------------------------------------------------
var i: integer;
begin
     with CreateMessageDialog(Msg, AType, AButtons) do
     try
        case AType of
             mtWarning      : Caption := 'Aviso';
             mtError        : Caption := 'Erro';
             mtInformation  : Caption := 'Informação';
             mtConfirmation : Caption := 'Confirmação';
             mtCustom       : Caption := 'Padrão';
        end;

        HelpContext:= HelpCtx;
        for i:=1 to ComponentCount - 1 do
        begin
            if (Components[i] is TButton) then
            begin
                 with TButton(Components[i]) do
                 case ModalResult of
                      mrCancel : Caption := '&Cancelar';
                      mrYes    : Caption := '&Sim';
                      mrNo     : Caption := '&Não';
                      mrNone   : Caption := 'N&enhum';
                      mrOk     : Caption := '&Ok';
                      mrAbort  : Caption := '&Abortar';
                      mrRetry  : Caption := 'Re&petir';
                      mrIgnore : Caption := '&Ignorar';
                      mrAll    : Caption := '&Todos';
                 end;
                 if (TButton(Components[i]).ModalResult = DefButton) then
                   ActiveControl:= (Components[i] as TButton);
            end;
        end;
        Result:= ShowModal;
      finally
        Free;
      end;
end;

//-----------------------------------------------------------------------
function Funcoes.LocalizaIndice(WPQuery: TIBQuery; WPselecao,WPCondicao: String; WPchave: Array Of Variant): boolean;
//-----------------------------------------------------------------------
Var Wi : Integer ;
begin
     Result := false;
     try
        with WPQuery do
        begin
             close;
             Sql.clear;
             Sql.Add(WPselecao);
             Sql.Add(WPcondicao);
             for wi := 0 to ParamCount - 1 do
                 params[wi].value:=WPchave[wi];
             prepare;
             open;
             if not eof then
                Result:=true;
        end;
     except
        if MessageDlg('Passagem incorreta de parametros. '+#13+'Função: Localiza indice. Deseja prosseguir? ',
        mtError,[mbYes,mbAbort],0) = mrAbort then
           Abort;
     end;
end;

//-----------------------------------------------------------------------
function Funcoes.VerificaDatas(WPDe, WPAt: string; WPControleAtivo: integer; WPMen1, WPMen2: string): boolean;
//-----------------------------------------------------------------------
var TrimDe, TrimAt: string;
begin
    TrimDe :=Trim(WPDe);
    TrimAt :=Trim(WPAt);

    if (TrimDe = '/  /') and (TrimAt = '/  /') then
       Result:=true

    else if (TrimDe <> '/  /') and (TrimAt = '/  /') then
       Result:=aFuncoes.ValidaData(TrimDe)

    else if (TrimDe = '/  /') and (TrimAt <> '/  /') then
       Result:=aFuncoes.ValidaData(TrimAt)

    else if (TrimDe <> '/  /') and (TrimAt <> '/  /') then
    begin
          if not aFuncoes.ValidaData(TrimDe) or
          not aFuncoes.ValidaData(TrimAt) then
             Result:=false
          else
          begin
             if StrToDate(TrimAt) <  StrToDate(TrimDe) then
             begin
                  if WPControleAtivo = 1 then
                       MessageDlg(WPMen1, mtWarning, [mbOk], 0)
                  else MessageDlg(WPMen2, mtWarning, [mbOk], 0);
                  Result:=false;
             end
             else Result:=true;
          end;
     end;
end;

//------------------------------------------------------------------------------
function Funcoes.ResultaNomeMes(WPNumMes,wPLong:integer):string;
//------------------------------------------------------------------------------
const wNomMes0: array [1..12] of string = ('JAN','FEV','MAR','ABR','MAI','JUN',
                      'JUL','AGO','SET','OUT','NOV','DEZ');
const wNomMes1: array [1..12] of string = ('JANEIRO','FEVEREIRO','MARÇO','ABRIL',
                      'MAIO','JUNHO','JULHO','AGOSTO','SETEMBRO','OUTUBRO',
                      'NOVEMBRO','DEZEMBRO');
begin
     case WPLong of
          0: Result := wNomMes0[WPNumMes];
          1: Result := wNomMes1[WPNumMes];
     end;
end;

//------------------------------------------------------------------------------
procedure Funcoes.STOperaRegistrosIB(WPSelect: string; WPParametros: array of
          variant);
//------------------------------------------------------------------------------
var wQuery : TIBQuery;
    wI : integer;
begin
     wQuery := TIBQuery.Create(Application);
     with wQuery do
     begin
          DataBase := Frm_Modulo.DTb_Academico;
          Sql.Clear;
          sql.add(WPSElect);
          if ParamCount > 0 then
             for wI:= 0 to ParamCount - 1 do
                 Params[wI].value:=WPParametros[wI];
          prepare;
          execsql;
          Free;
     end;
end;

//------------------------------------------------------------------------------
Function Funcoes.ResultaDataGravar(WPData: String): variant;
//------------------------------------------------------------------------------
begin
     try
            Result := strtodate(WPData);
     except Result := 0;
     end;
end;

//------------------------------------------------------------------------------
function Funcoes.MascaraCnpjCpf(WPTam: integer): string;
//------------------------------------------------------------------------------
begin
     result := '';
     case wPTam of
          11: result := '999.999.999-99;0; ';
          14: result := '99.999.999/9999-99;0; ';
     end;
end;

//------------------------------------------------------------------------------
function  Funcoes.RetornaDataStr(WPData: TDatetime): string;
//------------------------------------------------------------------------------
begin
     result := '';
     if WPData > strtodate('31/12/1900') then
        result := datetostr(WPData);
end;

//------------------------------------------------------------------------------
function Funcoes.ValidaCnpj(Cnpj: String):Boolean;
//------------------------------------------------------------------------------
{Testa se o CGC é válido ou não}
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
    if Trim(Cnpj) = '' then
    begin
         result := true;
         exit;
    end;


d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( Cnpj )-2 do
    begin
    if Pos( Copy( Cnpj, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( Cnpj, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( Cnpj, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(Cnpj,succ(length(Cnpj)-2),2) then
   begin
        aFuncoes.MessageDlgDef('CNPJ informado inválido...',mtInformation,[mbok],
        mrok,0);
        Result := False;
   end
   else Result := True;
end;

//------------------------------------------------------------------------------
Function Funcoes.ValidaCpf(Cpf : String) : Boolean;
//------------------------------------------------------------------------------
var
  nD1,nD2,nTroca,nResto,nConta,nDigito, ValResto : Integer;
begin
    if Trim(Cpf) = '' then
    begin
         result := true;
         exit;
    end;

    nD1 := 0;
    nD2 := 0;
    nTroca := 1;

    For nConta := 1 to ( Length(Cpf) - 2) Do
    Begin
         If pos(copy(Cpf,nConta,1),'/-.') = 0 Then
         Begin
              nD1 := nD1 + (( 11 - nTroca ) * StrToInt(copy(Cpf,nConta,1)));
              nD2 := nD2 + (( 12 - nTroca ) * StrToInt(copy(Cpf,nConta,1)));
              Inc(nTroca);
         End;
    End;
    nResto := nD1 - ( Trunc( nD1 / 11 ) * 11 );
    if nResto < 2 Then nDigito := 0 else nDigito := ( 11 - nResto );

    nD2 := nD2 +( 2 * nDigito );
    nResto := nD2 - ( Trunc(nD2 / 11 ) * 11 );

    if nResto < 2 Then ValResto := 0 else ValResto := ( 11 - nResto );

    nDigito := StrToInt((copy(IntToStr(nDigito),1,1)) + (copy(IntToStr(
    ValResto),1,1)));
    if nDigito <> StrToInt( copy(Cpf,Length(Cpf) - 1,2) ) Then
    Begin
         aFuncoes.MessageDlgDef('CPF informado inválido...',mtInformation,
         [mbok],mrok,0);
         Result :=  False;
    End
    else Result := true;
end;

//------------------------------------------------------------------------------
function Funcoes.SomaContaRegistros(WPSelect: string;WPParametros : array of
         variant): Variant;
//------------------------------------------------------------------------------
var wQuery : TIBQuery;
    wI : integer;
begin
     wQuery := TIBQuery.Create(Application);
     with wQuery do
     begin
          DataBase := Frm_Modulo.DTb_Academico;
          Sql.Clear;
          sql.add(WPSElect);
          if ParamCount > 0 then
          begin
               for wI:= 0 to ParamCount - 1 do
                    Params[wI].value:=WPParametros[wI];
          end;
          prepare;
          open;
          if (VarType(Fields[0].value) =  varSmallint) or (VarType(Fields[0].value) =  varInteger)  or
             (VarType(Fields[0].value) =  varSingle)   or (VarType(Fields[0].value) =  varDouble)   or
             (VarType(Fields[0].value) =  varCurrency) then
              Result := Fields[0].value
          else Result := 0;
          Free;
     end;
end;

//------------------------------------------------------------------------------
function Funcoes.EntraVF_RetSN(WPArgumento : boolean): string;
//------------------------------------------------------------------------------
begin
     Result:= 'N';
     if WPArgumento then Result:= 'S';
end;

//------------------------------------------------------------------------------
function Funcoes.EntraSN_RetVF(WPArgumento : string): boolean;
//------------------------------------------------------------------------------
begin
     Result:= false;
     if WPArgumento = 'S' then Result:= true;
end;

//------------------------------------------------------------------------------
function Funcoes.ValidaAno(WPAno: string): boolean;
//------------------------------------------------------------------------------
var wsano, wmsgerro : string;
    wiano : integer;
begin
     if Trim(WPAno) = '' then
     begin
          result := true;
          exit;
     end;
     result   := false;
     wmsgerro := 'Ano informado inválido...';
     try
        wsano := trim(WPAno);
        wiano := strtoint(wsano);
        // testar o mês e o ano
        if wiano < 1900 then
            wmsgerro := 'O ano deve conter 4 (quatro) digitos e deve ser maior que 1899...'
        else result := true;
     except
           MessageDlgDef(wmsgerro,mtInformation,[mbOk],mrok,0);
     end;
     if not result then MessageDlgDef(wmsgerro,mtInformation,[mbOk],mrok,0);
end;

//------------------------------------------------------------------------------
function Funcoes.ValidaMes(WPMes: string): boolean;
//------------------------------------------------------------------------------
var wsmes, wmsgerro : string;
    wimes : integer;
begin
     if Trim(WPMes) = '' then
     begin
          result := true;
          exit;
     end;
     result   := false;
     wmsgerro := 'Mês informado inválido...';
     try
        wsmes := trim(WPmes);
        wimes := strtoint(wsmes);
        // testar o mês
        if (wimes < 1) or (wimes > 12) then
            wmsgerro := 'O mês deve estar entre 01 e 12...'
        else if length(wsmes) <= 1 then
            wmsgerro := 'O mês deve possuir dois digitos...'
        else result := true;
     except
           MessageDlgDef(wmsgerro,mtInformation,[mbOk],mrok,0);
     end;
     if not result then MessageDlgDef(wmsgerro,mtInformation,[mbOk],mrok,0);
end;

//------------------------------------------------------------------------------
function funcoes.RetornaProximoMesAno(wMOVE_MES,wMOVE_ANO : string): string;
//------------------------------------------------------------------------------
begin
     if wMOVE_MES = '12' then
     begin
          result := formatfloat('00',Frm_principal.wDIA_VENCIMENTO)+'/01/' +
                    FormatFloat('0000',STRTOINT(wMOVE_ANO) + 1);
     end
     else result := formatfloat('00',Frm_principal.wDIA_VENCIMENTO)+'/'+
                    FormatFloat('00',STRTOINT(wMOVE_MES) + 1)+'/'+wMOVE_ANO;
end;

//------------------------------------------------------------------------------
function funcoes.RetornaMesmoMesAno(wMOVE_MES,wMOVE_ANO : string): string;
//------------------------------------------------------------------------------
begin
     result := formatfloat('00',Frm_principal.wDIA_VENCIMENTO)+'/'+
               wMOVE_MES+'/'+wMOVE_ANO;
end;

function funcoes.ResultaDescricaoResultadoFinal(WPCod: string): string;
begin
          if WPCod = 'C' then
               result := 'CURSANDO'
          else if WPCod = 'A' then
               result := 'APROVADO'
          else if WPCod = 'R' then
               result := 'REPROVADO'
          else if WPCod = 'T' then
               result := 'TRANCADO'
          else result := WPCod;
end;

function Funcoes.DecideMatriculaDuplicada(WPAno, WPSerie,WPAluno, WPNomeAluno,
        WPNomeserie: string) : boolean;
begin
     result := true;
     if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
     'Select * from TB_MATRICULA',
     'where matr_ano=:wa and matrseri<>:ws and matralun=:wd',
     [WPAno, WPSerie,WPAluno]) then
     begin
          if afuncoes.MessageDlgDef(WPNomeAluno + ' matriculado no(a) '+
          afuncoes.RetornaDescricao('select * from tb_serie','where sericodg=:w1'
          ,Frm_Modulo.IBQ_funcoes.fieldbyname('matrseri').asstring,'seridesc')
          +#13+'Deseja re-matricular no(a) '+WPNomeserie+' ?',mtWarning,[mbYes,mbNo]
          ,mrno,0) <> mrYes then
              result := false;
          Frm_Modulo.IBQ_funcoes.close;
          exit;
     end;

     if result then
        if Afuncoes.Localizaindice(Frm_Modulo.IBQ_funcoes,
        'Select * from TB_MATRCONCEITO',
        'where matr_ano=:wa and matrseri<>:ws and matralun=:wd',
        [WPAno, WPSerie,WPAluno]) then
        begin
          if afuncoes.MessageDlgDef(WPNomeAluno + ' matriculado no(a) '+
          afuncoes.RetornaDescricao('select * from tb_serie','where sericodg=:w1'
          ,Frm_Modulo.IBQ_funcoes.fieldbyname('matrseri').asstring,'seridesc')
          +#13+'Deseja re-matricular no(a) '+WPNomeserie+' ?',mtWarning,[mbYes,mbNo],mrno,0) <> mrYes then
             result := false;
          Frm_Modulo.IBQ_funcoes.close;
          exit;
        end;
end;
end.

