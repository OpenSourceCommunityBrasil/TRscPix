unit PIX_Tela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls, ACBrGIF, Data.FMTBcd,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, ACBrBase,
  ACBrPosPrinter, uDWResponseTranslator, uDWAbout, RLPrinters,
  RscPix, uRscPix.Variaveis, uRscPix.funcoes;

Const
 cLoja   = '1';
 LojaSeq = '1';

type
  TfrmPIX_Tela = class(TForm)
    Panel1: TPanel;
    imgLogo: TImage;
    imgQRCODE: TImage;
    btnImprQrCode: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    pbProgress: TProgressBar;
    TimerConsultar: TTimer;
    lblValor: TLabel;
    lblStatus: TLabel;
    ACBrPosPrinterPIX: TACBrPosPrinter;
    Memo1: TMemo;
    RscPix1: TRscPix;
    Label4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprQrCodeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerConsultarTimer(Sender: TObject);
  private
    { Private declarations }
    bRecebido  : Boolean;
    cQrCode,
    cFantasia  : String;
    DtIniConsult : TDatetime;
    DtFimConsult : TDateTime;



  public
    { Public declarations }
    procedure GerarPix;
    procedure AtualizarPix(cStatus : String);
    procedure ConsultaPixPorTXID(dMostraMensagem : Boolean);
    procedure ConsultaListaPixPorPeriodo(dMostraMensagem : Boolean);


  end;

var
  frmPIX_Tela: TfrmPIX_Tela;

implementation

{$R *.dfm}

Function Limpalixo(Value : String) : String;
Begin
 Result := StringReplace(StringReplace(StringReplace(Value, '-', '', [rfReplaceAll]),
                                                            '.', '', [rfReplaceAll]),
                                                            '/', '', [rfReplaceAll]);
End;

procedure TfrmPIX_Tela.btnCancelarClick(Sender: TObject);
begin
  //verificar aqui se foi gerado o PIX
  AtualizarPix('REMOVIDA_PELO_USUARIO_RECEBEDOR');

  if RscPix1.Resultado_Cod <> 0 then
    Close;
end;

procedure TfrmPIX_Tela.btnConfirmarClick(Sender: TObject);
begin
    //aqui vou confirmar o recebimento
    ConsultaPixPorTXID(True);
    if bRecebido = True then
    begin
        RscPix1.RecebidoTagPIX := True;
        Close;
    end
    else
     MessageBox(0, 'Recebimento de PIX não confirmado!', 'Atenção', mb_IconInformation + mb_ok);
end;

procedure TfrmPIX_Tela.ConsultaListaPixPorPeriodo(dMostraMensagem: Boolean);
begin
  RscPix1.ConsultarListaDeCobrancas(DtIniConsult, DtFimConsult);

  if RscPix1.Resultado_Cod = 200 then
  begin
      lblStatus.Caption := 'Situação: ' +  RscPix1.Resultado.status;

      if RscPix1.Resultado.status = 'CONCLUIDA' then
      begin
          //Verificar se Foi Recebido aqui e Ja alterar para Recebido
          if RscPix1.RecebidoTagPIX = True then
          begin
              if Assigned(RscPix1.Resultado.pix) then
              begin
                  bRecebido := True;
              end
              else
               MessageBox(0,'Expirado ou Cancelado!', 'Atenção', mb_IconInformation + mb_ok);
          end
          else
          begin
                bRecebido := True;
          end;
      end;
  end
  else
  begin
      if dMostraMensagem = True then
        MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.ConsultaPixPorTXID(dMostraMensagem : Boolean);
