unit uCadAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, jpeg, ExtCtrls, ComCtrls,
  CheckLst, Grids, DBGrids, DB, DBXpress;
  // ShellCtrls

type
  TfrmCadAcessos = class(TForm)
    Image1: TImage;
    Label20: TLabel;
    gbCadastro: TGroupBox;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    gbCpfDependente: TGroupBox;
    dbLkCbPerfil: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    dsAcessos: TDataSource;
    dsPerfil: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dbLkCbPerfilClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Trans: TTransactionDesc;
    procedure StartTransaction;
    procedure CommitTransaction;
    procedure RollbackTransaction;
  end;

var
  frmCadAcessos: TfrmCadAcessos;

implementation

uses uDmConsulta, uDmInsert, uDmGlobal, uDmDelete;

{$R *.dfm}


procedure TfrmCadAcessos.StartTransaction;
var IDTransaction:integer;
begin
  Randomize;
  IDTransaction:= random(IDTransaction);
  Trans.IsolationLevel := xilREADCOMMITTED;
  Trans.TransactionID := IDTransaction;
  dmGlobal.SQLConnecShopCard.StartTransaction(Trans);
end;

procedure TfrmCadAcessos.CommitTransaction;
begin
  dmGlobal.SQLConnecShopCard.Commit(Trans);
end;

procedure TfrmCadAcessos.RollbackTransaction;
begin
  dmGlobal.SQLConnecShopCard.Rollback(Trans);
end;


procedure TfrmCadAcessos.FormShow(Sender: TObject);
begin
  dmConsulta.cdsConsultaPerfil.Open;
end;

procedure TfrmCadAcessos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmConsulta.cdsConsPerfilMenu.close;
  dmConsulta.cdsConsultaPerfil.close;
end;

