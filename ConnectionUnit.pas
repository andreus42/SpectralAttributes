unit ConnectionUnit;

interface

uses
  System.SysUtils,
  ActiveX,
  DB,
  ADODB;

const
  // the connection string
  StrConnection = ''
    + 'Provider=SQLNCLI11.1;Integrated Security=SSPI'
    + ';Persist Security Info=False'
    + ';User ID=""'
    + ';Initial Catalog=awesomeapp'
    + ';Data Source=LAPTOP-L3MFR1GT'
    + ';Initial File Name=""'
    + ';Trusted_Connection=yes;'
    + ';Server SPN=""';

procedure SetupConnection(DataBase: String);
procedure CloseConnection;
procedure DoSQL(Query: String);

var
  AdoConnection: TADOConnection;
  AdoQuery: TADOQuery;

implementation

procedure SetupConnection(DataBase: String); // Open a connection
begin
  AdoConnection := TADOConnection.Create(nil);
  AdoConnection.LoginPrompt := False;
  AdoConnection.ConnectionString := StrConnection;
  AdoConnection.Connected := True;
end;


procedure CloseConnection; // Close an open connection
begin
  if AdoConnection.Connected then
    AdoConnection.Close;
  AdoConnection.Free;
end;

procedure DoSQL(Query: String);
begin
//  SetupConnection('Mydb');
//  AdoQuery := TADOQuery.Create(nil);
//  AdoQuery.Connection := AdoConnection;
//  AdoQuery.SQL.Add(Query);
//  AdoQuery.ExecSQL;
//  CloseConnection; // close the connection
//  AdoQuery.Free;
end;

procedure GetSQL(Query: String);
begin
  SetupConnection('Mydb');
  AdoQuery := TADOQuery.Create(nil);
  AdoQuery.Connection := AdoConnection;
  AdoQuery.SQL.Add(Query);
  AdoQuery.ExecSQL;
  CloseConnection; // close the connection
  AdoQuery.Free;
end;

end.
