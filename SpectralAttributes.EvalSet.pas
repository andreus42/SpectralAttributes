unit SpectralAttributes.EvalSet;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  // Database
  Data.DB,
  Data.Win.ADODB,
  Datasnap.DBClient,
  ActiveX,
  ChromaDataModule,

  // Project
  SpectralAttributes.EvalTest,
  SpectralAttributes.EvalGroup;

type
  TEvalTestSet = class(TObject)
  public
    SetID: Integer;
    EvalTestGroupList: TObjectList<TEvalTestGroup>;
    EvalTestGroupIDList: TList<Integer>;
    constructor Create(ID: Integer);
    destructor Destroy;
  end;

var
  EvalTestGroup: TEvalTestGroup;

implementation

{ TEvalTestSet }

constructor TEvalTestSet.Create(ID: Integer);
var
  Query : TADOQuery;
  GroupID: Integer;
//  GroupNum: Integer; For future ordering of sets
begin
  SetID := ID;
  EvalTestGroupList := TObjectList<TEvalTestGroup>.Create;
  EvalTestGroupIDList := TList<Integer>.Create;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('SELECT GroupID, GroupNum');
    SQL.Add('FROM EvalTestGroups WHERE SetID = ' + SetID.ToString);  // change to order by GroupNum for future revs
    SQL.Add('ORDER BY GroupID');
    Open;
    while not eof do
    begin
        GroupID := Query.FieldByName('GroupID').Value;
//        GroupNum := Query.FieldByName('GroupNum').Value;
        EvalTestGroup := TEvalTestGroup.Create(GroupID);
        EvalTestGroupList.Add(EvalTestGroup);
        EvalTestGroupIDList.Add(GroupID);
        Next;
    end;
    Close;
    Free;
  end;
end;

destructor TEvalTestSet.Destroy;
begin
  EvalTestGroupIDList.Destroy;
  EvalTestGroupList.Destroy;
end;

end.
