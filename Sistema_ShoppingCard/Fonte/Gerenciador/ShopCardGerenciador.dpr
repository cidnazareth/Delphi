program ShopCardGerenciador;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDmGlobal in 'uDmGlobal.pas' {dmGlobal: TDataModule},
  uCadDependente in 'uCadDependente.pas' {frmCadDependente},
  uCadLojasShopping in 'uCadLojasShopping.pas' {frmCadLojasShopping},
  uCadEventos in 'uCadEventos.pas' {frmCadEventos},
  uVincularCartaoCliente in 'uVincularCartaoCliente.pas' {frmVincularCartaoCliente},
  uVincularCartaoDependente in 'uVincularCartaoDependente.pas' {frmVincularCartaoDependente},
  uCadClientes in 'uCadClientes.pas' {frmCadClientes},
  uCadProdutoPromocao in 'uCadProdutoPromocao.pas' {frmCadProdutoPromocao},
  uDmInsert in 'uDmInsert.pas' {dmInsert: TDataModule},
  uCadSorteio in 'uCadSorteio.pas' {frmCadSorteio},
  uDmLocaliza in 'uDmLocaliza.pas' {dmLocaliza: TDataModule},
  uInformeNumCartaoDependente in 'uInformeNumCartaoDependente.pas' {frmInformeNumCartaoDependente},
  uCadPremioSorteio in 'uCadPremioSorteio.pas' {frmCadPremioSorteio},
  uConsTitularesCartao in 'uConsTitularesCartao.pas' {frmConsTitularesCartao},
  uDmConsulta in 'uDmConsulta.pas' {dmConsulta: TDataModule},
  uConsDependenteCartao in 'uConsDependenteCartao.pas' {frmConsDependenteCartao},
  uConsCartao in 'uConsCartao.pas' {frmConsCartao},
  uConsLojaShopping in 'uConsLojaShopping.pas' {frmConsLojaShopping},
  uConsProdutoPromocao in 'uConsProdutoPromocao.pas' {frmConsProdutoPromocao},
  uDmUpdate in 'uDmUpdate.pas' {dmUpdate: TDataModule},
  uReativarCartao in 'uReativarCartao.pas' {frmReativarCartao},
  uCadResultadoSorteio in 'uCadResultadoSorteio.pas' {frmCadResultadoSorteio},
  uCadCupomSorteio in 'uCadCupomSorteio.pas' {frmCadCupomSorteio},
  uMensagens in 'uMensagens.pas' {frmMensagens},
  uCadConfig in 'uCadConfig.pas' {frmCadConfig},
  uCadDigitais in 'uCadDigitais.pas' {frmCadDigitais},
  uAtualizaSaldos in 'uAtualizaSaldos.pas' {frmAtualizaSaldos},
  uCadCreditoPontos in 'uCadCreditoPontos.pas' {frmCadCreditoPontos},
  DPFPGlobal in 'DPFPGlobal.pas',
  DPFPEngXLib_TLB in 'C:\Program Files (x86)\Borland\Delphi7\Imports\DPFPEngXLib_TLB.pas',
  uConfirmaDigital in 'uConfirmaDigital.pas' {frmConfirmaDigital},
  uCadUsuarios in 'uCadUsuarios.pas' {frmCadUsuarios},
  uCadAcessos in 'uCadAcessos.pas' {frmCadAcessos},
  uDmDelete in 'uDmDelete.pas' {dmDelete: TDataModule},
  uSplash in 'uSplash.pas' {FrmSplash},
  uCadTransferenciaPontos in 'uCadTransferenciaPontos.pas' {frmCadTransferenciaPontos};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmGlobal, dmGlobal);
  Application.CreateForm(TdmInsert, dmInsert);
  Application.CreateForm(TdmLocaliza, dmLocaliza);
  Application.CreateForm(TdmConsulta, dmConsulta);
  Application.CreateForm(TdmUpdate, dmUpdate);
  Application.CreateForm(TfrmReativarCartao, frmReativarCartao);
  Application.CreateForm(TfrmCadResultadoSorteio, frmCadResultadoSorteio);
  Application.CreateForm(TfrmCadCupomSorteio, frmCadCupomSorteio);
  Application.CreateForm(TfrmMensagens, frmMensagens);
  Application.CreateForm(TfrmCadConfig, frmCadConfig);
  Application.CreateForm(TfrmCadDigitais, frmCadDigitais);
  Application.CreateForm(TfrmAtualizaSaldos, frmAtualizaSaldos);
  Application.CreateForm(TfrmCadCreditoPontos, frmCadCreditoPontos);
  Application.CreateForm(TfrmConfirmaDigital, frmConfirmaDigital);
  Application.CreateForm(TfrmCadUsuarios, frmCadUsuarios);
  Application.CreateForm(TfrmCadAcessos, frmCadAcessos);
  Application.CreateForm(TdmDelete, dmDelete);
  Application.CreateForm(TfrmCadTransferenciaPontos, frmCadTransferenciaPontos);
  Application.Run;
end.
