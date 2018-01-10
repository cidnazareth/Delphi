unit uInformeNumCartaoDependente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, EDBDate, Mask, DBCtrls, ENumEd, jpeg,
  ExtCtrls;

type
  TfrmInformeNumCartaoDependente = class(TForm)
    GroupBox2: TGroupBox;
    neNumCartaoDependente: TEvNumEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    DBedNome: TDBEdit;
    DBdtNascimento: TEvDBDateEdit;
    DBedIdentidade: TDBEdit;
    DBedOe: TDBEdit;
    Label1: TLabel;
    DBCPFDependente: TDBEdit;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    Image1: TImage;
    Label20: TLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure neNumCartaoDependenteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    function CartaoDuplicado: boolean;
    function ValidaCampos: boolean;

  public
    { Public declarations }
    gVinculado :boolean;
  end;

var
  frmInformeNumCartaoDependente: TfrmInformeNumCartaoDependente;

implementation

uses uVincularCartaoDependente, uDmInsert, uPrincipal, uDmConsulta,
  uDmLocaliza, uMensagens;

{$R *.dfm}

procedure TfrmInformeNumCartaoDependente.BtnSairClick(Sender: TObject);
begin
   frmInformeNumCartaoDependente.close;
end;

procedure TfrmInformeNumCartaoDependente.BtnConfirmarClick(
  Sender: TObject);
begin

   if not ValidaCampos then begin
      frmMensagens.showmodal;
      exit;
   end;


   if MessageDlg('Confirma vínculo do cartão com o dependente ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

   try
        with dmInsert.sqlCartaoIns do begin
          close;
          params[0].value := DBCPFDependente.Text;
          Params[1].value := frmPrincipal.gIdShopping;    
          params[2].value := 'A';  // tipo do cartão.
          params[3].value := neNumCartaoDependente.value;
          params[4].value := 0;
          params[5].value := frmPrincipal.gIdUsuarioSistema;
          execsql;
        end;
        showmessage('Cartão vinculado com sucesso !');
        gVinculado := true;  
        frmInformeNumCartaoDependente.Close;


   except
      showmessage('Erro na vinculação do cartão !');

   end;

end;


function TfrmInformeNumCartaoDependente.ValidaCampos: boolean;
begin 

   frmmensagens.RichEdit1.Lines.Clear;

   if (length(trim(neNumCartaoDependente.text)) > 0) and (neNumCartaoDependente.text = '0') then
       frmMensagens.RichEdit1.Lines.Add('Informe o número do cartão.');

   if CartaoDuplicado then
       frmMensagens.RichEdit1.Lines.Add('Cartão já existente.');


   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;

end;

function TfrmInformeNumCartaoDependente.CartaoDuplicado: boolean;
begin

   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := neNumCartaoDependente.text;
      params[1].value := null;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCartao.recordcount > 0 then
      result := true;

end;



procedure TfrmInformeNumCartaoDependente.FormShow(Sender: TObject);
begin
   gVinculado := false;
end;

procedure TfrmInformeNumCartaoDependente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmInformeNumCartaoDependente.neNumCartaoDependenteExit(
  Sender: TObject);
begin

  If BtnSair.Focused then
    exit
  else
  begin

    if trim(neNumCartaoDependente.text) = '' then begin
      Showmessage('Informe o número do cartão.');
      neNumCartaoDependente.SetFocus;
    end;
  end;
end;

procedure TfrmInformeNumCartaoDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmLocaliza.cdsLocalizaCartao.Close;
end;

end.
