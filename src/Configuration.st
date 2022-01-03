USING Simatic.Ax.WindowTracking.SortDecission;
USING Simatic.Ax.WindowTracking;
USING Simatic.Ax.WindowTracking.Trigger;
USING Simatic.Ax.WindowTracking.EventHandler;

CONFIGURATION MyConfiguration
    TASK Main(Priority := 1);
    TASK Encoder10ms(Interval := T#10ms, Priority := 1);
    TASK CreateWindowTask(Interval := T#1000ms, Priority := 1);
    
    PROGRAM P1 WITH Main: MainProgram;
    PROGRAM P2 WITH Encoder10ms: EncoderProgram;
    PROGRAM P3 WITH CreateWindowTask: WindowCreatorProgram;
        
    VAR_GLOBAL
        TriggerPointList : VirtualTriggerList := (PositiveTolerace := 50, NegativeTolerance := 50);
        WindowList : TransportWindowList := (Encoder := Enocder, TriggerPointList := TriggerPointList);
        Enocder : EncoderMock;
        CreateNewWindowRequest : BOOL;
        SortStrategy : SortDecissionOneDestination;

        // Virtual Triggers:
        
        // ExitPoint101 at position 2000
        ExitPoint101 : VirtualTrigger := (ID := UINT#101, Position := 2000, EventHandler := ExitPoint101Handler);
        ExitPoint101Handler : SortDecissionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit101);
        Exit101 : MyExitPoint;
        // ExitPoint201 at position 3500
        ExitPoint201 : VirtualTrigger := (ID := UINT#201, Position := 3500, EventHandler := ExitPoint201Handler);
        ExitPoint201Handler : SortDecissionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit201);
        Exit201 : MyExitPoint;

        // ExitPoint301 at position 5000
        ExitPoint301 : VirtualTrigger := (ID := UINT#301, Position := 5000, EventHandler := ExitPoint301Handler);
        ExitPoint301Handler : SortDecissionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit301);
        Exit301 : MyExitPoint;

        // ExitPoint401 at position 7500
        ExitPoint401 : VirtualTrigger := (ID := UINT#401, Position := 7500, EventHandler := ExitPoint401Handler);
        ExitPoint401Handler : SortDecissionEvent := (SortStrategy := SortStrategy, ExitHandler := Exit401);        
        Exit401 : MyExitPoint;

        // Terminate Window at and of conveyor at Pos 8000
        ClearWindowTrigger : VirtualTrigger := (ID := UINT#601, Position := 8000, EventHandler := TerminateWindowEvent);
        TerminateWindowEvent : TerminateWindowEvent  := (WindowList := WindowList, EventAfter := TerminateCounter);
        TerminateCounter : MyEventCounter;
    END_VAR
END_CONFIGURATION
