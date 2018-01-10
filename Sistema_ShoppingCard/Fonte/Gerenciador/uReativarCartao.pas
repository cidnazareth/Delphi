unit uReativarCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ENumEd, EChkCPF, EDateEd, Mask, EDBDate,
  DBCtrls, DB, EDBNum, ELibFnc, jpeg, ExtCtrls;

type
  TfrmReativarCartao = class(TForm)
    gbCpfTitular: TGroupBox;
    sbLocalizaCPF: TSpeedButton;
    meCpf: TMaskEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    CheckCpf: TEvCheckCPF;
    gbNumCartao: TGroupBox;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    Label20: TLabel;
    Label10: TLabel;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    edTipo: TEdit;
    neNumCartao: TEvNumEdit;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure sbLocalizaCPFClick(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LimpaCadastro;
    function LocalizaCPF(cpf:string):boolean;
    procedure habilitaCadastro(op: boolean);
    function localizaCartao(cpf:string):boolean;

  public
    { Public declarations }
  end;

var
  frmReativarCartao: TfrmReativarCartao;
  tipo: string;


implementation

uses uDmLocaliza, uDmInsert, SqlExpr, uPrincipal, uVincularCartaoCliente,
  uDmUpdate, uDmConsulta, uDmGlobal;

{$R *.dfm}

procedure TfrmReativarCartao.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento da REATIVAÇÃO DE CARTÃO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmReativarCartao.close;
end;

procedure TfrmReativarCartao.BtnConfirmarClick(Sender: TObject);
begin

   if MessageDlg('Confirma REATIVAÇÃO DO CARTÃO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

   try
      with dmUpdate.sqlReativaCartao do begin
					close;
					Params[0].Value := strAlltrim(meCpf.Text);
          Params[1].Value := tipo;
					execsql();
      end;
      showmessage('Cartão reativado com sucesso !');

      LimpaCadastro();
      habilitaCadastro(false);

   except
    showmessage('Erro ao reativar o cartão !');
    exit;
   end;
end;


procedure TfrmReativarCartao.sbLocalizaCPFClick(Sender: TObject);
begin

try

   //Verifica se o CPF é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      exit;
   end;


   if LocalizaCPF(meCpf.Text)  then begin

      edNome.text             := dmlocaliza.cdsLocalizaCpfNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfOE.value;
      edTipo.text             := dmlocaliza.cdsLocalizaCpfTIPO.value;
      neNumCartao.Text        := '';

      if localizaCartao(meCpf.Text) then begin
         neNumCartao.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;

          if dmlocaliza.cdsLocalizaCartaoAtivo.value = 'S' then begin
            showmessage('O cartão vinculado a este CPF já encontra-se ATIVO.');
            LimpaCadastro();
            mecpf.SetFocus;
            exit;
          end;
      end
      else begin
          showmessage('Não foi encontrado nenhum cartão vinculado a este CPF.');
          exit;
      end;
   end
   else begin
     showmessage('CPF não encontrado !');
     exit;
   end;

   habilitaCadastro(true);

  except
    showmessage('Erro ao consultar CPF.');
    exit;
  end;
end;


function TfrmReativarCartao.localizaCartao(cpf:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result:= false;
   if dmlocaliza.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;
end;


procedure TfrmReativarCartao.habilitaCadastro(op: boolean);
begin
   if op = True then begin
      BtnConfirmar.Enabled := true;
      ActiveControl        := BtnConfirmar;
   end
   else begin
      BtnConfirmar.Enabled := false;
      ActiveControl        := meCpf;
   end;
end;


function TfrmReativarCartao.LocalizaCPF(cpf:string):boolean;
begin
   with dmlocaliza.cdsLocalizaCpf do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpf.recordcount > 0 then
      result := true;
end;

procedure TfrmReativarCartao.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPF.Click;
   end;
end;

procedure TfrmReativarCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmlocaliza.cdsLocalizaCpf.close;
  dmlocaliza.cdsLocalizaCartao.Close;
end;

procedure TfrmReativarCartao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;


procedure TfrmReativarCartao.LimpaCadastro;
begin
    mecpf.Clear;
    ednome.Clear;
    dtnascimento.clear;
    edidentidade.clear;
    edoe.clear;
    edtipo.Clear;
    nenumcartao.Text := '';
end;

end.
