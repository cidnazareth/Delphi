unit uCadProdutoPromocao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, EDateEd, StdCtrls, ENumEd, Buttons, ELibFnc, DB,
  DBCtrls, EChkCGC, Grids, DBGrids, DBClient, jpeg;

type
  TfrmCadProdutoPromocao = class(TForm)
    gbCadastro: TGroupBox;
    gbTitular: TGroupBox;
    Label2: TLabel;
    edDescricaoProduto: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    rbAtivaNao: TRadioButton;
    rbAtivaSim: TRadioButton;
    imgProduto: TImage;
    GroupBox2: TGroupBox;
    sbLocalizaPath: TSpeedButton;
    btnExibirImagem: TBitBtn;
    edCaminhoImagemProduto: TEdit;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    gbCpfDependente: TGroupBox;
    sbLocalizaCnpjLoja: TSpeedButton;
    meCnpjLoja: TMaskEdit;
    gpDep: TGroupBox;
    Label22: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    DBRazaoSocial: TDBEdit;
    DbNomeFantasia: TDBEdit;
    DBNumeroLoja: TDBEdit;
    CheckCNPJ: TEvCheckCGC;
    Label20: TLabel;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    dsConsProdutosPromocao: TDataSource;
    Image1: TImage;
    Label5: TLabel;
    dtPeriodoInicio: TEvDateEdit;
    Label4: TLabel;
    dtPeriodoFim: TEvDateEdit;
    rbPeriodoNao: TRadioButton;
    rbPeriodoSim: TRadioButton;
    GroupBox5: TGroupBox;
    rbDestaqueNao: TRadioButton;
    rbDestaqueSim: TRadioButton;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    neQtdeProdPromocao: TEvNumEdit;
    neQtdePontosResgate: TEvNumEdit;
    Label17: TLabel;
    procedure sbLocalizaPathClick(Sender: TObject);
    procedure btnExibirImagemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure sbLocalizaCnpjLojaClick(Sender: TObject);
    procedure rbPeriodoNaoClick(Sender: TObject);
    procedure meCnpjLojaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LimpaCadastro();
    procedure habilitaCadastro(op:boolean);
    function localizaCnpj(cnpj:string): integer;
    procedure consProdutosLoja(id_loja: integer);
    procedure carregaImagem(path: string);
    function ValidaFormulario():boolean;

  public
    { Public declarations }
  end;

var
  frmCadProdutoPromocao: TfrmCadProdutoPromocao;
  Vacao : string;
  id : integer;
  id_loja : integer;

implementation

uses uDmInsert, SqlExpr , uDmLocaliza, uPrincipal, uDmConsulta, uDmUpdate,
  uMensagens;

{$R *.dfm}

procedure TfrmCadProdutoPromocao.sbLocalizaPathClick(Sender: TObject);
begin

   OpenDialog1.InitialDir := frmprincipal.gPathImagem;


   If OpenDialog1.Execute Then begin
      edCaminhoImagemProduto.Text:= OpenDialog1.FileName;
      btnExibirImagem.Click;
   end;
end;

procedure TfrmCadProdutoPromocao.btnExibirImagemClick(Sender: TObject);
var
   path : string;
begin
   try
      path := strAllTrim(edCaminhoImagemProduto.Text);
      if isfile(path) then
         imgProduto.Picture.LoadFromFile(path)
      else begin
         showmessage('Imagem não localizada !');
         ActiveControl := edCaminhoImagemProduto;
      end;
   except
      showmessage('ERRO no carregamento da imagem !');
      exit;
   end;
end;

procedure TfrmCadProdutoPromocao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadProdutoPromocao.BtnConfirmarClick(Sender: TObject);
var
   ativadoPeriodo, ativa, destaque : string;
begin

if rbPeriodoNao.Checked then
  ativadoPeriodo := 'N'
else
  ativadoPeriodo := 'S';

if rbAtivaSim.Checked then
  ativa := 'S'
else
  ativa := 'N';

if rbDestaqueSim.Checked then
  destaque := 'S'
