PROGRAM EncoderProgram
    VAR_EXTERNAL
        Enocder : EncoderMock;
    END_VAR

    // Increase the encoder value by 10 by every 10ms --> speed of 1m/s
    Enocder.Evaluate();
    ;
END_PROGRAM
