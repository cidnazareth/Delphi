unit uDmCliente;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, Provider, IniFiles,
  Dialogs, Forms;

type
  TdmCliente = class(TDataModule)
    sqlProdutosPromocao: TSQLDataSet;
    dspProdutosPromocao: TDataSetProvider;
    cdsProdutosPromocao: TClientDataSet;
    sqlImgStandBy: TSQLDataSet;
    dspImgStandBy: TDataSetProvider;
    cdsImgStandBy: TClientDataSet;
    cdsImgStandByID: TIntegerField;
    cdsImgStandByDESC_IMAGEM: TStringField;
    cdsImgStandByPATH_IMAGEM: TStringField;
    cdsImgStandByDT_INICIO: TDateField;
    cdsImgStandByDT_FIM: TDateField;
    cdsImgStandByATIVA: TStringField;
    cdsImgStandByTEMPO_EXIBICAO: TIntegerField;
    cdsImgStandByDT_CADASTRO: TDateField;
    cdsImgStandByUSUARIO_SISTEMA: TIntegerField;
    cdsLojas: TClientDataSet;
    dspLojas: TDataSetProvider;
    sqlLojas: TSQLDataSet;
    cdsLojasID: TIntegerField;
    cdsLojasID_SHOPPING: TIntegerField;
    cdsLojasCNPJ: TStringField;
    cdsLojasRAZAO_SOCIAL: TStringField;
    cdsLojasNOME_FANTASIA: TStringField;
    cdsLojasCONTATO: TStringField;
    cdsLojasTELEFONE_01: TStringField;
    cdsLojasTELEFONE_02: TStringField;
    cdsLojasRAMAL: TStringField;
    cdsLojasCELULAR: TStringField;
    cdsLojasEMAIL: TStringField;
    cdsLojasNUMERO_LOJA: TStringField;
    cdsLojasATIVA: TStringField;
    cdsLojasDT_CADASTRO: TDateField;
    cdsLojasUSUARIO_SISTEMA: TIntegerField;
    sqlConsultaExtrato: TSQLDataSet;
    dspConsultaExtrato: TDataSetProvider;
    cdsConsultaExtrato: TClientDataSet;
    cdsConsultaExtratoDT_MOVIMENTO: TDateField;
    cdsConsultaExtratoDESCRICAO: TStringField;
    cdsConsultaExtratoPONTOS: TFloatField;
    cdsConsultaExtratoOPERACAO: TStringField;
    cdsConsultaExtratoSALDO: TFloatField;
    sqlConsultaDigital: TSQLDataSet;
    dspConsultaDigital: TDataSetProvider;
    cdsConsultaDigital: TClientDataSet;
    cdsConsultaDigitalCPF: TStringField;
    cdsConsultaDigitalDIGITAL: TMemoField;
    sqlLocalizaCartao: TSQLDataSet;
    dspLocalizaCartao: TDataSetProvider;
    cdsLocalizaCartao: TClientDataSet;
    cdsLocalizaCartaoID: TIntegerField;
    cdsLocalizaCartaoCPF: TStringField;
    cdsLocalizaCartaoCARTAO: TFMTBCDField;
    cdsLocalizaCartaoQTDE_PONTOS: TFMTBCDField;
    cdsLocalizaCartaoTIPO: TStringField;
    cdsLocalizaCartaoATIVO: TStringField;
    cdsLocalizaCartaoNOME: TStringField;
    cdsLocalizaCartaoDT_NASCIMENTO: TDateField;
    cdsLocalizaCartaoIDENTIDADE: TStringField;
    cdsLocalizaCartaoOE: TStringField;
    cdsLocalizaCartaoNOME_MAE: TStringField;
    cdsLocalizaCartaoNOME_PAI: TStringField;
    cdsLocalizaCartaoCEP: TStringField;
    cdsLocalizaCartaoLOGRADOURO: TStringField;
    cdsLocalizaCartaoBAIRRO: TStringField;
    cdsLocalizaCartaoCIDADE: TStringField;
    cdsLocalizaCartaoUF: TStringField;
    cdsLocalizaCartaoTEL_CELULAR_01: TStringField;
    cdsLocalizaCartaoTEL_CELULAR_02: TStringField;
    cdsLocalizaCartaoTEL_RESIDENCIA: TStringField;
    cdsLocalizaCartaoTEL_TERCEIRO: TStringField;
    cdsLocalizaCartaoRAMAL_TERCEIRO: TStringField;
    cdsLocalizaCartaoPARENTESCO_TERCEIRO: TStringField;
    cdsLocalizaCartaoEMAIL: TStringField;
    sqlLocalizaCpf: TSQLDataSet;
    dspLocalizaCpf: TDataSetProvider;
    cdsLocalizaCpf: TClientDataSet;
    cdsLocalizaCpfCPF: TStringField;
    cdsLocalizaCpfCPF_TITULAR: TStringField;
    cdsLocalizaCpfNOME: TStringField;
    cdsLocalizaCpfDT_NASCIMENTO: TDateField;
    cdsLocalizaCpfIDENTIDADE: TStringField;
    cdsLocalizaCpfOE: TStringField;
    cdsLocalizaCpfNOME_MAE: TStringField;
    cdsLocalizaCpfNOME_PAI: TStringField;
    cdsLocalizaCpfCEP: TStringField;
    cdsLocalizaCpfLOGRADOURO: TStringField;
    cdsLocalizaCpfBAIRRO: TStringField;
    cdsLocalizaCpfCIDADE: TStringField;
    cdsLocalizaCpfUF: TStringField;
    cdsLocalizaCpfTEL_CELULAR_01: TStringField;
    cdsLocalizaCpfTEL_CELULAR_02: TStringField;
    cdsLocalizaCpfTEL_RESIDENCIA: TStringField;
    cdsLocalizaCpfTEL_TERCEIRO: TStringField;
    cdsLocalizaCpfRAMAL_TERCEIRO: TStringField;
    cdsLocalizaCpfPARENTESCO_TERCEIRO: TStringField;
    cdsLocalizaCpfEMAIL: TStringField;
    cdsLocalizaCpfDT_CADASTRO: TDateField;
    cdsLocalizaCpfATIVO: TStringField;
    cdsLocalizaCpfUSUARIO_SISTEMA: TIntegerField;
    cdsLocalizaCpfTIPO: TStringField;
    cdsLocalizaCpfDIGITAL: TMemoField;
    sqlConsTipoMovimento: TSQLDataSet;
    dspConsTipoMovimento: TDataSetProvider;
    cdsConsTipoMovimento: TClientDataSet;
    cdsConsTipoMovimentoID: TIntegerField;
    cdsConsTipoMovimentoDESCRICAO: TStringField;
    cdsConsTipoMovimentoOPERACAO: TStringField;
    cdsConsTipoMovimentoFATOR_CUSTO: TFMTBCDField;
    sqlPremioSorteio: TSQLDataSet;
    dspPremioSorteio: TDataSetProvider;
    cdsPremioSorteio: TClientDataSet;
    cdsPremioSorteioID: TIntegerField;
    cdsPremioSorteioID_SORTEIO: TIntegerField;
    cdsPremioSorteioORDEM_PREMIO: TIntegerField;
    cdsPremioSorteioDESC_PREMIO: TStringField;
    cdsPremioSorteioVALOR_FISCAL_PREMIO: TFloatField;
    cdsPremioSorteioQTDE_PONTOS_CUPOM: TFloatField;
    cdsPremioSorteioPATH_IMAGEM: TStringField;
    cdsPremioSorteioOBS_PREMIO: TMemoField;
    cdsPremioSorteioDT_INICIO: TDateField;
    cdsPremioSorteioDT_FIM: TDateField;
    cdsPremioSorteioDT_SORTEIO: TDateField;
    cdsPremioSorteioDESC_SORTEIO: TStringField;
    sqlConsultaParametros: TSQLDataSet;
    dspConsultaParametros: TDataSetProvider;
    cdsConsultaParametros: TClientDataSet;
    sqlLocalizaCupomSorteio: TSQLDataSet;
    dspLocalizaCupomSorteio: TDataSetProvider;
    cdsLocalizaCupomSorteio: TClientDataSet;
    cdsLocalizaCupomSorteioN_CUPOM: TIntegerField;
    cdsLocalizaCupomSorteioN_CARTAO: TFMTBCDField;
    cdsLocalizaCupomSorteioDT_EMISSAO: TDateField;
    cdsLocalizaCupomSorteioN_TERMINAL: TIntegerField;
    cdsLocalizaCupomSorteioDESC_SORTEIO: TStringField;
    cdsLocalizaCupomSorteioDESC_PREMIO: TStringField;
    cdsLocalizaCupomSorteioORDEM_PREMIO: TIntegerField;
    cdsConsultaParametrosVALOR: TStringField;
    cdsProdutosPromocaoID: TIntegerField;
    cdsProdutosPromocaoID_LOJA: TIntegerField;
    cdsProdutosPromocaoDESC_PRODUTO: TStringField;
    cdsProdutosPromocaoQTDE_PONTOS: TFloatField;
    cdsProdutosPromocaoQTDE_PRODUTO: TIntegerField;
    cdsProdutosPromocaoATIVADO_PERIODO: TStringField;
    cdsProdutosPromocaoDATA_INICIO: TDateField;
    cdsProdutosPromocaoDATA_FIM: TDateField;
    cdsProdutosPromocaoPATH_IMAGEM: TStringField;
    cdsProdutosPromocaoATIVO: TStringField;
    cdsProdutosPromocaoDT_CADASTRO: TDateField;
    cdsProdutosPromocaoQTDE_CUPOM_EMITIDO: TIntegerField;
    cdsProdutosPromocaoDESTAQUE: TStringField;
    cdsProdutosPromocaoDISPONIVEL: TFMTBCDField;
    cdsProdutosPromocaoCNPJ: TStringField;
    cdsProdutosPromocaoNOME_FANTASIA: TStringField;
    cdsProdutosPromocaoNUMERO_LOJA: TStringField;
    SQLConnecShoppCard: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
    Function transform(valor:real):string;
    procedure CarregaTelaConfig();
    procedure CarregaConfig();
    function Encrypt(const S: String): String;
    function Decrypt(const S: ShortString): String;
  end;

