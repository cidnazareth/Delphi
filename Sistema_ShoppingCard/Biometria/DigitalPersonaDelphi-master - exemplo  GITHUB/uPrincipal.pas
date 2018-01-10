unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btCapture: TButton;
    Button1: TButton;
    procedure btCaptureClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCapturar, DPFPGlobal, Unit1;

procedure TfrmPrincipal.btCaptureClick(Sender: TObject);
begin
  if (frmCapturar = nil) then
    frmCapturar := TfrmCapturar.Create(self);

  frmCapturar.ShowModal;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
    if (Form1 = nil) then
    Form1 := TForm1.Create(self);

  Form1.ShowModal;
end;

end.
