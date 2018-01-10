unit uBlobImageFB;

interface

uses Jpeg, Graphics,ExtDlgs,Classes,DB,SysUtils,ExtCtrls,Dialogs,Consts;

type
   TTipoImagem = (tiBitmap, tiJpeg);

   procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String;
ImageExibicao : TImage);
   procedure GravaFoto(DataSet : TDataSet; BlobFieldName, FileName :
String);
   procedure ExcluiFoto(DataSet : TDataSet; BlobFieldName : String;
ImageExibicao : TImage);
   procedure ExportaFoto(DataSet : TDataSet; BlobFieldName, FileName :
String; TipoImagem : TTipoImagem);

implementation

procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String;
ImageExibicao : TImage);
var
BlobStream : TStream;
JpegImage : TJPEGImage;
bitmap:TBitMap;
begin
    BlobStream :=
DataSet.CreateBlobStream(DataSet.FieldByname(BlobFieldName), bmRead);
    if BlobStream.Size <> 0 then
    begin
        JpegImage  := TJPEGImage.Create;
        try
          JpegImage.LoadFromStream(BlobStream);
          ImageExibicao.Picture.Assign(JpegImage);
          ImageExibicao.Center:=true;
        finally
          BlobStream.Free;
          JpegImage.Free;
        end;
    end
    else
    begin
        Bitmap:=TBitMap.Create;
        Try
            Bitmap.Width:=1;
            Bitmap.Height:=1;
            ImageExibicao.Picture.Assign(BitMap);
            ImageExibicao.Center:=false;
        finally
            Bitmap.Free;
            BlobStream.Free;
        end;
    end;
end;

procedure GravaFoto(DataSet : TDataSet; BlobFieldName, FileName : String);
var
ext : string;
JpegImage : TJPEGImage;
bitmap:TBitMap;
begin
    if (DataSet.State in [dsEdit,dsInsert]) then
    begin
        ext := UpperCase(ExtractFileExt(FileName));
        if (ext <> '.BMP') and (ext <> '.JPG') and (ext <> '.JPEG') then
        begin
            raise EAccessViolation.Create('Formato de imagem não suportado! Formato suportado: Jpeg ou Bitmap');
            Abort;
        end;
        try
            JpegImage := TJpegImage.Create;
            Bitmap := TBitmap.Create;
            if (ext = '.BMP') then
            begin
                Bitmap.LoadFromFile(FileName);
                JpegImage.Assign(Bitmap);
                JpegImage.Compress;
            end
            else
            begin
                JpegImage.LoadFromFile(FileName);
            end;
            JpegImage.SaveToFile('FIGURA.JPG');
            (DataSet.FieldByName(BlobFieldName) as TBlobField).LoadFromFile('FIGURA.JPG');
        finally
            Bitmap.Free;
            JpegImage.Free;
        end;
    end;
end;

procedure ExcluiFoto(DataSet : TDataSet; BlobFieldName : String;
ImageExibicao : TImage);
var
bitmap:TBitMap;
begin
    if (DataSet.State in [dsEdit,dsInsert]) and
not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then
    begin
        (DataSet.FieldByName(BlobFieldName) as TBlobField).Clear; // para limpar o TImage use // Image1.Picture := Nil;
        Bitmap:=TBitMap.Create;
        Try
            Bitmap.Width:=1;
            Bitmap.Height:=1;
            ImageExibicao.Picture.Assign(BitMap);
            ImageExibicao.Center:=false;
        finally
            Bitmap.Free;
        end;
    end;
end;

procedure ExportaFoto(DataSet : TDataSet; BlobFieldName, FileName : string;
TipoImagem : TTipoImagem);
begin
    // SERÁ IMPLEMENTADO FUTURAMENTE // ME FALTA TEMPO :)

end;

end.

