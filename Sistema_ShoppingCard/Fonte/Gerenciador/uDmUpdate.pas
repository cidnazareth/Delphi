unit uDmUpdate;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmUpdate = class(TDataModule)
    sqlReativaCartao: TSQLDataSet;
    sqlLojasShoppingUpd: TSQLDataSet;
    sqlProdutoPromocaoUpd: TSQLDataSet;
    sqlSorteioUpd: TSQLDataSet;
    sqlPremioSorteioUpd: TSQLDataSet;
    sqlResultadoSorteioUpd: TSQLDataSet;
    sqlDebitaCartao: TSQLDataSet;
    sqlClienteUpd: TSQLDataSet;
    sqlClienteDigitalUpd: TSQLDataSet;
    sqlUsuarioUpd: TSQLDataSet;
    sqlSenhaUpd: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUpdate: TdmUpdate;

implementation

{$R *.dfm}

end.
