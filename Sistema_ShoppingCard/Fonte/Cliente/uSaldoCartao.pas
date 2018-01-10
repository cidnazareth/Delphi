unit uSaldoCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Grids, DBGrids, DB, ENumEd;

type
  TfrmSaldoCartao = class(TForm)
    Image1: TImage;
    TimeClose: TTimer;
    lblNrCartao: TLabel;
    Shape1: TShape;
    EvNumSaldo: TEvNumEdit;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Shape2: TShape;
    Label4: TLabel;
    Image2: TImage;
    Label5: TLabel;
    EvNumCartao: TEvNumEdit;
    Image3: TImage;
    Label1: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
    function localizaCartao(cpf:string):boolean;
    procedure ZeraApplication();
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure LigaTimer(Sender: TObject; var Done: Boolean);

  public
    { Public declarations }
    cpf : string;

  end;

var
  frmSaldoCartao: TfrmSaldoCartao;
  
implementation

uses uDmCliente;

{$R *.dfm}

procedure TfrmSaldoCartao.FormShow(Sender: TObject);
begin

    frmSaldoCartao.Width := 1024;
    frmSaldoCartao.Height := 768;

    if LocalizaCartao(cpf) then begin
       EvNumSaldo.Value := dmCliente.cdsLocalizaCartaoQTDE_PONTOS.AsFloat;
       EvNumCartao.Value := dmCliente.cdsLocalizaCartaoCARTAO.AsFloat;
    end;

    dmCliente.cdsLocalizaCartao.Close;
    
end;

function TfrmSaldoCartao.localizaCartao(cpf:string):boolean;
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


procedure TfrmSaldoCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ZeraApplication();
end;


procedure TfrmSaldoCartao.TimeCloseTimer(Sender: TObject);
begin
  frmSaldoCartao.close;
end;


procedure TfrmSaldoCartao.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmSaldoCartao.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmSaldoCartao.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;

procedure TfrmSaldoCartao.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;

procedure TfrmSaldoCartao.Image4Click(Sender: TObject);
begin
    frmSaldoCartao.Close;
end;

end.
