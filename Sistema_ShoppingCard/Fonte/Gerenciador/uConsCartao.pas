unit uConsCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ENumEd, DB, Grids, DBGrids,
  ComCtrls, EDateEd, Mask, DBCtrls, EDBGrid, jpeg;

type
  TfrmConsCartao = class(TForm)
    Label20: TLabel;
    BtnSair: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnExportaExcel: TBitBtn;
    gbCpfTitular: TGroupBox;
    sbLocalizaCartao: TSpeedButton;
    neNumCartao: TEvNumEdit;
    dsCartao: TDataSource;
    pcDependente: TPageControl;
    TabDados: TTabSheet;
    gbEnderecoDep: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    gpDep: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    TabExtrato: TTabSheet;
    gbFiliacao: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    gbContatoDep: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lbTipoCpf: TLabel;
    dbeNome: TDBEdit;
    dbeDtnascimento: TDBEdit;
    dbeIdentidade: TDBEdit;
    dbeOE: TDBEdit;
    dbePai: TDBEdit;
    dbemae: TDBEdit;
    dbecep: TDBEdit;
    dbeuf: TDBEdit;
    dbelogradouro: TDBEdit;
    dbecidade: TDBEdit;
    dbebairro: TDBEdit;
    dbetelcel1: TDBEdit;
    dbetelcel2: TDBEdit;
    dbetelresidencial: TDBEdit;
    dbetelterceiros: TDBEdit;
    dberamal: TDBEdit;
    dbeparentesco: TDBEdit;
    dbeemail: TDBEdit;
    dbecpf: TDBEdit;
    lblAtivo: TLabel;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    dsExtrato: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox5: TGroupBox;
    lblSaldoCartao: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCartaoClick(Sender: TObject);
    procedure neNumCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcDependenteChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure GeraExtrato(idcartao:integer);
    function localizaCartao(cartao:string):boolean;
  public
    { Public declarations }
  end;

var
  frmConsCartao: TfrmConsCartao;

implementation

uses uDmConsulta, DBClient, uDmLocaliza, uDmInsert;

{$R *.dfm}

procedure TfrmConsCartao.BtnSairClick(Sender: TObject);
begin
   frmConsCartao.close;
end;


function TfrmConsCartao.localizaCartao(cartao:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := cartao;
      params[1].value := null;
      open;
   end;

   result:= false;
   if dmlocaliza.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;
end;

procedure TfrmConsCartao.sbLocalizaCartaoClick(Sender: TObject);
var
    idcartao : integer;
begin
try

  if localizaCartao(neNumCartao.Text) then begin
    lbTipoCpf.Caption := dmLocaliza.cdsLocalizacartaoTIPO.Value;
    lblSaldoCartao.Caption := dmLocaliza.cdsLocalizaCartaoQTDE_PONTOS.asstring;
    idcartao := dmLocaliza.cdsLocalizacartaoID.value;

    if dmLocaliza.cdsLocalizacartaoATIVO.Value = 'S' then begin
      lblAtivo.Font.Color := clGreen;
      lblAtivo.Caption := 'Ativo';
    end
    else begin
      lblAtivo.Font.Color := clRed;
      lblAtivo.Caption := 'Inativo';
    end;

    GeraExtrato(idcartao);

    ActiveControl := neNumCartao;
  end
  else begin
    showmessage('Cartão não cadastrado !');
    exit;
  end;

   except
      showmessage('Erro ao consultar cadastro !');
      exit;
   end;

end;

procedure TfrmConsCartao.GeraExtrato(idcartao:integer);
begin

   with dminsert.sqlGeraExtrato do begin
      close;
      Params[0].Value := idcartao;
      ExecSQL;
   end;

   with dmConsulta.cdsConsultaExtrato do begin
      close;
      Params[0].Value := idcartao;
      open;
   end;

end;

procedure TfrmConsCartao.neNumCartaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCartao.Click;
   end;
end;

procedure TfrmConsCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmLocaliza.cdsLocalizacartao.close;
    dmConsulta.cdsConsultaExtrato.Close;
end;

procedure TfrmConsCartao.pcDependenteChange(Sender: TObject);
begin

  //if pcdependente.ActivePage.Name = 'TabExtrato' then


end;

procedure TfrmConsCartao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

   if (dmConsulta.cdsConsultaExtrato.FieldByName('operacao').value = 'C') and
      (dmConsulta.cdsConsultaExtrato.FieldByName('dt_movimento').value < date)  then
      Dbgrid1.Canvas.Font.Color := clBlue;

   if (dmConsulta.cdsConsultaExtrato.FieldByName('operacao').value = 'D') then
      Dbgrid1.Canvas.Font.Color := clRed;

   if (dmConsulta.cdsConsultaExtrato.FieldByName('operacao').value = 'C') and
      (dmConsulta.cdsConsultaExtrato.FieldByName('dt_movimento').value = date) then
      Dbgrid1.Canvas.Font.Color := clGreen;


   Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);

end;

end.
