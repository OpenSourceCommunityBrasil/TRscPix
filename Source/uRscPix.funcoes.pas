unit uRscPix.funcoes;

interface

  uses
    System.SysUtils
    ,System.Math
    ,System.UITypes
    ,System.NetEncoding
    ,System.Classes

    ,IdHashMessageDigest

    ,Vcl.ExtCtrls
    ,Vcl.Graphics


    ,DelphiZXingQRCode

    ;




  function TirarAcentoE(Texto: string): widestring;

//  function ExtraiNumero(Texto: String): String;

  function StrZero(Numero: string; Quant: integer): String;

  function CRC16CCITT(texto: string): WORD;

  function ZeroAEsquerda(Numero: string): string;

  function MD5(const texto:string):string;

  procedure QRCodeWin(imgQRCode: TImage; texto: string);

  function ExRight(Value, str: string): string;

  function StreamFromBase64(sBase64: string):  TMemoryStream;

  function GetStrNumber(const S: string): string;

implementation






function GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

function StreamFromBase64(sBase64: string):  TMemoryStream;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(sBase64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    Result  :=  TMemoryStream.Create;
    try
      System.NetEncoding.TBase64Encoding.Base64.Decode(Input, Output);
//      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;


function ExRight(Value, str: string): string;
begin
  if Pos(str, Value) = 0 then
    begin
      Result  :=  EmptyStr;
    end
  else
    begin
      Result  :=  Copy(Value, Pos(str, Value) + 1,  Length(Value));
    end;
end;

procedure QRCodeWin(imgQRCode: TImage; texto: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := texto;
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone := 4;
    imgQRCode.Picture.Bitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
        begin
          imgQRCode.Picture.Bitmap.Canvas.Pixels[Column, Row] := clBlack;
        end else
        begin
          imgQRCode.Picture.Bitmap.Canvas.Pixels[Column, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRCode.Free;
  end;
end;


function MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

function ZeroAEsquerda(Numero: string): string;
begin
    if length(Numero) = 1 then
      Result := '0' + Numero
    else
      Result := Numero;
end;

function CRC16CCITT(texto: string): WORD;
const polynomial = $1021;

var crc: WORD;
    i, j: Integer;
    b: Byte;
    bit, c15: Boolean;
begin
    crc := $FFFF;
    for i := 1 to length(texto) do
    begin
        b := Byte(texto[i]);
        for j := 0 to 7 do
        begin
            bit := (((b shr (7 - j)) and 1) = 1);
            c15 := (((crc shr 15) and 1) = 1);
            crc := crc shl 1;
            if (c15 xor bit) then
              crc := crc xor polynomial;
        end;
    end;
    Result := crc and $FFFF;
end;

function StrZero(Numero: string; Quant: integer): String;
var
  I:integer;
  Retorno : String;
begin
  Retorno := '';
  for I:=1 to quant-Length(Numero) do
    Retorno := Retorno + '0';
  Retorno := Retorno + Numero;
  StrZero := Retorno;
end;

//function ExtraiNumero(Texto: String): String;
//var
//  X : SmallInt;
//  Ret : String;
//begin
//  for X := 1 to Length(Texto) do
//  begin
//    if Pos(Copy(Texto,X,1),'0123456789') > 0 then
//      Ret := Ret + Copy(Texto,X,1);
//  end;
//  Result := Ret;
//end;

function TirarAcentoE(Texto: string): widestring;
const
  ComAcentuacao = ' &àáâãäèéêëìíîïòóôõöùúûüçÀÁÁÂÃÄÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÇÇ`´ª°ºªÇÚ,<>'+'''';
  SemAcentuacao = ' EaaaaaeeeeiiiiooooouuuucAAAAAAEEEEIIIIOOOOOUUUUCC  aooaCU               ';
var
  i : Integer;
begin
  for i :=  1 to Length(Texto) do
    if Pos(Texto[i],  ComAcentuacao) <> 0 then
      Texto[i]  :=  SemAcentuacao[Pos(Texto[i],ComAcentuacao)];

  Result  :=  Trim(Texto);
end;

end.
