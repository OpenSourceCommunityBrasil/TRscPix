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
unit uRscPix.Localizacao;

interface

type

  TLocalizacao = class
  private
    FId       : Integer;
    FLocation : string;
    FTipoCob  : string;
  public
    property Id         : Integer read FId        write FId;
    property Location   : string  read FLocation  write FLocation;
    property TipoCob    : string  read FTipoCob   write FTipoCob;
  end;

implementation

end.
