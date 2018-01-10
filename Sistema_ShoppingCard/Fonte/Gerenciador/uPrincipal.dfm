object frmPrincipal: TfrmPrincipal
  Left = 303
  Top = 5
  BorderStyle = bsSingle
  Caption = 'Gerenciador ShoppCard '
  ClientHeight = 666
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EvStatusBar: TEvStatusBar
    Left = 0
    Top = 641
    Width = 1008
    Height = 25
    Panels = <
      item
        Width = 400
      end
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 200
      end>
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 320
    Top = 16
  end
  object EvFocusColor1: TEvFocusColor
    ChangeFont = False
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 271
    Top = 50
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 16
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object Clientes: TMenuItem
        Caption = 'Clientes'
        OnClick = ClientesClick
      end
      object Dependentes: TMenuItem
        Caption = 'Dependentes'
        OnClick = DependentesClick
      end
      object Digitais: TMenuItem
        Caption = 'Digitais'
        OnClick = DigitaisClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ReativarCartao: TMenuItem
        Caption = 'Reativar Cart'#245'es'
        OnClick = ReativarCartaoClick
      end
      object VincularCartao: TMenuItem
        Caption = 'Vincular Cart'#245'es'
        object VincularCartaoCliente: TMenuItem
          Caption = 'Clientes'
          OnClick = VincularCartaoClienteClick
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object VincularCartaoDependente: TMenuItem
          Caption = 'Dependentes'
          OnClick = VincularCartaoDependenteClick
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object LojasShopping: TMenuItem
        Caption = 'Lojas Shopping'
        OnClick = LojasShoppingClick
      end
      object ProdutosPromocao: TMenuItem
        Caption = 'Produtos Promo'#231#227'o'
        OnClick = ProdutosPromocaoClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Sorteios: TMenuItem
        Caption = 'Sorteios'
        OnClick = SorteiosClick
      end
      object PremiosSorteio: TMenuItem
        Caption = 'Pr'#234'mios dos Sorteios'
        OnClick = PremiosSorteioClick
      end
      object ResultadodeSorteio: TMenuItem
        Caption = 'Resultados dos Sorteios'
        OnClick = ResultadodeSorteioClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object GeracaoCupomSorteio: TMenuItem
        Caption = 'Gera'#231#227'o de Cupons para Sorteios'
        OnClick = GeracaoCupomSorteioClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object Usuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = UsuariosClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object ControledeAcesso: TMenuItem
        Caption = 'Controle de Acesso'
        OnClick = ControledeAcessoClick
      end
    end
    object Consultas: TMenuItem
      Caption = 'Consultas'
      object ConsultaTitulares: TMenuItem
        Caption = 'Titulares'
        OnClick = ConsultaTitularesClick
      end
      object ConsultaDependentes: TMenuItem
        Caption = 'Dependentes'
        OnClick = ConsultaDependentesClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ConsultaCartoes: TMenuItem
        Caption = 'Cart'#245'es'
        OnClick = ConsultaCartoesClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ConsultaLojas: TMenuItem
        Caption = 'Lojas Shopping'
        OnClick = ConsultaLojasClick
      end
      object ConsultaProdutosPromocao: TMenuItem
        Caption = 'Produtos em Promo'#231#227'o'
        OnClick = ConsultaProdutosPromocaoClick
      end
    end
    object Pontuacao: TMenuItem
      Caption = 'Pontua'#231#227'o'
      OnClick = PontuacaoClick
      object CreditoPontuacao: TMenuItem
        Caption = 'Cr'#233'dito de Pontos'
        OnClick = CreditoPontuacaoClick
      end
      object TransferenciaPontuacao: TMenuItem
        Caption = 'Transfer'#234'ncia de Pontos'
        OnClick = TransferenciaPontuacaoClick
      end
    end
    object Processamento: TMenuItem
      Caption = 'Processamento'
      object AtualizaSaldos: TMenuItem
        Caption = 'Atualiza'#231#227'o de Saldos'
        OnClick = AtualizaSaldosClick
      end
    end
    object Configuracoes: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Parametros: TMenuItem
        Caption = 'Par'#226'metros'
        OnClick = ParametrosClick
      end
    end
    object SairdoSistema2: TMenuItem
      Caption = 'Sair do Sistema'
      OnClick = SairdoSistema2Click
    end
  end
end