var
  dmCliente: TdmCliente;

implementation

uses uPrincipal, uCadConfig;

{$R *.dfm}


function TdmCliente.IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
     Result := ParteTRUE
  else
     Result := ParteFALSE;
end;

Function TdmCliente.transform(valor:real):string;
var
   txt:string;
begin
   txt:='          '+formatfloat('##,###,##0.00',valor);
   transform:=copy(txt,length(txt)-13,14);
end;




function TdmCliente.Encrypt(const S: String): String;
var
   I: byte;
   Key: Word;
const
  { Constantes que irão ser utilizadas nos cálculos das rotinas de criptografia e podendo ser alteradas.}
  C1 = 52829;
  C2 = 29719;
begin
   Key := 6598;
   Result := '';
   for I := 1 to Length(S) do
   begin
      Result := Result + IntToHex(byte(char(byte(S[I]) xor (Key shr 8))), 2);
      Key := (byte(char(byte(S[I]) xor (Key shr 8))) + Key) * C1 + C2;
   end;
end;


function TdmCliente.Decrypt(const S: ShortString): String;
var
  I: byte;
  x: char;
  Key: Word;
const
  { Constantes que irão ser utilizadas nos cálculos das rotinas de criptografia e podendo ser alteradas.}
  C1 = 52829;
  C2 = 29719;

