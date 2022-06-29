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

unit uRscPix.Desenvolvedor;

interface

  uses
    System.Classes;

type

  TDeveloperSettings = class(TPersistent)
    private
      FClient_ID: String;
      FClient_Secret: String;
      FApplication_key: String;
      procedure SetApplication_key(const Value: String);
      procedure SetClient_ID(const Value: String);
      procedure SetClient_Secret(const Value: String);
    published
      property Application_key  : String read FApplication_key write SetApplication_key;
      property Client_ID        : String read FClient_ID write SetClient_ID;
      property Client_Secret    : String read FClient_Secret write SetClient_Secret;
  end;

implementation

{ TDeveloperSettings }

procedure TDeveloperSettings.SetApplication_key(const Value: String);
begin
  FApplication_key := Value;
end;

procedure TDeveloperSettings.SetClient_ID(const Value: String);
begin
  FClient_ID := Value;
end;

procedure TDeveloperSettings.SetClient_Secret(const Value: String);
begin
  FClient_Secret := Value;
end;

end.
