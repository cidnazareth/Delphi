unit uCadDigitais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, EChkCPF, Mask, Buttons, ENumEd, EDateEd,
  StdCtrls, OleServer, DPFPCtlXLib_TLB, DPFPDevXLib_TLB, DPFPShrXLib_TLB, DPFPEngXLib_TLB,
  ActiveX, AXCtrls, ComCtrls, ImgList, DB, ToolWin;

type
  TfrmCadDigitais = class(TForm)
    gbTitular: TGroupBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    dtNascimento: TEvDateEdit;
    edIdentidade: TEdit;
    edOe: TEdit;
    gbNumCartaoTitular: TGroupBox;
    neNumCartao: TEvNumEdit;
    gbCpfTitular: TGroupBox;
    sbLocalizaCPF: TSpeedButton;
    meCpf: TMaskEdit;
    CheckCpf: TEvCheckCPF;
    BtnConfirmar: TBitBtn;
    BtnSair: TBitBtn;
    Label20: TLabel;
    DPCA: TDPFPCapture;
    DPFE: TDPFPFeatureExtraction;
    DPEN: TDPFPEnrollment;
    DPSC: TDPFPSampleConversion;
    Image3: TImage;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Image2: TImage;
    GroupBox5: TGroupBox;
    IMAGFingerPrint: TImage;
    Status: TListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure sbLocalizaCPFClick(Sender: TObject);
    procedure meCpfKeyPress(Sender: TObject; var Key: Char);

    procedure DPCAComplete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);
    procedure DPCASampleQuality(ASender: TObject;
      const ReaderSerNum: WideString; CaptureFeedback: TOleEnum);
    procedure DPCAReaderConnect(ASender: TObject;
      const ReaderSerNum: WideString);
    procedure DPCAReaderDisconnect(ASender: TObject;
      const ReaderSerNum: WideString);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
   
  private
    { Private declarations }
    FTemplate: String;
    FSampleNumber: Byte;
    function  LocalizaCPF(cpf:string):boolean;
    function  localizaCartao(cpf:string):boolean;
    procedure ReportStatus(Str:string);
    procedure AtivarLeitor(op:boolean);
    procedure LoadImgFeaturesNeeded(samples:integer);
    procedure GravarDigital();
    function  SerializeTemplate(PTemplate: IDPFPTemplate): String;
    procedure limpacadastro;
  public
    { Public declarations }
  end;

var
  frmCadDigitais: TfrmCadDigitais;

implementation

uses uDmLocaliza, uDmUpdate, uDmGlobal, uPrincipal;

{$R *.dfm}

procedure TfrmCadDigitais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_RETURN) then begin
      key := VK_OEM_CLEAR;
      SelectNext(ActiveControl,True,True);
   end;
end;

