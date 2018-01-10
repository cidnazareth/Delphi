program DPFPDelphi;

uses
  Forms,
  DPFPGlobal in 'DPFPGlobal.pas',
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uCapturar in 'uCapturar.pas' {frmCapturar},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCapturar, frmCapturar);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
