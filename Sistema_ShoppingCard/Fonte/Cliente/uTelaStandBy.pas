unit uTelaStandBy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,ELibFNC;

type
  TfrmTelaStandBy = class(TForm)
    imgStandBy: TImage;
    tmStandBy: TTimer;
    procedure tmStandByTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure selecionaImagem();
    procedure exibeImagem();
  public
    { Public declarations }
  end;

var
  frmTelaStandBy: TfrmTelaStandBy;

implementation

uses uDmCliente;

{$R *.dfm}

procedure TfrmTelaStandBy.selecionaImagem;
begin
   with dmCliente do begin
      cdsImgStandBy.next;
      if cdsImgStandBy.eof then begin
         cdsImgStandBy.first;
      end;
      exibeImagem();
   end;
end;

procedure TfrmTelaStandBy.tmStandByTimer(Sender: TObject);
begin
   tmStandBy.Enabled := false;
   selecionaImagem();
end;

procedure TfrmTelaStandBy.FormShow(Sender: TObject);
begin
   dmCliente.cdsImgStandBy.Open;
   dmCliente.cdsImgStandBy.first;
   exibeImagem();
end;

procedure TfrmTelaStandBy.exibeImagem;
var
    PathImg : string;
begin
   tmStandBy.Interval := dmCliente.cdsImgStandByTEMPO_EXIBICAO.AsInteger * 1000;
   PathImg            := dmCliente.cdsImgStandByPATH_IMAGEM.AsString;
   if isfile(PathImg) then
      imgStandBy.Picture.LoadFromFile(PathImg);
   tmStandBy.Enabled  := true;
end;

procedure TfrmTelaStandBy.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   frmTelaStandBy.Close;
end;

end.
