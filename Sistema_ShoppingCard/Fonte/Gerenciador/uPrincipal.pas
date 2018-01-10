unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids, EFocCol,
  AppEvnts, Menus, DBCtrls, ComCtrls, EStBar;

type
  TfrmPrincipal = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    EvFocusColor1: TEvFocusColor;
    MainMenu1: TMainMenu;
    Cadastros: TMenuItem;
    Clientes: TMenuItem;
    Dependentes: TMenuItem;
    N1: TMenuItem;
    VincularCartao: TMenuItem;
    VincularCartaoCliente: TMenuItem;
    N2: TMenuItem;
    VincularCartaoDependente: TMenuItem;
    N3: TMenuItem;
    LojasShopping: TMenuItem;
    ProdutosPromocao: TMenuItem;
    N4: TMenuItem;
    Processamento: TMenuItem;
    Digitais: TMenuItem;
    Sorteios: TMenuItem;
    PremiosSorteio: TMenuItem;
    Consultas: TMenuItem;
    ConsultaTitulares: TMenuItem;
    ConsultaDependentes: TMenuItem;
    N6: TMenuItem;
    ConsultaCartoes: TMenuItem;
    N7: TMenuItem;
    ConsultaLojas: TMenuItem;
    ConsultaProdutosPromocao: TMenuItem;
    ReativarCartao: TMenuItem;
    ResultadodeSorteio: TMenuItem;
    N10: TMenuItem;
    GeracaoCupomSorteio: TMenuItem;
    N11: TMenuItem;
    Usuarios: TMenuItem;
    SairdoSistema2: TMenuItem;
    AtualizaSaldos: TMenuItem;
    Pontuacao: TMenuItem;
    CreditoPontuacao: TMenuItem;
    TransferenciaPontuacao: TMenuItem;
    Configuracoes: TMenuItem;
    Parametros: TMenuItem;
    N5: TMenuItem;
    ControledeAcesso: TMenuItem;
    EvStatusBar: TEvStatusBar;
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure DependentesClick(Sender: TObject);
    procedure LojasShoppingClick(Sender: TObject);
    procedure Eventos1Click(Sender: TObject);
    procedure VincularCartaoClienteClick(Sender: TObject);
    procedure VincularCartaoDependenteClick(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
    procedure ProdutosPromocaoClick(Sender: TObject);
    procedure DigitaisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SorteiosClick(Sender: TObject);
    procedure PremiosSorteioClick(Sender: TObject);
    procedure ConsultaTitularesClick(Sender: TObject);
    procedure ConsultaDependentesClick(Sender: TObject);
    procedure ConsultaCartoesClick(Sender: TObject);
    procedure ConsultaLojasClick(Sender: TObject);
    procedure ConsultaProdutosPromocaoClick(Sender: TObject);
    procedure ReativarCartaoClick(Sender: TObject);
    procedure ResultadodeSorteioClick(Sender: TObject);
    procedure GeracaoCupomSorteioClick(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
    procedure SairdoSistema2Click(Sender: TObject);
    procedure AtualizaSaldosClick(Sender: TObject);
    procedure PontuacaoClick(Sender: TObject);
    procedure CreditoPontuacaoClick(Sender: TObject);
    procedure ParametrosClick(Sender: TObject);
    procedure ControledeAcessoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TransferenciaPontuacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaPermissao();
    procedure LoadStatusBar();
  public
    { Public declarations }
    gIdUsuarioSistema : integer;
    gUsuarioSistema   : String;
    gPerfilUsuario    : String;
    gIdShopping       : integer;
    gIdTerminal       : integer;
    gPathImagem       : String;
    gPathBase         : String;

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDmGlobal, uCadDependente, uCadLojasShopping,
  uCadEventos, uVincularCartaoCliente, uVincularCartaoDependente,
  uCadClientes, uCadProdutoPromocao, uCadDigitais, uCadSorteio,
  uCadPremioSorteio, uConsTitularesCartao, uConsDependenteCartao,
  uConsCartao, uConsLojaShopping, uConsProdutoPromocao, uReativarCartao,
  uCadResultadoSorteio, uCadCupomSorteio, uCadConfig, uAtualizaSaldos,
  uCadCreditoPontos, uConfirmaDigital, uCadUsuarios, uCadAcessos,
  uDmConsulta, uCadTransferenciaPontos;

{$R *.dfm}

procedure TfrmPrincipal.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
   i: SmallInt;
begin
   if (Msg.message = WM_MOUSEWHEEL) then begin
      Msg.message := WM_KEYDOWN;
      Msg.lParam := 0;
      i := HiWord(Msg.wParam) ;
      if i > 0 then
         Msg.wParam := VK_UP
      else
         Msg.wParam := VK_DOWN;
      Handled := False;
   end;
end;
procedure TfrmPrincipal.DependentesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadDependente,frmCadDependente);
      frmCadDependente.ShowModal;
   finally
      frmCadDependente.free;
      frmCadDependente := nil;
   end;
end;

procedure TfrmPrincipal.LojasShoppingClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadLojasShopping,frmCadLojasShopping);
      frmCadLojasShopping.ShowModal;
   finally
      frmCadLojasShopping.free;
      frmCadLojasShopping := nil;
   end;
