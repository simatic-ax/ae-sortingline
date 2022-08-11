USING Simatic.Ax.WindowTracking;

PROGRAM MainProgram
    VAR_EXTERNAL
        CreateNewWindowRequest : BOOL;
        CreatedWindows : DINT;
        CreatedWindowsDiff : DINT;
        WindowsInList : DINT;

        TriggerPointList : VirtualTriggerList;
        WindowList : TransportWindowList;

        // ExitPoint101 at position 2000
        ExitPoint101 : VirtualTrigger;
        ExitPoint101Handler : SortDecisionEvent;

        // ExitPoint201 at position 3500
        ExitPoint201 : VirtualTrigger;
        ExitPoint201Handler : SortDecisionEvent;

        // ExitPoint301 at position 5000
        ExitPoint301 : VirtualTrigger;
        ExitPoint301Handler : SortDecisionEvent;

        // ExitPoint401 at position 7500
        ExitPoint401 : VirtualTrigger;
        ExitPoint401Handler : SortDecisionEvent;
        
        // Terminate Window at and of conveyor at Pos 8000
        ClearWindowTrigger : VirtualTrigger;
        terminateWindowEvent : TerminateWindowEvent;

        Items : Array[0..15] OF IItem;
    END_VAR
    
    VAR
        _initialized : BOOL;    
        _itemId : INT;
    END_VAR

    VAR_TEMP
        _newWindow : ITransportWindow;
        _item : IItem;
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
        _itemId := (_itemId + 1) MOD 16;
        _newWindow := WindowList.Create(i := Items[_itemId], offset := 0);
        CreateNewWindowRequest := FALSE;
        CreatedWindows := CreatedWindows + 1;
    END_IF;
    //reatedWindowsDiff := ClearWindowTrigger.activations - CreatedWindows;
    WindowList.Evaluate();
    WindowsInList := WindowList.Count();
END_PROGRAM
