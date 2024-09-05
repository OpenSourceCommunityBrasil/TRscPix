unit RscPixCertificado;

interface

  uses
    Classes;

type
  TCertificado = class(TPersistent)
    private
      FCertKeyFile: string;
      FCertFile: string;
    procedure SetCertFile(const Value: string);
    procedure SetCertKeyFile(const Value: string);
    public
    published
      property CertFile     : string  Read FCertFile    Write SetCertFile;
      property CertKeyFile  : string  Read FCertKeyFile Write SetCertKeyFile;
  end;

implementation


{ TCertificado }

procedure TCertificado.SetCertFile(const Value: string);
begin
  FCertFile := Value;
end;

procedure TCertificado.SetCertKeyFile(const Value: string);
begin
  FCertKeyFile := Value;
end;

end.


