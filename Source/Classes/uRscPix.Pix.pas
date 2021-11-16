unit uRscPix.Pix;

interface
  uses
    System.Classes,
    System.SysUtils,
    uRscPix.Tipos, uRscPix.Validations, uRscPix.funcoes;

type

  TTPix = class(TPersistent)
    private
      FChavePix: string;
      FTipoChavePix: TTipoChavePIX;
      FNomeTitularConta: string;
      FCidadeTitularConta: string;
      procedure SetChavePix(const Value: string);
      procedure SetTipoChavePix(const Value: TTipoChavePIX);
      procedure SetNomeTitularConta(const Value: string);
      procedure SetCidadeTitularConta(const Value: string);
    published
      property ChavePix:  string read FChavePix write SetChavePix;
      property TipoChavePix:  TTipoChavePIX read FTipoChavePix write SetTipoChavePix;
      property NomeTitularConta : string read FNomeTitularConta write SetNomeTitularConta;
      property CidadeTitularConta : string read FCidadeTitularConta write SetCidadeTitularConta;
  end;

implementation

{ TPix }

procedure TTPix.SetChavePix(const Value: string);
begin
  case TipoChavePix of
    tcCPF:
      begin
        if IsCPF(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave Pix informada n�o � um CFP v�lido.');
          end;
      end;
    tcCNPJ:
      begin
        if IsCNPJ(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave Pix informada n�o � um CNPJ v�lido.');
          end;
      end;
    tcTelefone:
      begin
        if IsCelular(Value) then
          begin
            FChavePIX := GetStrNumber(Value);
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave Pix informada n�o � um N� de TELEFONE v�lido.');
          end;
      end;
    tcEmail:
      begin
        if IsEMail(Value) then
          begin
            FChavePIX := Value;
          end
        else
          begin
            FChavePIX := EmptyStr;
            raise Exception.Create('A Chave Pix informada n�o � um E-MAIL v�lido.');
          end;
      end;
    tcAleatoria:
      begin
        FChavePIX := Value;
      end;
  end;
end;


procedure TTPix.SetCidadeTitularConta(const Value: string);
begin
  if length(Value) > 15 then
    raise Exception.Create('O Nome da Cidade N�o Pode Ultrapassar 15 Caracteres')
  else
    if length(Value) < 3 then
      raise Exception.Create('Nome Para Cidade Informado � muito Curto')
    else
      FCidadeTitularConta := Value;
end;

procedure TTPix.SetNomeTitularConta(const Value: string);
begin
  if length(Value) < 10 then
    raise Exception.Create('Nome Informado Para o Titular � Muito Curto, Informe o Nome Completo do T�tular da Conta')
  else
    FNomeTitularConta := Value;
end;

procedure TTPix.SetTipoChavePix(const Value: TTipoChavePIX);
begin
  FTipoChavePix := Value;
end;

end.
