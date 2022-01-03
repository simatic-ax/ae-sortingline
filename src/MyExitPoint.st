USING Simatic.Ax.WindowTracking.ExitPointHandler;

CLASS MyExitPoint IMPLEMENTS IExitPointHandler
    VAR
        _CountItems : INT;
    END_VAR

    METHOD PUBLIC IsReady : BOOL
        IsReady := TRUE;
    END_METHOD

    METHOD PUBLIC Activate : BOOL
        _CountItems := _CountItems + 1;
        
    END_METHOD
END_CLASS