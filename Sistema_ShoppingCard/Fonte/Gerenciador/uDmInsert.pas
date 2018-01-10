unit uDmInsert;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmInsert = class(TDataModule)
    sqlCartaoDependenteIns: TSQLDataSet;
    sqlLojasShoppingIns: TSQLDataSet;
    sqlSorteioIns: TSQLDataSet;
    sqlPremioSorteioIns: TSQLDataSet;
    sqlIncShopping: TSQLDataSet;
    sqlResultadoSorteioIns: TSQLDataSet;
    sqlClienteIns: TSQLDataSet;
    sqlCartaoIns: TSQLDataSet;
    sqlProdutoPromocaoIns: TSQLDataSet;
    sqlAtualizaSaldo: TSQLDataSet;
    sqlGeraExtrato: TSQLDataSet;
    sqlMovimentoIns: TSQLDataSet;
    sqlCupomSorteioIns: TSQLDataSet;
    sqlUsuarioIns: TSQLDataSet;
    sqlPerfilmenuIns: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmInsert: TdmInsert;

implementation

uses uDmGlobal;

{$R *.dfm}

end.
