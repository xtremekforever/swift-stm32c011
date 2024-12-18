// Generated by svd2swift.

import MMIO

/// General-purpose timers
@RegisterBlock
public struct TIM16: Sendable {
    /// TIM16 control register 1
    @RegisterBlock(offset: 0x0)
    public var cr1: Register<CR1>

    /// TIM16 control register 2
    @RegisterBlock(offset: 0x4)
    public var cr2: Register<CR2>

    /// TIM16 DMA/interrupt enable register
    @RegisterBlock(offset: 0xc)
    public var dier: Register<DIER>

    /// TIM16 status register
    @RegisterBlock(offset: 0x10)
    public var sr: Register<SR>

    /// TIM16 event generation register
    @RegisterBlock(offset: 0x14)
    public var egr: Register<EGR>

    /// TIM16 capture/compare mode register 1 [alternate]
    @RegisterBlock(offset: 0x18)
    public var ccmr1_input: Register<CCMR1_input>

    /// TIM16 capture/compare mode register 1 [alternate]
    @RegisterBlock(offset: 0x18)
    public var ccmr1_output: Register<CCMR1_output>

    /// TIM16 capture/compare enable register
    @RegisterBlock(offset: 0x20)
    public var ccer: Register<CCER>

    /// TIM16 counter
    @RegisterBlock(offset: 0x24)
    public var cnt: Register<CNT>

    /// TIM16 prescaler
    @RegisterBlock(offset: 0x28)
    public var psc: Register<PSC>

    /// TIM16 auto-reload register
    @RegisterBlock(offset: 0x2c)
    public var arr: Register<ARR>

    /// TIM16 repetition counter register
    @RegisterBlock(offset: 0x30)
    public var rcr: Register<RCR>

    /// TIM16 capture/compare register 1
    @RegisterBlock(offset: 0x34)
    public var ccr1: Register<CCR1>

    /// TIM16 break and dead-time register
    @RegisterBlock(offset: 0x44)
    public var bdtr: Register<BDTR>

    /// TIM16 DMA control register
    @RegisterBlock(offset: 0x48)
    public var dcr: Register<DCR>

    /// TIM16 DMA address for full transfer
    @RegisterBlock(offset: 0x4c)
    public var dmar: Register<DMAR>

    /// TIM16 alternate function register 1
    @RegisterBlock(offset: 0x60)
    public var af1: Register<AF1>

    /// TIM16 input selection register
    @RegisterBlock(offset: 0x68)
    public var tisel: Register<TISEL>
}

extension TIM16 {
    /// TIM16 control register 1
    @Register(bitWidth: 16)
    public struct CR1 {
        /// Counter enable
        /// Note: External clock and gated mode can work only if the CEN bit has been previously set by software. However trigger mode can set the CEN bit automatically by hardware.
        @ReadWrite(bits: 0..<1)
        public var cen: CEN

        /// Update disable
        /// This bit is set and cleared by software to enable/disable UEV event generation.
        /// Counter overflow/underflow
        /// Setting the UG bit
        /// Update generation through the slave mode controller
        /// Buffered registers are then loaded with their preload values.
        @ReadWrite(bits: 1..<2)
        public var udis: UDIS

        /// Update request source
        /// This bit is set and cleared by software to select the UEV event sources.
        /// Counter overflow/underflow
        /// Setting the UG bit
        /// Update generation through the slave mode controller
        @ReadWrite(bits: 2..<3)
        public var urs: URS

        /// One pulse mode
        @ReadWrite(bits: 3..<4)
        public var opm: OPM

        /// Auto-reload preload enable
        @ReadWrite(bits: 7..<8)
        public var arpe: ARPE

        /// Clock division
        /// This bit-field indicates the division ratio between the timer clock (CK_INT) frequency and the dead-time and sampling clock (tDTS)used by the dead-time generators and the digital filters (TIx),
        @ReadWrite(bits: 8..<10)
        public var ckd: CKD

        /// UIF status bit remapping
        @ReadWrite(bits: 11..<12)
        public var uifremap: UIFREMAP
    }

    /// TIM16 control register 2
    @Register(bitWidth: 16)
    public struct CR2 {
        /// Capture/compare preloaded control
        /// Note: This bit acts only on channels that have a complementary output.
        @ReadWrite(bits: 0..<1)
        public var ccpc: CCPC

