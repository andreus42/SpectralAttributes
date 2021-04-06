constructor TFrameType01.CreateWithEvalTest(AOwner: TComponent;
  MyEvalTest: TEvalTest);
var
  TestPanel1: TType1;
  TestPanel2: TType2;
  TestPanel3: TType3;
  TestPanel4: TType4;
  TestPanel5: TType5;
  TypeID: Integer;
begin
  inherited Create(AOwner);
  // On create set DBlookupComboBox

  TypeID := MyEvalTest.TestType.ToInteger; //DEBUG

  DBLookupComboBox1.KeyValue := TypeID;
  Case TypeID of
   1: begin
        TestPanel1 := TType1.CreateFromEvalTest(EvalTestPanel, MyEvalTest);
        TestPanel1.Parent := EvalTestPanel;
        TestPanel1.Name := 'SpecPanel' + I.ToString;
        // TestPanel1.Left := TestPanelOffset;
        // TestPanel1.Align.alLeft;
      end;
   2: begin
        TestPanel2 := TType2.CreateFromEvalTest(EvalTestPanel, MyEvalTest);
        TestPanel2.Parent := EvalTestPanel;
        TestPanel2.Name := 'SpecPanel' + I.ToString;
        // TestPanel2.Left := TestPanelOffset;
        // TestPanel1.Align.alLeft;
      end;
   3: begin
        TestPanel3 := TType3.CreateFromEvalTest(EvalTestPanel, MyEvalTest);
        TestPanel3.Parent := EvalTestPanel;
        TestPanel3.Name := 'SpecPanel' + I.ToString;
        // TestPanel3.Left := TestPanelOffset;
        // TestPanel1.Align.alLeft;
      end;
   4: begin
        TestPanel4 := TType4.CreateFromEvalTest(EvalTestPanel, MyEvalTest);
        TestPanel4.Parent := EvalTestPanel;
        TestPanel4.Name := 'SpecPanel' + I.ToString;
        // TestPanel4.Left := TestPanelOffset;
        // TestPanel4.Align.alLeft;
      end;
   5 :begin
        TestPanel5 := TType5.CreateFromEvalTest(EvalTestPanel, MyEvalTest);
        TestPanel5.Parent := EvalTestPanel;
        TestPanel5.Name := 'SpecPanel' + I.ToString;
        // TestPanel5.Left := TestPanelOffset;
        // TestPanel5.Align.alLeft;
      end;
   end;
end;



procedure TFrameType01.DBLookupComboBox1CloseUp(Sender: TObject);
var
  TestPanel1: TType1;
  TestPanel2: TType2;
  TestPanel3: TType3;
  TestPanel4: TType4;
  TestPanel5: TType5;
  TypeID: Integer;
  I: Integer;

begin
  Inc(I);
  NumLabel.Caption := I; // Need to increment from TestList.Count; Construct with TestGroup or pass TestList?
  TypeID := TestTypeDataSetTypeID.Value;
  TypeID := 1;
    // TODO: if (Self.EvalTestPanel.ContainsControl) then EvalTestPanel.Controls.Destroy;
  Case TypeID of
   1: begin
        TestPanel1 := TType1.CreateFromEvalTest(EvalTestPanel);
        TestPanel1.Parent := EvalTestPanel;
        TestPanel1.Name := 'SpecPanel' + I.ToString;
        // TestPanel1.Left := TestPanelOffset;
        // TestPanel1.Align.alLeft;
      end;
   2: begin
        TestPanel2 := TType2.CreateFromEvalTest(EvalTestPanel);
        TestPanel2.Parent := EvalTestPanel;
        TestPanel2.Name := 'SpecPanel' + I.ToString;
        // TestPanel2.Align.alLeft;
        // TestPanel2.Left := TestPanelOffset;
      end;
   3: begin
        TestPanel3 := TType3.CreateFromEvalTest(EvalTestPanel);
        TestPanel3.Parent := EvalTestPanel;
        TestPanel3.Name := 'SpecPanel' + I.ToString;
        // TestPanel3.Align.alLeft;
        // TestPanel3.Left := TestPanelOffset;
        
      end;
   4: begin
        TestPanel4 := TType4.CreateFromEvalTest(EvalTestPanel);
        TestPanel4.Parent := EvalTestPanel;
        TestPanel4.Name := 'SpecPanel' + I.ToString;
        // TestPanel5.Left := TestPanelOffset;
        // TestPanel4.Align.alLeft;
      end;
   5 :begin
        TestPanel5 := TType5.CreateFromEvalTest(EvalTestPanel);
        TestPanel5.Parent := EvalTestPanel;
        TestPanel5.Name := 'SpecPanel' + I.ToString;
        // TestPanel5.Left := TestPanelOffset;
        // TestPanel5.Align.alLeft;
      end;
   end;
end;


procedure TFrameType01.DBLookupComboBox1CloseUp(Sender: TObject);
var
  TestPanel1: TType1;
  TestPanel2: TType2;
  TestPanel3: TType3;
  TestPanel4: TType4;
  TestPanel5: TType5;
  TypeID: Integer;
  I: Integer;

begin
  Inc(I);
  NumLabel.Caption := I; // Need to increment from TestList.Count; Construct with TestGroup or pass TestList?
  TypeID := TestTypeDataSetTypeID.Value;
  TypeID := 1;
    // TODO: if (Self.EvalTestPanel.ContainsControl) then EvalTestPanel.Controls.Destroy;
  Case TypeID of
   1: begin
        TestPanel1 := TType1.CreateFromEvalTest(EvalTestPanel);
        TestPanel1.Parent := EvalTestPanel;
        // TestPanel1.Left := TestPanelOffset;
        TestPanel1.Align.alLeft;
      end;
   2: begin
        TestPanel2 := TType2.CreateFromEvalTest(EvalTestPanel);
        TestPanel2.Parent := EvalTestPanel;
        // TestPanel2.Left := TestPanelOffset;
        TestPanel1.Align.alLeft;
      end;
   3: begin
        TestPanel3 := TType3.CreateFromEvalTest(EvalTestPanel);
        TestPanel3.Parent := EvalTestPanel;
        // TestPanel3.Left := TestPanelOffset;
        TestPanel1.Align.alLeft;
      end;
   4: begin
        TestPanel4 := TType4.CreateFromEvalTest(EvalTestPanel);
        TestPanel4.Parent := EvalTestPanel;
        // TestPanel4.Left := TestPanelOffset;
        TestPanel1.Align.alLeft;
      end;
   5 :begin
        TestPanel5 := TType5.CreateFromEvalTest(EvalTestPanel);
        TestPanel5.Parent := EvalTestPanel;
        // TestPanel5.Left := TestPanelOffset;
        TestPanel1.Align.alLeft;
      end;
   end;
end;

end.