unit uDmGlobal;

interface

uses
  SysUtils, Dialogs, Classes, DBXpress, FMTBcd, DB, SqlExpr, Provider, DBClient,
  Forms, IniFiles;

type
  TdmGlobal = class(TDataModule)
    SQLConnecShopCard: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
    function IsValidEmail(const Value: string): Boolean;
    procedure CarregaTelaConfig();
    procedure CarregaConfig();
    function Encrypt(const S: String): String;
    function Decrypt(const S: ShortString): String;
  end;

var
  dmGlobal: TdmGlobal;
  PathBase: string;
implementation

uses uCadConfig, uPrincipal;

{$R *.dfm}

function TdmGlobal.IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
  if Expressao then
     Result := ParteTRUE
  else
     Result := ParteFALSE;
end;

function TdmGlobal.IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

procedure TdmGlobal.CarregaTelaConfig();
begin
   try
      Application.CreateForm(TfrmCadConfig,frmCadConfig);
      frmCadConfig.ShowModal;
   finally
      frmCadConfig.free;
      frmCadConfig := nil;
   end;
end;


procedure TdmGlobal.DataModuleCreate(Sender: TObject);
begin
  try
      if not FileExists('Config.ini') then
        CarregaTelaConfig();
  finally

        CarregaConfig();

        SQLConnecShopCard.Params.Values['DataBase'] := frmPrincipal.gPathBase;
        SQLConnecShopCard.Connected := True;
  end;
end;


procedure TdmGlobal.CarregaConfig();
var
   Arquivo : TIniFile;
begin
   Arquivo := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'Config.ini');
   frmPrincipal.gIdTerminal := StrtoInt('0' + Decrypt(Arquivo.ReadString('DADOS','LINHA01','')));
   frmPrincipal.gIdShopping := StrtoInt('0' + Decrypt(Arquivo.ReadString('DADOS','LINHA02','')));
   frmPrincipal.gPathBase   := Decrypt(Arquivo.ReadString('DADOS','LINHA03',''));
   frmPrincipal.gPathImagem := Decrypt(Arquivo.ReadString('DADOS','LINHA04',''));
   Arquivo.Free;
end;


function TdmGlobal.Encrypt(const S: String): String;
var
   I: byte;
   Key: Word;
const
  { Constantes que irão ser utilizadas nos cálculos das rotinas de criptografia e podendo ser alteradas.}
  C1 = 52829;
  C2 = 29719;
begin
   Key := 6598;
   Result := '';
   for I := 1 to Length(S) do
   begin
      Result := Result + IntToHex(byte(char(byte(S[I]) xor (Key shr 8))), 2);
      Key := (byte(char(byte(S[I]) xor (Key shr 8))) + Key) * C1 + C2;
   end;
end;


function TdmGlobal.Decrypt(const S: ShortString): String;
var
  I: byte;
  x: char;
  Key: Word;
const
  { Constantes que irão ser utilizadas nos cálculos das rotinas de criptografia e podendo ser alteradas.}
  C1 = 52829;
  C2 = 29719;

begin
  Key := 6598;
  result := '';
  i := 1;
  while (i < Length(S)) do
  begin
    x := char(strToInt('$' + Copy(s, i, 2)));
    Result := result + char(byte(x) xor (Key shr 8));
    Key := (byte(x) + Key) * C1 + C2;
    Inc(i, 2);
  end;
end; 
end.
