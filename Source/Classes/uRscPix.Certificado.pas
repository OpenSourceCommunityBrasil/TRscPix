unit uRscPix.Certificado;

interface

  uses
    System.Classes;

type
  TCertified = class(TPersistent)
    private
      FDirectoryCertifiedKey: string;
      FDirectoryCertified: string;
      procedure SetDirectoryCertified(const Value: string);
      procedure SetDirectoryCertifiedKey(const Value: string);
    published
      property DiretorioCertificado : string read FDirectoryCertified write SetDirectoryCertified;
      property DiretorioCertificadoSenha  : string read FDirectoryCertifiedKey write SetDirectoryCertifiedKey;
  end;

implementation

{ TCertified }

procedure TCertified.SetDirectoryCertified(const Value: string);
begin
  FDirectoryCertified := Value;
end;

procedure TCertified.SetDirectoryCertifiedKey(const Value: string);
begin
  FDirectoryCertifiedKey := Value;
end;

end.
