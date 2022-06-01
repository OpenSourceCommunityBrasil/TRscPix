{=======================================}
{             RSC SISTEMAS              }
{        SOLU«’ES TECNOL”GICAS          }
{         rscsistemas.com.br            }
{          +55 92 4141-2737             }
{      contato@rscsistemas.com.br       }
{                                       }
{ Desenvolvidor por:                    }
{   Roniery Santos Cardoso              }
{     ronierys2@hotmail.com             }
{     +55 92 984391279                  }
{                                       }
{                                       }
{ Vers„o Original RSC SISTEMAS          }
{ Vers„o: 3.0.0                         }
{                                       }
{ FaÁa uma  doaÁ„o:                     }
{ Pix - Email: ronierys2@hotmail.com    }
{ Banco: NuBank                         }
{                                       }
{                                       }
{                                       }
{ Componente TRscPix                    }
{ Componente OpenSource                 }
{ license Apache-2.0                    }
{                                       }
{=======================================}
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

    ,DelphiZXingQRCode, System.DateUtils
    ,Winapi.Windows
//    ,uniImage
    ;


  function TirarAcentoE(Texto: string): widestring;

  function StrZero(Numero: string; Quant: integer): String;

  function CRC16CCITT(texto: string): WORD;

  function ZeroAEsquerda(Numero: string): string;

  function MD5(const texto:string):string;

  procedure QRCodeWin(imgQRCode: TImage; texto: string); overload;

//  procedure QRCodeWin(imgQRCode: TUniImage; texto: string); overload;

  function ExRight(Value, str: string): string;

  function StreamFromBase64(sBase64: string):  TMemoryStream;

  function GetStrNumber(const S: string): string;

  function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean = False) : string ;


implementation

function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean) : string ;
const
  SDateFormat   : string = 'yyyy''-''mm''-''dd''T''hh'':''nn'':''ss''.''zzz';
  SOffsetFormat : string = '%s%s%.02d:%.02d';
  Neg           : array[Boolean] of string = ('+', '-');
var
  Bias: Integer;
  TimeZone: TTimeZone ;
begin
  Result := FormatDateTime(SDateFormat, ADate);

  if AInputIsUTC then
    begin
      TimeZone := TTimeZone.Local ;
      Bias := Trunc(TimeZone.GetUTCOffset(ADate).Negate.TotalMinutes) ;
      if Bias <> 0 then
        begin
          SetLength(Result, Result.Length - 1);
          Result := Format(SOffsetFormat, [Result, Neg[Bias > 0], (Abs(Bias) div MinsPerHour), (Abs(Bias) mod MinsPerHour)]);
        end;
    end
  else
    begin
      Result  :=  Result  + 'Z';
    end;


end;

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

//procedure QRCodeWin(imgQRCode: TUniImage; texto: string);
//var
//  QRCode: TDelphiZXingQRCode;
//  Row, Column: Integer;
//begin
//  QRCode := TDelphiZXingQRCode.Create;
//  try
//    QRCode.Data := texto;
//    QRCode.Encoding := TQRCodeEncoding.qrUTF8BOM;
//    QRCode.QuietZone := 4;
//    imgQRCode.Picture.Bitmap.SetSize(QRCode.Rows, QRCode.Columns);
//    for Row := 0 to QRCode.Rows - 1 do
//    begin
//      for Column := 0 to QRCode.Columns - 1 do
//      begin
//        if (QRCode.IsBlack[Row, Column]) then
//        begin
//          imgQRCode.Picture.Bitmap.Canvas.Pixels[Column, Row] := clBlack;
//        end else
//        begin
//          imgQRCode.Picture.Bitmap.Canvas.Pixels[Column, Row] := clWhite;
//        end;
//      end;
//    end;
//  finally
//    QRCode.Free;
//  end;
//end;

procedure QRCodeWin(imgQRCode: TImage; texto: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  QRCode := TDelphiZXingQRCode.Create;
  try
    QRCode.Data := texto;
    QRCode.Encoding := TQRCodeEncoding.qrUTF8BOM;
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

function TirarAcentoE(Texto: string): widestring;
const
  ComAcentuacao = ' &‡·‚„‰ËÈÍÎÏÌÓÔÚÛÙıˆ˘˙˚¸Á¿¡¡¬√ƒ»… ÀÃÕŒœ“”‘’÷Ÿ⁄€‹««`¥™∞∫™«⁄,<>'+'''';
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
