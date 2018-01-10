unit uConfirmaDigital;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, DPFPCtlXLib_TLB, OleServer, DPFPShrXLib_TLB,
  DPFPEngXLib_TLB, DBCtrls, db, ExtCtrls, DPFPDevXLib_TLB, Buttons, jpeg,
  Mask, EChkCPF, AppEvnts;

type
  TfrmConfirmaDigital = class(TForm)
    DPCA: TDPFPCapture;
    DPVE: TDPFPVerification;
    DPFE: TDPFPFeatureExtraction;
    DPSC: TDPFPSampleConversion;
    TIME: TTimer;
    Image1: TImage;
    Status: TListBox;
    DigitalConfirmada: TEdit;
    CheckCpf: TEvCheckCPF;
    meCpf: TMaskEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    lblResultado: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    TimeClose: TTimer;
    lblGuia: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPCAComplete(ASender: TObject;
      const ReaderSerNum: WideString; const pSample: IDispatch);
    procedure DPCASampleQuality(ASender: TObject; const ReaderSerNum: WideString; CaptureFeedback: TOleEnum);
    procedure TIMETimer(Sender: TObject);
    procedure DPCAReaderConnect(ASender: TObject; const ReaderSerNum: WideString);
    procedure DPCAReaderDisconnect(ASender: TObject; const ReaderSerNum: WideString);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimeCloseTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCountDown1: Byte;
    FTemplate: String;
    function  UnserializeTemplate(ATemplate: String): IDPFPTemplate;
    procedure RestartCapture(ATime: Byte);
    procedure ReportStatus(Str:string);
    procedure AtivarLeitor(op:boolean);
    function  localizaCartao(cpf:string):boolean;
    function  LocalizaCPF(cpf:string):boolean;

    procedure LigaTimer(Sender: TObject; var Done: Boolean);
    procedure DesligaTimer(var MSG: tagMSG; var Handled: Boolean);
    procedure ZeraApplication();
    procedure mensagem(msg:string);

   public
    { Public declarations }
  end;

var
  frmConfirmaDigital: TfrmConfirmaDigital;
  FTemplate: String;
  achou : boolean;

implementation

uses ActiveX, AxCtrls, uDmCliente;

{$R *.dfm}


procedure TfrmConfirmaDigital.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCliente.cdsConsultaDigital.close;
  dmCliente.cdsLocalizaCpf.close;
  dmCliente.cdsLocalizaCartao.close;

  AtivarLeitor(false);
  ZeraApplication();
  Action := CaFree;
end;


procedure TfrmConfirmaDigital.DPCAComplete(ASender: TObject; const ReaderSerNum: WideString; const pSample: IDispatch);
var
  VerificationResult: IDPFPVerificationResult;
begin
  FTemplate := '';
  achou := false;
  DigitalConfirmada.Text :=  'N';

  //gbDigital.Visible := true;

  //Picture := DPSC.ConvertToPicture(pSample);
  //SetOlePicture(IMAGVerify.Picture,IPictureDisp(Picture));

  DPFE.CreateFeatureSet(pSample,DataPurposeVerification);
  AtivarLeitor(false);

  with dmCliente.cdsConsultaDigital do begin
    close;
    params[0].value := dmCliente.iif(mecpf.text = '', null, mecpf.Text);
    open;
  end;

  while not dmCliente.cdsConsultaDigital.Eof do
  begin
      FTemplate := dmCliente.cdsConsultaDigitalDIGITAL.AsString;
      VerificationResult := DPVE.Verify(DPFE.FeatureSet,(UnserializeTemplate(FTemplate) as IDispatch)) as IDPFPVerificationResult;

      if VerificationResult.Verified then begin
        achou := true;
        DigitalConfirmada.Text :=  'S';
        break;
      end;

      dmCliente.cdsConsultaDigital.Next;
   end;

   if achou then
      mensagem('DIGITAL VÁLIDA')
   else
      mensagem('A DIGITAL NÃO CONFERE');


   //gbDigital.visible := false;
   RestartCapture(5);
end;

procedure TfrmConfirmaDigital.mensagem(msg:string);
begin
  lblResultado.caption := msg;
  lblResultado.Width := 200;
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


