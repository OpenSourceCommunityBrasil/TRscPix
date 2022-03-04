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

unit uRscPix.Recebedor;

interface

type

  TTRecebedor = class
  private
      Fcpf        : String;
      Fcnpj       : String;
      Fnome       : String;
      Flogradouro : String;
      Fcidade     : String;
      FUF         : String;
      FCEP        : String;
  public
      property cpf         : String read Fcpf        write Fcpf;
      property cnpj        : String read Fcnpj       write Fcnpj;
      property nome        : String read Fnome       write Fnome;
      property logradouro  : String read Flogradouro write Flogradouro;
      property cidade      : String read Fcidade     write Fcidade;
      property UF          : String read FUF         write FUF;
      property CEP         : String read FCEP        write FCEP;
  end;

implementation

end.
