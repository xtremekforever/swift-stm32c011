// Generated by svd2swift.

import MMIO

/// I2C register block
@RegisterBlock
public struct I2C: Sendable {
    /// I2C control register 1
    @RegisterBlock(offset: 0x0)
    public var cr1: Register<CR1>

    /// I2C control register 2
    @RegisterBlock(offset: 0x4)
    public var cr2: Register<CR2>

    /// I2C own address 1 register
    @RegisterBlock(offset: 0x8)
    public var oar1: Register<OAR1>

    /// I2C own address 2 register
    @RegisterBlock(offset: 0xc)
    public var oar2: Register<OAR2>

    /// I2C timing register
    @RegisterBlock(offset: 0x10)
    public var timingr: Register<TIMINGR>

    /// I2C timeout register
    @RegisterBlock(offset: 0x14)
    public var timeoutr: Register<TIMEOUTR>

    /// I2C interrupt and status register
    @RegisterBlock(offset: 0x18)
    public var isr: Register<ISR>

    /// I2C interrupt clear register
    @RegisterBlock(offset: 0x1c)
    public var icr: Register<ICR>

    /// I2C PEC register
    @RegisterBlock(offset: 0x20)
    public var pecr: Register<PECR>

    /// I2C receive data register
    @RegisterBlock(offset: 0x24)
    public var rxdr: Register<RXDR>

    /// I2C transmit data register
    @RegisterBlock(offset: 0x28)
    public var txdr: Register<TXDR>
}

extension I2C {
    /// I2C control register 1
    @Register(bitWidth: 32)
    public struct CR1 {
        /// Peripheral enable
        /// Note: When PE=0, the I2C SCL and SDA lines are released. Internal state machines and status bits are put back to their reset value. When cleared, PE must be kept low for at least 3 APB clock cycles.
        @ReadWrite(bits: 0..<1)
        public var pe: PE

        /// TX Interrupt enable
        @ReadWrite(bits: 1..<2)
        public var txie: TXIE

        /// RX Interrupt enable
        @ReadWrite(bits: 2..<3)
        public var rxie: RXIE

        /// Address match Interrupt enable (slave only)
        @ReadWrite(bits: 3..<4)
        public var addrie: ADDRIE

        /// Not acknowledge received Interrupt enable
        @ReadWrite(bits: 4..<5)
        public var nackie: NACKIE

        /// Stop detection Interrupt enable
        @ReadWrite(bits: 5..<6)
        public var stopie: STOPIE

        /// Transfer Complete interrupt enable
        /// Note: Any of these events generate an interrupt:
        /// Transfer Complete (TC)
        /// Transfer Complete Reload (TCR)
        @ReadWrite(bits: 6..<7)
        public var tcie: TCIE

        /// Error interrupts enable
        /// Note: Any of these errors generate an interrupt:
        /// Arbitration Loss (ARLO)
        /// Bus Error detection (BERR)
        /// Overrun/Underrun (OVR)
        /// Timeout detection (TIMEOUT)
        /// PEC error detection (PECERR)
        /// Alert pin event detection (ALERT)
        @ReadWrite(bits: 7..<8)
        public var errie: ERRIE

        /// Digital noise filter
        /// These bits are used to configure the digital noise filter on SDA and SCL input. The digital filter, filters spikes with a length of up to DNF[3:0] * tI2CCLK
        /// ...
        /// Note: If the analog filter is also enabled, the digital filter is added to the analog filter.
        /// This filter can only be programmed when the I2C is disabled (PE = 0).
        @ReadWrite(bits: 8..<12)
        public var dnf: DNF

        /// Analog noise filter OFF
        /// Note: This bit can only be programmed when the I2C is disabled (PE = 0).
        @ReadWrite(bits: 12..<13)
        public var anfoff: ANFOFF

        /// DMA transmission requests enable
        @ReadWrite(bits: 14..<15)
        public var txdmaen: TXDMAEN

        /// DMA reception requests enable
        @ReadWrite(bits: 15..<16)
        public var rxdmaen: RXDMAEN

        /// Slave byte control
        /// This bit is used to enable hardware byte control in slave mode.
        @ReadWrite(bits: 16..<17)
        public var sbc: SBC

        /// Clock stretching disable
        /// This bit is used to disable clock stretching in slave mode. It must be kept cleared in master mode.
        /// Note: This bit can only be programmed when the I2C is disabled (PE = 0).
        @ReadWrite(bits: 17..<18)
        public var nostretch: NOSTRETCH

