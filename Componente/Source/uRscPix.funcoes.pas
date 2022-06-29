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
    ,System.DateUtils
    ,Winapi.Windows
    ;


  function TirarAcentoE(Texto: string): widestring;

  function StrZero(Numero: string; Quant: integer): String;

  function CRC16CCITT(texto: string): WORD;

  function MD5(const texto:string):string;

  function GetStrNumber(const S: string): string;

  function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean = False; AZzz: Boolean = False) : string ;


  function codificaURL(Const Url: string): string;


implementation

function codificaURL(Const Url: string): string;
var
  aux : string;
begin

  aux :=  Url;

  {:}
  aux :=  StringReplace(aux, ':', '%3A', [rfReplaceAll]);
  {-}
  aux :=  StringReplace(aux, '-', '%2D', [rfReplaceAll]);

  Result  :=  aux;

end;

function FormatDataPix(const ADate: TDateTime; AInputIsUTC: Boolean = False; AZzz: Boolean = False) : string ;
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
      if AZzz then
        begin
          Result  :=  Copy(Result, 1, Length(Result) - 4)  + 'Z';
        end
      else
        begin
          Result  :=  Result  + 'Z';
        end;
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
