unit uConfirmaDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, DPFPCtlXLib_TLB, OleServer, DPFPShrXLib_TLB,
  DPFPEngXLib_TLB, DBCtrls, db, ExtCtrls, DPFPDevXLib_TLB, Buttons, jpeg;

type
  TfrmConfirmaDigital = class(TForm)
    DPCA: TDPFPCapture;
    DPVE: TDPFPVerification;
    DPFE: TDPFPFeatureExtraction;
    DPSC: TDPFPSampleConversion;
    TIME: TTimer;
    Image1: TImage;
    Label20: TLabel;
    Status: TListBox;
    Panel1: TPanel;
    cpf: TEdit;
    Resultado: TLabel;
    GroupBox5: TGroupBox;
    IMAGVerify: TImage;
    DigitalConfirmada: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPCAComplete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);
    procedure FormShow(Sender: TObject);
    procedure DPCASampleQuality(ASender: TObject; const ReaderSerNum: WideString; CaptureFeedback: TOleEnum);
    procedure TIMETimer(Sender: TObject);
    procedure DPCAReaderConnect(ASender: TObject; const ReaderSerNum: WideString);
    procedure DPCAReaderDisconnect(ASender: TObject; const ReaderSerNum: WideString);
  private
    { Private declarations }
    FCountDown: Byte;
    FTemplate: String;
    function  UnserializeTemplate(ATemplate: String): IDPFPTemplate;
    procedure RestartCapture(ATime: Byte);
    procedure ReportStatus(Str:string);
    procedure AtivarLeitor(op:boolean);
   public
    { Public declarations }
  end;

var
  frmConfirmaDigital: TfrmConfirmaDigital;
  FTemplate: String;
  achou : boolean;

implementation

uses ActiveX, AxCtrls, uDmConsulta, uDmGlobal;

{$R *.dfm}

procedure TfrmConfirmaDigital.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmconsulta.cdsConsultaDigital.close;
  AtivarLeitor(false);
end;


procedure TfrmConfirmaDigital.DPCAComplete(ASender: TObject; const ReaderSerNum: WideString; const pSample: IDispatch);
var
  VerificationResult: IDPFPVerificationResult;
  Picture : IDispatch;
begin
  FTemplate := '';
  achou := false;
  DigitalConfirmada.Text :=  'N';

  Picture := DPSC.ConvertToPicture(pSample);
  SetOlePicture(IMAGVerify.Picture,IPictureDisp(Picture));

  DPFE.CreateFeatureSet(pSample,DataPurposeVerification);
  AtivarLeitor(false);

  with dmconsulta.cdsConsultaDigital do begin
    close;
    params[0].value := dmglobal.iif(cpf.text = '', null, cpf.Text);
    open;
  end;

  while not dmconsulta.cdsConsultaDigital.Eof do
  begin
      FTemplate := dmconsulta.cdsConsultaDigitalDIGITAL.AsString;

      VerificationResult := DPVE.Verify(DPFE.FeatureSet,(UnserializeTemplate(FTemplate) as IDispatch)) as IDPFPVerificationResult;

      if VerificationResult.Verified then begin
        Resultado.Caption := dmconsulta.cdsConsultaDigitalCPF.Value;
        achou := true;
        DigitalConfirmada.Text :=  'S';
        break;
      end;

      dmconsulta.cdsConsultaDigital.Next;
   end;

   if achou then
      Resultado.Caption := 'CPF: ' + Resultado.Caption + ' - DIGITAL VÁLIDA'
   else
      Resultado.Caption := 'A DIGITAL CAPTURADA NÃO CONFERE COM A DO CLIENTE';

   RestartCapture(5);
end;


function TfrmConfirmaDigital.UnserializeTemplate(ATemplate: String): IDPFPTemplate;
var
  ByteArray: PByteArray;
  SerializedTemplate: OleVariant;
  i: Integer;
begin
  { Transforma o template serializado na forma byte[0];byte[1];byte[2];byte[n] em um PByteArray "espelhado" em SerializedTemplate }
  with TStringList.Create do
    try
      Delimiter := ';';
      DelimitedText := ATemplate;

      SerializedTemplate := VarArrayCreate([0,Count],varByte);

      ByteArray := VarArrayLock(SerializedTemplate);
      try
        for i := 0 to Pred(Count) do
          ByteArray[i] := StrToInt(Strings[i]);
      finally
        VarArrayUnlock(SerializedTemplate);
      end;
    finally
      Free;
    end;

  with TDPFPTemplate.Create(nil) do
    try
      DefaultInterface.Deserialize(SerializedTemplate);
      Result := DefaultInterface;
    finally
      Free;
    end;
end;


procedure TfrmConfirmaDigital.DPCASampleQuality(ASender: TObject; const ReaderSerNum: WideString; CaptureFeedback: TOleEnum);
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


procedure TfrmConfirmaDigital.DPCAReaderConnect(ASender: TObject;
  const ReaderSerNum: WideString);
begin
  ReportStatus('Leitor conectado.');
end;

procedure TfrmConfirmaDigital.DPCAReaderDisconnect(ASender: TObject;
  const ReaderSerNum: WideString);
begin
  ReportStatus('Leitor desconectado.');
end;

procedure TfrmConfirmaDigital.ReportStatus(Str:string);
begin
  status.Items.Insert(0,Str);
end;

procedure TfrmConfirmaDigital.FormShow(Sender: TObject);
begin
   AtivarLeitor(true);
end;



procedure TfrmConfirmaDigital.AtivarLeitor(op:boolean);
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


procedure TfrmConfirmaDigital.RestartCapture(ATime: Byte);
begin
  FCountDown := ATime;
  TIME.Enabled := True;
end;

procedure TfrmConfirmaDigital.TIMETimer(Sender: TObject);
begin
  Dec(FCountDown);

  if FCountDown = 0 then
  begin

    if not achou then begin
      IMAGVerify.Picture := nil;
      TIME.Enabled := False;
      status.Clear;
      resultado.Caption := '';
      AtivarLeitor(true);
    end
    else
      frmConfirmaDigital.Close;

  end;
end;

end.


