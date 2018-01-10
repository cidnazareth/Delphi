unit uMensagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg, Buttons;

type
  TfrmMensagens = class(TForm)
    RichEdit1: TRichEdit;
    BtnSair: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Label20: TLabel;
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}


procedure TfrmMensagens.BtnSairClick(Sender: TObject);
begin
    FrmMensagens.Close;
end;

end.
