unit uCadConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, DBXpress, DB, SqlExpr, ExtCtrls, Menus,
  ELibFnc, ECmpCol, Buttons, jpeg, FileCtrl;

type
  TfrmCadConfig = class(TForm)
    btnOk: TButton;
    Label1: TLabel;
    EdLinha01: TEdit;
    GroupBox2: TGroupBox;
    EdNomeArqIni: TEdit;
    Bevel1: TBevel;
    BtnSair: TBitBtn;
    Label2: TLabel;
    EdLinha03: TEdit;
    Image1: TImage;
    Label20: TLabel;
    OpenDialog1: TOpenDialog;
    sbLocalizaPathDB: TSpeedButton;
    Label3: TLabel;
    EdLinha04: TEdit;
    sbLocalizaPathImg: TSpeedButton;
    Label4: TLabel;
    EdLinha02: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbLocalizaPathDBClick(Sender: TObject);
    procedure sbLocalizaPathImgClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaConfig();
  public
    { Public declarations }
    Linha01:string;
    Linha02:string;
    Linha03:string;
    Linha04:string;
  end; 
var
  frmCadConfig: TfrmCadConfig;

implementation

uses uDmGlobal;

{$R *.dfm}
  
procedure TfrmCadConfig.btnOkClick(Sender: TObject);
Var
   Arquivo: TIniFile;
begin
   try
      Linha01  := stralltrim(EdLinha01.Text);
      Linha02  := stralltrim(EdLinha02.Text);
      Linha03  := stralltrim(EdLinha03.Text);
      Linha04  := stralltrim(EdLinha04.Text);

      //Cria Arquivo
      Arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName) + EdNomeArqIni.Text  +'.ini');
      with Arquivo do
         begin
            //Grava o conteudo escrito no Edit no arquivo .ini
            WriteString('DADOS','LINHA01', dmGlobal.Encrypt(Linha01));
            WriteString('DADOS','LINHA02', dmGlobal.Encrypt(Linha02));
            WriteString('DADOS','LINHA03', dmGlobal.Encrypt(Linha03));
            WriteString('DADOS','LINHA04', dmGlobal.Encrypt(Linha04));

         end;
      Arquivo.Free;
      Showmessage('ARQUIVO CRIADO COM SUCESSO !');
   Except
      showmessage('ERRO AO CRIAR O ARQUIVO !');
   end;
end;


procedure TfrmCadConfig.BtnSairClick(Sender: TObject);
begin
  if MessageDlg('Confirma fechamento do CADASTRO DE CONFIGURAÇÕES ?', mtconfirmation, [mbno, mbyes], 0) = mrNo then
       exit;

   FrmCadConfig.close;
end;

procedure TfrmCadConfig.FormShow(Sender: TObject);
begin
   CarregaConfig();
end;


procedure TfrmCadConfig.CarregaConfig();
var
   Arquivo : TIniFile;
begin
   Arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Config.ini');
   EdLinha01.text := dmGlobal.Decrypt(Arquivo.ReadString('DADOS','LINHA01',''));
   EdLinha02.text := dmGlobal.Decrypt(Arquivo.ReadString('DADOS','LINHA02',''));
   EdLinha03.text := dmGlobal.Decrypt(Arquivo.ReadString('DADOS','LINHA03',''));
   EdLinha04.text := dmGlobal.Decrypt(Arquivo.ReadString('DADOS','LINHA04',''));
end;


procedure TfrmCadConfig.sbLocalizaPathDBClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EdLinha03.Text := OpenDialog1.FileName;
end;

procedure TfrmCadConfig.sbLocalizaPathImgClick(Sender: TObject);
var
  options : TSelectDirOpts;
  chosenDirectory : string;
begin
  chosenDirectory := 'C:\';
  if selectdirectory(chosenDirectory, options, 0) then
    EdLinha04.Text:=chosenDirectory;

end;

end.
