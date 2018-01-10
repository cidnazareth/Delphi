unit uCadLojasShopping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ENumEd, EDateEd, StdCtrls, Mask, Buttons, ExtCtrls, EChkCGC,ELibFnc,
  Grids, DBGrids, DB, jpeg;

type
  TfrmCadLojasShopping = class(TForm)
    gbCpfDependente: TGroupBox;
    sbLocalizaCnpjLoja: TSpeedButton;
    meCnpj: TMaskEdit;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    pnCadastro: TPanel;
    gpDep: TGroupBox;
    Label22: TLabel;
    Label24: TLabel;
    edRazaoSocial: TEdit;
    edNomeFantasia: TEdit;
    gbContatoDep: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    meTelCelular: TMaskEdit;
    meTelefone01: TMaskEdit;
    meTelefone02: TMaskEdit;
    neRamal: TEvNumEdit;
    edContato: TEdit;
    edEmail: TEdit;
    CheckCNPJ: TEvCheckCGC;
    Label1: TLabel;
    edNumeroLoja: TEdit;
    Label20: TLabel;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    dsLojas: TDataSource;
    Image1: TImage;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure sbLocalizaCnpjLojaClick(Sender: TObject);
    procedure meCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure edRazaoSocialExit(Sender: TObject);
    procedure edNumeroLojaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure habilitaCadastro(op:boolean);
    function localizaCnpj(cnpj:string): boolean;
    procedure carregaLojas();
    procedure LimpaCadastroTotal(op: boolean);
    function ValidaFormulario():boolean;

  public
    { Public declarations }
  end;

var
  frmCadLojasShopping: TfrmCadLojasShopping;
  Vacao : string;

implementation

uses uDmInsert, SqlExpr, uPrincipal, uDmLocaliza, uDmUpdate, uDmConsulta, uMensagens,
  uDmGlobal;

{$R *.dfm}

procedure TfrmCadLojasShopping.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DAS LOJAS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadLojasShopping.close;
end;

