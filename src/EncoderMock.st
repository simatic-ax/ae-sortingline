USING Simatic.Ax.SimpleControlModules;

CLASS EncoderMock IMPLEMENTS IEncoder
    VAR
        _value : DINT;
    END_VAR

    METHOD PUBLIC Evaluate
        _value := _value + 10;
        _value := _value MOD THIS.GetModulo();
    END_METHOD

    METHOD PUBLIC Reset
        _value := 0;
    END_METHOD

    METHOD PUBLIC SetValue
        VAR_INPUT
            value : DINT;
        END_VAR
        _value := value;
        ;
    END_METHOD

    METHOD PUBLIC GetValue : DINT
        GetValue := _value;
    END_METHOD

    METHOD PUBLIC SetDirection
        VAR_INPUT
            mode : CountMode;
        END_VAR

        ;
    END_METHOD

    METHOD PUBLIC RelativeCount : DINT
        ;
    END_METHOD

    METHOD PUBLIC ResetRelative
        ;
    END_METHOD

    METHOD PUBLIC GetModulo : DINT
        GetModulo := 4096;
    END_METHOD
END_CLASS