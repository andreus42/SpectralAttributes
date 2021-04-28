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
  TEvalSet = class(TObject)
  public
    SetID: Integer;
    EvalGroupList: TObjectList<TEvalGroup>;
    constructor Create(ID: Integer);
//    destructor Destroy;
  end;

var
  EvalTestGroup: TEvalGroup;

implementation

{ TEvalTestSet }

constructor TEvalSet.Create(ID: Integer);
var
  Query : TADOQuery;
  GroupID: Integer;
  GroupNum: Integer; // For ordering of in-process groups
begin
  SetID := ID;
  EvalGroupList := TObjectList<TEvalGroup>.Create;
  Query := TADOQuery.Create(Nil);
  with Query do
  begin
    Connection := _ChromaDataModule.ChromaData;
    SQL.Add('SELECT GroupID, GroupNum');
    SQL.Add('FROM EvalGroups WHERE SetID = ' + SetID.ToString);  // change to order by GroupNum for future revs
    SQL.Add('ORDER BY GroupID, GroupNum');
    Open;
    while not eof do
    begin
        GroupID := Query.FieldByName('GroupID').Value;
        GroupNum := Query.FieldByName('GroupNum').Value; // Eventually need this as In-Process#1,#2,etc.
        EvalTestGroup := TEvalGroup.Create(GroupID, SetID);
        EvalGroupList.Add(EvalTestGroup);
        Next;
    end;
    Close;
    Free;
  end;
end;

//destructor TEvalSet.Destroy;
//var
//  I: Integer;
//begin
////  for I := 0 to EvalGroupList.Count-1 do
////    EvalGroupList.Delete(I);
//  EvalGroupList.Free;
//end;

end.
