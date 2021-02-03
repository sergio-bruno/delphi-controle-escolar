program Academico;

uses
  Forms,
  U_Principal in 'U_Principal.pas' {Frm_principal},
  U_Calendario in 'U_Calendario.pas' {Frm_Calendario},
  U_Funcoes in 'U_Funcoes.pas',
  U_GravaCopia in 'U_GravaCopia.pas' {Frm_GravaCopia},
  U_Login in 'U_Login.pas' {Frm_Login},
  U_RestauraCopia in 'U_RestauraCopia.pas' {Frm_RestauraCopia},
  U_Sobre in 'U_SOBRE.PAS' {Frm_Sobre},
  U_Splash in 'U_SPLASH.PAS' {Frm_Splash},
  U_FiltData in 'U_FiltData.pas' {Frm_FiltData},
  U_Modulo in 'U_MODULO.PAS' {Frm_Modulo: TDataModule},
  U_PesqIncremento in 'U_PesqIncremento.pas' {Frm_PesqIncremento},
  U_TbSerie in 'U_TbSerie.pas' {Frm_TbSerie},
  U_TbNivelEscolar in 'U_TbNivelEscolar.pas' {Frm_TbNivelEscolar},
  U_TbDisciplina in 'U_TbDisciplina.pas' {Frm_TbDisciplina},
  U_CdDicente in 'U_CdDicente.pas' {Frm_CdDicente},
  U_CdFuncionario in 'U_CdFuncionario.pas' {Frm_CdFuncionario},
  U_Usuario in 'U_Usuario.pas' {Frm_Usuario},
  U_FiltroGerenciamentoAluno in 'U_FiltroGerenciamentoAluno.pas' {Frm_FiltroGerenciamentoAluno},
  U_SelecionaBoletim in 'U_SelecionaBoletim.pas' {Frm_SelecionaBoletim},
  U_SelecionaSerieAno in 'U_SelecionaSerieAno.pas' {Frm_SelecionaSerieAno},
  U_RelAlu004 in 'U_RelAlu004.pas' {Qrp_RelAlu004: TQuickRep},
  U_RelAlu005 in 'U_RelAlu005.pas' {Qrp_RelAlu005: TQuickRep},
  U_RelAlu003 in 'U_RelAlu003.pas' {Qrp_RelAlu003: TQuickRep},
  U_Mensalidade in 'U_Mensalidade.pas' {Frm_Mensalidade},
  U_PedeSenhaFuncUsua in 'U_PedeSenhaFuncUsua.pas' {Frm_PedeSenhaFuncUsua},
  U_PedeSenha in 'U_PedeSenha.pas' {Frm_PedeSenha},
  U_FiltMes in 'U_FiltMes.pas' {Frm_FiltMes},
  U_RelAlu001 in 'U_RelAlu001.pas' {Qrp_RelAlu001: TQuickRep},
  U_RelAlu007 in 'U_RelAlu007.pas' {Qrp_RelAlu007: TQuickRep},
  U_RelAlu002 in 'U_RelAlu002.pas' {Qrp_RelAlu002: TQuickRep},
  U_RelAlu010 in 'U_RelAlu010.pas' {Qrp_RelAlu010: TQuickRep},
  U_RelAlu011 in 'U_RelAlu011.pas' {Qrp_RelAlu011: TQuickRep},
  U_RelAlu006 in 'U_RelAlu006.pas' {Qrp_RelAlu006: TQuickRep},
  U_GerenciaAlunoConceito in 'U_GerenciaAlunoConceito.pas' {Frm_GerenciaAlunoConceito},
  U_GerenciaAluno in 'U_GerenciaAluno.pas' {Frm_GerenciaAluno},
  U_SelecionaAlunoMatriculaC in 'U_SelecionaAlunoMatriculaC.pas' {Frm_SelecionaAlunoMatriculaC},
  U_SelecionaAlunoMatricula in 'U_SelecionaAlunoMatricula.pas' {Frm_SelecionaAlunoMatricula},
  U_EditaGerenciamentoAlunoC in 'U_EditaGerenciamentoAlunoC.pas' {Frm_EditaGerenciamentoAlunoC},
  U_EditaGerenciamentoAluno in 'U_EditaGerenciamentoAluno.pas' {Frm_EditaGerenciamentoAluno},
  U_RelAlu012 in 'U_RelAlu012.pas' {Qrp_RelAlu012: TQuickRep},
  U_RelAlu009 in 'U_RelAlu009.pas' {Qrp_RelAlu009: TQuickRep},
  U_MensalidadePorSerie in 'U_MensalidadePorSerie.pas' {Frm_MensalidadePorSerie},
  U_AlunosPorSerie in 'U_AlunosPorSerie.pas' {Frm_AlunosPorSerie},
  U_FiltMesAno in 'U_FiltMesAno.pas' {Frm_FiltMesAno},
  U_RelAlu013 in 'U_RelAlu013.pas' {Qrp_RelAlu013: TQuickRep},
  U_RelAlu008 in 'U_RelAlu008.pas' {Qrp_RelAlu008: TQuickRep},
  U_BoletoAlternado in 'U_BoletoAlternado.pas' {Frm_BoletoAlternado},
  U_BoletimAlternadoConceito in 'U_BoletimAlternadoConceito.pas' {Frm_BoletimAlternadoConceito},
  U_BoletimAlternadoNota in 'U_BoletimAlternadoNota.pas' {Frm_BoletimAlternadoNota},
  U_ApagaMensalidade in 'U_ApagaMensalidade.pas' {Frm_ApagaMensalidade},
  U_EditaMensalidade in 'U_EditaMensalidade.pas' {Frm_EditaMensalidade},
  U_BaixaMensalidadeGeral in 'U_BaixaMensalidadeGeral.pas' {Frm_BaixaMensalidadeGeral},
  U_BaixaMensalidade in 'U_BaixaMensalidade.pas' {Frm_BaixaMensalidade};

{$R *.RES}

begin
  Frm_Splash:= TFrm_Splash.Create(Application);
  Frm_Splash.Show;
  Frm_Splash.Update;
  Application.Initialize;
  Application.Title := 'Acadêmico - Sistema Integrado de Gerenciamento Escolar';
  Application.CreateForm(TFrm_principal, Frm_principal);
  Application.CreateForm(TFrm_Modulo, Frm_Modulo);
  Application.CreateForm(TFrm_PesqIncremento, Frm_PesqIncremento);
  Application.CreateForm(TFrm_PedeSenhaFuncUsua, Frm_PedeSenhaFuncUsua);
  Application.CreateForm(TFrm_PedeSenha, Frm_PedeSenha);
  Application.CreateForm(TQrp_RelAlu013, Qrp_RelAlu013);
  Application.CreateForm(TQrp_RelAlu008, Qrp_RelAlu008);
  Application.CreateForm(TFrm_BoletimAlternadoConceito, Frm_BoletimAlternadoConceito);
  Application.CreateForm(TFrm_BoletimAlternadoNota, Frm_BoletimAlternadoNota);
  Application.CreateForm(TFrm_ApagaMensalidade, Frm_ApagaMensalidade);
  Frm_Splash.Hide;
  Frm_Splash.Free;
  Application.Run;
end.
