unit uRscPix.Pix.Cobranca;

interface
  uses
    uRscPix.Tipos;

type
  TTPixCobranca  = class
  private
    FE2eid: string;
    FDuracaoMinutos: integer;
    FValor: Currency;
    FTXIDDev: String;
    FTipoQRCode: TTipoQrCode;
    FMensagem: String;
    FTXID: String;
    procedure SetDuracaoMinutos(const Value: integer);
    procedure SetE2eid(const Value: string);
    procedure SetMensagem(const Value: String);
    procedure SetTipoQRCode(const Value: TTipoQrCode);
    procedure SetTXID(const Value: String);
    procedure SetTXIDDev(const Value: String);
    procedure SetValor(const Value: Currency);

  published

    property Mensagem            : String read FMensagem write SetMensagem;
    property Valor               : Currency read FValor write SetValor;
    property DuracaoMinutos      : integer read FDuracaoMinutos write SetDuracaoMinutos Default 30;
    property TipoQRCode          : TTipoQrCode read FTipoQRCode write SetTipoQRCode;
    property TXID                : String read FTXID write SetTXID;
    property TXIDDev             : String read FTXIDDev write SetTXIDDev;
    property E2eid               : string read FE2eid write SetE2eid;

  end;

implementation

{ TTPixCobranca }

procedure TTPixCobranca.SetDuracaoMinutos(const Value: integer);
begin
  FDuracaoMinutos := Value;
end;

procedure TTPixCobranca.SetE2eid(const Value: string);
begin
  FE2eid := Value;
end;

procedure TTPixCobranca.SetMensagem(const Value: String);
begin
  FMensagem := Value;
end;

procedure TTPixCobranca.SetTipoQRCode(const Value: TTipoQrCode);
begin
  FTipoQRCode := Value;
end;

procedure TTPixCobranca.SetTXID(const Value: String);
begin
  FTXID := Value;
end;

procedure TTPixCobranca.SetTXIDDev(const Value: String);
begin
  FTXIDDev := Value;
end;

procedure TTPixCobranca.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