        /// Wakeup from Stop mode enable
        /// Note: If the Wakeup from Stop mode feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        /// Note: WUPEN can be set only when DNF = ‘0000’
        @ReadWrite(bits: 18..<19)
        public var wupen: WUPEN

        /// General call enable
        @ReadWrite(bits: 19..<20)
        public var gcen: GCEN

        /// SMBus host address enable
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadWrite(bits: 20..<21)
        public var smbhen: SMBHEN

        /// SMBus device default address enable
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadWrite(bits: 21..<22)
        public var smbden: SMBDEN

        /// SMBus alert enable
        /// Note: When ALERTEN=0, the SMBA pin can be used as a standard GPIO.
        /// If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadWrite(bits: 22..<23)
        public var alerten: ALERTEN

        /// PEC enable
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadWrite(bits: 23..<24)
        public var pecen: PECEN
    }

    /// I2C control register 2
    @Register(bitWidth: 32)
    public struct CR2 {
        /// Slave address (master mode)
        /// In 7-bit addressing mode (ADD10 = 0):
        /// SADD[7:1] should be written with the 7-bit slave address to be sent. The bits SADD[9], SADD[8] and SADD[0] are don't care.
        /// In 10-bit addressing mode (ADD10 = 1):
        /// SADD[9:0] should be written with the 10-bit slave address to be sent.
        /// Note: Changing these bits when the START bit is set is not allowed.
        @ReadWrite(bits: 0..<10)
        public var sadd: SADD

        /// Transfer direction (master mode)
        /// Note: Changing this bit when the START bit is set is not allowed.
        @ReadWrite(bits: 10..<11)
        public var rd_wrn: RD_WRN

        /// 10-bit addressing mode (master mode)
        /// Note: Changing this bit when the START bit is set is not allowed.
        @ReadWrite(bits: 11..<12)
        public var add10: ADD10

        /// 10-bit address header only read direction (master receiver mode)
        /// Note: Changing this bit when the START bit is set is not allowed.
        @ReadWrite(bits: 12..<13)
        public var head10r: HEAD10R

        /// Start generation
        /// This bit is set by software, and cleared by hardware after the Start followed by the address sequence is sent, by an arbitration loss, by an address matched in slave mode, by a timeout error detection, or when PE = 0.
        /// If the I2C is already in master mode with AUTOEND = 0, setting this bit generates a Repeated Start condition when RELOAD=0, after the end of the NBYTES transfer.
        /// Otherwise setting this bit generates a START condition once the bus is free.
        /// Note: Writing ‘0’ to this bit has no effect.
        /// The START bit can be set even if the bus is BUSY or I2C is in slave mode.
        /// This bit has no effect when RELOAD is set.
        @ReadWrite(bits: 13..<14)
        public var start: START

        /// Stop generation (master mode)
        /// The bit is set by software, cleared by hardware when a STOP condition is detected, or when PE = 0.
        /// In Master Mode:
        /// Note: Writing ‘0’ to this bit has no effect.
        @ReadWrite(bits: 14..<15)
        public var stop: STOP

        /// NACK generation (slave mode)
        /// The bit is set by software, cleared by hardware when the NACK is sent, or when a STOP condition or an Address matched is received, or when PE=0.
        /// Note: Writing ‘0’ to this bit has no effect.
        /// This bit is used in slave mode only: in master receiver mode, NACK is automatically generated after last byte preceding STOP or RESTART condition, whatever the NACK bit value.
        /// When an overrun occurs in slave receiver NOSTRETCH mode, a NACK is automatically generated whatever the NACK bit value.
        /// When hardware PEC checking is enabled (PECBYTE=1), the PEC acknowledge value does not depend on the NACK value.
        @ReadWrite(bits: 15..<16)
        public var nack: NACK

        /// Number of bytes
        /// The number of bytes to be transmitted/received is programmed there. This field is don’t care in slave mode with SBC=0.
        /// Note: Changing these bits when the START bit is set is not allowed.
        @ReadWrite(bits: 16..<24)
        public var nbytes: NBYTES

        /// NBYTES reload mode
        /// This bit is set and cleared by software.
        @ReadWrite(bits: 24..<25)
        public var reload: RELOAD

        /// Automatic end mode (master mode)
        /// This bit is set and cleared by software.
        /// Note: This bit has no effect in slave mode or when the RELOAD bit is set.
        @ReadWrite(bits: 25..<26)
        public var autoend: AUTOEND