end;

procedure TfrmPrincipal.Eventos1Click(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadEventos,frmCadEventos);
      frmCadEventos.ShowModal;
   finally
      frmCadEventos.free;
      frmCadEventos := nil;
   end;
end;

procedure TfrmPrincipal.VincularCartaoClienteClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmVincularCartaoCliente,frmVincularCartaoCliente);
      frmVincularCartaoCliente.ShowModal;
   finally
      frmVincularCartaoCliente.free;
      frmVincularCartaoCliente := nil;
   end;
end;

procedure TfrmPrincipal.VincularCartaoDependenteClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmVincularCartaoDependente,frmVincularCartaoDependente);
      frmVincularCartaoDependente.ShowModal;
   finally
      frmVincularCartaoDependente.free;
      frmVincularCartaoDependente := nil;
   end;
end;

procedure TfrmPrincipal.ClientesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadClientes,frmCadClientes);
      frmCadClientes.ShowModal;
   finally
      frmCadClientes.free;
      frmCadClientes := nil;
   end;
end;

procedure TfrmPrincipal.ProdutosPromocaoClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadProdutoPromocao,frmCadProdutoPromocao);
      frmCadProdutoPromocao.ShowModal;
   finally
      frmCadProdutoPromocao.free;
      frmCadProdutoPromocao := nil;
   end;
end;

procedure TfrmPrincipal.DigitaisClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadDigitais,frmCadDigitais);
      frmCadDigitais.ShowModal;
   finally
      frmCadDigitais.free;
      frmCadDigitais := nil;
   end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  CarregaPermissao();

  dmGlobal.CarregaConfig();

  LoadStatusBar();

end;


procedure TfrmPrincipal.CarregaPermissao();
var i, j, k: integer;
begin

  {****PERMISSÕES****}
   with dmConsulta.cdsConsPerfilMenu do begin
     close;
     params[0].value := 1;  // 1=ADM, 2=GER, 3=QUIOSQUE
     open;
   end; 

   for i := 0 to self.ComponentCount -1 do begin
     if Self.Components[i] is TMainMenu then begin
       for j := 0 to TMainMenu(Self.Components[i]).Items.Count - 1 do begin
         if (dmConsulta.cdsConsPerfilMenu.Locate('menu', TMainMenu(Self.Components[i]).Items[j].Name, [])) then
           TMainMenu(Self.Components[i]).Items[j].VISIBLE:= dmGlobal.iif(dmConsulta.cdsConsPerfilMenuACESSAR.Asstring = 'S',true,false);

         for k := 0 to TMainMenu(Self.Components[i]).Items[j].Count -1 do
           if (dmConsulta.cdsConsPerfilMenu.Locate('menu', TMainMenu(Self.Components[i]).Items[j].Items[k].name, [])) then
             TMainMenu(Self.Components[i]).Items[j].Items[k].VISIBLE:= dmGlobal.iif(dmConsulta.cdsConsPerfilMenuACESSAR.Asstring = 'S',true,false);
         end;
       end;
   end;

   dmConsulta.cdsConsPerfilMenu.Close;

end;

procedure TfrmPrincipal.SorteiosClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadSorteio,frmCadSorteio);
      frmCadSorteio.ShowModal;
   finally
      frmCadSorteio.free;
      frmCadSorteio := nil;
   end;
end;

procedure TfrmPrincipal.PremiosSorteioClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadPremioSorteio,frmCadPremioSorteio);
      frmCadPremioSorteio.ShowModal;
   finally
      frmCadPremioSorteio.free;
      frmCadPremioSorteio := nil;
   end;
end;

procedure TfrmPrincipal.ConsultaTitularesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmConsTitularesCartao,frmConsTitularesCartao);
      frmConsTitularesCartao.ShowModal;
   finally
      frmConsTitularesCartao.free;
      frmConsTitularesCartao := nil;
   end;