begin
  Key := 6598;
  result := '';
  i := 1;
  while (i < Length(S)) do
  begin
    x := char(strToInt('$' + Copy(s, i, 2)));
    Result := result + char(byte(x) xor (Key shr 8));
    Key := (byte(x) + Key) * C1 + C2;
    Inc(i, 2);
  end;
end;


procedure TdmCliente.CarregaTelaConfig();
begin
   try
      Application.CreateForm(TfrmCadConfig,frmCadConfig);
      frmCadConfig.ShowModal;
   finally
      frmCadConfig.free;
      frmCadConfig := nil;
   end;
end;


procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin

  try
      if not FileExists('Config.ini') then
        CarregaTelaConfig();
  finally

        CarregaConfig();

        SQLConnecShoppCard.Params.Values['DataBase'] := frmPrincipal.gPathBase;
        SQLConnecShoppCard.Connected := True;
  end;
end;


procedure TdmCliente.CarregaConfig();
var
   Arquivo : TIniFile;
begin
   Arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Config.ini');
   frmPrincipal.gIdTerminal := StrtoInt('0' + Decrypt(Arquivo.ReadString('DADOS','LINHA01','')));
   frmPrincipal.gIdShopping := StrtoInt('0' + Decrypt(Arquivo.ReadString('DADOS','LINHA02','')));
   frmPrincipal.gPathBase   := Decrypt(Arquivo.ReadString('DADOS','LINHA03',''));
   frmPrincipal.gPathImagem := Decrypt(Arquivo.ReadString('DADOS','LINHA04',''));
   Arquivo.Free;
end;


end.
