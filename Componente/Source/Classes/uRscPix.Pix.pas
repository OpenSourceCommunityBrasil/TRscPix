{=======================================}
{             RSC SISTEMAS              }
{        SOLUÇÕES TECNOLÓGICAS          }
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
{ Versão Original RSC SISTEMAS          }
{ Versão: 3.0.0                         }
{                                       }
{ Faça uma  doação:                     }
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

unit uRscPix.Pix;

interface
  uses
    System.Classes,
    System.SysUtils,
    uRscPix.Tipos, uRscPix.Validations, uRscPix.funcoes;

type


  TDadosTitularPix = class(TPersistent)
    private
      FChavePix: string;
      FTipoChavePix: TTipoChavePIX;
      FNomeTitularConta: string;
      FCidadeTitularConta: string;
      FDuracaoMinutos: integer;
      FTipoQRCode: TTipoQrCode;

      procedure SetChavePix(const Value: string);
      procedure SetTipoChavePix(const Value: TTipoChavePIX);
      procedure SetNomeTitularConta(const Value: string);
      procedure SetCidadeTitularConta(const Value: string);
    published
      property ChavePix:  string read FChavePix write SetChavePix;
      property TipoChavePix:  TTipoChavePIX read FTipoChavePix write SetTipoChavePix;
      property NomeTitularConta : string read FNomeTitularConta write SetNomeTitularConta;
      property CidadeTitularConta : string read FCidadeTitularConta write SetCidadeTitularConta;
      property DuracaoMinutos      : integer read FDuracaoMinutos write FDuracaoMinutos Default 30;
      property TipoQRCode          : TTipoQrCode read FTipoQRCode write FTipoQRCode;
  end;

implementation

{ TPix }

procedure TDadosTitularPix.SetChavePix(const Value: string);
begin
  FChavePIX := Value;
end;


procedure TDadosTitularPix.SetCidadeTitularConta(const Value: string);
begin
  if length(Value) > 15 then
    raise Exception.Create('O Nome da Cidade Não Pode Ultrapassar 15 Caracteres')
  else
    if length(Value) < 3 then
      raise Exception.Create('Nome Para Cidade Informado é muito Curto')
    else
      FCidadeTitularConta := Value;
end;

procedure TDadosTitularPix.SetNomeTitularConta(const Value: string);
begin
  if length(Value) < 10 then
    raise Exception.Create('Nome Informado Para o Titular é Muito Curto, Informe o Nome Completo do Títular da Conta')
  else
    FNomeTitularConta := Value;
end;

procedure TDadosTitularPix.SetTipoChavePix(const Value: TTipoChavePIX);
begin
  FTipoChavePix := Value;
end;

end.