function TfrmConfirmaDigital.localizaCartao(cpf:string):boolean;
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


function TfrmConfirmaDigital.LocalizaCPF(cpf:string):boolean;
begin
   with dmCliente.cdsLocalizaCpf do begin
      close;
      params[0].value := cpf;
      open;
   end;

   result := false;
   if dmCliente.cdsLocalizaCpf.recordcount > 0 then
      result := true;
end;

procedure TfrmConfirmaDigital.SpeedButton1Click(Sender: TObject);
begin
  mecpf.Text := Mecpf.Text + '1';
end;

procedure TfrmConfirmaDigital.SpeedButton2Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '2';
end;

procedure TfrmConfirmaDigital.SpeedButton3Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '3';
end;

procedure TfrmConfirmaDigital.SpeedButton4Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '4';
end;

procedure TfrmConfirmaDigital.SpeedButton5Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '5';
end;

procedure TfrmConfirmaDigital.SpeedButton6Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '6';
end;

procedure TfrmConfirmaDigital.SpeedButton7Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '7';
end;

procedure TfrmConfirmaDigital.SpeedButton8Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '8';
end;

procedure TfrmConfirmaDigital.SpeedButton9Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '9';
end;

procedure TfrmConfirmaDigital.SpeedButton11Click(Sender: TObject);
begin
mecpf.Text := Mecpf.Text + '0';
end;

procedure TfrmConfirmaDigital.SpeedButton10Click(Sender: TObject);
begin
  mecpf.editmask := '';
  mecpf.clear;
end;

procedure TfrmConfirmaDigital.SpeedButton12Click(Sender: TObject);
begin

   mecpf.editmask := '###.###.###-##;1;_';

   //Verifica se o CPF é válido
   CheckCpf.CPF := meCpf.Text;
   if (CheckCpf.Valid = false) or (meCpf.Text = '   .   .   -  ') then begin
      showmessage('CPF Inválido !');
      mecpf.clear;
      mecpf.editmask := '';
      exit;
   end;

   if LocalizaCPF(meCpf.Text) then begin
      if LocalizaCartao(mecpf.Text) then begin
         if dmCliente.cdsLocalizaCartao.FieldByName('Ativo').Value = 'S' then begin
            AtivarLeitor(true);
            lblGuia.Caption := 'Encoste seu dedo no leitor.'
         end
         else begin
            showmessage('Cartão encontra-se inativo.');
            exit
         end;
      end
      else begin
         showmessage('Não foi encontrado nenhum cartão para o CPF informado.');
         exit
      end;
   end
   else
      showmessage('CPF não localizado.');

end;

procedure TfrmConfirmaDigital.FormShow(Sender: TObject);
begin
  //gbDigital.Visible := false;
  mensagem('');
end;


procedure TfrmConfirmaDigital.RestartCapture(ATime: Byte);
begin
  FCountDown1 := ATime;
  TIME.Enabled := True;
end;

procedure TfrmConfirmaDigital.TIMETimer(Sender: TObject);
begin
  Dec(FCountDown1);

  if FCountDown1 = 0 then
  begin
    if not achou then begin
      //IMAGVerify.Picture := nil;
      TIME.Enabled := False;
      status.Clear;
      mensagem('');
      AtivarLeitor(true);
    end
    else
      frmConfirmaDigital.Close;

  end;
end;

procedure TfrmConfirmaDigital.ZeraApplication();
begin
    Application.OnIdle := nil;
    Application.OnMessage := nil;
end;

procedure TfrmConfirmaDigital.TimeCloseTimer(Sender: TObject);
begin
    ZeraApplication();
    frmConfirmaDigital.Close;
end;

procedure TfrmConfirmaDigital.FormCreate(Sender: TObject);
begin
  Application.OnIdle := LigaTimer;
  Application.OnMessage := DesligaTimer;
end;


procedure TfrmConfirmaDigital.LigaTimer(Sender: TObject; var Done: Boolean); // liga o timer ao ficar ocioso
begin
  TimeClose.Enabled := True;
end;

procedure TfrmConfirmaDigital.DesligaTimer(var MSG: tagMSG; var Handled: Boolean); // desliga o timer ao entrar em atividade
begin
  TimeClose.Enabled := False;
end;


end.


