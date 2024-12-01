// Generated by svd2swift.

import MMIO

/// Serial peripheral interface
@RegisterBlock
public struct SPI: Sendable {
    /// SPI control register 1
    @RegisterBlock(offset: 0x0)
    public var cr1: Register<CR1>

    /// SPI control register 2
    @RegisterBlock(offset: 0x4)
    public var cr2: Register<CR2>

    /// SPI status register
    @RegisterBlock(offset: 0x8)
    public var sr: Register<SR>

    /// SPI data register
    @RegisterBlock(offset: 0xc)
    public var dr: Register<DR>

    /// SPI CRC polynomial register
    @RegisterBlock(offset: 0x10)
    public var crcpr: Register<CRCPR>

    /// SPI Rx CRC register
    @RegisterBlock(offset: 0x14)
    public var rxcrcr: Register<RXCRCR>

    /// SPI Tx CRC register
    @RegisterBlock(offset: 0x18)
    public var txcrcr: Register<TXCRCR>

    /// SPI_I2S configuration register
    @RegisterBlock(offset: 0x1c)
    public var i2scfgr: Register<I2SCFGR>

    /// SPI_I2S prescaler register
    @RegisterBlock(offset: 0x20)
    public var i2spr: Register<I2SPR>

    /// Direct 8-bit access to data register
    @RegisterBlock(offset: 0xc)
    public var dr8: Register<DR8>
}

extension SPI {
    /// SPI control register 1
    @Register(bitWidth: 16)
    public struct CR1 {
        /// Clock phase
        /// Note: This bit should not be changed when communication is ongoing.
        /// This bit is not used in I2S mode and SPI TI mode except the case when CRC is applied at TI mode.
        @ReadWrite(bits: 0..<1)
        public var cpha: CPHA

        /// Clock polarity
        /// Note: This bit should not be changed when communication is ongoing.
        /// This bit is not used in I2S mode and SPI TI mode except the case when CRC is applied at TI mode.
        @ReadWrite(bits: 1..<2)
        public var cpol: CPOL

        /// Master selection
        /// Note: This bit should not be changed when communication is ongoing.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 2..<3)
        public var mstr: MSTR

        /// Baud rate control
        /// Note: These bits should not be changed when communication is ongoing.
        /// These bits are not used in I2S mode.
        @ReadWrite(bits: 3..<6)
        public var br: BR

        /// SPI enable
        /// Note: When disabling the SPI, follow the procedure described in SPI on page 1349.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 6..<7)
        public var spe: SPE

        /// Frame format
        /// Note: 1. This bit should not be changed when communication is ongoing.
        /// 2. This bit is not used in I2S mode and SPI TI mode.
        @ReadWrite(bits: 7..<8)
        public var lsbfirst: LSBFIRST

        /// Internal slave select
        /// This bit has an effect only when the SSM bit is set. The value of this bit is forced onto the NSS pin and the I/O value of the NSS pin is ignored.
        /// Note: This bit is not used in I2S mode and SPI TI mode.
        @ReadWrite(bits: 8..<9)
        public var ssi: SSI

        /// Software slave management
        /// When the SSM bit is set, the NSS pin input is replaced with the value from the SSI bit.
        /// Note: This bit is not used in I2S mode and SPI TI mode.
        @ReadWrite(bits: 9..<10)
        public var ssm: SSM

        /// Receive only mode enabled.
        /// This bit enables simplex communication using a single unidirectional line to receive data exclusively. Keep BIDIMODE bit clear when receive only mode is active.This bit is also useful in a multislave system in which this particular slave is not accessed, the output from the accessed slave is not corrupted.
        /// Note: This bit is not used in I2S mode.
        @ReadWrite(bits: 10..<11)
        public var rxonly: RXONLY

        /// CRC length
        /// This bit is set and cleared by software to select the CRC length.
        /// Note: This bit should be written only when SPI is disabled (SPE = ‘0’) for correct operation.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 11..<12)
        public var crcl: CRCL

        /// Transmit CRC next
        /// Note: This bit has to be written as soon as the last data is written in the SPI_DR register.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 12..<13)
        public var crcnext: CRCNEXT

        /// Hardware CRC calculation enable
        /// Note: This bit should be written only when SPI is disabled (SPE = ‘0’) for correct operation.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 13..<14)
        public var crcen: CRCEN

        /// Output enable in bidirectional mode
        /// This bit combined with the BIDIMODE bit selects the direction of transfer in bidirectional mode.
        /// Note: In master mode, the MOSI pin is used and in slave mode, the MISO pin is used.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 14..<15)
        public var bidioe: BIDIOE

