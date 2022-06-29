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

unit uRscPix.Pix.Cobranca;

interface
  uses
    System.SysUtils,

    uRscPix.Tipos;

type

  TTPixCobranca  = class
  private
    FValor: Currency;
    FMensagem: String;
    FTXID: String;
    FValorToString: String;

    procedure SetMensagem(const Value: String);
    procedure SetTXID(const Value: String);
    procedure SetValor(const Value: Currency);

  public
    property Mensagem            : String read FMensagem write SetMensagem;
    property Valor               : Currency read FValor write SetValor;
    property ValorToString       : String read FValorToString;
    property TXID                : String read FTXID write SetTXID;

  end;

implementation

{ TTPixCobranca }

procedure TTPixCobranca.SetMensagem(const Value: String);
begin
  if (Length(Value) > 140) then
    begin
      raise Exception.Create('O Texto da Mensagem deve ter até 140 caracteres!');
      Exit;
    end;
    
  FMensagem := Value;
end;

procedure TTPixCobranca.SetTXID(const Value: String);
begin
  if Value = '' then
    begin
      raise Exception.Create('O TXID deve ser informado!');
      Exit;
    end;

  if (Length(Value) < 26) or (Length(Value) > 38) then
    begin
      raise Exception.Create('O TXID deve ter entre 26 á 38 caracteres!');
      Exit;
    end;
    
  FTXID := Value;
end;

procedure TTPixCobranca.SetValor(const Value: Currency);
begin
  if Value < 0 then
    begin
      raise Exception.Create('Somente Valores Positivos são válidos!');
      Exit;
    end;

  FValor := Value;

  if FValor > 0 then
    begin
      FValorToString := FormatFloat('#0.00', FValor);

      if Pos(',', FValorToString) > 0 then
         FValorToString := StringReplace(FValorToString,',','.',[rfReplaceAll]);
    end
  else
    FValorToString  :=  '0';
end;

end.