end;

procedure TfrmPrincipal.ConsultaDependentesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmConsDependenteCartao,frmConsDependenteCartao);
      frmConsDependenteCartao.ShowModal;
   finally
      frmConsDependenteCartao.free;
      frmConsDependenteCartao := nil;
   end;
end;

procedure TfrmPrincipal.ConsultaCartoesClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmConsCartao,frmConsCartao);
      frmConsCartao.ShowModal;
   finally
      frmConsCartao.free;
      frmConsCartao := nil;
   end;
end;

procedure TfrmPrincipal.ConsultaLojasClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmConsLojaShopping,frmConsLojaShopping);
      frmConsLojaShopping.ShowModal;
   finally
      frmConsLojaShopping.free;
      frmConsLojaShopping := nil;
   end;
end;

procedure TfrmPrincipal.ConsultaProdutosPromocaoClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmConsProdutoPromocao,frmConsProdutoPromocao);
      frmConsProdutoPromocao.ShowModal;
   finally
      frmConsProdutoPromocao.free;
      frmConsProdutoPromocao := nil;
   end;
end;

procedure TfrmPrincipal.ReativarCartaoClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmReativarCartao,frmReativarCartao);
      frmReativarCartao.ShowModal;
   finally
      frmReativarCartao.free;
      frmReativarCartao := nil;
   end;
end;

procedure TfrmPrincipal.ResultadodeSorteioClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadResultadoSorteio,frmCadResultadoSorteio);
      frmCadResultadoSorteio.ShowModal;
   finally
      frmCadResultadoSorteio.free;
      frmCadResultadoSorteio := nil;
   end;
end;

procedure TfrmPrincipal.GeracaoCupomSorteioClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadCupomSorteio,frmCadCupomSorteio);
      frmCadCupomSorteio.ShowModal;
   finally
      frmCadCupomSorteio.free;
      frmCadCupomSorteio := nil;
   end;
end;

procedure TfrmPrincipal.UsuariosClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadUsuarios,frmCadUsuarios);
      frmCadUsuarios.ShowModal;
   finally
      frmCadUsuarios.free;
      frmCadUsuarios := nil;
   end;
end;

procedure TfrmPrincipal.SairdoSistema2Click(Sender: TObject);
begin
  frmPrincipal.Close;
end;

procedure TfrmPrincipal.AtualizaSaldosClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmAtualizaSaldos,frmAtualizaSaldos);
      frmAtualizaSaldos.ShowModal;
   finally
      frmAtualizaSaldos.free;
      frmAtualizaSaldos := nil;
   end;
end;

procedure TfrmPrincipal.PontuacaoClick(Sender: TObject);
begin
   try
     // Application.CreateForm(TfrmMovimentacao,frmMovimentacao);
     // frmMovimentacao.ShowModal;
   finally
      //frmMovimentacao.free;
      //frmMovimentacao := nil;
   end;
end;

procedure TfrmPrincipal.CreditoPontuacaoClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadCreditoPontos,frmCadCreditoPontos);
      frmCadCreditoPontos.ShowModal;
   finally
      frmCadCreditoPontos.free;
      frmCadCreditoPontos := nil;
   end;
end;



procedure TfrmPrincipal.ParametrosClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadConfig,frmCadConfig);
      frmCadConfig.ShowModal;
   finally
      frmCadConfig.free;
      frmCadConfig := nil;
   end;
end;

procedure TfrmPrincipal.ControledeAcessoClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfrmCadAcessos,frmCadAcessos);
      frmCadAcessos.ShowModal;
   finally
      frmCadAcessos.free;
      frmCadAcessos := nil;
   end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TfrmPrincipal.LoadStatusBar;
begin
  EvStatusBar.Panels[0].Text := 'Usuário: ' + gUsuarioSistema;
  EvStatusBar.Panels[1].Text := 'Perfil: ' + gPerfilUsuario;
  EvStatusBar.Panels[2].Text := 'Terminal: ' + InttoStr(gIdTerminal);
  EvStatusBar.Panels[3].Text := 'Data: ' + DatetoStr(date);
end;

procedure TfrmPrincipal.TransferenciaPontuacaoClick(Sender: TObject);
begin

   try
      Application.CreateForm(TfrmCadTransferenciaPontos,frmCadTransferenciaPontos);
      frmCadTransferenciaPontos.ShowModal;
   finally
      frmCadTransferenciaPontos.free;
      frmCadTransferenciaPontos := nil;
   end;

end;

end.
