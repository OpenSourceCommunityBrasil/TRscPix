{=======================================}
{             RSC SISTEMAS              }
{        SOLU��ES TECNOL�GICAS          }
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
{ Vers�o Original RSC SISTEMAS          }
{ Vers�o: 3.0.0                         }
{                                       }
{ Fa�a uma  doa��o:                     }
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
unit uRsc.funcoes;
interface
  uses
    Vcl.Graphics
    ,DelphiZXingQRCode
    ,uniImage
    ;


  procedure QRCodeWin(imgQRCode: TUniImage; texto: string); overload;


implementation


procedure QRCodeWin(imgQRCode: TUniImage; texto: string);
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


end.