else
  destaque := 'N';



   if not ValidaFormulario then begin
     frmMensagens.showmodal;
     exit;
   end;


   try
			if Vacao = 'I' then begin

        if MessageDlg('Confirma INCLUSÃO DO PRODUTO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
        exit;

			  with dmInsert.sqlProdutoPromocaoIns do begin
				 close;
				 Params[0].Value := id_loja;
				 Params[1].Value := edDescricaoProduto.Text;
				 Params[2].Value := neQtdePontosResgate.Value;
				 Params[3].Value := neQtdeProdPromocao.Value;
				 Params[4].Value := ativadoPeriodo;
				 if (ativadoPeriodo = 'N') then begin
					Params[5].Value := null;
					Params[6].Value := null;
				 end
				 else begin
					Params[5].Value := dtperiodoinicio.DateValue;
					Params[6].Value := dtPeriodoFim.DateValue;
				 end;
				 Params[7].Value := edCaminhoImagemProduto.Text;
				 Params[8].Value := ativa;
				 Params[9].Value := frmPrincipal.gidUsuarioSistema;
         Params[10].Value := destaque;

				 ExecSQL;
			  end;

			  showmessage('Cadastrado efetuado com sucesso !');
      end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO PRODUTO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;

 			  with dmUpdate.sqlProdutoPromocaoUpd do begin
				 close;
         Params[0].Value := ID;
				 Params[1].Value := edDescricaoProduto.Text;

				 Params[2].Value := neQtdePontosResgate.Value;
				 Params[3].Value := neQtdeProdPromocao.Value;
				 Params[4].Value := ativadoPeriodo;
				 if (ativadoPeriodo = 'N') then begin
					Params[5].Value := null;
					Params[6].Value := null;
				 end
				 else begin
					Params[5].Value := dtPeriodoInicio.DateValue;
					Params[6].Value := dtPeriodoFim.DateValue;
				 end;
				 Params[7].Value := edCaminhoImagemProduto.Text;
				 Params[8].Value := ativa;
         Params[9].Value := destaque;
				 ExecSQL;
			  end;

			  showmessage('Cadastrado alterado com sucesso !');
        Vacao := 'I'

      end;

      dsConsProdutosPromocao.DataSet.Refresh;
      LimpaCadastro();
      

   except
      showmessage('Erro ao salvar cadastro !');
      exit;
   end;
end;


procedure TfrmCadProdutoPromocao.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE PRODUTOS EM PROMOÇÃO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadProdutoPromocao.close;
end;

procedure TfrmCadProdutoPromocao.sbLocalizaCnpjLojaClick(Sender: TObject);
begin
   //Verifica Validade do CPF
   CheckCNPJ.CGC := meCnpjLoja.Text;
   if (CheckCNPJ.Valid = false) or (meCnpjLoja.Text = '  .   .   /    -  ') then begin   // Cid;
      habilitaCadastro(false);
      showmessage('CNPJ Inválido !');
      exit;
   end;

   habilitaCadastro(true);

   LimpaCadastro();


   Vacao := 'I';

   if localizaCNPJ(meCnpjLoja.text) > 0 then begin
      id_loja :=  dmLocaliza.cdsLocalizaCnpjLojaID.value;
      DBRazaoSocial.text := dmLocaliza.cdsLocalizaCnpjLojaRAZAO_SOCIAL.value;
      DbNomeFantasia.text := dmLocaliza.cdsLocalizaCnpjLojaNOME_FANTASIA.Value;
      DBNumeroLoja.text :=  dmLocaliza.cdsLocalizaCnpjLojaNUMERO_LOJA.value;

      //Pesquisa Produtos loja
      consProdutosLoja(id_loja);
   end
   else begin
      showmessage('Loja não cadastrada !');
      habilitaCadastro(false);
      exit;
   end;

end;

function TfrmCadProdutoPromocao.localizaCnpj(cnpj: string): integer;
var i:integer;
begin
   with dmLocaliza.cdsLocalizaCnpjLoja do begin
      close;
      params[0].value := null;
      params[1].value := cnpj;
      open;
   end;

   i:= dmLocaliza.cdsLocalizaCnpjLoja.recordcount;
   result := i;
end;        

procedure TfrmCadProdutoPromocao.consProdutosLoja(id_loja: integer);
begin
   //Consulta loja
   with dmConsulta.cdsConsProdutosPromocao do begin
      close;
      Params[0].Value := id_loja;
      open;
   end;
end;


procedure TfrmCadProdutoPromocao.carregaImagem(path: string);
begin
   try
      if isfile(path) then
         imgProduto.Picture.LoadFromFile(path)
      else
         imgProduto.Picture := nil;
         
   except
      exit;
   end;
end;



procedure TfrmCadProdutoPromocao.rbPeriodoNaoClick(Sender: TObject);
begin
   if (rbPeriodoNao.Checked) then begin
      dtPeriodoInicio.DateValue := date;
      dtPeriodoFim.DateValue := date;
      dtPeriodoInicio.Enabled := false;
      dtPeriodoFim.Enabled := false;
   end
   else begin
      dtPeriodoInicio.Enabled := true;
      dtPeriodoFim.Enabled := true;
      ActiveControl := dtPeriodoInicio;
   end;
end;

procedure TfrmCadProdutoPromocao.habilitaCadastro(op: boolean);
begin
   if op = True then begin
      gbCadastro.Enabled   := true;
      BtnConfirmar.Enabled := true;
      ActiveControl        := edDescricaoProduto;
   end
   else begin
      gbCadastro.Enabled   := false;
      BtnConfirmar.Enabled := false;
      ActiveControl        := meCnpjLoja;
   end;
end;

procedure TfrmCadProdutoPromocao.LimpaCadastro;
var
   i : integer;
begin
   //Limpa edits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEdit then  begin
         TEdit(Components[i]).Text := '';
      end;
   //Limpa Numedits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvNumEdit then  begin
         TEvNumEdit(Components[i]).Value := 0;
      end;
   //Limpa DateEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvDateEdit then  begin
         TEvDateEdit(Components[i]).DateText := '00/00/0000';
      end;
  
   imgProduto.Picture := nil

end;



procedure TfrmCadProdutoPromocao.meCnpjLojaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then begin
      key := #0;
      sbLocalizaCnpjLoja.Click;
   end;
end;

procedure TfrmCadProdutoPromocao.FormShow(Sender: TObject);
begin
   dtPeriodoInicio.DateValue := date;
   dtPeriodoFim.DateValue    := date;
end;

procedure TfrmCadProdutoPromocao.DBGrid2DblClick(Sender: TObject);
begin

   Vacao := 'A';

   carregaImagem(dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value);


   id :=  dmConsulta.cdsConsProdutosPromocaoID.Value;

   edDescricaoProduto.Text := dmConsulta.cdsConsProdutosPromocaoDESC_PRODUTO.Value;
   edCaminhoImagemProduto.Text := dmConsulta.cdsConsProdutosPromocaoPATH_IMAGEM.Value;

   if dmConsulta.cdsConsProdutosPromocaoATIVADO_PERIODO.value = 'S' then
      rbPeriodoSim.Checked := true
   else
      rbPeriodoNao.Checked := true;

    dtPeriodoInicio.DateValue := dmConsulta.cdsConsProdutosPromocaoDATA_INICIO.Value;
    dtPeriodoFim.DateValue := dmConsulta.cdsConsProdutosPromocaoDATA_FIM.Value;

   if dmConsulta.cdsConsProdutosPromocaoATIVO.value = 'S' then
      rbAtivaSim.Checked := true
   else
      rbAtivaNao.Checked := true;


   neQtdeProdPromocao.Value := dmConsulta.cdsConsProdutosPromocaoQTDE_PRODUTO.value;
   neQtdePontosResgate.value := dmConsulta.cdsConsProdutosPromocaoQTDE_PONTOS.asfloat;

   if dmConsulta.cdsConsProdutosPromocaoDESTAQUE.value = 'S' then
      rbDestaqueSim.Checked := true
   else
      rbDestaqueNao.Checked := true;


end;

procedure TfrmCadProdutoPromocao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmConsulta.cdsConsProdutosPromocao.Close;
  dmLocaliza.cdsLocalizaCnpjLoja.Close;
end;


function TfrmCadProdutoPromocao.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edDescricaoProduto.text) = '' then 
      frmMensagens.RichEdit1.Lines.Add('A descrição do produto deve ser preenchida.');

   if strAlltrim(edCaminhoImagemProduto.Text) = '' then
      frmMensagens.RichEdit1.Lines.Add('Uma imagem do produto deve ser inserida.');

   if neQtdeProdPromocao.Value = 0 then
      frmMensagens.RichEdit1.Lines.Add('Informe a quantidade do produto que será disponibilizada.');

   if neQtdePontosResgate.Value = 0 then
      frmMensagens.RichEdit1.Lines.Add('Informe a quantidade de pontos para resgate do produto.'); 

   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;


end.
