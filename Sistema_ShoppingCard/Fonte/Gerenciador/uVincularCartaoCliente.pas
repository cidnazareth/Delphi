unit uVincularCartaoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ENumEd, EChkCPF, EDateEd, Mask, EDBDate,
  DBCtrls, DB, EDBNum, jpeg, ExtCtrls;

type
  TfrmVincularCartaoCliente = class(TForm)
    gbCpfTitular: TGroupBox;
    sbLocalizaCPFTitular: TSpeedButton;
    meCpf: TMaskEdit;
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    CheckCpf: TEvCheckCPF;
    gbNumCartaoTitular: TGroupBox;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    Label20: TLabel;
    neNumCartaoTitular: TEvNumEdit;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure sbLocalizaCPFTitularClick(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBneNumCartaoTitularExit(Sender: TObject);
    procedure neNumCartaoTitularChange(Sender: TObject);
  private
    { Private declarations }
    procedure habilitaCadastro(op:boolean);
    function localizaCpfTitular(cpf:string): boolean;
    function ValidaCampos: boolean;
    procedure carregaTelaReativarCartao(cpf: string);
    function localizaCartao(cpf:string): boolean;
    function CartaoDuplicado: boolean;
  public
    { Public declarations }
  end;

var
  frmVincularCartaoCliente: TfrmVincularCartaoCliente;
  var CartaoNovo:boolean;

implementation

uses uDmLocaliza, uDmInsert, SqlExpr, uPrincipal, uReativarCartao,
  uDmConsulta, uMensagens, uDmGlobal;

{$R *.dfm}

procedure TfrmVincularCartaoCliente.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do VINCULO DO CARTÃO DO CLIENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmVincularCartaoCliente.close;
end;

procedure TfrmVincularCartaoCliente.BtnConfirmarClick(Sender: TObject);

begin

   if not ValidaCampos then begin
      frmMensagens.showmodal;
      exit;
   end;


   if MessageDlg('Confirma VINCULO DO CARTÃO COM O CLIENTE ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;

   try


    if CartaoNovo then begin
      with dmInsert.sqlCartaoIns do begin
         close;
         Params[0].value := meCpf.text;                   // Cpf Titular
         Params[1].value := frmPrincipal.gIdShopping;     // id shopp
         Params[2].value := 'A';                          // Tipo do Cartão (Cid)
         Params[3].value := neNumCartaoTitular.value;   // Numero do Cartão
         Params[4].value := 0;                            // qtde Pontos
         Params[5].value := frmPrincipal.gIdUsuarioSistema; // Usuario do sistema;
         execsql;
      end;
      showmessage('Cartão vinculado com sucesso !');
      frmVincularCartaoCliente.Close;
    end;


  except
    showmessage('Erro ao vincular cartão !');
    exit;

  end;
end;


function TfrmVincularCartaoCliente.ValidaCampos: boolean;
begin 

   frmmensagens.RichEdit1.Lines.Clear;

   if (length(trim(neNumCartaoTitular.text)) > 0) and (neNumCartaoTitular.text = '0') then
       frmMensagens.RichEdit1.Lines.Add('Informe o número do cartão.');

   if CartaoDuplicado then
       frmMensagens.RichEdit1.Lines.Add('Cartão já existente.');


   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;

end;


procedure TfrmVincularCartaoCliente.sbLocalizaCPFTitularClick(Sender: TObject);
begin
   //Verifica se o CPF é válido
   CheckCpf.CPF := meCpf.Text;       
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin // Cid;
      habilitaCadastro(false);
      showmessage('CPF Inválido !');
      exit;
   end;

   CartaoNovo := false;

   // Localiza CPF
   if localizaCpfTitular(meCpf.Text) then begin

     //Carrega dados do titular
      edNome.text             := dmlocaliza.cdsLocalizaCpfTitularNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfTitularDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfTitularIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfTitularOE.value;
      neNumCartaoTitular.Text := '';

      if localizaCartao(meCpf.Text) then begin
          neNumCartaoTitular.Text :=  dmlocaliza.cdsLocalizaCartaoCARTAO.asstring;

          //Verifica se o titular tem cartão e se está inativo
          if dmlocaliza.cdsLocalizaCartaoATIVO.Value = 'N' then begin
   				    if MessageDlg('Este cliente possui um cartão INATIVO vinculado ao seu CPF. Deseja reativá-lo ?',mtconfirmation, [mbno, mbyes], 0) = mrYes then begin
					      carregaTelaReativarCartao(meCpf.Text);
                exit;
              end;
          end;

          if dmLocaliza.cdsLocalizaCartaoATIVO.Value = 'S' then begin
            showmessage('Este cliente possui um cartão ATIVO vinculado ao seu CPF.');
            HabilitaCadastro(false);
            exit;
          end;
      end;

      CartaoNovo := true;
      habilitaCadastro(true);

   end
   else
   begin
      showmessage('CPF não localizado !');
      exit
   end;  
end;

function TfrmVincularCartaoCliente.localizaCartao(cpf:string): boolean;
begin

   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCartao.recordcount > 0 then
      result := true;

end;

function TfrmVincularCartaoCliente.CartaoDuplicado: boolean;
begin

   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := neNumCartaoTitular.text;
      params[1].value := null;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCartao.recordcount > 0 then
      result := true;

end;


function TfrmVincularCartaoCliente.localizaCpfTitular(cpf: string): boolean;
begin
   with dmlocaliza.cdsLocalizaCpfTitular do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpfTitular.recordcount > 0 then begin
      if dmlocaliza.cdsLocalizaCpfTitularCPF_TITULAR.Value = '' then   // indica que o cpf é do titular
         result := true;
   end;

end;


procedure TfrmVincularCartaoCliente.carregaTelaReativarCartao(cpf: string);
begin
   try
      Application.CreateForm(TfrmReativarCartao,frmReativarCartao);
      frmReativarCartao.meCpf.text := cpf;
      frmReativarCartao.sbLocalizaCPF.Click;
      frmReativarCartao.ShowModal;
   finally
      frmReativarCartao.free;
      frmReativarCartao := nil;
   end;
end;

procedure TfrmVincularCartaoCliente.meCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCPFTitular.Click;
   end;
end;

procedure TfrmVincularCartaoCliente.habilitaCadastro(op: boolean);
begin
   gbNumCartaoTitular.Enabled := op;
   btnConfirmar.Enabled := op;

   if op then
      ActiveControl := neNumCartaoTitular
   else
      ActiveControl := meCpf;    
end;

procedure TfrmVincularCartaoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmLocaliza.cdsLocalizaCpfTitular.Close;
   dmlocaliza.cdsLocalizaCartao.Close;
end;

procedure TfrmVincularCartaoCliente.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True); 
   end;
end;


procedure TfrmVincularCartaoCliente.DBneNumCartaoTitularExit(
  Sender: TObject);
begin

 //Cid
  If BtnSair.Focused then
    exit
  else
  begin

    if trim(neNumCartaoTitular.text) = '' then begin
      Showmessage('Informe o número do cartão.');
      neNumCartaoTitular.SetFocus;
    end;
  end;

end;


procedure TfrmVincularCartaoCliente.neNumCartaoTitularChange(
  Sender: TObject);
begin
  if neNumCartaoTitular.Value > 0 then
     btnconfirmar.enabled:=true
   else
     btnconfirmar.enabled:=false;

end;


end.
