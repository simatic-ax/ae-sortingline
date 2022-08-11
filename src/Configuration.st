USING Simatic.Ax.WindowTracking;

CONFIGURATION MyConfiguration
    TASK Main(Priority := 1);
    TASK Encoder10ms(Interval := T#10ms, Priority := 1);
    TASK CreateWindowTask(Interval := T#1000ms, Priority := 1);
    
    PROGRAM P1 WITH Main: MainProgram;
    PROGRAM P2 WITH Encoder10ms: EncoderProgram;
    PROGRAM P3 WITH CreateWindowTask: WindowCreatorProgram;
        
    VAR_GLOBAL
        TriggerPointList : VirtualTriggerList := (PositiveTolerance := 50, NegativeTolerance := 50);
        WindowList : TransportWindowList := (Encoder := Enocder, TriggerPointList := TriggerPointList);
        Enocder : EncoderMock;
        CreateNewWindowRequest : BOOL;
        SortStrategy : SortDecisionOneDestination;
        CreatedWindows : DINT;
        CreatedWindowsDiff : DINT;
        WindowsInList : DINT;
        // Virtual Triggers:
        
        // ExitPoint101 at position 2000
        ExitPoint101 : VirtualTrigger := (ID := UINT#101, Position := 2000, EventHandler := ExitPoint101Handler);
        ExitPoint101Handler : SortDecisionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit101);
        Exit101 : MyExitPoint;
        // ExitPoint201 at position 3500
        ExitPoint201 : VirtualTrigger := (ID := UINT#201, Position := 3500, EventHandler := ExitPoint201Handler);
        ExitPoint201Handler : SortDecisionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit201);
        Exit201 : MyExitPoint;

        // ExitPoint301 at position 5000
        ExitPoint301 : VirtualTrigger := (ID := UINT#301, Position := 5000, EventHandler := ExitPoint301Handler);
        ExitPoint301Handler : SortDecisionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit301);
        Exit301 : MyExitPoint;

        // ExitPoint401 at position 7000
        ExitPoint401 : VirtualTrigger := (ID := UINT#401, Position := 7000, EventHandler := ExitPoint401Handler);
        ExitPoint401Handler : SortDecisionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit401);        
        Exit401 : MyExitPoint;

        // Terminate Window at and of conveyor at Pos 9000
        ClearWindowTrigger : VirtualTrigger := (ID := UINT#601, Position := 9000, EventHandler := TerminateWindowEvent);
        TerminateWindowEvent : TerminateWindowEvent  := (WindowList := WindowList, EventAfter := TerminateCounter);
        TerminateCounter : MyEventCounter;

        // Items 
        Item00 : ItemOneDestination := (Destination1 := ExitPoint201);
        Item01 : ItemOneDestination := (Destination1 := ExitPoint301);
        Item02 : ItemOneDestination := (Destination1 := ExitPoint101);
        Item03 : ItemOneDestination := (Destination1 := ExitPoint101);
        Item04 : ItemOneDestination := (Destination1 := ExitPoint301);
        Item05 : ItemOneDestination := (Destination1 := ExitPoint401);
        Item06 : ItemOneDestination := (Destination1 := ExitPoint301);
        Item07 : ItemOneDestination := (Destination1 := ExitPoint301);
        Item08 : ItemOneDestination := (Destination1 := ExitPoint101);
        Item09 : ItemOneDestination := (Destination1 := ExitPoint401);
        Item10 : ItemOneDestination := (Destination1 := ExitPoint101);
        Item11 : ItemOneDestination := (Destination1 := ExitPoint201);
        Item12 : ItemOneDestination := (Destination1 := ExitPoint201);
        Item13 : ItemOneDestination := (Destination1 := ExitPoint301);
        Item14 : ItemOneDestination := (Destination1 := ExitPoint401);
        Item15 : ItemOneDestination := (Destination1 := ExitPoint301);
        Items : Array[0..15] OF IItem := [Item00, Item01, Item02, Item03, Item04, Item05, Item06, Item07, Item08, Item09, Item10, Item11, Item12, Item13, Item14, Item15] ;


    END_VAR
END_CONFIGURATION
