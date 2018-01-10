unit uAtualizaSaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, DBXpress, jpeg, ExtCtrls;

type
  TfrmAtualizaSaldos = class(TForm)
    Label20: TLabel;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsStatus: TDataSource;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    dsSaldo: TDataSource;
    Image1: TImage;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction ;
  end;

var
  frmAtualizaSaldos: TfrmAtualizaSaldos;

implementation

uses uDmGlobal, uDmInsert, uDmLocaliza;

{$R *.dfm}

procedure TfrmAtualizaSaldos.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmGlobal.SQLConnecShopCard.StartTransaction(Trans);
end;

procedure TfrmAtualizaSaldos.CommitTransaction;
begin
  dmGlobal.SQLConnecShopCard.Commit(Trans);
end;

procedure TfrmAtualizaSaldos.RollbackTransaction;
begin
  dmGlobal.SQLConnecShopCard.Rollback(Trans);
  raise Exception.Create('Erro no Rollback');
end;


procedure TfrmAtualizaSaldos.BtnConfirmarClick(Sender: TObject);
begin

    if MessageDlg('Confirma a ATUALIZAÇÃO DOS SALDOS DOS CARTÕES ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
    exit;

try
    // Inicio a transação no banco de dados, garantindo a atomicidade na gravação.
    // Nada fica pela metade em caso de erro (tudo ou nada)
    StartTransaction;

    dmInsert.sqlAtualizaSaldo.Close;
    dmInsert.sqlAtualizaSaldo.ExecSQL;

    CommitTransaction;

    dmlocaliza.cdsLocalizaProcessamento.refresh;
    dmlocaliza.cdsLocalizaSaldo.refresh;

    showmessage('Processamento efetuado com sucesso !');


  except
     RollbackTransaction;
     showmessage('Erro ao processar saldos !');
     exit;
  end;
end;


procedure TfrmAtualizaSaldos.BtnSairClick(Sender: TObject);
begin

   if MessageDlg('Confirma fechamento da ATUALIZAÇÃO DE SALDOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
  frmAtualizaSaldos.Close;
end;

procedure TfrmAtualizaSaldos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaProcessamento.close;
  dmLocaliza.cdsLocalizaSaldo.close;
end;

procedure TfrmAtualizaSaldos.FormShow(Sender: TObject);
begin
  dmlocaliza.cdsLocalizaProcessamento.Open;
  dmLocaliza.cdsLocalizaSaldo.Open;
end;

end.
