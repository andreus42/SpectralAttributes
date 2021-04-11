unit TEvalTestSetUnit;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,
  TEvalTestUnit,
  TEvalTestGroupUnit;

type
  TEvalTestSet = class(TObject)
  public
    SetID: Integer;
    EvalTestGroupList: TObjectList<TEvalTestGroup>;
    constructor Create(ID: Integer);
    destructor Destroy;
  end;

implementation

{ TEvalTestSet }

constructor TEvalTestSet.Create(ID: Integer);
var
  Query : TADOQuery;
  EvalTestGroup: TEvalTestGroup;
  GroupID: Integer;
begin
  SetID := ID;
  EvalTestGroupList := TObjectList<TEvalTestGroup>.Create;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('select GroupID');
    SQL.Add('from EvalTestGroups where SetID = ' + SetID.ToString);
    Open;
    while not eof do
    begin
        GroupID := Query.FieldByName('GroupID').Value;
        EvalTestGroup := TEvalTestGroup.Create(GroupID);
        EvalTestGroupList.Add(EvalTestGroup);
        Next;
    end;
    Close;
    Free;
  end;
end;

destructor TEvalTestSet.Destroy;
begin
  EvalTestGroupList.Free;
  Destroy;
end;

end.
