unit uDmGlobal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Dialogs, Forms, IniFiles;

type
  TdmGlobal = class(TDataModule)
    
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTelaConfig();
    procedure CarregaConfig();
  end;

var
  dmGlobal: TdmGlobal;

implementation

uses uCadConfig, uPrincipal, uDmCliente;

{$R *.dfm}



end.
