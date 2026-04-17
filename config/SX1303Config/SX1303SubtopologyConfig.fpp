module SX1303 {
    module SubtopologyConfig {
        constant BASE_ID = 0xD0000000
    }

    module Components {
        constant QUEUE_SIZE = 2
        constant STACK_SIZE = 6 * 1024
    }

    instance sx1303PowerDriver: Arduino.GpioDriver base id SX1303.SubtopologyConfig.BASE_ID + 0x00002000 {
        phase Fpp.ToCpp.Phases.configComponents """
        SX1303::sx1303PowerDriver.open(4, Arduino::GpioDriver::GpioDirection::OUT);
        """
    }

    instance sx1303ResetDriver: Arduino.GpioDriver base id SX1303.SubtopologyConfig.BASE_ID + 0x00003000 {
        phase Fpp.ToCpp.Phases.configComponents """
        SX1303::sx1303ResetDriver.open(5, Arduino::GpioDriver::GpioDirection::OUT);
        """
    }

    instance sx1303SpiDriver: Arduino.SpiDriver base id SX1303.SubtopologyConfig.BASE_ID + 0x00004000 {
        phase Fpp.ToCpp.Phases.configComponents """
        SX1303::sx1303SpiDriver.open(&SPI, Arduino::SpiDriver::SPI_FREQUENCY_4MHZ, 10);
        """
    }

    # @ Lora MAC processor to received data from SX1303 and process it for LoRaWAN
    # instance sx1303DataProcessor: LORAMAC.LoRaMacProcessor base id SX1303.SubtopologyConfig.BASE_ID + 0x5000
} 