procedure TfrmCadAcessos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin

  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'ACESSAR' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if dmConsulta.cdsConsPerfilMenuACESSAR.AsString = 'S' then
        Check := DFCS_CHECKED;

    R:=Rect;
    InflateRect(R,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;


  if (dmConsulta.cdsConsPerfilMenuTEM_INCLUSAO.Value = 'S') AND (Column.FieldName = 'INCLUIR') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if dmConsulta.cdsConsPerfilMenuINCLUIR.AsString = 'S' then
        Check := DFCS_CHECKED;

    R:=Rect;
    InflateRect(R,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if (dmConsulta.cdsConsPerfilMenuTEM_ALTERACAO.Value = 'S') AND (Column.FieldName = 'ALTERAR') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if dmConsulta.cdsConsPerfilMenuALTERAR.AsString = 'S' then
        Check := DFCS_CHECKED;

    R:=Rect;
    InflateRect(R,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if (dmConsulta.cdsConsPerfilMenuTEM_EXCLUSAO.Value = 'S') AND (Column.FieldName = 'EXCLUIR') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if dmConsulta.cdsConsPerfilMenuEXCLUIR.AsString = 'S' then
        Check := DFCS_CHECKED;

    R:=Rect;
    InflateRect(R,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if (dmConsulta.cdsConsPerfilMenuTEM_CONSULTA.Value = 'S') AND (Column.FieldName = 'CONSULTAR') then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;  
    if dmConsulta.cdsConsPerfilMenuCONSULTAR.AsString = 'S' then
        Check := DFCS_CHECKED;

    R:=Rect;
    InflateRect(R,-2,-2);
    DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end; 
end;

procedure TfrmCadAcessos.DBGrid1CellClick(Column: TColumn);
begin

  dmConsulta.cdsConsPerfilMenu.Edit;

    if column.Index = 1 then begin
      if dmConsulta.cdsConsPerfilMenuACESSAR.AsString = 'S' then
        dmConsulta.cdsConsPerfilMenuACESSAR.AsString := ''
      else
        dmConsulta.cdsConsPerfilMenuACESSAR.AsString := 'S';
    end;

    if (column.Index = 3) AND (dmConsulta.cdsConsPerfilMenuTEM_INCLUSAO.AsString = 'S') then begin
      if dmConsulta.cdsConsPerfilMenuINCLUIR.AsString = 'S' then
        dmConsulta.cdsConsPerfilMenuINCLUIR.AsString := ''
      else
        dmConsulta.cdsConsPerfilMenuINCLUIR.AsString := 'S';
    end;

    if (column.Index = 4) AND (dmConsulta.cdsConsPerfilMenuTEM_ALTERACAO.AsString = 'S') then begin
      if (dmConsulta.cdsConsPerfilMenuALTERAR.AsString = 'S') then
        dmConsulta.cdsConsPerfilMenuALTERAR.AsString := ''
      else
        dmConsulta.cdsConsPerfilMenuALTERAR.AsString := 'S';
    end;

    if (column.Index = 5) AND (dmConsulta.cdsConsPerfilMenuTEM_EXCLUSAO.AsString = 'S') then begin
      if (dmConsulta.cdsConsPerfilMenuEXCLUIR.AsString = 'S') then
        dmConsulta.cdsConsPerfilMenuEXCLUIR.AsString := ''
      else
        dmConsulta.cdsConsPerfilMenuEXCLUIR.AsString := 'S';
    end;

    if (column.Index = 6) AND (dmConsulta.cdsConsPerfilMenuTEM_CONSULTA.AsString = 'S') then begin
      if (dmConsulta.cdsConsPerfilMenuCONSULTAR.AsString = 'S') then
        dmConsulta.cdsConsPerfilMenuCONSULTAR.AsString := ''
      else
        dmConsulta.cdsConsPerfilMenuCONSULTAR.AsString := 'S';
    end;


  dmConsulta.cdsConsPerfilMenu.post;

end;

procedure TfrmCadAcessos.dbLkCbPerfilClick(Sender: TObject);
begin

  with dmConsulta.cdsConsPerfilMenu do begin
    close;
    params[0].value := dbLkCbPerfil.KeyValue;
    open;
  end;

  dsacessos.DataSet.Refresh;
  
  btnconfirmar.Enabled := true;

end;

procedure TfrmCadAcessos.BtnConfirmarClick(Sender: TObject);
var	sucesso: Boolean;
begin

StartTransaction;

try

  with dmDelete.sqlPerfilMenuDel do begin
    close;
    params[0].value := dbLkCbPerfil.KeyValue;
    ExecSQL;
  end;

  dmConsulta.cdsConsPerfilMenu.First;
  while not dmConsulta.cdsConsPerfilMenu.Eof do begin
    if dmConsulta.cdsConsPerfilMenuACESSAR.AsString = 'S' then begin
      with dmInsert.sqlPerfilmenuIns do begin
        close;
        params[0].value := dbLkCbPerfil.KeyValue;
        params[1].value := dmConsulta.cdsConsPerfilMenuID_MENU.value;
        params[2].value := dmConsulta.cdsConsPerfilMenuINCLUIR.value;
        params[3].value := dmConsulta.cdsConsPerfilMenuALTERAR.value;
        params[4].value := dmConsulta.cdsConsPerfilMenuEXCLUIR.value;
        params[5].value := dmConsulta.cdsConsPerfilMenuCONSULTAR.value;
        ExecSQL;
      end;
    end;
    dmConsulta.cdsConsPerfilMenu.Next;
  end;


  sucesso := True;

  except
     sucesso := False;
  end;

	if sucesso then begin
    CommitTransaction;
    ActiveControl := dbLkCbPerfil;
    dmConsulta.cdsConsPerfilMenu.First;
    showmessage('Cadastro salvo com sucesso !');
	end
	else begin
    RollbackTransaction;
		showmessage('Erro ao salvar cadastro !');
	end;

end;

procedure TfrmCadAcessos.BtnSairClick(Sender: TObject);
begin

    if MessageDlg('Confirma fechamento do CADASTRO DE ACESSOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

    frmCadAcessos.close; 

end;

end.
