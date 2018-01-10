unit uDmConsulta;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Dialogs;

type
  TdmConsulta = class(TDataModule)
    sqlConsShopping: TSQLDataSet;
    dspConsShopping: TDataSetProvider;
    cdsConsShopping: TClientDataSet;
    cdsConsShoppingID: TIntegerField;
    cdsConsShoppingNOME_FANTASIA: TStringField;
    sqlConsProdutosPromocao: TSQLDataSet;
    dspConsProdutosPromocao: TDataSetProvider;
    cdsConsProdutosPromocao: TClientDataSet;
    sqlConsultaPremio: TSQLDataSet;
    dspConsultaPremio: TDataSetProvider;
    cdsConsultaPremio: TClientDataSet;
    sqlConsultaResultadoSorteio: TSQLDataSet;
    dspConsultaResultadoSorteio: TDataSetProvider;
    cdsConsultaResultadoSorteio: TClientDataSet;
    cdsConsultaResultadoSorteioID_SORTEIO: TIntegerField;
    cdsConsultaResultadoSorteioN_SORTEIO: TIntegerField;
    cdsConsultaResultadoSorteioCDSDesigner01_PREMIO: TIntegerField;
    cdsConsultaResultadoSorteioCDSDesigner02_PREMIO: TIntegerField;
    cdsConsultaResultadoSorteioCDSDesigner03_PREMIO: TIntegerField;
    cdsConsultaResultadoSorteioCDSDesigner04_PREMIO: TIntegerField;
    cdsConsultaResultadoSorteioCDSDesigner05_PREMIO: TIntegerField;
    sqlConsultaParametros: TSQLDataSet;
    dspConsultaParametros: TDataSetProvider;
    cdsConsultaParametros: TClientDataSet;
    cdsConsultaParametrosVALOR: TStringField;
    sqlConsLojasShopping: TSQLDataSet;
    dspConsLojasShopping: TDataSetProvider;
    cdsConsLojasShopping: TClientDataSet;
    sqlConsultaExtrato: TSQLDataSet;
    dspConsultaExtrato: TDataSetProvider;
    cdsConsultaExtrato: TClientDataSet;
    sqlConsultaDigital: TSQLDataSet;
    dspConsultaDigital: TDataSetProvider;
    cdsConsultaDigital: TClientDataSet;
    cdsConsultaDigitalCPF: TStringField;
    cdsConsultaDigitalDIGITAL: TMemoField;
    sqlConsultaUsuario: TSQLDataSet;
    dspConsultaUsuario: TDataSetProvider;
    cdsConsultaUsuario: TClientDataSet;
    sqlConsPerfilMenu: TSQLDataSet;
    dspConsPerfilMenu: TDataSetProvider;
    cdsConsPerfilMenu: TClientDataSet;
    sqlConsultaPerfil: TSQLDataSet;
    dspConsultaPerfil: TDataSetProvider;
    cdsConsultaPerfil: TClientDataSet;
    cdsConsultaPerfilID: TIntegerField;
    cdsConsultaPerfilPERFIL: TStringField;
    cdsConsPerfilMenuACESSAR: TStringField;
    cdsConsPerfilMenuID: TIntegerField;
    cdsConsPerfilMenuID_PERFIL: TIntegerField;
    cdsConsPerfilMenuID_MENU: TIntegerField;
    cdsConsPerfilMenuMENU: TStringField;
    cdsConsPerfilMenuPOSICAO: TStringField;
    cdsConsPerfilMenuDESCRICAO: TStringField;
    cdsConsPerfilMenuINCLUIR: TStringField;
    cdsConsPerfilMenuALTERAR: TStringField;
    cdsConsPerfilMenuEXCLUIR: TStringField;
    cdsConsPerfilMenuCONSULTAR: TStringField;
    cdsConsPerfilMenuTEM_INCLUSAO: TStringField;
    cdsConsPerfilMenuTEM_ALTERACAO: TStringField;
    cdsConsPerfilMenuTEM_EXCLUSAO: TStringField;
    cdsConsPerfilMenuTEM_CONSULTA: TStringField;
    sqlConsTipoMovimento: TSQLDataSet;
    dspConsTipoMovimento: TDataSetProvider;
    cdsConsTipoMovimento: TClientDataSet;
    cdsConsultaUsuarioID: TIntegerField;
    cdsConsultaUsuarioCPF: TStringField;
    cdsConsultaUsuarioNOME: TStringField;
    cdsConsultaUsuarioDT_NASCIMENTO: TDateField;
    cdsConsultaUsuarioIDENTIDADE: TStringField;
    cdsConsultaUsuarioOE: TStringField;
    cdsConsultaUsuarioNOME_MAE: TStringField;
    cdsConsultaUsuarioNOME_PAI: TStringField;
    cdsConsultaUsuarioCEP: TStringField;
    cdsConsultaUsuarioLOGRADOURO: TStringField;
    cdsConsultaUsuarioBAIRRO: TStringField;
    cdsConsultaUsuarioCIDADE: TStringField;
    cdsConsultaUsuarioUF: TStringField;
    cdsConsultaUsuarioTEL_CELULAR_01: TStringField;
    cdsConsultaUsuarioTEL_CELULAR_02: TStringField;
    cdsConsultaUsuarioTEL_RESIDENCIA: TStringField;
    cdsConsultaUsuarioEMAIL: TStringField;
    cdsConsultaUsuarioDT_CADASTRO: TDateField;
    cdsConsultaUsuarioATIVO: TStringField;
    cdsConsultaUsuarioUSUARIO_SISTEMA: TIntegerField;
    cdsConsultaUsuarioSENHA: TStringField;
    cdsConsultaUsuarioID_PERFIL: TIntegerField;
    cdsConsultaUsuarioPERFIL: TStringField;
    cdsConsProdutosPromocaoID: TIntegerField;
    cdsConsProdutosPromocaoID_LOJA: TIntegerField;
    cdsConsProdutosPromocaoDESC_PRODUTO: TStringField;
    cdsConsProdutosPromocaoQTDE_PONTOS: TFloatField;
    cdsConsProdutosPromocaoQTDE_PRODUTO: TIntegerField;
    cdsConsProdutosPromocaoATIVADO_PERIODO: TStringField;
    cdsConsProdutosPromocaoDATA_INICIO: TDateField;
    cdsConsProdutosPromocaoDATA_FIM: TDateField;
    cdsConsProdutosPromocaoPATH_IMAGEM: TStringField;
    cdsConsProdutosPromocaoATIVO: TStringField;
    cdsConsProdutosPromocaoDT_CADASTRO: TDateField;
    cdsConsLojasShoppingID: TIntegerField;
    cdsConsLojasShoppingID_SHOPPING: TIntegerField;
    cdsConsLojasShoppingCNPJ: TStringField;
    cdsConsLojasShoppingRAZAO_SOCIAL: TStringField;
    cdsConsLojasShoppingNOME_FANTASIA: TStringField;
    cdsConsLojasShoppingCONTATO: TStringField;
    cdsConsLojasShoppingTELEFONE_01: TStringField;
    cdsConsLojasShoppingTELEFONE_02: TStringField;
    cdsConsLojasShoppingRAMAL: TStringField;
    cdsConsLojasShoppingCELULAR: TStringField;
    cdsConsLojasShoppingEMAIL: TStringField;
    cdsConsLojasShoppingNUMERO_LOJA: TStringField;
    cdsConsLojasShoppingATIVA: TStringField;
    cdsConsLojasShoppingDT_CADASTRO: TDateField;
    cdsConsLojasShoppingUSUARIO_SISTEMA: TIntegerField;
    cdsConsultaPremioID: TIntegerField;
    cdsConsultaPremioID_SORTEIO: TIntegerField;
    cdsConsultaPremioORDEM_PREMIO: TIntegerField;
    cdsConsultaPremioDESC_PREMIO: TStringField;
    cdsConsultaPremioVALOR_FISCAL_PREMIO: TFloatField;
    cdsConsultaPremioQTDE_PONTOS_CUPOM: TFloatField;
    cdsConsultaPremioPATH_IMAGEM: TStringField;
    cdsConsultaPremioOBS_PREMIO: TMemoField;
    cdsConsultaPremioDT_CADASTRO: TDateField;
    cdsConsultaPremioUSUARIO_SISTEMA: TIntegerField;
    cdsConsTipoMovimentoID: TIntegerField;
    cdsConsTipoMovimentoDESCRICAO: TStringField;
    cdsConsTipoMovimentoOPERACAO: TStringField;
    cdsConsTipoMovimentoFATOR_CUSTO: TFMTBCDField;
    cdsConsultaExtratoDT_MOVIMENTO: TDateField;
    cdsConsultaExtratoDESCRICAO: TStringField;
    cdsConsultaExtratoPONTOS: TFloatField;
    cdsConsultaExtratoOPERACAO: TStringField;
    cdsConsultaExtratoSALDO: TFloatField;
    cdsConsProdutosPromocaoQTDE_CUPOM_EMITIDO: TIntegerField;
    cdsConsProdutosPromocaoDESTAQUE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmConsulta: TdmConsulta;

implementation

uses uDmGlobal;

{$R *.dfm}

{ TdmConsulta }


end.
