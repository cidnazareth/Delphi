unit uDmInsert;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmInsert = class(TDataModule)
    sqlCupomSorteioIns: TSQLDataSet;
    sqlVoucherIns: TSQLDataSet;
    sqlMovimentoIns: TSQLDataSet;
    sqlGeraExtrato: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmInsert: TdmInsert;

implementation

{$R *.dfm}

end.