        /// Bidirectional data mode enable.
        /// This bit enables half-duplex communication using common single bidirectional data line. Keep RXONLY bit clear when bidirectional mode is active.
        /// Note: This bit is not used in I2S mode.
        @ReadWrite(bits: 15..<16)
        public var bidimode: BIDIMODE
    }

    /// SPI control register 2
    @Register(bitWidth: 16)
    public struct CR2 {
        /// Rx buffer DMA enable
        /// When this bit is set, a DMA request is generated whenever the RXNE flag is set.
        @ReadWrite(bits: 0..<1)
        public var rxdmaen: RXDMAEN

        /// Tx buffer DMA enable
        /// When this bit is set, a DMA request is generated whenever the TXE flag is set.
        @ReadWrite(bits: 1..<2)
        public var txdmaen: TXDMAEN

        /// SS output enable
        /// Note: This bit is not used in I2S mode and SPI TI mode.
        @ReadWrite(bits: 2..<3)
        public var ssoe: SSOE

        /// NSS pulse management
        /// This bit is used in master mode only. it allows the SPI to generate an NSS pulse between two consecutive data when doing continuous transfers. In the case of a single data transfer, it forces the NSS pin high level after the transfer.
        /// It has no meaning if CPHA = ’1’, or FRF = ’1’.
        /// Note: 1. This bit must be written only when the SPI is disabled (SPE=0).
        /// 2. This bit is not used in I2S mode and SPI TI mode.
        @ReadWrite(bits: 3..<4)
        public var nssp: NSSP

        /// Frame format
        /// 1 SPI TI mode
        /// Note: This bit must be written only when the SPI is disabled (SPE=0).
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 4..<5)
        public var frf: FRF

        /// Error interrupt enable
        /// This bit controls the generation of an interrupt when an error condition occurs (CRCERR, OVR, MODF in SPI mode, FRE at TI mode and UDR, OVR, and FRE in I2S mode).
        @ReadWrite(bits: 5..<6)
        public var errie: ERRIE

        /// RX buffer not empty interrupt enable
        @ReadWrite(bits: 6..<7)
        public var rxneie: RXNEIE

        /// Tx buffer empty interrupt enable
        @ReadWrite(bits: 7..<8)
        public var txeie: TXEIE

        /// Data size
        /// These bits configure the data length for SPI transfers.
        /// If software attempts to write one of the “Not used” values, they are forced to the value “0111”
        /// (8-bit)
        /// Note: These bits are not used in I2S mode.
        @ReadWrite(bits: 8..<12)
        public var ds: DS

        /// FIFO reception threshold
        /// This bit is used to set the threshold of the RXFIFO that triggers an RXNE event
        /// Note: This bit is not used in I2S mode.
        @ReadWrite(bits: 12..<13)
        public var frxth: FRXTH

        /// Last DMA transfer for reception
        /// This bit is used in data packing mode, to define if the total number of data to receive by DMA is odd or even. It has significance only if the RXDMAEN bit in the SPI_CR2 register is set and if packing mode is used (data length =< 8-bit and write access to SPI_DR is 16-bit wide). It has to be written when the SPI is disabled (SPE = 0 in the SPI_CR1 register).
        /// Note: Refer to if the CRCEN bit is set.
        /// This bit is not used in I�S mode.
        @ReadWrite(bits: 13..<14)
        public var ldma_rx: LDMA_RX

