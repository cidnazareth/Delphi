unit uCapturar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, OleCtrls, AXCtrls, ActiveX,
  DPFPDevXLib_TLB, DPFPCtlXLib_TLB, DPFPShrXLib_TLB, StdCtrls,
  OleServer;

   //,

type
  TfrmCapturar = class(TForm)
    btClose: TButton;
    DPFPEnrollmentControl1: TDPFPEnrollmentControl;
    procedure btCloseClick(Sender: TObject);
    procedure DPFPEnrollmentControl1Enroll(ASender: TObject;
      lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
    procedure FormShow(Sender: TObject);
    procedure DPFPEnrollmentControl1Complete(ASender: TObject;
      const pSerialNumber: WideString; lEnrolledFinger: Integer);

  private
    FPGetImage: TDPFPSampleConversion;
  public
    { Public declarations }
  end;

var
  frmCapturar: TfrmCapturar;

implementation

{$R *.dfm}

uses DPFPGlobal, uPrincipal;

procedure TfrmCapturar.btCloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmCapturar.DPFPEnrollmentControl1Enroll(ASender: TObject;
  lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
var
  oDPFPTemplate: DPFPTemplate;
  oVariant: Variant;

  i, iVariantType: Integer;

  rawDataSize: integer;
  aryLow : integer;
  aryHigh : integer;
  vtByteBuf : PByteArray;

begin


  oDPFPTemplate := pTemplate as DPFPTemplate;



  //Before saving data to database you will need to get the raw data (variant)
  try
    oVariant := oDPFPTemplate.Serialize;
    //iVariantType := VarType(oVariant);

    //Now that you have the variant, try to get raw byte array
    //We are assuming here that you cannot save a variant directly to database field
    //That you need a byte array
    aryLow := VarArrayLowBound(oVariant,1);
    aryHigh := varArrayHighBound(oVariant,1);
    aryHigh := aryHigh - aryLow;

    vtByteBuf := VarArrayLock(oVariant);  //lock down the array

    for i := 0 to Pred(aryHigh) do
      fpData[i] := vtByteBuf[i];

    VarArrayUnlock(oVariant);
    //Save fpData to database here
    //Database logic is not provided here.  Plenty examples on web on
    //How to save a byte array to database.

  except
    on E: Exception do
      ShowMessage('Trouble saving data');
  end;

  //This section would be in a different form or part of your application.
  //So just pretend that the user is at a login screen

  //Before verification or user login you will need to read the user's fingerprint template from database

  //Database logic not included

  //Once you get the raw data (here we are just reusing the fpData as opposed
  //To actually loading it from a database) you will need to create a variant array.

  rawDataSize := High(fpData) - Low(fpData); //Obviously this would be set to actual data length
  oVariant := VarArrayCreate([0,rawDataSize],varByte);
  vtByteBuf := VarArrayLock(oVariant);

  for i := 0 to rawDataSize - 1 do
    vtByteBuf[i] := fpData[i];

  VarArrayUnlock(oVariant);

  //Then recreate a DPFPTemplate object by just calling Deserialize(yourvariant)
  //oDPFPTemplateDeserialization.Deserialize(oVariant);

  showmessage('Gravado com sucesso.');

end;



procedure TfrmCapturar.FormShow(Sender: TObject);
begin
  DPFPEnrollmentControl1.EnrolledFingersMask := 48;
  DPFPEnrollmentControl1.MaxEnrollFingerCount := 10;
end;


procedure TfrmCapturar.DPFPEnrollmentControl1Complete(ASender: TObject;
  const pSerialNumber: WideString; lEnrolledFinger: Integer);
begin
    showmessage('Complete');
end;

end.