        /// Capture/compare control update selection
        /// Note: This bit acts only on channels that have a complementary output.
        @ReadWrite(bits: 2..<3)
        public var ccus: CCUS

        /// Capture/compare DMA selection
        @ReadWrite(bits: 3..<4)
        public var ccds: CCDS

        /// Output Idle state 1 (OC1 output)
        /// Note: This bit can not be modified as long as LOCK level 1, 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 8..<9)
        public var ois1: OIS1

        /// Output Idle state 1 (OC1N output)
        /// Note: This bit can not be modified as long as LOCK level 1, 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 9..<10)
        public var ois1n: OIS1N
    }

    /// TIM16 DMA/interrupt enable register
    @Register(bitWidth: 16)
    public struct DIER {
        /// Update interrupt enable
        @ReadWrite(bits: 0..<1)
        public var uie: UIE

        /// Capture/Compare 1 interrupt enable
        @ReadWrite(bits: 1..<2)
        public var cc1ie: CC1IE

        /// COM interrupt enable
        @ReadWrite(bits: 5..<6)
        public var comie: COMIE

        /// Break interrupt enable
        @ReadWrite(bits: 7..<8)
        public var bie: BIE

        /// Update DMA request enable
        @ReadWrite(bits: 8..<9)
        public var ude: UDE

        /// Capture/Compare 1 DMA request enable
        @ReadWrite(bits: 9..<10)
        public var cc1de: CC1DE
    }

    /// TIM16 status register
    @Register(bitWidth: 16)
    public struct SR {
        /// Update interrupt flag
        /// This bit is set by hardware on an update event. It is cleared by software.
        /// At overflow regarding the repetition counter value (update if repetition counter = 0) and if the UDIS=0 in the TIMx_CR1 register.
        /// When CNT is reinitialized by software using the UG bit in TIMx_EGR register, if URS=0 and UDIS=0 in the TIMx_CR1 register.
        @ReadWrite(bits: 0..<1)
        public var uif: UIF

        /// Capture/Compare 1 interrupt flag
        /// This flag is set by hardware. It is cleared by software (input capture or output compare mode) or by reading the TIMx_CCR1 register (input capture mode only).
        /// If channel CC1 is configured as output: this flag is set when the content of the counter TIMx_CNT matches the content of the TIMx_CCR1 register. When the content of TIMx_CCR1 is greater than the content of TIMx_ARR, the CC1IF bit goes high on the counter overflow (in up-counting and up/down-counting modes) or underflow (in down-counting mode). There are 3 possible options for flag setting in center-aligned mode, refer to the CMS bits in the TIMx_CR1 register for the full description.
        /// If channel CC1 is configured as input: this bit is set when counter value has been captured in TIMx_CCR1 register (an edge has been detected on IC1, as per the edge sensitivity defined with the CC1P and CC1NP bits setting, in TIMx_CCER).
        @ReadWrite(bits: 1..<2)
        public var cc1if: CC1IF

        /// COM interrupt flag
        /// This flag is set by hardware on a COM event (once the capture/compare control bits –CCxE, CCxNE, OCxM– have been updated). It is cleared by software.
        @ReadWrite(bits: 5..<6)
        public var comif: COMIF

        /// Break interrupt flag
        /// This flag is set by hardware as soon as the break input goes active. It can be cleared by software if the break input is not active.
        @ReadWrite(bits: 7..<8)
        public var bif: BIF

        /// Capture/Compare 1 overcapture flag
        /// This flag is set by hardware only when the corresponding channel is configured in input capture mode. It is cleared by software by writing it to ‘0’.
        @ReadWrite(bits: 9..<10)
        public var cc1of: CC1OF
    }

    /// TIM16 event generation register
    @Register(bitWidth: 16)
    public struct EGR {
        /// Update generation
        /// This bit can be set by software, it is automatically cleared by hardware.
        @WriteOnly(bits: 0..<1)
        public var ug: UG

