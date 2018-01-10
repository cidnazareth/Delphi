unit uExtratoCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Grids, DBGrids, DB, ENumEd;

type
  TfrmExtratoCartao = class(TForm)
    Image1: TImage;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    dsExtrato: TDataSource;
    TimeClose: TTimer;
    GroupBox1: TGroupBox;
    EvNumSaldo: TEvNumEdit;
    Image3: TImage;
    Label2: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GeraExtrato(idcartao:integer);
    function localizaCartao(cpf:string):boolean;
    procedure ZeraApplication();
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure LigaTimer(Sender: TObject; var Done: Boolean);

  public
    { Public declarations }
    cpf : string;

  end;

var
  frmExtratoCartao: TfrmExtratoCartao;
  
implementation

uses uDmCliente, uDmInsert;

{$R *.dfm}

procedure TfrmExtratoCartao.FormShow(Sender: TObject);
var
  idCartao:integer;
begin

    frmExtratoCartao.Width := 1024;
    frmExtratoCartao.Height := 768;

    if LocalizaCartao(cpf) then begin
       idCartao := dmCliente.cdsLocalizaCartaoID.Value;

       GeraExtrato(idCartao);

       EvNumSaldo.Value := dmCliente.cdsLocalizaCartaoQTDE_PONTOS.AsFloat;
    end;
    
end;

function TfrmExtratoCartao.localizaCartao(cpf:string):boolean;
begin
   with dmCliente.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result:= false;
   if dmCliente.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;
end;



procedure TfrmExtratoCartao.GeraExtrato(idcartao:integer);
begin

   with dmInsert.sqlGeraExtrato do begin
      close;
      Params[0].Value := idcartao;
      ExecSQL;
   end;

   with dmCliente.cdsConsultaExtrato do begin
      close;
      Params[0].Value := idcartao;
      open;
   end;

end;

procedure TfrmExtratoCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ZeraApplication();
  dmCliente.cdsConsultaExtrato.close;
  dmCliente.cdsLocalizaCartao.Close;
end;

procedure TfrmExtratoCartao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin


   if (dmCliente.cdsConsultaExtrato.FieldByName('operacao').value = 'C') and
      (dmCliente.cdsConsultaExtrato.FieldByName('dt_movimento').value < date)  then
      Dbgrid1.Canvas.Font.Color := clBlue;

   if (dmCliente.cdsConsultaExtrato.FieldByName('operacao').value = 'D') then
      Dbgrid1.Canvas.Font.Color := clRed;

   if (dmCliente.cdsConsultaExtrato.FieldByName('operacao').value = 'C') and
      (dmCliente.cdsConsultaExtrato.FieldByName('dt_movimento').value = date) then
      Dbgrid1.Canvas.Font.Color := clGreen;


   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State); 

end;

procedure TfrmExtratoCartao.TimeCloseTimer(Sender: TObject);
begin
  frmExtratoCartao.close;
end;


procedure TfrmExtratoCartao.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmExtratoCartao.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmExtratoCartao.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmExtratoCartao.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;

end.
