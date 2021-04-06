unit TMyList;

// From Hefferman at
// https://stackoverflow.com/questions/14139830/how-to-get-the-maximum-value-in-a-generic-tlistinteger
interface

uses
  System.SysUtils, System.Generics.Defaults, System.Generics.Collections;

type
  TMyList<T> = class(TList<T>)
  public
    function MaxValue: T;
  end;

implementation
{ TMyList<T> }


function TMyList<T>.MaxValue: T;
var
  i: Integer;
  Comparer: IComparer<T>;
begin
  if Count=0 then
    raise Exception.Create('Cannot call TMyList<T>.MaxValue on an empty list');
  Comparer := TComparer<T>.Default;
  Result := Self[0];
  for i := 1 to Count-1 do
    if Comparer.Compare(Self[i], Result)>0 then
      Result := Self[i];
end;
end.