        /// Capture/Compare 1 generation
        /// This bit is set by software in order to generate an event, it is automatically cleared by hardware.
        /// If channel CC1 is configured as output:
        /// CC1IF flag is set, Corresponding interrupt or DMA request is sent if enabled.
        /// If channel CC1 is configured as input:
        /// The current value of the counter is captured in TIMx_CCR1 register. The CC1IF flag is set, the corresponding interrupt or DMA request is sent if enabled. The CC1OF flag is set if the CC1IF flag was already high.
        @WriteOnly(bits: 1..<2)
        public var cc1g: CC1G

        /// Capture/Compare control update generation
        /// This bit can be set by software, it is automatically cleared by hardware.
        /// Note: This bit acts only on channels that have a complementary output.
        @WriteOnly(bits: 5..<6)
        public var comg: COMG

        /// Break generation
        /// This bit is set by software in order to generate an event, it is automatically cleared by hardware.
        @WriteOnly(bits: 7..<8)
        public var bg: BG
    }

    /// TIM16 capture/compare mode register 1 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR1_input {
        /// Capture/Compare 1 Selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Others: Reserved
        /// Note: CC1S bits are writable only when the channel is OFF (CC1E = ‘0’ in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc1s: CC1S

        /// Input capture 1 prescaler
        /// This bit-field defines the ratio of the prescaler acting on CC1 input (IC1).
        /// The prescaler is reset as soon as CC1E=’0’ (TIMx_CCER register).
        @ReadWrite(bits: 2..<4)
        public var ic1psc: IC1PSC

