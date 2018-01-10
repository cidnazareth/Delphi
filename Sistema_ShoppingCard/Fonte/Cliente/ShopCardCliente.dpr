program ShopCardCliente;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDmCliente in 'uDmCliente.pas' {dmCliente: TDataModule},
  uLojasParticipantes in 'uLojasParticipantes.pas' {frmLojasParticipantes},
  uExtratoCartao in 'uExtratoCartao.pas' {frmExtratoCartao},
  uSaldoCartao in 'uSaldoCartao.pas' {frmSaldoCartao},
  uTelaStandBy in 'uTelaStandBy.pas' {frmTelaStandBy},
  uConfirmaDigital in 'uConfirmaDigital.pas' {frmConfirmaDigital},
  uDetalheProduto in 'uDetalheProduto.pas' {frmDetalheProduto},
  uProdutos in 'uProdutos.pas' {frmProdutos},
  uSorteios in 'uSorteios.pas' {frmSorteios},
  uDetalhePremio in 'uDetalhePremio.pas' {frmDetalhePremio},
  uDmInsert in 'uDmInsert.pas' {dmInsert: TDataModule},
  uCadConfig in 'uCadConfig.pas' {frmCadConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmExtratoCartao, frmExtratoCartao);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TfrmSorteios, frmSorteios);
  Application.CreateForm(TfrmDetalhePremio, frmDetalhePremio);
  Application.CreateForm(TdmInsert, dmInsert);
  Application.CreateForm(TfrmCadConfig, frmCadConfig);
  Application.Run;
end.
