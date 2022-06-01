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

unit uRscPix.Tipos;

interface

type

  TTipoPSP      = (pspSicredi, pspBancoDoBrasil, pspBradesco,pspSantander,pspSicoob, pspGerencianet);
  TTipoChavePIX = (tcCPF, tcCNPJ, tcTelefone, tcEmail, tcAleatoria);
  TTipoQrCode   = (tqDinamico, tqEstatico);
  TTipoAmbiente = (taSandBox,taHomologacao,taProducao);
  TTipoPessoa   = (pFisica, pJuridica);

implementation

end.