        /// Input capture 1 filter
        /// This bit-field defines the frequency used to sample TI1 input and the length of the digital filter applied to TI1. The digital filter is made of an event counter in which N consecutive events are needed to validate a transition on the output:
        @ReadWrite(bits: 4..<8)
        public var ic1f: IC1F
    }

    /// TIM16 capture/compare mode register 1 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR1_output {
        /// Capture/Compare 1 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Others: Reserved
        /// Note: CC1S bits are writable only when the channel is OFF (CC1E = ‘0’ in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc1s: CC1S

        /// Output Compare 1 fast enable
        /// This bit decreases the latency between a trigger event and a transition on the timer output. It must be used in one-pulse mode (OPM bit set in TIMx_CR1 register), to have the output pulse starting as soon as possible after the starting trigger.
        @ReadWrite(bits: 2..<3)
        public var oc1fe: OC1FE

        /// Output Compare 1 preload enable
        /// Note: These bits can not be modified as long as LOCK level 3 has been programmed (LOCK bits in TIMx_BDTR register) and CC1S=’00’ (the channel is configured in output).
        /// The PWM mode can be used without validating the preload register only in one pulse mode (OPM bit set in TIMx_CR1 register). Else the behavior is not guaranteed.
        @ReadWrite(bits: 3..<4)
        public var oc1pe: OC1PE

        /// Output Compare 1 mode
        /// These bits define the behavior of the output reference signal OC1REF from which OC1 and OC1N are derived. OC1REF is active high whereas OC1 and OC1N active level depends on CC1P and CC1NP bits.
        /// All other values: Reserved
        /// Note: These bits can not be modified as long as LOCK level 3 has been programmed (LOCK bits in TIMx_BDTR register) and CC1S=’00’ (the channel is configured in output).
        /// In PWM mode 1 or 2, the OCREF level changes only when the result of the comparison changes or when the output compare mode switches from “frozen” mode to “PWM” mode.
        /// The OC1M[3] bit is not contiguous, located in bit 16.
        @ReadWrite(bits: 4..<7)
        public var oc1m1: OC1M1

        /// Output Compare 1 mode
        /// These bits define the behavior of the output reference signal OC1REF from which OC1 and OC1N are derived. OC1REF is active high whereas OC1 and OC1N active level depends on CC1P and CC1NP bits.
        /// All other values: Reserved
        /// Note: These bits can not be modified as long as LOCK level 3 has been programmed (LOCK bits in TIMx_BDTR register) and CC1S=’00’ (the channel is configured in output).
        /// In PWM mode 1 or 2, the OCREF level changes only when the result of the comparison changes or when the output compare mode switches from “frozen” mode to “PWM” mode.
        /// The OC1M[3] bit is not contiguous, located in bit 16.
        @ReadWrite(bits: 16..<17)
        public var oc1m2: OC1M2
    }

    /// TIM16 capture/compare enable register
    @Register(bitWidth: 16)
    public struct CCER {
        /// Capture/Compare 1 output enable
        /// When CC1 channel is configured as output, the OC1 level depends on MOE, OSSI, OSSR, OIS1, OIS1N and CC1NE bits, regardless of the CC1E bits state. Refer to for details.
        @ReadWrite(bits: 0..<1)
        public var cc1e: CC1E

        /// Capture/Compare 1 output polarity
        /// When CC1 channel is configured as input, both CC1NP/CC1P bits select the active polarity of TI1FP1 and TI2FP1 for trigger or capture operations.
        /// CC1NP=0, CC1P=0:	non-inverted/rising edge. The circuit is sensitive to TIxFP1 rising edge (capture or trigger operations in reset, external clock or trigger mode), TIxFP1 is not inverted (trigger operation in gated mode or encoder mode).
        /// CC1NP=0, CC1P=1:	inverted/falling edge. The circuit is sensitive to TIxFP1 falling edge (capture or trigger operations in reset, external clock or trigger mode), TIxFP1 is inverted (trigger operation in gated mode or encoder mode).
        /// CC1NP=1, CC1P=1:	non-inverted/both edges/ The circuit is sensitive to both TIxFP1 rising and falling edges (capture or trigger operations in reset, external clock or trigger mode), TIxFP1is not inverted (trigger operation in gated mode). This configuration must not be used in encoder mode.
        /// CC1NP=1, CC1P=0:	this configuration is reserved, it must not be used.
        /// Note: This bit is not writable as soon as LOCK level 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register).
        /// On channels that have a complementary output, this bit is preloaded. If the CCPC bit is set in the TIMx_CR2 register then the CC1P active bit takes the new value from the preloaded bit only when a Commutation event is generated.
        @ReadWrite(bits: 1..<2)
        public var cc1p: CC1P

        /// Capture/Compare 1 complementary output enable
        @ReadWrite(bits: 2..<3)
        public var cc1ne: CC1NE

        /// Capture/Compare 1 complementary output polarity
        /// CC1 channel configured as output:
        /// CC1 channel configured as input:
        /// This bit is used in conjunction with CC1P to define the polarity of TI1FP1 and TI2FP1. Refer
        /// to the description of CC1P.
        /// Note: This bit is not writable as soon as LOCK level 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register) and CC1S=”00” (the channel is configured in output).
        /// On channels that have a complementary output, this bit is preloaded. If the CCPC bit is set in the TIMx_CR2 register then the CC1NP active bit takes the new value from the preloaded bit only when a commutation event is generated.
        @ReadWrite(bits: 3..<4)
        public var cc1np: CC1NP
    }

    /// TIM16 counter
    @Register(bitWidth: 32)
    public struct CNT {
        /// Counter value
        @ReadWrite(bits: 0..<16)
        public var cnt_field: CNT_FIELD

        /// UIF Copy
        /// This bit is a read-only copy of the UIF bit of the TIMx_ISR register. If the UIFREMAP bit in TIMx_CR1 is reset, bit 31 is reserved and read as 0.
        @ReadOnly(bits: 31..<32)
        public var uifcpy: UIFCPY
    }

    /// TIM16 prescaler
    @Register(bitWidth: 16)
    public struct PSC {
        /// Prescaler value
        /// The counter clock frequency (CK_CNT) is equal to fCK_PSC / (PSC[15:0] + 1).
        /// PSC contains the value to be loaded in the active prescaler register at each update event (including when the counter is cleared through UG bit of TIMx_EGR register or through trigger controller when configured in “reset mode”).
        @ReadWrite(bits: 0..<16)
        public var psc_field: PSC_FIELD
    }

    /// TIM16 auto-reload register
    @Register(bitWidth: 16)
    public struct ARR {
        /// Auto-reload value
        /// ARR is the value to be loaded in the actual auto-reload register.
        /// Refer to the for more details about ARR update and behavior.
        /// The counter is blocked while the auto-reload value is null.
        @ReadWrite(bits: 0..<16)
        public var arr_field: ARR_FIELD
    }

    /// TIM16 repetition counter register
    @Register(bitWidth: 16)
    public struct RCR {
        /// Repetition counter value
        /// These bits allow the user to set-up the update rate of the compare registers (i.e. periodic transfers from preload to active registers) when preload registers are enable, as well as the update interrupt generation rate, if this interrupt is enable.
        /// Each time the REP_CNT related downcounter reaches zero, an update event is generated and it restarts counting from REP value. As REP_CNT is reloaded with REP value only at the repetition update event U_RC, any write to the TIMx_RCR register is not taken in account until the next repetition update event.
        /// It means in PWM mode (REP+1) corresponds to the number of PWM periods in edge-aligned mode.
        @ReadWrite(bits: 0..<8)
        public var rep: REP
    }

    /// TIM16 capture/compare register 1
    @Register(bitWidth: 16)
    public struct CCR1 {
        /// Capture/Compare 1 value
        /// If channel CC1 is configured as output:
        /// CCR1 is the value to be loaded in the actual capture/compare 1 register (preload value).
        /// It is loaded permanently if the preload feature is not selected in the TIMx_CCMR1 register (bit OC1PE). Else the preload value is copied in the active capture/compare 1 register when an update event occurs.
        /// The active capture/compare register contains the value to be compared to the counter TIMx_CNT and signaled on OC1 output.
        /// If channel CC1 is configured as input:
        /// CCR1 is the counter value transferred by the last input capture 1 event (IC1).
        @ReadWrite(bits: 0..<16)
        public var ccr1_field: CCR1_FIELD
    }

    /// TIM16 break and dead-time register
    @Register(bitWidth: 32)
    public struct BDTR {
        /// Dead-time generator setup
        /// This bit-field defines the duration of the dead-time inserted between the complementary outputs. DT correspond to this duration.
        /// DTG[7:5] = 0xx => DT = DTG[7:0] x tdtg with tdtg = tDTS
        /// DTG[7:5] = 10x => DT = (64 + DTG[5:0]) x tdtg with tdtg = 2 x tDTS
        /// DTG[7:5] = 110 => DT = (32 + DTG[4:0]) x tdtg with tdtg = 8 x tDTS
        /// DTG[7:5] = 111 => DT = (32 + DTG[4:0]) x tdtg with tdtg = 16 x tDTS
        /// Example if tDTS = 125 ns (8 MHz), dead-time possible values are:
        /// 0 to 15875 ns by 125 ns steps,
        /// 16 �s to 31750 ns by 250 ns steps,
        /// 32 �s to 63 �s by 1 �s steps,
        /// 64 �s to 126 �s by 2 �s steps
        /// Note: This bit-field can not be modified as long as LOCK level 1, 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 0..<8)
        public var dtg: DTG

        /// Lock configuration
        /// These bits offer a write protection against software errors.
        /// Note: The LOCK bits can be written only once after the reset. Once the TIMx_BDTR register has been written, their content is frozen until the next reset.
        @ReadWrite(bits: 8..<10)
        public var lock: LOCK

        /// Off-state selection for Idle mode
        /// This bit is used when MOE=0 on channels configured as outputs.
        /// See OC/OCN enable description for more details (enable register (TIM16_CCER)(TIMx_CCER)(x = 16 to 17) on page 1793).
        /// Note: This bit can not be modified as soon as the LOCK level 2 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 10..<11)
        public var ossi: OSSI

        /// Off-state selection for Run mode
        /// This bit is used when MOE=1 on channels that have a complementary output which are configured as outputs. OSSR is not implemented if no complementary output is implemented in the timer.
        /// See OC/OCN enable description for more details (enable register (TIM16_CCER)(TIMx_CCER)(x = 16 to 17) on page 1793).
        /// Note: This bit can not be modified as soon as the LOCK level 2 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 11..<12)
        public var ossr: OSSR

        /// Break enable
        /// 1; Break inputs (BRK and CCS clock failure event) enabled
        /// Note: This bit cannot be modified when LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        /// Any write operation to this bit takes a delay of 1 APB clock cycle to become effective.
        @ReadWrite(bits: 12..<13)
        public var bke: BKE

        /// Break polarity
        /// Note: This bit can not be modified as long as LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        /// Any write operation to this bit takes a delay of 1 APB clock cycle to become effective.
        @ReadWrite(bits: 13..<14)
        public var bkp: BKP

        /// Automatic output enable
        /// Note: This bit can not be modified as long as LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 14..<15)
        public var aoe: AOE

        /// Main output enable
        /// This bit is cleared asynchronously by hardware as soon as the break input is active. It is set by software or automatically depending on the AOE bit. It is acting only on the channels which are configured in output.
        /// enable register (TIM16_CCER)(TIMx_CCER)(x = 16 to 17) on page 1793).
        @ReadWrite(bits: 15..<16)
        public var moe: MOE

        /// Break filter
        /// This bit-field defines the frequency used to sample BRK input and the length of the digital filter applied to BRK. The digital filter is made of an event counter in which N events are needed to validate a transition on the output:
        /// This bit cannot be modified when LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 16..<20)
        public var bkf: BKF

        /// Break Disarm
        /// This bit is cleared by hardware when no break source is active.
        /// The BKDSRM bit must be set by software to release the bidirectional output control (open-drain output in Hi-Z state) and then be polled it until it is reset by hardware, indicating that the fault condition has disappeared.
        /// Note: Any write operation to this bit takes a delay of 1 APB clock cycle to become effective.
        @ReadWrite(bits: 26..<27)
        public var bkdsrm: BKDSRM

        /// Break Bidirectional
        /// In the bidirectional mode (BKBID bit set to 1), the break input is configured both in input mode and in open drain output mode. Any active break event asserts a low logic level on the Break input to indicate an internal break event to external devices.
        /// Note: This bit cannot be modified as long as LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        /// Note: Any write operation to this bit takes a delay of 1 APB clock cycle to become effective.
        @ReadWrite(bits: 28..<29)
        public var bkbid: BKBID
    }

    /// TIM16 DMA control register
    @Register(bitWidth: 16)
    public struct DCR {
        /// DMA base address
        /// This 5-bit field defines the base-address for DMA transfers (when read/write access are done through the TIMx_DMAR address). DBA is defined as an offset starting from the address of the TIMx_CR1 register.
        /// Example:
        /// ...
        /// Example: Let us consider the following transfer: DBL = 7 transfers and DBA = TIMx_CR1. In this case the transfer is done to/from 7 registers starting from the TIMx_CR1 address.
        @ReadWrite(bits: 0..<5)
        public var dba: DBA

        /// DMA burst length
        /// This 5-bit field defines the length of DMA transfers (the timer recognizes a burst transfer when a read or a write access is done to the TIMx_DMAR address), i.e. the number of transfers. Transfers can be in half-words or in bytes (see example below).
        /// ...
        @ReadWrite(bits: 8..<13)
        public var dbl: DBL
    }

    /// TIM16 DMA address for full transfer
    @Register(bitWidth: 16)
    public struct DMAR {
        /// DMA register for burst accesses
        /// A read or write operation to the DMAR register accesses the register located at the address
        /// (TIMx_CR1 address) + (DBA + DMA index) x 4
        /// where TIMx_CR1 address is the address of the control register 1, DBA is the DMA base address configured in TIMx_DCR register, DMA index is automatically controlled by the DMA transfer, and ranges from 0 to DBL (DBL configured in TIMx_DCR).
        @ReadWrite(bits: 0..<16)
        public var dmab: DMAB
    }

    /// TIM16 alternate function register 1
    @Register(bitWidth: 32)
    public struct AF1 {
        /// BRK BKIN input enable
        /// This bit enables the BKIN alternate function input for the timer’s BRK input. BKIN input is ‘ORed’ with the other BRK sources.
        /// Note: This bit can not be modified as long as LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 0..<1)
        public var bkine: BKINE

        /// BRK BKIN input polarity
        /// This bit selects the BKIN alternate function input sensitivity. It must be programmed together with the BKP polarity bit.
        /// Note: This bit can not be modified as long as LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
        @ReadWrite(bits: 9..<10)
        public var bkinp: BKINP
    }

    /// TIM16 input selection register
    @Register(bitWidth: 32)
    public struct TISEL {
        /// selects TI1[0] to TI1[15] input
        /// Others: Reserved
        @ReadWrite(bits: 0..<4)
        public var ti1sel: TI1SEL
    }
}
