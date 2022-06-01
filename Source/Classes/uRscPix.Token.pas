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
unit uRscPix.Token;

interface

type
  TTToken  = class
  private
    FAcessToken: string;
    FTokenType: string;
    FExpires_in: Integer;
    procedure SetAcessToken(const Value: string);
    procedure SetExpires_in(const Value: Integer);
    procedure SetTokenType(const Value: string);

  published

    property Expires_in            : Integer read FExpires_in write SetExpires_in;
    property AcessToken            : string read FAcessToken write SetAcessToken;
    property TokenType             : string read FTokenType write SetTokenType;

  end;

implementation

{ TTPixCobranca }

procedure TTToken.SetAcessToken(const Value: string);
begin
  FAcessToken := Value;  
end;

procedure TTToken.SetExpires_in(const Value: Integer);
begin
  FExpires_in := Value;
end;

procedure TTToken.SetTokenType(const Value: string);
begin
  FTokenType := Value;
end;

end.
