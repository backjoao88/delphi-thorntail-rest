program IndyClient;

{$APPTYPE CONSOLE}

uses
  IdHTTP,
  SysUtils, Classes;

procedure Main;
var
  IdHTTP: TIdHTTP;
  RequestBody: TStream;
  Response: string;
begin
  IdHTTP := TIdHTTP.Create;
  try
    RequestBody := TStringStream.Create('{"answer":42}',
      TEncoding.UTF8);
    try
      IdHTTP.Request.ContentType := 'application/json';
      IdHTTP.Request.Accept := 'application/json';
      Response := IdHTTP.Post('http://localhost:8080/rest/hello',
        RequestBody);
      WriteLn(Response);
    finally
      RequestBody.Free;
    end;
  finally
    IdHTTP.Free;
  end;
end;

begin
  try
    Main;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
  ReadLn;
end.
