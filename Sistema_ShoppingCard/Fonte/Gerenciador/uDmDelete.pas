unit uDmDelete;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr;

type
  TdmDelete = class(TDataModule)
    sqlPerfilMenuDel: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDelete: TdmDelete;

implementation

{$R *.dfm}

end.