        /// Packet error checking byte
        /// This bit is set by software, and cleared by hardware when the PEC is transferred, or when a STOP condition or an Address matched is received, also when PE=0.
        /// Note: Writing ‘0’ to this bit has no effect.
        /// This bit has no effect when RELOAD is set.
        /// This bit has no effect is slave mode when SBC=0.
        /// If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadWrite(bits: 26..<27)
        public var pecbyte: PECBYTE
    }

    /// I2C own address 1 register
    @Register(bitWidth: 32)
    public struct OAR1 {
        /// Interface own slave address
        /// 7-bit addressing mode: OA1[7:1] contains the 7-bit own slave address. The bits OA1[9], OA1[8] and OA1[0] are don't care.
        /// 10-bit addressing mode: OA1[9:0] contains the 10-bit own slave address.
        /// Note: These bits can be written only when OA1EN=0.
        @ReadWrite(bits: 0..<10)
        public var oa1: OA1

        /// Own Address 1 10-bit mode
        /// Note: This bit can be written only when OA1EN=0.
        @ReadWrite(bits: 10..<11)
        public var oa1mode: OA1MODE

        /// Own Address 1 enable
        @ReadWrite(bits: 15..<16)
        public var oa1en: OA1EN
    }

    /// I2C own address 2 register
    @Register(bitWidth: 32)
    public struct OAR2 {
        /// Interface address
        /// 7-bit addressing mode: 7-bit address
        /// Note: These bits can be written only when OA2EN=0.
        @ReadWrite(bits: 1..<8)
        public var oa2: OA2

        /// Own Address 2 masks
        /// Note: These bits can be written only when OA2EN=0.
        /// As soon as OA2MSK is not equal to 0, the reserved I2C addresses (0b0000xxx and 0b1111xxx) are not acknowledged even if the comparison matches.
        @ReadWrite(bits: 8..<11)
        public var oa2msk: OA2MSK

        /// Own Address 2 enable
        @ReadWrite(bits: 15..<16)
        public var oa2en: OA2EN
    }

    /// I2C timing register
    @Register(bitWidth: 32)
    public struct TIMINGR {
        /// SCL low period (master mode)
        /// This field is used to generate the SCL low period in master mode.
        /// tSCLL = (SCLL+1) x tPRESC
        /// Note: SCLL is also used to generate tBUF and tSU:STA timings.
        @ReadWrite(bits: 0..<8)
        public var scll: SCLL

        /// SCL high period (master mode)
        /// This field is used to generate the SCL high period in master mode.
        /// tSCLH = (SCLH+1) x tPRESC
        /// Note: SCLH is also used to generate tSU:STO and tHD:STA timing.
        @ReadWrite(bits: 8..<16)
        public var sclh: SCLH

        /// Data hold time
        /// This field is used to generate the delay tSDADEL between SCL falling edge and SDA edge. In master mode and in slave mode with NOSTRETCH = 0, the SCL line is stretched low during tSDADEL.
        /// tSDADEL= SDADEL x tPRESC
        /// Note: SDADEL is used to generate tHD:DAT timing.
        @ReadWrite(bits: 16..<20)
        public var sdadel: SDADEL

        /// Data setup time
        /// This field is used to generate a delay tSCLDEL between SDA edge and SCL rising edge. In master mode and in slave mode with NOSTRETCH = 0, the SCL line is stretched low during tSCLDEL.
        /// tSCLDEL = (SCLDEL+1) x tPRESC
        /// Note: tSCLDEL is used to generate tSU:DAT timing.
        @ReadWrite(bits: 20..<24)
        public var scldel: SCLDEL

        /// Timing prescaler
        /// This field is used to prescale I2CCLK in order to generate the clock period tPRESC used for data setup and hold counters (refer to ) and for SCL high and low level counters (refer to ).
        /// tPRESC = (PRESC+1) x tI2CCLK
        @ReadWrite(bits: 28..<32)
        public var presc: PRESC
    }

    /// I2C timeout register
    @Register(bitWidth: 32)
    public struct TIMEOUTR {
        /// Bus Timeout A
        /// This field is used to configure:
        /// The SCL low timeout condition tTIMEOUT when TIDLE=0
        /// tTIMEOUT= (TIMEOUTA+1) x 2048 x tI2CCLK
        /// The bus idle condition (both SCL and SDA high) when TIDLE=1
        /// tIDLE= (TIMEOUTA+1) x 4 x tI2CCLK
        /// Note: These bits can be written only when TIMOUTEN=0.
        @ReadWrite(bits: 0..<12)
        public var timeouta: TIMEOUTA

