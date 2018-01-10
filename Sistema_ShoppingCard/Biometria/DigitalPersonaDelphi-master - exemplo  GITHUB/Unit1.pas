unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, StdCtrls, ComCtrls,
  DPFPCtlXLib_TLB, DPFPDevXLib_TLB, DPFPShrXLib_TLB, DPFPEngXLib_TLB,
  OleCtrls;

type

  TForm1 = class(TForm)
    Status: TRichEdit;
    DPFPCapture1: TDPFPCapture;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPFPCapture1ReaderDisconnect(ASender: TObject;
      const ReaderSerNum: WideString);

  private
    { Private declarations }
    procedure ReportStatus(Str:string);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin


 DPFPCapture1.StartCapture;


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  DPFPCapture1.StopCapture;
  
end;


procedure TForm1.ReportStatus(Str:string);
begin
  status.Lines.Add(Str);
end;


procedure TForm1.DPFPCapture1ReaderDisconnect(ASender: TObject;
  const ReaderSerNum: WideString);
begin
   ReportStatus ('The fingerprint reader was disconnected.');
end;

end.

