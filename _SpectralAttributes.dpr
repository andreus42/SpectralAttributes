program _SpectralAttributes;

uses
  Vcl.Forms,
  EvalTestGroupFrameUnit in 'EvalTestGroupFrameUnit.pas' {EvalTestGroupFrame: TFrame},
  SpectalAttributesForm in 'SpectalAttributesForm.pas' {_SpectralAttributesForm},
  ChromaDataModule in '..\ChromaData\ChromaDataModule.pas' {_ChromaDataModule: TDataModule},
  EvalFrameUnit in 'EvalFrameUnit.pas' {EvalFrame: TFrame},
  TEvalTestUnit in 'TEvalTestUnit.pas',
  TEvalTestGroupUnit in 'TEvalTestGroupUnit.pas',
  TEvalTestSetUnit in 'TEvalTestSetUnit.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(T_ChromaDataModule, _ChromaDataModule);
  Application.CreateForm(T_SpectralAttributesForm, _SpectralAttributesForm);
  Application.Run;
end.
