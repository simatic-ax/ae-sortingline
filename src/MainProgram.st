USING Simatic.Ax.WindowTracking.EventHandler;
USING Simatic.Ax.WindowTracking;
USING Simatic.Ax.WindowTracking.Trigger;

PROGRAM MainProgram
    VAR_EXTERNAL
        CreateNewWindowRequest : BOOL;

        TriggerPointList : VirtualTriggerList;
        WindowList : TransportWindowList;

        // ExitPoint101 at position 2000
        ExitPoint101 : VirtualTrigger;
        ExitPoint101Handler : SortDecissionEvent;

        // ExitPoint201 at position 3500
        ExitPoint201 : VirtualTrigger;
        ExitPoint201Handler : SortDecissionEvent;

        // ExitPoint301 at position 5000
        ExitPoint301 : VirtualTrigger;
        ExitPoint301Handler : SortDecissionEvent;

        // ExitPoint401 at position 7500
        ExitPoint401 : VirtualTrigger;
        ExitPoint401Handler : SortDecissionEvent;
        
        // Terminate Window at and of conveyor at Pos 8000
        ClearWindowTrigger : VirtualTrigger;
        terminateWindowEvent : TerminateWindowEvent;
    END_VAR
    
    VAR
        _initialized : BOOL;    
    END_VAR

    VAR_TEMP
        _newWindow : ITransportWindow;
    END_VAR

    IF NOT(_initialized) THEN
        TriggerPointList.Add(ExitPoint101);
        TriggerPointList.Add(ExitPoint201);
        TriggerPointList.Add(ExitPoint301);
        TriggerPointList.Add(ExitPoint401);
        TriggerPointList.Add(ClearWindowTrigger);
        _initialized := TRUE;
    END_IF;

    IF (CreateNewWindowRequest) THEN
        _newWindow := WindowList.Create();
        CreateNewWindowRequest := FALSE;
        // 
    END_IF;

    WindowList.Evaluate();
    ;
END_PROGRAM