procedure TfrmCadLojasShopping.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadLojasShopping.BtnConfirmarClick(Sender: TObject);
begin

      if not ValidaFormulario then begin
        frmMensagens.showmodal;
        exit;
      end;

  try

			if Vacao = 'I' then begin

          if MessageDlg('Confirma INCLUSÃO DA LOJA ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
            exit;

				  with dmInsert.sqlLojasShoppingIns do begin
					 close;
					 Params[0].Value := frmprincipal.gIdShopping;
					 Params[1].Value := meCnpj.Text;
					 Params[2].Value := strAlltrim(edRazaoSocial.Text);
					 Params[3].Value := strAlltrim(edNomeFantasia.Text);
					 Params[4].Value := strAlltrim(edContato.Text);
					 Params[5].Value := meTelefone01.Text;
					 Params[6].Value := meTelefone02.Text;
					 Params[7].Value := neRamal.Text;
					 Params[8].Value := meTelCelular.Text;
					 Params[9].Value := strAlltrim(edEmail.Text);
					 Params[10].Value := strAlltrim(edNumeroLoja.Text);
					 Params[11].Value := frmPrincipal.gIdUsuarioSistema;
					 execsql;
				  end;
				  showmessage('Cadastro efetuado com sucesso !');
      end

			else begin

          if MessageDlg('Confirma ALTERAÇÃO DA LOJA ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
            exit;

				  with dmUpdate.sqlLojasShoppingUpd do begin
					 close;
					 Params[0].Value := meCnpj.Text;
					 Params[1].Value := strAlltrim(edRazaoSocial.Text);
					 Params[2].Value := strAlltrim(edNomeFantasia.Text);
					 Params[3].Value := strAlltrim(edContato.Text);
					 Params[4].Value := meTelefone01.Text;
					 Params[5].Value := meTelefone02.Text;
					 Params[6].Value := neRamal.Text;
					 Params[7].Value := meTelCelular.Text;
					 Params[8].Value := strAlltrim(edEmail.Text);
					 Params[9].Value := strAlltrim(edNumeroLoja.Text);
					 execsql;
				  end;
				  showmessage('Cadastro alterado com sucesso !');
      end;


      LimpaCadastroTotal(true);
      habilitaCadastro(false);
      dsLojas.DataSet.Refresh;

  except
     showmessage('Erro ao salvar o cadastro !');
     exit;
  end;
end;


function TfrmCadLojasShopping.ValidaFormulario():boolean;
begin

   frmmensagens.RichEdit1.Lines.Clear;

   if edRazaoSocial.text = '' then
      frmMensagens.RichEdit1.Lines.Add('Razão Social não pode ser branco.');

   if edNumeroLoja.text = '' then
      frmMensagens.RichEdit1.Lines.Add('Número da loja não pode ser branco.');


   if edemail.Text <> '' then begin
      if not dmGlobal.IsValidEmail(edemail.Text) then
        frmMensagens.RichEdit1.Lines.Add('E-mail inválido.');
   end;

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;




procedure TfrmCadLojasShopping.LimpaCadastroTotal(op: boolean);
begin

  if op then
    mecnpj.clear;

  edRazaoSocial.clear;
  edNomeFantasia.clear;
  edNumeroLoja.clear;
  edContato.clear;
  neRamal.clear;
  meTelefone01.clear;
  meTelefone02.clear;
  meTelCelular.clear;
  edEmail.clear;

end;




procedure TfrmCadLojasShopping.sbLocalizaCnpjLojaClick(Sender: TObject);
begin
   //Verifica Validade do CPF
   CheckCNPJ.CGC := meCnpj.Text;
   if (CheckCNPJ.Valid = false) or (meCnpj.Text = '  .   .   /    -  ')  then begin
      habilitaCadastro(false);
      showmessage('CNPJ Inválido !');
      exit;
   end;

   habilitaCadastro(true);

   Vacao := 'I';   

   if localizaCnpj(meCnpj.text) then begin
      Vacao := 'A';
      edRazaoSocial.text  := dmLocaliza.cdsLocalizaCnpjLojaRAZAO_SOCIAL.Value;
      edNomeFantasia.text := dmLocaliza.cdsLocalizaCnpjLojaNOME_FANTASIA.Value;
      edNumeroLoja.text   := dmLocaliza.cdsLocalizaCnpjLojaNUMERO_LOJA.Value;
      edContato.text      := dmLocaliza.cdsLocalizaCnpjLojaCONTATO.Value;
      neRamal.text        := dmLocaliza.cdsLocalizaCnpjLojaRAMAL.Value;
      meTelefone01.text   := dmLocaliza.cdsLocalizaCnpjLojaTELEFONE_01.Value;
      meTelefone02.text   := dmLocaliza.cdsLocalizaCnpjLojaTELEFONE_02.Value;
      meTelCelular.text   := dmLocaliza.cdsLocalizaCnpjLojaCELULAR.Value;
      edEmail.text        := dmLocaliza.cdsLocalizaCnpjLojaEMAIL.Value;
   end
   else
      LimpaCadastroTotal(false);


end;


function TfrmCadLojasShopping.localizaCnpj(cnpj: string): boolean;
begin
try

   with dmLocaliza.cdsLocalizaCnpjLoja do begin
      close;
      params[0].value := null;
      params[1].value := cnpj;
      open;
   end;

   result := false;

   if dmLocaliza.cdsLocalizaCnpjLoja.recordcount > 0 then
      result := true


   except
      showmessage('Ocorreu um erro consultando loja !');
   end;

end;



procedure TfrmCadLojasShopping.habilitaCadastro(op: boolean);
begin
   if op = True then begin
      pnCadastro.Enabled   := true;
      BtnConfirmar.Enabled := true;
      ActiveControl        := edRazaoSocial;
   end
   else begin
      pnCadastro.Enabled   := false;
      BtnConfirmar.Enabled := false;
      ActiveControl := meCnpj;
   end;
end;


procedure TfrmCadLojasShopping.meCnpjKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then begin
      key := #0;
      sbLocalizaCnpjLoja.Click;
   end;
end;

procedure TfrmCadLojasShopping.edRazaoSocialExit(Sender: TObject);
begin

  //Cid
  If BtnSair.Focused then
    exit
  else
  begin
    if trim(edRazaoSocial.text) = '' then begin
      Showmessage('Informe a razão social.');
      edRazaoSocial.SetFocus;
    end;
  end;


end;

procedure TfrmCadLojasShopping.edNumeroLojaExit(Sender: TObject);
begin

//Cid
  If BtnSair.Focused then
    exit
  else
  begin
    if trim(edNumeroLoja.text) = '' then begin
      Showmessage('Informe o número da loja.');
      edNumeroLoja.SetFocus;
    end;
  end;

end;


procedure TfrmCadLojasShopping.carregaLojas();
begin
   //Consulta loja
   with dmConsulta.cdsConsLojasShopping do begin
      close;
        params[0].value := null;
        params[1].value := null;
      open;
   end;

end; 


procedure TfrmCadLojasShopping.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  dmLocaliza.cdsLocalizaCnpjLoja.close;
  dmConsulta.cdsConsLojasShopping.Close;
end;



procedure TfrmCadLojasShopping.FormShow(Sender: TObject);
begin
  carregaLojas();
end;


procedure TfrmCadLojasShopping.DBGrid2DblClick(Sender: TObject);
begin

  try

      habilitaCadastro(true);

      Vacao := 'A';

      meCnpj.Text         := dmConsulta.cdsConsLojasShoppingCNPJ.Value;
      edRazaoSocial.text  := dmConsulta.cdsConsLojasShoppingRAZAO_SOCIAL.Value;
      edNomeFantasia.text := dmConsulta.cdsConsLojasShoppingNOME_FANTASIA.Value;
      edNumeroLoja.text   := dmConsulta.cdsConsLojasShoppingNUMERO_LOJA.Value;
      edContato.text      := dmConsulta.cdsConsLojasShoppingCONTATO.Value;
      neRamal.text        := dmConsulta.cdsConsLojasShoppingRAMAL.Value;
      meTelefone01.text   := dmConsulta.cdsConsLojasShoppingTELEFONE_01.Value;
      meTelefone02.text   := dmConsulta.cdsConsLojasShoppingTELEFONE_02.Value;
      meTelCelular.text   := dmConsulta.cdsConsLojasShoppingCELULAR.Value;
      edEmail.text        := dmConsulta.cdsConsLojasShoppingEMAIL.Value;

   except
      showmessage('Ocorreu um erro inesperado !');
   end;

end;

end.
