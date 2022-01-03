USING Simatic.Ax.WindowTracking.Trigger;
USING Simatic.Ax.WindowTracking.WindowTracking;
USING Simatic.Ax.WindowTracking.EventHandler;

CLASS MyEventCounter IMPLEMENTS IUserDefinedEvent
    VAR
        _CountItems : INT;
    END_VAR

    METHOD PUBLIC Action : EventStatus
        VAR_INPUT
            te : IVirtualTrigger;
            tw : ITransportWindow;
        END_VAR
        _CountItems := _CountItems + 1;
        ;
    END_METHOD
END_CLASS