USING Simatic.Ax.WindowTracking;


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