        /// Last DMA transfer for transmission
        /// This bit is used in data packing mode, to define if the total number of data to transmit by DMA is odd or even. It has significance only if the TXDMAEN bit in the SPI_CR2 register is set and if packing mode is used (data length =< 8-bit and write access to SPI_DR is 16-bit wide). It has to be written when the SPI is disabled (SPE = 0 in the SPI_CR1 register).
        /// Note: Refer to if the CRCEN bit is set.
        /// This bit is not used in I�S mode.
        @ReadWrite(bits: 14..<15)
        public var ldma_tx: LDMA_TX
    }

    /// SPI status register
    @Register(bitWidth: 16)
    public struct SR {
        /// Receive buffer not empty
        @ReadOnly(bits: 0..<1)
        public var rxne: RXNE

        /// Transmit buffer empty
        @ReadOnly(bits: 1..<2)
        public var txe: TXE

        /// Channel side
        /// Note: This bit is not used in SPI mode. It has no significance in PCM mode.
        @ReadOnly(bits: 2..<3)
        public var chside: CHSIDE

        /// Underrun flag
        /// This flag is set by hardware and reset by a software sequence. Refer to page 1385 for the software sequence.
        /// Note: This bit is not used in SPI mode.
        @ReadOnly(bits: 3..<4)
        public var udr: UDR

        /// CRC error flag
        /// Note: This flag is set by hardware and cleared by software writing 0.
        /// This bit is not used in I2S mode.
        @ReadWrite(bits: 4..<5)
        public var crcerr: CRCERR

        /// Mode fault
        /// This flag is set by hardware and reset by a software sequence. Refer to (MODF) on page 1359 for the software sequence.
        /// Note: This bit is not used in I2S mode.
        @ReadOnly(bits: 5..<6)
        public var modf: MODF

        /// Overrun flag
        /// This flag is set by hardware and reset by a software sequence. Refer to page 1385 for the software sequence.
        @ReadOnly(bits: 6..<7)
        public var ovr: OVR

        /// Busy flag
        /// This flag is set and cleared by hardware.
        /// Note: The BSY flag must be used with caution: refer to and .
        @ReadOnly(bits: 7..<8)
        public var bsy: BSY

        /// Frame format error
        /// This flag is used for SPI in TI slave mode and I2S slave mode. Refer to error flags and .
        /// This flag is set by hardware and reset when SPI_SR is read by software.
        @ReadOnly(bits: 8..<9)
        public var fre: FRE

        /// FIFO reception level
        /// These bits are set and cleared by hardware.
        /// Note: These bits are not used in I�S mode and in SPI receive-only mode while CRC calculation is enabled.
        @ReadOnly(bits: 9..<11)
        public var frlvl: FRLVL

        /// FIFO transmission level
        /// These bits are set and cleared by hardware.
        /// Note: This bit is not used in I2S mode.
        @ReadOnly(bits: 11..<13)
        public var ftlvl: FTLVL
    }

    /// SPI data register
    @Register(bitWidth: 16)
    public struct DR {
        /// Data register
        /// Data received or to be transmitted
        /// The data register serves as an interface between the Rx and Tx FIFOs. When the data register is read, RxFIFO is accessed while the write to data register accesses TxFIFO (See ).
        /// Note: Data is always right-aligned. Unused bits are ignored when writing to the register, and read as zero when the register is read. The Rx threshold setting must always correspond with the read access currently used.
        @ReadWrite(bits: 0..<16)
        public var dr_field: DR_FIELD
    }

    /// SPI CRC polynomial register
    @Register(bitWidth: 16)
    public struct CRCPR {
        /// CRC polynomial register
        /// This register contains the polynomial for the CRC calculation.
        /// The CRC polynomial (0x0007) is the reset value of this register. Another polynomial can be configured as required.
        @ReadWrite(bits: 0..<16)
        public var crcpoly: CRCPOLY
    }

    /// SPI Rx CRC register
    @Register(bitWidth: 16)
    public struct RXCRCR {
        /// Rx CRC register
        /// When CRC calculation is enabled, the RXCRC[15:0] bits contain the computed CRC value of the subsequently received bytes. This register is reset when the CRCEN bit in SPI_CR1 register is written to 1. The CRC is calculated serially using the polynomial programmed in the SPI_CRCPR register.
        /// Only the 8 LSB bits are considered when the CRC frame format is set to be 8-bit length (CRCL bit in the SPI_CR1 is cleared). CRC calculation is done based on any CRC8 standard.
        /// The entire 16-bits of this register are considered when a 16-bit CRC frame format is selected (CRCL bit in the SPI_CR1 register is set). CRC calculation is done based on any CRC16 standard.
        /// Note: A read to this register when the BSY Flag is set could return an incorrect value.
        /// These bits are not used in I2S mode.
        @ReadOnly(bits: 0..<16)
        public var rxcrc: RXCRC
    }

    /// SPI Tx CRC register
    @Register(bitWidth: 16)
    public struct TXCRCR {
        /// Tx CRC register
        /// When CRC calculation is enabled, the TXCRC[7:0] bits contain the computed CRC value of the subsequently transmitted bytes. This register is reset when the CRCEN bit of SPI_CR1 is written to 1. The CRC is calculated serially using the polynomial programmed in the SPI_CRCPR register.
        /// Only the 8 LSB bits are considered when the CRC frame format is set to be 8-bit length (CRCL bit in the SPI_CR1 is cleared). CRC calculation is done based on any CRC8 standard.
        /// The entire 16-bits of this register are considered when a 16-bit CRC frame format is selected (CRCL bit in the SPI_CR1 register is set). CRC calculation is done based on any CRC16 standard.
        /// Note: A read to this register when the BSY flag is set could return an incorrect value.
        /// These bits are not used in I2S mode.
        @ReadOnly(bits: 0..<16)
        public var txcrc: TXCRC
    }

    /// SPI_I2S configuration register
    @Register(bitWidth: 16)
    public struct I2SCFGR {
        /// Channel length (number of bits per audio channel)
        /// The bit write operation has a meaning only if DATLEN = 00 otherwise the channel length is fixed to 32-bit by hardware whatever the value filled in.
        /// Note: For correct operation, this bit should be configured when the I2S is disabled.
        /// It is not used in SPI mode.
        @ReadWrite(bits: 0..<1)
        public var chlen: CHLEN

        /// Data length to be transferred
        /// Note: For correct operation, these bits should be configured when the I2S is disabled.
        /// They are not used in SPI mode.
        @ReadWrite(bits: 1..<3)
        public var datlen: DATLEN

        /// Inactive state clock polarity
        /// Note: For correct operation, this bit should be configured when the I2S is disabled.
        /// It is not used in SPI mode.
        /// The bit CKPOL does not affect the CK edge sensitivity used to receive or transmit the SD and WS signals.
        @ReadWrite(bits: 3..<4)
        public var ckpol: CKPOL

        /// I2S standard selection
        /// For more details on I2S standards, refer to
        /// Note: For correct operation, these bits should be configured when the I2S is disabled.
        /// They are not used in SPI mode.
        @ReadWrite(bits: 4..<6)
        public var i2sstd: I2SSTD

        /// PCM frame synchronization
        /// Note: This bit has a meaning only if I2SSTD = 11 (PCM standard is used).
        /// It is not used in SPI mode.
        @ReadWrite(bits: 7..<8)
        public var pcmsync: PCMSYNC

        /// I2S configuration mode
        /// Note: These bits should be configured when the I2S is disabled.
        /// They are not used in SPI mode.
        @ReadWrite(bits: 8..<10)
        public var i2scfg: I2SCFG

        /// I2S enable
        /// Note: This bit is not used in SPI mode.
        @ReadWrite(bits: 10..<11)
        public var i2se: I2SE

        /// I2S mode selection
        /// Note: This bit should be configured when the SPI is disabled.
        @ReadWrite(bits: 11..<12)
        public var i2smod: I2SMOD

        /// Asynchronous start enable.
        /// When the I2S is enabled in slave mode, the hardware starts the transfer when the I2S clock is received and an appropriate transition is detected on the WS signal.
        /// When the I2S is enabled in slave mode, the hardware starts the transfer when the I2S clock is received and the appropriate level is detected on the WS signal.
        /// Note: The appropriate transition is a falling edge on WS signal when I2S Philips Standard is used, or a rising edge for other standards.
        /// The appropriate level is a low level on WS signal when I2S Philips Standard is used, or a high level for other standards.
        /// Please refer to for additional information.
        @ReadWrite(bits: 12..<13)
        public var astrten: ASTRTEN
    }

    /// SPI_I2S prescaler register
    @Register(bitWidth: 16)
    public struct I2SPR {
        /// I2S linear prescaler
        /// I2SDIV [7:0] = 0 or I2SDIV [7:0] = 1 are forbidden values.
        /// Refer to .
        /// Note: These bits should be configured when the I2S is disabled. They are used only when the I2S is in master mode.
        /// They are not used in SPI mode.
        @ReadWrite(bits: 0..<8)
        public var i2sdiv: I2SDIV

        /// Odd factor for the prescaler
        /// Refer to .
        /// Note: This bit should be configured when the I2S is disabled. It is used only when the I2S is in master mode.
        /// It is not used in SPI mode.
        @ReadWrite(bits: 8..<9)
        public var odd: ODD

        /// Master clock output enable
        /// Note: This bit should be configured when the I2S is disabled. It is used only when the I2S is in master mode.
        /// It is not used in SPI mode.
        @ReadWrite(bits: 9..<10)
        public var mckoe: MCKOE
    }

    /// Direct 8-bit access to data register
    @Register(bitWidth: 8)
    public struct DR8 {
        /// Data register
        @ReadWrite(bits: 0..<8)
        public var dr: DR
    }
}
