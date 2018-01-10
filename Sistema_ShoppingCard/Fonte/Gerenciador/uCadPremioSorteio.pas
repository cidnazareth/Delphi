unit uCadPremioSorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, EDateEd, StdCtrls, ENumEd, Buttons, ELibFnc, DB,
  DBCtrls, EChkCGC, ComCtrls, EDBDate, Grids, DBGrids, jpeg;

type
  TfrmCadPremioSorteio = class(TForm)
    gbCadastro: TGroupBox;
    gbTitular: TGroupBox;
    Label2: TLabel;
    edDescPremio: TEdit;
    Label17: TLabel;
    neQtdePontosCupom: TEvNumEdit;
    Label1: TLabel;
    neValorPremio: TEvNumEdit;
    imgProduto: TImage;
    GroupBox2: TGroupBox;
    OpenDialog1: TOpenDialog;
    sbLocalizaPath: TSpeedButton;
    btnExibirImagem: TBitBtn;
    edCaminhoImagemPremio: TEdit;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    gpDep: TGroupBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    EvDBDateEdit1: TEvDBDateEdit;
    EvDBDateEdit2: TEvDBDateEdit;
    EvDBDateEdit3: TEvDBDateEdit;
    DBRichEdit1: TDBRichEdit;
    gbCpfDependente: TGroupBox;
    Label3: TLabel;
    cbOrdemPremio: TComboBox;
    dsLocalizaSorteio: TDataSource;
    dbLkCbDescSorteio: TDBLookupComboBox;
    Label20: TLabel;
    DBGrid2: TDBGrid;
    dsPremio: TDataSource;
    reObsPremio: TRichEdit;
    Label4: TLabel;
    Image1: TImage;
    procedure sbLocalizaPathClick(Sender: TObject);
    procedure btnExibirImagemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure reObsPremioEnter(Sender: TObject);
    procedure reObsPremioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edDescPremioExit(Sender: TObject);
    procedure dbLkCbDescSorteioClick(Sender: TObject);
    procedure dbLkCbDescSorteioMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbLkCbDescSorteioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure cbOrdemPremioChange(Sender: TObject);
    procedure edDescPremioChange(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCadastro();
    procedure abreLocalizaSorteio();
    procedure carregaListaPremio(idSorteio: integer);
    procedure HabilitaBotao(op:boolean);
    function ValidaFormulario():boolean;
  public
    { Public declarations }
  end;

var
  frmCadPremioSorteio: TfrmCadPremioSorteio;
  Vacao : string;

implementation

uses uDmInsert, SqlExpr , uDmLocaliza, uPrincipal, uDmConsulta, uDmUpdate,
  uMensagens;

{$R *.dfm}

procedure TfrmCadPremioSorteio.sbLocalizaPathClick(Sender: TObject);
begin
   OpenDialog1.InitialDir := frmprincipal.gPathImagem;
   If OpenDialog1.Execute Then begin
      edCaminhoImagemPremio.Text:= OpenDialog1.FileName;
      btnExibirImagem.Click;
   end;
end;

procedure TfrmCadPremioSorteio.btnExibirImagemClick(Sender: TObject);
var
   path : string;
begin
   try
      path := strAllTrim(edCaminhoImagemPremio.Text);
      if isfile(path) then
         imgProduto.Picture.LoadFromFile(path)
      else begin
         showmessage('Imagem não localizada !');
         ActiveControl := edCaminhoImagemPremio;
      end;
   except
      showmessage('ERRO no carregamento da imagem !');
      exit;
   end;
end;


procedure TfrmCadPremioSorteio.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadPremioSorteio.HabilitaBotao(op:boolean);
begin
      btnconfirmar.enabled := op;
end;


procedure TfrmCadPremioSorteio.BtnConfirmarClick(Sender: TObject);
begin

      if not ValidaFormulario then begin
        frmMensagens.showmodal;
        exit;
      end;  

  try
			if Vacao = 'I' then begin

        if MessageDlg('Confirma INCLUSÃO DO PRÊMIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
        exit;


        with dmInsert.sqlPremioSorteioIns do begin
         close;
         Params[0].Value := dmLocaliza.cdsLocalizaSorteioId.value;
         Params[1].Value := cbOrdemPremio.ItemIndex+1;
         Params[2].Value := stralltrim(edDescPremio.Text);
         Params[3].Value := neValorPremio.Value;
         Params[4].Value := neQtdePontosCupom.Value;
         Params[5].Value := stralltrim(edCaminhoImagemPremio.Text);
         //Params[6].LoadFromFile(edCaminhoImagemPremio.Text, ftBlob);
         Params[6].Value := reObsPremio.Text;
         Params[7].Value := frmPrincipal.gIdUsuarioSistema;
         ExecSQL;
        end;

        showmessage('Cadastrado efetuado com sucesso !');

      end

			else begin

        if MessageDlg('Confirma ALTERAÇÃO DO PRÊMIO ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
          exit;


 			  with dmUpdate.sqlPremioSorteioUpd do begin
				 close;

         Params[0].Value := dmConsulta.cdsConsultaPremioID.value;
         Params[1].Value := cbOrdemPremio.ItemIndex+1;
         Params[2].Value := stralltrim(edDescPremio.Text);
         Params[3].Value := neValorPremio.Value;
         Params[4].Value := neQtdePontosCupom.Value;
         Params[5].Value := stralltrim(edCaminhoImagemPremio.Text);
         //Params[6].LoadFromFile(edCaminhoImagemPremio.Text, ftBlob);
         Params[6].Value := reObsPremio.Text;
         ExecSQL;
        end;

        showmessage('Cadastrado alterado com sucesso !');
        Vacao := 'I'

      end;

      dsPremio.DataSet.Refresh;
      LimpaCadastro();
      HabilitaBotao(false);
      ActiveControl := dbLkCbDescSorteio; 

  except
     showmessage('Erro ao salvar cadastro !');
     exit;
  end;
end;

procedure TfrmCadPremioSorteio.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE PRÊMIOS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadPremioSorteio.close;
end;

procedure TfrmCadPremioSorteio.LimpaCadastro;
var
   i : integer;
begin
   //Limpa edits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEdit then  begin
         TEdit(Components[i]).Text := '';
      end;
   //Limpa TRichEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TRichEdit then  begin
         TRichEdit(Components[i]).Text := '';
      end; 
   //Limpa Numedits
   for i := 0 to ComponentCount -1 do
      if Components[i] is TEvNumEdit then  begin
         TEvNumEdit(Components[i]).Value := 0;
      end;
   //limpa MascEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TMaskEdit then  begin
         TMaskEdit(Components[i]).Clear;
      end;


   //Limpa Imagens
   //for i := 0 to ComponentCount -1 do
     // if Components[i] is TImage then  begin
       //  TImage(Components[i]).Picture:= nil;
    //  end;

   imgProduto.Picture:= nil;

   //Limpa dbEdit
   for i := 0 to ComponentCount -1 do
      if Components[i] is TDBEdit then  begin
         TDBEdit(Components[i]).Clear;
      end;
end;

procedure TfrmCadPremioSorteio.reObsPremioEnter(Sender: TObject);
begin
   KeyPreview := false;
end;

procedure TfrmCadPremioSorteio.reObsPremioExit(Sender: TObject);
begin
   KeyPreview := true;
end;

procedure TfrmCadPremioSorteio.abreLocalizaSorteio();
begin
   with dmLocaliza.cdsLocalizaSorteio do begin
      close;
      params[0].Value := date;
      open;
   end;
   // inicia dblookupcombobox com o primeiro registro
   dbLkCbDescSorteio.KeyValue:= dmLocaliza.cdsLocalizaSorteioID.Value;

   carregaListaPremio(dbLkCbDescSorteio.KeyValue);
end;

procedure TfrmCadPremioSorteio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmLocaliza.cdsLocalizaSorteio.Close;
   dmConsulta.cdsConsultaPremio.close;
end;

procedure TfrmCadPremioSorteio.FormShow(Sender: TObject);
begin
   abreLocalizaSorteio();
   cbOrdemPremio.OnChange(cbOrdemPremio);
end;

procedure TfrmCadPremioSorteio.edDescPremioExit(Sender: TObject);
begin
  If BtnSair.Focused then
    exit
  else
  begin

    if trim(edDescPremio.text) = '' then begin
      Showmessage('Informe a descrição do prêmio.');
      edDescPremio.SetFocus;
    end;
  end;
end;

procedure TfrmCadPremioSorteio.dbLkCbDescSorteioClick(Sender: TObject);
begin
  carregaListaPremio(dbLkCbDescSorteio.KeyValue);
end;


procedure TfrmCadPremioSorteio.carregaListaPremio(idSorteio: integer);
begin
   //Consulta premios e preenche grid
     with dmConsulta.cdsConsultaPremio do begin
        close;
        params[0].value := idSorteio;
        open;
     end;

     LimpaCadastro();
end;

procedure TfrmCadPremioSorteio.dbLkCbDescSorteioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  carregaListaPremio(dbLkCbDescSorteio.KeyValue);;
end;

procedure TfrmCadPremioSorteio.dbLkCbDescSorteioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  carregaListaPremio(dbLkCbDescSorteio.KeyValue);;
end;

procedure TfrmCadPremioSorteio.DBGrid2DblClick(Sender: TObject);
begin
  Vacao := 'A';
	cbOrdemPremio.ItemIndex     := dmConsulta.cdsConsultaPremioORDEM_PREMIO.value-1;
	edDescPremio.text   	      := dmConsulta.cdsConsultaPremioDESC_PREMIO.value;
	neValorPremio.Value 	      := dmConsulta.cdsConsultaPremioVALOR_FISCAL_PREMIO.value;
	neQtdePontosCupom.Value	    := dmconsulta.cdsConsultaPremioQTDE_PONTOS_CUPOM.value;
	edCaminhoImagemPremio.Text  := dmconsulta.cdsConsultaPremioPATH_IMAGEM.value;
	reObsPremio.Text            := dmconsulta.cdsConsultaPremioOBS_PREMIO.value;

  btnExibirImagem.Click();
  HabilitaBotao(true);
end;

procedure TfrmCadPremioSorteio.cbOrdemPremioChange(Sender: TObject);
var chave:integer;
var achou:boolean;
begin 
  chave := strtoint(copy(cbOrdemPremio.items[cbOrdemPremio.itemindex],1,1));
  achou := dmConsulta.cdsConsultaPremio.Locate('ORDEM_PREMIO', chave, [loCaseInsensitive, loPartialKey]);

  Vacao := 'I';

  if achou then
    Vacao := 'A';

end;

procedure TfrmCadPremioSorteio.edDescPremioChange(Sender: TObject);
begin
  if trim(edDescPremio.text) <> '' then
      Habilitabotao(true)
  else
      habilitaBotao(false);
end;

function TfrmCadPremioSorteio.ValidaFormulario():boolean;
begin
   frmmensagens.RichEdit1.Lines.Clear;

   if strAlltrim(edDescPremio.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('A descrição do prêmio deve ser preenchida.');

   if neValorPremio.value = 0 then
      frmMensagens.RichEdit1.Lines.Add('O valor do prêmio deve ser preenchido.');

   if neQtdePontosCupom.value = 0 then
      frmMensagens.RichEdit1.Lines.Add('A quantidade de pontos deve ser preenchida.');

   if strAlltrim(edCaminhoImagemPremio.text) = '' then
      frmMensagens.RichEdit1.Lines.Add('A imagem do prêmio deve ser informada.');


   if frmmensagens.RichEdit1.Lines.Count = 0 then
      result:=true
   else
      result:= false;
end;


end.