procedure TfrmCadDigitais.BtnSairClick(Sender: TObject);
begin
   if MessageDlg('Confirma fechamento do CADASTRO DE DIGITAIS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
      exit;
   frmCadDigitais.close;
end;

procedure TfrmCadDigitais.BtnConfirmarClick(Sender: TObject);
begin
   if MessageDlg('Confirma INCLUSÃO DAS DIGITAIS ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then begin
      limpacadastro();
      exit;
   end;

   GravarDigital();

end;


function TfrmCadDigitais.localizaCartao(cpf:string):boolean;
begin
try
   with dmlocaliza.cdsLocalizaCartao do begin
      close;
      params[0].value := null;
      params[1].value := cpf;
      open;
   end;

   result:= false;
   if dmlocaliza.cdsLocalizaCartao.RecordCount > 0 then
      result:= true;

  except
      ShowMessage('Erro ao consultar cartão.');
  end;
end;

function TfrmCadDigitais.LocalizaCPF(cpf:string):boolean;
begin
try
   with dmlocaliza.cdsLocalizaCpf do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmlocaliza.cdsLocalizaCpf.recordcount > 0 then
      result := true;

  except
      ShowMessage('Erro ao consultar CPF.');
  end;
end;  

procedure TfrmCadDigitais.sbLocalizaCPFClick(Sender: TObject);
begin
   //Verifica Validade do CPF
   CheckCpf.CPF := meCpf.Text;
   if CheckCpf.Valid = false then begin
      showmessage('CPF Inválido !');
      exit;
   end;


   if LocalizaCPF(meCpf.Text)  then begin
      edNome.text             := dmlocaliza.cdsLocalizaCpfNOME.value;
      dtNascimento.DateValue  := dmglobal.iif(dmlocaliza.cdsLocalizaCpfDT_NASCIMENTO.value=0,-693594,dmlocaliza.cdsLocalizaCpfDT_NASCIMENTO.value);
      edIdentidade.text       := dmlocaliza.cdsLocalizaCpfIDENTIDADE.value;
      edOe.text               := dmlocaliza.cdsLocalizaCpfOE.value;
      neNumCartao.Text        := '';

      if localizaCartao(meCpf.Text) then
         neNumCartao.Text := dmlocaliza.cdsLocalizaCartaoCARTAO.AsString;  
   end
   else begin
     showmessage('CPF não encontrado !');
     exit;
   end;

   ativarleitor(true);

   ReportStatus('Toque lentamente o mesmo dedo 4 vezes no leitor.');

end; 


procedure TfrmCadDigitais.meCpfKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) then
      sbLocalizaCPF.Click;
end;



procedure TfrmCadDigitais.DPCAComplete(ASender: TObject; const ReaderSerNum: WideString; Const pSample: IDispatch);
var Feedback:DPFPCaptureFeedbackEnum;
    samples : integer;
    Picture : IDispatch;
begin

  Picture := DPSC.ConvertToPicture(pSample);
  SetOlePicture(IMAGFingerPrint.Picture,IPictureDisp(Picture));

  {DPFE.CreateFeatureSet(pSample,DataPurposeEnrollment)
  cria um conjunto de características a partir da amostra obtida (pSample)
  para ser usada no cadastro de uma impressão digital.}
  DPFE.CreateFeatureSet(pSample,DataPurposeEnrollment);


  {DPEN.AddFeatures(DPFE.FeatureSet)
  Adiciona o conjunto de características obtido ao componente responsável
  por criar o template consolidado.}
  DPEN.AddFeatures(DPFE.FeatureSet);

  {DPEN.FeaturesNeeded
  Retorna a quantidades de amostras que faltam ser colhidas para
  compor o template da digital.}
  Samples := DPEN.FeaturesNeeded;
  LoadImgFeaturesNeeded(samples);


  {DPEN.TemplateStatus = TemplateStatusTemplateReady
  Verifica o status de criação do template. Quando for verdadeiro,
  significa que obtivemos amostras suficientes e que o template consolidado está pronto para ser salvo.}
  if DPEN.TemplateStatus = TemplateStatusTemplateReady then
  begin
    // Para a captura, desativando o leitor
    DPCA.StopCapture;

    {FTemplate := SerializeTemplate(DPEN.Template as IDPFPTemplate)
     Serializa o template consolidado (TDPFPEnrollment.Template).
     A serialização usada foi simplesmente pegar cada elemento de Template (que é um array de bytes),
     converter para string e usar como separador o (ponto-e-vírgula), o que gera
     no final algo como 0;11;23;234;250;111... com cerca de 4K.}
    FTemplate := SerializeTemplate(DPEN.Template as IDPFPTemplate);

    ReportStatus('Um modelo de impressão digital foi criado.');
    BtnConfirmar.Enabled := true;
  end

end;

procedure TfrmCadDigitais.GravarDigital();
begin
  try
     with dmUpdate.sqlClienteDigitalUpd do begin
      close;
      ParamByName('CPF').AsString := mecpf.Text;
      ParamByName('DIGITAL').asstring := FTemplate;
     ExecSQL;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar digital.');
  end;
  showmessage('Digital gravada com sucesso.');

  limpacadastro();

end;


procedure TfrmCadDigitais.limpacadastro;
begin
  FTemplate := '';
  AtivarLeitor(false);
  DPEN.Clear;
  LoadImgFeaturesNeeded(4);
  status.clear;
  IMAGFingerPrint.Picture := nil;
  mecpf.Clear;
  ednome.Clear;
  dtnascimento.Clear;
  edIdentidade.clear;
  edOe.Clear;
  nenumcartao.Clear;
end;

procedure TfrmCadDigitais.LoadImgFeaturesNeeded(samples:integer);
var
  nomeimagem : string;
  path : string;
begin
try
    nomeimagem := inttostr(4 - samples) + '.jpg';

    path := frmPrincipal.gPathImagem + '\Biometria\' + nomeimagem;
    image2.Picture.LoadFromFile(path);

  except
    showmessage('Erro ao carregar imagens FeaturesNeeded.');
  end;
end;

procedure TfrmCadDigitais.DPCASampleQuality(ASender: TObject; const ReaderSerNum: WideString; CaptureFeedback: TOleEnum);
begin
  case CaptureFeedback of
    CaptureFeedbackGood: ReportStatus ('Amostra de boa qualidade.');
    CaptureFeedbackNone: ReportStatus ('Amostra não obtida. Tente novamente.');
    CaptureFeedbackTooLight: ReportStatus ('A amostra obtida é muito clara. Tente novamente.');
    CaptureFeedbackTooDark: ReportStatus ('A amostra obtida é muito escura. Tente novamente.');
    CaptureFeedbackTooNoisy: ReportStatus ('A amostra obtida não está legível. Limpe o leitor e/ou o dedo do usário e tente novamente.');
    CaptureFeedbackLowContrast: ReportStatus ('A amostra obtida está com pouco contraste. Tente novamente.');
    CaptureFeedbackNotEnoughFtrs, CaptureFeedbackTooStrange, CaptureFeedbackTooSkewed: ReportStatus ('A amostra obtida tem qualidade muito baixa. Solicite que o usuário não mova o dedo.');
    CaptureFeedbackNoCentralRgn, CaptureFeedbackTooHigh, CaptureFeedbackTooLow, CaptureFeedbackTooLeft, CaptureFeedbackTooRight: ReportStatus ('A amostra obtida não está centralizada. Centralize o dedo no leitor.');
    CaptureFeedbackNoFinger: ReportStatus ('A amostra obtida não corresponde a um dedo.');
    CaptureFeedbackTooFast: ReportStatus ('A amostra obtida não está legível. O dedo foi removido muito rapidamente.');
    CaptureFeedbackTooShort: ReportStatus ('A amostra obtida é muito pequena. Solicite que o usuário faça um pouco mais de pressão no leitor.');
    CaptureFeedbackTooSlow: ReportStatus ('A amostra obtida não está legível. O dedo foi removido muito lentamente.');
  end;
end;


function TfrmCadDigitais.SerializeTemplate(PTemplate: IDPFPTemplate): String;
var
  SerializedTemplate: OleVariant;
  LowBound: Integer;
  HighBound: Integer;
  ByteArray: PByteArray;
  i: Integer;
begin
  { O template é serializado em um array de bytes }
  SerializedTemplate := PTemplate.Serialize;

  { Obtendo os limites do array de bytes }
  LowBound := VarArrayLowBound(SerializedTemplate,1);
  HighBound := varArrayHighBound(SerializedTemplate,1);

  { Varre o array de bytes salvando cada um de seus bytes como texto em um
  formato que permite transformar novamente esse texto em um array de
  bytes. O formato usado foi byte[0];byte[1];byte[2];byte[n] }
  ByteArray := VarArrayLock(SerializedTemplate);
  try
    Result := '';
    for i := LowBound to HighBound do
      if i = LowBound then
        Result := Result + IntToStr(ByteArray[i])
      else
        Result := Result + ';' + IntToStr(ByteArray[i]);
  finally
    VarArrayUnlock(SerializedTemplate);
  end;
end;



procedure TfrmCadDigitais.AtivarLeitor(op:boolean);
begin
try
  if op then
    DPCA.StartCapture
  else
    DPCA.StopCapture;

  except
    showmessage('Erro ao iniciar ou parar o leitor de digitais.');
  end;
end;


procedure TfrmCadDigitais.ReportStatus(Str:string);
var indice :integer;
begin
  status.Items.Insert(0,STR);
end;


procedure TfrmCadDigitais.DPCAReaderConnect(ASender: TObject;
  const ReaderSerNum: WideString);
begin
  ReportStatus('Leitor conectado.');
end;

procedure TfrmCadDigitais.DPCAReaderDisconnect(ASender: TObject;
  const ReaderSerNum: WideString);
begin
  ReportStatus('Leitor desconectado.');
end;


procedure TfrmCadDigitais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AtivarLeitor(false);

  dmlocaliza.cdsLocalizaCpf.Close;
  dmlocaliza.cdsLocalizaCartao.Close;
end;


procedure TfrmCadDigitais.FormShow(Sender: TObject);
begin
  AtivarLeitor(true);
end;

end.