        /// Idle clock timeout detection
        /// Note: This bit can be written only when TIMOUTEN=0.
        @ReadWrite(bits: 12..<13)
        public var tidle: TIDLE

        /// Clock timeout enable
        @ReadWrite(bits: 15..<16)
        public var timouten: TIMOUTEN

        /// Bus timeout B
        /// This field is used to configure the cumulative clock extension timeout:
        /// In master mode, the master cumulative clock low extend time (tLOW:MEXT) is detected
        /// In slave mode, the slave cumulative clock low extend time (tLOW:SEXT) is detected
        /// tLOW:EXT= (TIMEOUTB+1) x 2048 x tI2CCLK
        /// Note: These bits can be written only when TEXTEN=0.
        @ReadWrite(bits: 16..<28)
        public var timeoutb: TIMEOUTB

        /// Extended clock timeout enable
        @ReadWrite(bits: 31..<32)
        public var texten: TEXTEN
    }

    /// I2C interrupt and status register
    @Register(bitWidth: 32)
    public struct ISR {
        /// Transmit data register empty (transmitters)
        /// This bit is set by hardware when the I2C_TXDR register is empty. It is cleared when the next data to be sent is written in the I2C_TXDR register.
        /// This bit can be written to ‘1’ by software in order to flush the transmit data register I2C_TXDR.
        /// Note: This bit is set by hardware when PE=0.
        @ReadWrite(bits: 0..<1)
        public var txe: TXE

        /// Transmit interrupt status (transmitters)
        /// This bit is set by hardware when the I2C_TXDR register is empty and the data to be transmitted must be written in the I2C_TXDR register. It is cleared when the next data to be sent is written in the I2C_TXDR register.
        /// This bit can be written to ‘1’ by software when NOSTRETCH=1 only, in order to generate a TXIS event (interrupt if TXIE=1 or DMA request if TXDMAEN=1).
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadWrite(bits: 1..<2)
        public var txis: TXIS

        /// Receive data register not empty (receivers)
        /// This bit is set by hardware when the received data is copied into the I2C_RXDR register, and is ready to be read. It is cleared when I2C_RXDR is read.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 2..<3)
        public var rxne: RXNE

        /// Address matched (slave mode)
        /// This bit is set by hardware as soon as the received slave address matched with one of the enabled slave addresses. It is cleared by software by setting ADDRCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 3..<4)
        public var addr: ADDR

        /// Not Acknowledge received flag
        /// This flag is set by hardware when a NACK is received after a byte transmission. It is cleared by software by setting the NACKCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 4..<5)
        public var nackf: NACKF

        /// Stop detection flag
        /// This flag is set by hardware when a STOP condition is detected on the bus and the peripheral is involved in this transfer:
        /// either as a master, provided that the STOP condition is generated by the peripheral.
        /// or as a slave, provided that the peripheral has been addressed previously during this transfer.
        /// It is cleared by software by setting the STOPCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 5..<6)
        public var stopf: STOPF

        /// Transfer Complete (master mode)
        /// This flag is set by hardware when RELOAD=0, AUTOEND=0 and NBYTES data have been transferred. It is cleared by software when START bit or STOP bit is set.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 6..<7)
        public var tc: TC

        /// Transfer Complete Reload
        /// This flag is set by hardware when RELOAD=1 and NBYTES data have been transferred. It is cleared by software when NBYTES is written to a non-zero value.
        /// Note: This bit is cleared by hardware when PE=0.
        /// This flag is only for master mode, or for slave mode when the SBC bit is set.
        @ReadOnly(bits: 7..<8)
        public var tcr: TCR

        /// Bus error
        /// This flag is set by hardware when a misplaced Start or STOP condition is detected whereas the peripheral is involved in the transfer. The flag is not set during the address phase in slave mode. It is cleared by software by setting BERRCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 8..<9)
        public var berr: BERR

        /// Arbitration lost
        /// This flag is set by hardware in case of arbitration loss. It is cleared by software by setting the ARLOCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 9..<10)
        public var arlo: ARLO

        /// Overrun/Underrun (slave mode)
        /// This flag is set by hardware in slave mode with NOSTRETCH=1, when an overrun/underrun error occurs. It is cleared by software by setting the OVRCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        @ReadOnly(bits: 10..<11)
        public var ovr: OVR

        /// PEC Error in reception
        /// This flag is set by hardware when the received PEC does not match with the PEC register content. A NACK is automatically sent after the wrong PEC reception. It is cleared by software by setting the PECCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        /// If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadOnly(bits: 11..<12)
        public var pecerr: PECERR