begin
  RscPix1.ConsultarCobranca(RscPix1.PixTXID);

  if RscPix1.Resultado_Cod = 200 then
  begin
      lblStatus.Caption := 'Situação: ' +  RscPix1.Resultado.status;

      if RscPix1.Resultado.status = 'CONCLUIDA' then
      begin
          //Verificar se Foi Recebido aqui e Ja alterar para Recebido
          if RscPix1.RecebidoTagPIX = True then
          begin
              if Assigned(RscPix1.Resultado.pix) then
              begin
                  bRecebido := True;
              end
              else
               MessageBox(0,'Expirado ou Cancelado!', 'Atenção', mb_IconInformation + mb_ok);
          end
          else
          begin
                bRecebido := True;
          end;
      end;

      if RscPix1.Resultado.status = 'ATIVA' then
      begin
        if RscPix1.Resultado.textoImagemQRcode <> '' then
          begin
            Memo1.Text  :=  RscPix1.Resultado.textoImagemQRcode;
            QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
            cQrCode := RscPix1.Resultado.textoImagemQRcode;
          end
        else
          begin
            Memo1.Text  :=  RscPix1.Resultado.location;
            QRCodeWin(imgQRCODE, RscPix1.Resultado.location);
            cQrCode := RscPix1.Resultado.location;
          end;
      end;

    var cValor := StringReplace(RscPix1.Resultado.valor.original, '.', ',', [rfReplaceAll]);
    lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
  end
  else
  begin
      if dMostraMensagem = True then
        MessageBox(0,PChar('Erro ao Consultar o PIX, tente novamente!'  + #13#10  + RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
  end;
end;

procedure TfrmPIX_Tela.btnImprQrCodeClick(Sender: TObject);
var
  mImp  : TStringList;
begin
  try
    if (ACBrPosPrinterPIX.Porta <> '') then
      ACBrPosPrinterPIX.Ativar
    else
      raise Exception.Create('Porta não definida');

    ACBrPosPrinterPIX.CortaPapel    := True;
    ACBrPosPrinterPIX.TraduzirTags  := True;

    //Configurando o QrCOde
    ACBrPosPrinterPIX.configqrcode.Tipo               := 2;
    ACBrPosPrinterPIX.configqrcode.LarguraModulo      := 6;//4;
    ACBrPosPrinterPIX.configqrcode.ErrorLevel         := 0;

    //aplicando
    mImp  := TStringList.Create;
    mImp.Clear;
    mImp.Add('</zera>');
    mImp.Add('</ce>');
    mImp.Add('<a><n>'+cFantasia+'</n></a>');
    mImp.Add('</ce>');
    mImp.Add('<qrcode>'+cQrCode+'</qrcode>');
    mImp.Add('</ce>');
    mImp.Add('<n><e><a>'+lblValor.Caption+'</a></e></n>');
    mImp.Add('</fn>');
    mImp.Add('</ce>');
    mImp.Add('</corte_total>');
    ACBrPosPrinterPIX.Ativar;
    ACBrPosPrinterPIX.Buffer.Text := mImp.Text;
    ACBrPosPrinterPIX.Imprimir;

  finally
    ACBrPosPrinterPIX.Desativar;
    mImp.Free;
  end;
end;

procedure TfrmPIX_Tela.FormCreate(Sender: TObject);
begin
  bRecebido     := False;
  cQrCode   := '';
  cFantasia := '';
  DtIniConsult  :=  IncMonth(now);
  DtFimConsult  :=  Now;

end;

procedure TfrmPIX_Tela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_Escape then
  begin
    Key := 0;
    btnCancelar.SetFocus;
    btnCancelar.Click;
  end;
end;

procedure TfrmPIX_Tela.FormShow(Sender: TObject);
begin
//  Gerar;
  lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',RscPix1.PIXValor);
end;

procedure TfrmPIX_Tela.GerarPix;
var
    cValor : String;
begin
        RscPix1.CriarCobranca;

        if RscPix1.Resultado_Cod = 200 then
        begin
          case RscPix1.PixTipoQRCode of
            tqDinamico:
              begin
                TimerConsultar.enabled := True; {criar uma função interna para fazer essa consulta}
              end;
            tqEstatico:
              begin
                TimerConsultar.enabled := False;
              end;
          end;

            lblStatus.Caption := 'Situação: '+RscPix1.Resultado.status;

            if RscPix1.Resultado.textoImagemQRcode <> '' then
            begin
              Memo1.Text  :=  RscPix1.Resultado.textoImagemQRcode;
              QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
              cQrCode := RscPix1.Resultado.textoImagemQRcode;
            end
            else
            begin
              Memo1.Text  :=  RscPix1.Resultado.location;
              QRCodeWin(imgQRCODE, RscPix1.Resultado.location);
              cQrCode := RscPix1.Resultado.location;
            end;

            cValor := StringReplace(RscPix1.Resultado.valor.original, '.', ',', [rfReplaceAll]);
            lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
        end
        else
        begin
            lblStatus.Caption  := 'Situação: Erro ao Gerar';
            MessageBox(0, PChar('Erro ao Gerar PIX, tente novamente!'#13#10+RscPix1.Retorno), 'Atenção', MB_ICONERROR + mb_ok);
        end;
end;



procedure TfrmPIX_Tela.TimerConsultarTimer(Sender: TObject);
begin
    TimerConsultar.enabled := False;
    ConsultaPixPorTXID(True);
    if bRecebido = True then
      begin
        Close;
      end
    else
        TimerConsultar.enabled := True;
end;

procedure TfrmPIX_Tela.AtualizarPix(cStatus:String);
var
    cValor : String;
begin

        RscPix1.RevisarCobranca(RscPix1.PixTXID,cStatus);//Gerando uma Cobrança

        if RscPix1.Resultado_Cod = 200 then
        begin
            if RscPix1.Resultado.textoImagemQRcode <> '' then
            begin
              QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
                cQrCode := RscPix1.Resultado.textoImagemQRcode;
            end
            else
            begin
              QRCodeWin(imgQRCODE, RscPix1.Resultado.textoImagemQRcode);
                cQrCode := RscPix1.Resultado.location;
            end;

            lblStatus.Caption := 'Situação: '+RscPix1.Resultado.status;

            cValor := StringReplace(RscPix1.Resultado.valor.original, '.', ',', [rfReplaceAll]);
            lblValor.Caption := 'R$ '+FormatFLoat('###,###,##0.00',StrToCurr(cValor));
        end
        else
        begin
            if RscPix1.Resultado_Cod = 0 then//Esse banco não faz cancelamento ou Alteracao
            begin
              MessageBox(0, PChar('Instituição não faz alteração de PIX!'#13#10+RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
            end
            else
             MessageBox(0, PChar('Erro ao Atualizar PIX, tente novamente!'#13#10+RscPix1.Retorno), 'Atenção', mb_IconInformation + mb_ok);
        end;
end;

end.
