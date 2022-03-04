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

unit uRscPix.Certificado;

interface

  uses
    System.Classes,
    IdSSLOpenSSL;

type
  TSecurityConnection = class(TPersistent)
    private
      FCertKeyFile: string;
      FCertFile: string;
      FUseSSL,
      FVerifyCert       : Boolean;
      FSSLVersions      : TIdSSLVersions;

    published
      property CertFile                   : string                    Read FCertFile            Write FCertFile;
      property CertKeyFile                : string                    Read FCertKeyFile         Write FCertKeyFile;
      Property SSLVersions                : TIdSSLVersions            Read FSSLVersions         Write FSSLVersions;
      Property VerifyCert                 : Boolean                   Read FVerifyCert          Write FVerifyCert default True;
      Property UseSSL                     : Boolean                   Read FUseSSL              Write FUseSSL default True;
  end;

implementation


end.