        /// Timeout or tLOW detection flag
        /// This flag is set by hardware when a timeout or extended clock timeout occurred. It is cleared by software by setting the TIMEOUTCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        /// If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadOnly(bits: 12..<13)
        public var timeout: TIMEOUT

        /// SMBus alert
        /// This flag is set by hardware when SMBHEN=1 (SMBus host configuration), ALERTEN=1 and a SMBALERT event (falling edge) is detected on SMBA pin. It is cleared by software by setting the ALERTCF bit.
        /// Note: This bit is cleared by hardware when PE=0.
        /// If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @ReadOnly(bits: 13..<14)
        public var alert: ALERT

        /// Bus busy
        /// This flag indicates that a communication is in progress on the bus. It is set by hardware when a START condition is detected. It is cleared by hardware when a STOP condition is detected, or when PE=0.
        @ReadOnly(bits: 15..<16)
        public var busy: BUSY

        /// Transfer direction (Slave mode)
        /// This flag is updated when an address match event occurs (ADDR=1).
        @ReadOnly(bits: 16..<17)
        public var dir: DIR

        /// Address match code (Slave mode)
        /// These bits are updated with the received address when an address match event occurs (ADDR = 1).
        /// In the case of a 10-bit address, ADDCODE provides the 10-bit header followed by the 2 MSBs of the address.
        @ReadOnly(bits: 17..<24)
        public var addcode: ADDCODE
    }

    /// I2C interrupt clear register
    @Register(bitWidth: 32)
    public struct ICR {
        /// Address matched flag clear
        /// Writing 1 to this bit clears the ADDR flag in the I2C_ISR register. Writing 1 to this bit also clears the START bit in the I2C_CR2 register.
        @WriteOnly(bits: 3..<4)
        public var addrcf: ADDRCF

        /// Not Acknowledge flag clear
        /// Writing 1 to this bit clears the NACKF flag in I2C_ISR register.
        @WriteOnly(bits: 4..<5)
        public var nackcf: NACKCF

        /// STOP detection flag clear
        /// Writing 1 to this bit clears the STOPF flag in the I2C_ISR register.
        @WriteOnly(bits: 5..<6)
        public var stopcf: STOPCF

        /// Bus error flag clear
        /// Writing 1 to this bit clears the BERRF flag in the I2C_ISR register.
        @WriteOnly(bits: 8..<9)
        public var berrcf: BERRCF

        /// Arbitration lost flag clear
        /// Writing 1 to this bit clears the ARLO flag in the I2C_ISR register.
        @WriteOnly(bits: 9..<10)
        public var arlocf: ARLOCF

        /// Overrun/Underrun flag clear
        /// Writing 1 to this bit clears the OVR flag in the I2C_ISR register.
        @WriteOnly(bits: 10..<11)
        public var ovrcf: OVRCF

        /// PEC Error flag clear
        /// Writing 1 to this bit clears the PECERR flag in the I2C_ISR register.
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @WriteOnly(bits: 11..<12)
        public var peccf: PECCF

        /// Timeout detection flag clear
        /// Writing 1 to this bit clears the TIMEOUT flag in the I2C_ISR register.
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @WriteOnly(bits: 12..<13)
        public var timoutcf: TIMOUTCF

        /// Alert flag clear
        /// Writing 1 to this bit clears the ALERT flag in the I2C_ISR register.
        /// Note: If the SMBus feature is not supported, this bit is reserved and forced by hardware to ‘0’. Refer to .
        @WriteOnly(bits: 13..<14)
        public var alertcf: ALERTCF
    }

    /// I2C PEC register
    @Register(bitWidth: 32)
    public struct PECR {
        /// Packet error checking register
        /// This field contains the internal PEC when PECEN=1.
        /// The PEC is cleared by hardware when PE=0.
        @ReadOnly(bits: 0..<8)
        public var pec: PEC
    }

    /// I2C receive data register
    @Register(bitWidth: 32)
    public struct RXDR {
        /// 8-bit receive data
        /// Data byte received from the I2C bus
        @ReadOnly(bits: 0..<8)
        public var rxdata: RXDATA
    }

    /// I2C transmit data register
    @Register(bitWidth: 32)
    public struct TXDR {
        /// 8-bit transmit data
        /// Data byte to be transmitted to the I2C bus
        /// Note: These bits can be written only when TXE=1.
        @ReadWrite(bits: 0..<8)
        public var txdata: TXDATA
    }
}
