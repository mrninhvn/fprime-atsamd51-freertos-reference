module SX1303 {
    module SubtopologyConfig {
        constant BASE_ID = 0xD0000000
    }

    module Components {
        constant QUEUE_SIZE = 2
        constant STACK_SIZE = 2 * 1024
    }

    instance sx1303Driver: Arduino.SpiDriver base id SX1303.SubtopologyConfig.BASE_ID + 0x00002000 {
        phase Fpp.ToCpp.Phases.configComponents """
        SX1303::sx1303Driver.open(&SPI, Arduino::SpiDriver::SPI_FREQUENCY_4MHZ, 10);
        """
    }
} 
