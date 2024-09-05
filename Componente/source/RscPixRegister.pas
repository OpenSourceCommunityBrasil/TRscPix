unit RscPixRegister;

interface

uses
  SysUtils, Classes, RscPix;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RSC-PIX', [TRscPix]);
end;

end.
