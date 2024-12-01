// Generated by svd2swift.

import MMIO

/// General-purpose timer
@RegisterBlock
public struct TIM3: Sendable {
    /// TIM3 control register 1
    @RegisterBlock(offset: 0x0)
    public var cr1: Register<CR1>

    /// TIM3 control register 2
    @RegisterBlock(offset: 0x4)
    public var cr2: Register<CR2>

    /// TIM3 slave mode control register
    @RegisterBlock(offset: 0x8)
    public var smcr: Register<SMCR>

    /// TIM3 DMA/Interrupt enable register
    @RegisterBlock(offset: 0xc)
    public var dier: Register<DIER>

    /// TIM3 status register
    @RegisterBlock(offset: 0x10)
    public var sr: Register<SR>

    /// TIM3 event generation register
    @RegisterBlock(offset: 0x14)
    public var egr: Register<EGR>

    /// TIM3 capture/compare mode register 1 [alternate]
    @RegisterBlock(offset: 0x18)
    public var ccmr1_input: Register<CCMR1_input>

    /// TIM3 capture/compare mode register 1 [alternate]
    @RegisterBlock(offset: 0x18)
    public var ccmr1_output: Register<CCMR1_output>

    /// TIM3 capture/compare mode register 2 [alternate]
    @RegisterBlock(offset: 0x1c)
    public var ccmr2_input: Register<CCMR2_input>

    /// TIM3 capture/compare mode register 2 [alternate]
    @RegisterBlock(offset: 0x1c)
    public var ccmr2_output: Register<CCMR2_output>

    /// TIM3 capture/compare enable register
    @RegisterBlock(offset: 0x20)
    public var ccer: Register<CCER>

    /// TIM3 counter [alternate]
    @RegisterBlock(offset: 0x24)
    public var cnt: Register<CNT>

    /// TIM3 prescaler
    @RegisterBlock(offset: 0x28)
    public var psc: Register<PSC>

    /// TIM3 auto-reload register
    @RegisterBlock(offset: 0x2c)
    public var arr: Register<ARR>

    /// TIM3 capture/compare register 1
    @RegisterBlock(offset: 0x34)
    public var ccr1: Register<CCR1>

    /// TIM3 capture/compare register 2
    @RegisterBlock(offset: 0x38)
    public var ccr2: Register<CCR2>

    /// TIM3 capture/compare register 3
    @RegisterBlock(offset: 0x3c)
    public var ccr3: Register<CCR3>

    /// TIM3 capture/compare register 4
    @RegisterBlock(offset: 0x40)
    public var ccr4: Register<CCR4>

    /// TIM3 DMA control register
    @RegisterBlock(offset: 0x48)
    public var dcr: Register<DCR>

    /// TIM3 DMA address for full transfer
    @RegisterBlock(offset: 0x4c)
    public var dmar: Register<DMAR>

    /// TIM3 alternate function option register 1
    @RegisterBlock(offset: 0x60)
    public var af1: Register<AF1>

    /// TIM3 timer input selection register
    @RegisterBlock(offset: 0x68)
    public var tisel: Register<TISEL>
}

extension TIM3 {
    /// TIM3 control register 1
    @Register(bitWidth: 16)
    public struct CR1 {
        /// Counter enable
        /// Note: External clock, gated mode and encoder mode can work only if the CEN bit has been previously set by software. However trigger mode can set the CEN bit automatically by hardware.
        /// CEN is cleared automatically in one-pulse mode, when an update event occurs.
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

        /// One-pulse mode
        @ReadWrite(bits: 3..<4)
        public var opm: OPM

        /// Direction
        /// Note: This bit is read only when the timer is configured in Center-aligned mode or Encoder mode.
        @ReadWrite(bits: 4..<5)
        public var dir: DIR

        /// Center-aligned mode selection
        /// Note: It is not allowed to switch from edge-aligned mode to center-aligned mode as long as the counter is enabled (CEN=1)
        @ReadWrite(bits: 5..<7)
        public var cms: CMS

        /// Auto-reload preload enable
        @ReadWrite(bits: 7..<8)
        public var arpe: ARPE

        /// Clock division
        /// This bit-field indicates the division ratio between the timer clock (CK_INT) frequency and sampling clock used by the digital filters (ETR, TIx),
        @ReadWrite(bits: 8..<10)
        public var ckd: CKD

        /// UIF status bit remapping
        @ReadWrite(bits: 11..<12)
        public var uifremap: UIFREMAP
    }

    /// TIM3 control register 2
    @Register(bitWidth: 16)
    public struct CR2 {
        /// Capture/compare DMA selection
        @ReadWrite(bits: 3..<4)
        public var ccds: CCDS

        /// Master mode selection
        /// These bits permit to select the information to be sent in master mode to slave timers for synchronization (TRGO). The combination is as follows:
        /// When the Counter Enable signal is controlled by the trigger input, there is a delay on TRGO, except if the master/slave mode is selected (see the MSM bit description in TIMx_SMCR register).
        /// Note: The clock of the slave timer or ADC must be enabled prior to receive events from the master timer, and must not be changed on-the-fly while triggers are received from the master timer.
        @ReadWrite(bits: 4..<7)
        public var mms: MMS

        /// TI1 selection
        @ReadWrite(bits: 7..<8)
        public var ti1s: TI1S
    }

    /// TIM3 slave mode control register
    @Register(bitWidth: 32)
    public struct SMCR {
        /// Slave mode selection
        /// When external signals are selected the active edge of the trigger signal (TRGI) is linked to the polarity selected on the external input (see Input Control register and Control Register description.
        /// reinitializes the counter, generates an update of the registers and starts the counter.
        /// Note: The gated mode must not be used if TI1F_ED is selected as the trigger input (TS=00100). Indeed, TI1F_ED outputs 1 pulse for each transition on TI1F, whereas the gated mode checks the level of the trigger signal.
        /// Note: The clock of the slave peripherals (timer, ADC, ...) receiving the TRGO or the TRGO2 signals must be enabled prior to receive events from the master timer, and the clock frequency (prescaler) must not be changed on-the-fly while triggers are received from the master timer.
        @ReadWrite(bits: 0..<3)
        public var sms1: SMS1

        /// OCREF clear selection
        /// This bit is used to select the OCREF clear source
        @ReadWrite(bits: 3..<4)
        public var occs: OCCS

        /// Trigger selection
        /// This bit-field selects the trigger input to be used to synchronize the counter.
        /// Others: Reserved
        /// See for more details on ITRx meaning for each Timer.
        /// Note: These bits must be changed only when they are not used (e.g. when SMS=000) to avoid wrong edge detections at the transition.
        @ReadWrite(bits: 4..<7)
        public var ts1: TS1

        /// Master/Slave mode
        @ReadWrite(bits: 7..<8)
        public var msm: MSM

        /// External trigger filter
        /// This bit-field then defines the frequency used to sample ETRP signal and the length of the digital filter applied to ETRP. The digital filter is made of an event counter in which N consecutive events are needed to validate a transition on the output:
        @ReadWrite(bits: 8..<12)
        public var etf: ETF

        /// External trigger prescaler
        /// External trigger signal ETRP frequency must be at most 1/4 of CK_INT frequency. A prescaler can be enabled to reduce ETRP frequency. It is useful when inputting fast external clocks.
        @ReadWrite(bits: 12..<14)
        public var etps: ETPS

        /// External clock enable
        /// This bit enables External clock mode 2.
        /// Note: Setting the ECE bit has the same effect as selecting external clock mode 1 with TRGI connected to ETRF (SMS=111 and TS=00111).
        /// It is possible to simultaneously use external clock mode 2 with the following slave modes: reset mode, gated mode and trigger mode. Nevertheless, TRGI must not be connected to ETRF in this case (TS bits must not be 00111).
        /// If external clock mode 1 and external clock mode 2 are enabled at the same time, the external clock input is ETRF.
        @ReadWrite(bits: 14..<15)
        public var ece: ECE

        /// External trigger polarity
        /// This bit selects whether ETR or ETR is used for trigger operations
        @ReadWrite(bits: 15..<16)
        public var etp: ETP

        /// Slave mode selection
        /// When external signals are selected the active edge of the trigger signal (TRGI) is linked to the polarity selected on the external input (see Input Control register and Control Register description.
        /// reinitializes the counter, generates an update of the registers and starts the counter.
        /// Note: The gated mode must not be used if TI1F_ED is selected as the trigger input (TS=00100). Indeed, TI1F_ED outputs 1 pulse for each transition on TI1F, whereas the gated mode checks the level of the trigger signal.
        /// Note: The clock of the slave peripherals (timer, ADC, ...) receiving the TRGO or the TRGO2 signals must be enabled prior to receive events from the master timer, and the clock frequency (prescaler) must not be changed on-the-fly while triggers are received from the master timer.
        @ReadWrite(bits: 16..<17)
        public var sms2: SMS2

        /// Trigger selection
        /// This bit-field selects the trigger input to be used to synchronize the counter.
        /// Others: Reserved
        /// See for more details on ITRx meaning for each Timer.
        /// Note: These bits must be changed only when they are not used (e.g. when SMS=000) to avoid wrong edge detections at the transition.
        @ReadWrite(bits: 20..<22)
        public var ts2: TS2
    }

    /// TIM3 DMA/Interrupt enable register
    @Register(bitWidth: 16)
    public struct DIER {
        /// Update interrupt enable
        @ReadWrite(bits: 0..<1)
        public var uie: UIE

        /// Capture/Compare 1 interrupt enable
        @ReadWrite(bits: 1..<2)
        public var cc1ie: CC1IE

        /// Capture/Compare 2 interrupt enable
        @ReadWrite(bits: 2..<3)
        public var cc2ie: CC2IE

        /// Capture/Compare 3 interrupt enable
        @ReadWrite(bits: 3..<4)
        public var cc3ie: CC3IE

        /// Capture/Compare 4 interrupt enable
        @ReadWrite(bits: 4..<5)
        public var cc4ie: CC4IE

        /// Trigger interrupt enable
        @ReadWrite(bits: 6..<7)
        public var tie: TIE

        /// Update DMA request enable
        @ReadWrite(bits: 8..<9)
        public var ude: UDE

        /// Capture/Compare 1 DMA request enable
        @ReadWrite(bits: 9..<10)
        public var cc1de: CC1DE

        /// Capture/Compare 2 DMA request enable
        @ReadWrite(bits: 10..<11)
        public var cc2de: CC2DE

        /// Capture/Compare 3 DMA request enable
        @ReadWrite(bits: 11..<12)
        public var cc3de: CC3DE

        /// Capture/Compare 4 DMA request enable
        @ReadWrite(bits: 12..<13)
        public var cc4de: CC4DE

        /// Trigger DMA request enable
        @ReadWrite(bits: 14..<15)
        public var tde: TDE
    }

    /// TIM3 status register
    @Register(bitWidth: 16)
    public struct SR {
        /// Update interrupt flag
        /// This bit is set by hardware on an update event. It is cleared by software.
        /// At overflow or underflow and if UDIS=0 in the TIMx_CR1 register.
        /// When CNT is reinitialized by software using the UG bit in TIMx_EGR register, if URS=0 and UDIS=0 in the TIMx_CR1 register.
        /// When CNT is reinitialized by a trigger event (refer to the synchro control register description), if URS=0 and UDIS=0 in the TIMx_CR1 register.
        @ReadWrite(bits: 0..<1)
        public var uif: UIF

        /// Capture/compare 1 interrupt flag
        /// This flag is set by hardware. It is cleared by software (input capture or output compare mode) or by reading the TIMx_CCR1 register (input capture mode only).
        /// If channel CC1 is configured as output: this flag is set when the content of the counter TIMx_CNT matches the content of the TIMx_CCR1 register. When the content of TIMx_CCR1 is greater than the content of TIMx_ARR, the CC1IF bit goes high on the counter overflow (in up-counting and up/down-counting modes) or underflow (in down-counting mode). There are 3 possible options for flag setting in center-aligned mode, refer to the CMS bits in the TIMx_CR1 register for the full description.
        /// If channel CC1 is configured as input: this bit is set when counter value has been captured in TIMx_CCR1 register (an edge has been detected on IC1, as per the edge sensitivity defined with the CC1P and CC1NP bits setting, in TIMx_CCER).
        @ReadWrite(bits: 1..<2)
        public var cc1if: CC1IF

        /// Capture/Compare 2 interrupt flag
        /// Refer to CC1IF description
        @ReadWrite(bits: 2..<3)
        public var cc2if: CC2IF

        /// Capture/Compare 3 interrupt flag
        /// Refer to CC1IF description
        @ReadWrite(bits: 3..<4)
        public var cc3if: CC3IF

        /// Capture/Compare 4 interrupt flag
        /// Refer to CC1IF description
        @ReadWrite(bits: 4..<5)
        public var cc4if: CC4IF

        /// Trigger interrupt flag
        /// This flag is set by hardware on the TRG trigger event (active edge detected on TRGI input when the slave mode controller is enabled in all modes but gated mode. It is set when the counter starts or stops when gated mode is selected. It is cleared by software.
        @ReadWrite(bits: 6..<7)
        public var tif: TIF

        /// Capture/Compare 1 overcapture flag
        /// This flag is set by hardware only when the corresponding channel is configured in input capture mode. It is cleared by software by writing it to ‘0’.
        @ReadWrite(bits: 9..<10)
        public var cc1of: CC1OF

        /// Capture/compare 2 overcapture flag
        /// refer to CC1OF description
        @ReadWrite(bits: 10..<11)
        public var cc2of: CC2OF

        /// Capture/Compare 3 overcapture flag
        /// refer to CC1OF description
        @ReadWrite(bits: 11..<12)
        public var cc3of: CC3OF

        /// Capture/Compare 4 overcapture flag
        /// refer to CC1OF description
        @ReadWrite(bits: 12..<13)
        public var cc4of: CC4OF
    }

    /// TIM3 event generation register
    @Register(bitWidth: 16)
    public struct EGR {
        /// Update generation
        /// This bit can be set by software, it is automatically cleared by hardware.
        @WriteOnly(bits: 0..<1)
        public var ug: UG

        /// Capture/compare 1 generation
        /// This bit is set by software in order to generate an event, it is automatically cleared by hardware.
        /// If channel CC1 is configured as output:
        /// CC1IF flag is set, Corresponding interrupt or DMA request is sent if enabled.
        /// If channel CC1 is configured as input:
        /// The current value of the counter is captured in TIMx_CCR1 register. The CC1IF flag is set, the corresponding interrupt or DMA request is sent if enabled. The CC1OF flag is set if the CC1IF flag was already high.
        @WriteOnly(bits: 1..<2)
        public var cc1g: CC1G

        /// Capture/compare 2 generation
        /// Refer to CC1G description
        @WriteOnly(bits: 2..<3)
        public var cc2g: CC2G

        /// Capture/compare 3 generation
        /// Refer to CC1G description
        @WriteOnly(bits: 3..<4)
        public var cc3g: CC3G

        /// Capture/compare 4 generation
        /// Refer to CC1G description
        @WriteOnly(bits: 4..<5)
        public var cc4g: CC4G

        /// Trigger generation
        /// This bit is set by software in order to generate an event, it is automatically cleared by hardware.
        @WriteOnly(bits: 6..<7)
        public var tg: TG
    }

    /// TIM3 capture/compare mode register 1 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR1_input {
        /// Capture/Compare 1 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC1S bits are writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc1s: CC1S

        /// Input capture 1 prescaler
        /// This bit-field defines the ratio of the prescaler acting on CC1 input (IC1). The prescaler is reset as soon as CC1E=0 (TIMx_CCER register).
        @ReadWrite(bits: 2..<4)
        public var ic1psc: IC1PSC

        /// Input capture 1 filter
        /// This bit-field defines the frequency used to sample TI1 input and the length of the digital filter applied to TI1. The digital filter is made of an event counter in which N consecutive events are needed to validate a transition on the output:
        @ReadWrite(bits: 4..<8)
        public var ic1f: IC1F

        /// Capture/compare 2 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC2S bits are writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
        @ReadWrite(bits: 8..<10)
        public var cc2s: CC2S

        /// Input capture 2 prescaler
        @ReadWrite(bits: 10..<12)
        public var ic2psc: IC2PSC

        /// Input capture 2 filter
        @ReadWrite(bits: 12..<16)
        public var ic2f: IC2F
    }

    /// TIM3 capture/compare mode register 1 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR1_output {
        /// Capture/Compare 1 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC1S bits are writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc1s: CC1S

        /// Output compare 1 fast enable
        /// This bit decreases the latency between a trigger event and a transition on the timer output. It must be used in one-pulse mode (OPM bit set in TIMx_CR1 register), to have the output pulse starting as soon as possible after the starting trigger.
        @ReadWrite(bits: 2..<3)
        public var oc1fe: OC1FE

        /// Output compare 1 preload enable
        /// Note: The PWM mode can be used without validating the preload register only in one-pulse mode (OPM bit set in TIMx_CR1 register). Else the behavior is not guaranteed.
        @ReadWrite(bits: 3..<4)
        public var oc1pe: OC1PE

        /// Output compare 1 mode
        /// These bits define the behavior of the output reference signal OC1REF from which OC1 and OC1N are derived. OC1REF is active high whereas OC1 and OC1N active level depends on CC1P and CC1NP bits.
        /// Note: In PWM mode, the OCREF level changes only when the result of the comparison changes or when the output compare mode switches from “frozen” mode to “PWM” mode.
        /// Note: The OC1M[3] bit is not contiguous, located in bit 16.
        @ReadWrite(bits: 4..<7)
        public var oc1m1: OC1M1

        /// Output compare 1 clear enable
        @ReadWrite(bits: 7..<8)
        public var oc1ce: OC1CE

        /// Capture/Compare 2 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC2S bits are writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
        @ReadWrite(bits: 8..<10)
        public var cc2s: CC2S

        /// Output compare 2 fast enable
        @ReadWrite(bits: 10..<11)
        public var oc2fe: OC2FE

        /// Output compare 2 preload enable
        @ReadWrite(bits: 11..<12)
        public var oc2pe: OC2PE

        /// Output compare 2 mode
        /// refer to OC1M description on bits 6:4
        @ReadWrite(bits: 12..<15)
        public var oc2m1: OC2M1

        /// Output compare 2 clear enable
        @ReadWrite(bits: 15..<16)
        public var oc2ce: OC2CE

        /// Output compare 1 mode
        /// These bits define the behavior of the output reference signal OC1REF from which OC1 and OC1N are derived. OC1REF is active high whereas OC1 and OC1N active level depends on CC1P and CC1NP bits.
        /// Note: In PWM mode, the OCREF level changes only when the result of the comparison changes or when the output compare mode switches from “frozen” mode to “PWM” mode.
        /// Note: The OC1M[3] bit is not contiguous, located in bit 16.
        @ReadWrite(bits: 16..<17)
        public var oc1m2: OC1M2

        /// Output compare 2 mode
        /// refer to OC1M description on bits 6:4
        @ReadWrite(bits: 24..<25)
        public var oc2m2: OC2M2
    }

    /// TIM3 capture/compare mode register 2 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR2_input {
        /// Capture/Compare 3 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC3S bits are writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc3s: CC3S

        /// Input capture 3 prescaler
        @ReadWrite(bits: 2..<4)
        public var ic3psc: IC3PSC

        /// Input capture 3 filter
        @ReadWrite(bits: 4..<8)
        public var ic3f: IC3F

        /// Capture/Compare 4 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC4S bits are writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
        @ReadWrite(bits: 8..<10)
        public var cc4s: CC4S

        /// Input capture 4 prescaler
        @ReadWrite(bits: 10..<12)
        public var ic4psc: IC4PSC

        /// Input capture 4 filter
        @ReadWrite(bits: 12..<16)
        public var ic4f: IC4F
    }

    /// TIM3 capture/compare mode register 2 [alternate]
    @Register(bitWidth: 32)
    public struct CCMR2_output {
        /// Capture/Compare 3 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC3S bits are writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
        @ReadWrite(bits: 0..<2)
        public var cc3s: CC3S

        /// Output compare 3 fast enable
        @ReadWrite(bits: 2..<3)
        public var oc3fe: OC3FE

        /// Output compare 3 preload enable
        @ReadWrite(bits: 3..<4)
        public var oc3pe: OC3PE

        /// Output compare 3 mode
        /// Refer to OC1M description (bits 6:4 in TIMx_CCMR1 register)
        @ReadWrite(bits: 4..<7)
        public var oc3m1: OC3M1

        /// Output compare 3 clear enable
        @ReadWrite(bits: 7..<8)
        public var oc3ce: OC3CE

        /// Capture/Compare 4 selection
        /// This bit-field defines the direction of the channel (input/output) as well as the used input.
        /// Note: CC4S bits are writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
        @ReadWrite(bits: 8..<10)
        public var cc4s: CC4S

        /// Output compare 4 fast enable
        @ReadWrite(bits: 10..<11)
        public var oc4fe: OC4FE

        /// Output compare 4 preload enable
        @ReadWrite(bits: 11..<12)
        public var oc4pe: OC4PE

        /// Output compare 4 mode
        /// Refer to OC1M description (bits 6:4 in TIMx_CCMR1 register)
        @ReadWrite(bits: 12..<15)
        public var oc4m1: OC4M1

        /// Output compare 4 clear enable
        @ReadWrite(bits: 15..<16)
        public var oc4ce: OC4CE

        /// Output compare 3 mode
        /// Refer to OC1M description (bits 6:4 in TIMx_CCMR1 register)
        @ReadWrite(bits: 16..<17)
        public var oc3m2: OC3M2

        /// Output compare 4 mode
        /// Refer to OC1M description (bits 6:4 in TIMx_CCMR1 register)
        @ReadWrite(bits: 24..<25)
        public var oc4m2: OC4M2
    }

    /// TIM3 capture/compare enable register
    @Register(bitWidth: 16)
    public struct CCER {
        /// Capture/Compare 1 output enable.
        @ReadWrite(bits: 0..<1)
        public var cc1e: CC1E

        /// Capture/Compare 1 output Polarity.
        /// When CC1 channel is configured as input, both CC1NP/CC1P bits select the active polarity of TI1FP1 and TI2FP1 for trigger or capture operations.
        /// CC1NP=0, CC1P=0:	non-inverted/rising edge. The circuit is sensitive to TIxFP1 rising edge (capture or trigger operations in reset, external clock or trigger mode), TIxFP1 is not inverted (trigger operation in gated mode or encoder mode).
        /// CC1NP=0, CC1P=1:	inverted/falling edge. The circuit is sensitive to TIxFP1 falling edge (capture or trigger operations in reset, external clock or trigger mode), TIxFP1 is inverted (trigger operation in gated mode or encoder mode).
        /// CC1NP=1, CC1P=1:	non-inverted/both edges. The circuit is sensitive to both TIxFP1 rising and falling edges (capture or trigger operations in reset, external clock or trigger mode), TIxFP1is not inverted (trigger operation in gated mode). This configuration must not be used in encoder mode.
        /// CC1NP=1, CC1P=0:	This configuration is reserved, it must not be used.
        @ReadWrite(bits: 1..<2)
        public var cc1p: CC1P

        /// Capture/Compare 1 output Polarity.
        /// CC1 channel configured as output: CC1NP must be kept cleared in this case.
        /// CC1 channel configured as input: This bit is used in conjunction with CC1P to define TI1FP1/TI2FP1 polarity. refer to CC1P description.
        @ReadWrite(bits: 3..<4)
        public var cc1np: CC1NP

        /// Capture/Compare 2 output enable.
        /// Refer to CC1E description
        @ReadWrite(bits: 4..<5)
        public var cc2e: CC2E

        /// Capture/Compare 2 output Polarity.
        /// refer to CC1P description
        @ReadWrite(bits: 5..<6)
        public var cc2p: CC2P

        /// Capture/Compare 2 output Polarity.
        /// Refer to CC1NP description
        @ReadWrite(bits: 7..<8)
        public var cc2np: CC2NP

        /// Capture/Compare 3 output enable.
        /// Refer to CC1E description
        @ReadWrite(bits: 8..<9)
        public var cc3e: CC3E

        /// Capture/Compare 3 output Polarity.
        /// Refer to CC1P description
        @ReadWrite(bits: 9..<10)
        public var cc3p: CC3P

        /// Capture/Compare 3 output Polarity.
        /// Refer to CC1NP description
        @ReadWrite(bits: 11..<12)
        public var cc3np: CC3NP

        /// Capture/Compare 4 output enable.
        /// refer to CC1E description
        @ReadWrite(bits: 12..<13)
        public var cc4e: CC4E

        /// Capture/Compare 4 output Polarity.
        /// Refer to CC1P description
        @ReadWrite(bits: 13..<14)
        public var cc4p: CC4P

        /// Capture/Compare 4 output Polarity.
        /// Refer to CC1NP description
        @ReadWrite(bits: 15..<16)
        public var cc4np: CC4NP
    }

    /// TIM3 counter [alternate]
    @Register(bitWidth: 32)
    public struct CNT {
        /// counter value
        @ReadWrite(bits: 0..<16)
        public var cnt_field: CNT_FIELD

        /// UIF Copy
        /// This bit is a read-only copy of the UIF bit of the TIMx_ISR register
        @ReadWrite(bits: 31..<32)
        public var uifcpy: UIFCPY
    }

    /// TIM3 prescaler
    @Register(bitWidth: 16)
    public struct PSC {
        /// Prescaler value
        /// The counter clock frequency CK_CNT is equal to fCK_PSC / (PSC[15:0] + 1).
        /// PSC contains the value to be loaded in the active prescaler register at each update event (including when the counter is cleared through UG bit of TIMx_EGR register or through trigger controller when configured in “reset mode”).
        @ReadWrite(bits: 0..<16)
        public var psc_field: PSC_FIELD
    }

    /// TIM3 auto-reload register
    @Register(bitWidth: 32)
    public struct ARR {
        /// Auto-reload value
        /// ARR is the value to be loaded in the actual auto-reload register.
        /// Refer to the for more details about ARR update and behavior.
        /// The counter is blocked while the auto-reload value is null.
        @ReadWrite(bits: 0..<16)
        public var arr_field: ARR_FIELD
    }

    /// TIM3 capture/compare register 1
    @Register(bitWidth: 32)
    public struct CCR1 {
        /// Capture/Compare 1 value
        /// If channel CC1 is configured as output:
        /// CCR1 is the value to be loaded in the actual capture/compare 1 register (preload value).
        /// It is loaded permanently if the preload feature is not selected in the TIMx_CCMR1 register (bit OC1PE). Else the preload value is copied in the active capture/compare 1 register when an update event occurs.
        /// The active capture/compare register contains the value to be compared to the counter TIMx_CNT and signaled on OC1 output.
        /// If channel CC1is configured as input:
        /// CCR1 is the counter value transferred by the last input capture 1 event (IC1). The TIMx_CCR1 register is read-only and cannot be programmed.
        @ReadWrite(bits: 0..<16)
        public var ccr1_field: CCR1_FIELD
    }

    /// TIM3 capture/compare register 2
    @Register(bitWidth: 32)
    public struct CCR2 {
        /// Capture/Compare 2 value
        /// If channel CC2 is configured as output:
        /// CCR2 is the value to be loaded in the actual capture/compare 2 register (preload value).
        /// It is loaded permanently if the preload feature is not selected in the TIMx_CCMR1 register (bit OC2PE). Else the preload value is copied in the active capture/compare 2 register when an update event occurs.
        /// The active capture/compare register contains the value to be compared to the counter TIMx_CNT and signalled on OC2 output.
        /// If channel CC2 is configured as input:
        /// CCR2 is the counter value transferred by the last input capture 2 event (IC2). The TIMx_CCR2 register is read-only and cannot be programmed.
        @ReadWrite(bits: 0..<16)
        public var ccr2_field: CCR2_FIELD
    }

    /// TIM3 capture/compare register 3
    @Register(bitWidth: 32)
    public struct CCR3 {
        /// Capture/Compare value
        /// If channel CC3 is configured as output:
        /// CCR3 is the value to be loaded in the actual capture/compare 3 register (preload value).
        /// It is loaded permanently if the preload feature is not selected in the TIMx_CCMR2 register (bit OC3PE). Else the preload value is copied in the active capture/compare 3 register when an update event occurs.
        /// The active capture/compare register contains the value to be compared to the counter TIMx_CNT and signalled on OC3 output.
        /// If channel CC3is configured as input:
        /// CCR3 is the counter value transferred by the last input capture 3 event (IC3). The TIMx_CCR3 register is read-only and cannot be programmed.
        @ReadWrite(bits: 0..<16)
        public var ccr3_field: CCR3_FIELD
    }

    /// TIM3 capture/compare register 4
    @Register(bitWidth: 32)
    public struct CCR4 {
        /// Capture/Compare value
        /// if CC4 channel is configured as output (CC4S bits):
        /// CCR4 is the value to be loaded in the actual capture/compare 4 register (preload value).
        /// It is loaded permanently if the preload feature is not selected in the TIMx_CCMR2 register (bit OC4PE). Else the preload value is copied in the active capture/compare 4 register when an update event occurs.
        /// The active capture/compare register contains the value to be compared to the counter TIMx_CNT and signalled on OC4 output.
        /// if CC4 channel is configured as input (CC4S bits in TIMx_CCMR4 register):
        /// CCR4 is the counter value transferred by the last input capture 4 event (IC4). The TIMx_CCR4 register is read-only and cannot be programmed.
        @ReadWrite(bits: 0..<16)
        public var ccr4_field: CCR4_FIELD
    }

    /// TIM3 DMA control register
    @Register(bitWidth: 16)
    public struct DCR {
        /// DMA base address
        /// This 5-bit vector defines the base-address for DMA transfers (when read/write access are done through the TIMx_DMAR address). DBA is defined as an offset starting from the address of the TIMx_CR1 register.
        /// Example:
        /// ...
        /// Example: Let us consider the following transfer: DBL = 7 transfers & DBA = TIMx_CR1. In this case the transfer is done to/from 7 registers starting from the TIMx_CR1 address.
        @ReadWrite(bits: 0..<5)
        public var dba: DBA

        /// DMA burst length
        /// This 5-bit vector defines the number of DMA transfers (the timer recognizes a burst transfer when a read or a write access is done to the TIMx_DMAR address).
        /// ...
        @ReadWrite(bits: 8..<13)
        public var dbl: DBL
    }

    /// TIM3 DMA address for full transfer
    @Register(bitWidth: 16)
    public struct DMAR {
        /// DMA register for burst accesses
        /// A read or write operation to the DMAR register accesses the register located at the address
        /// (TIMx_CR1 address) + (DBA + DMA index) x 4
        /// where TIMx_CR1 address is the address of the control register 1, DBA is the DMA base address configured in TIMx_DCR register, DMA index is automatically controlled by the DMA transfer, and ranges from 0 to DBL (DBL configured in TIMx_DCR).
        @ReadWrite(bits: 0..<16)
        public var dmab: DMAB
    }

    /// TIM3 alternate function option register 1
    @Register(bitWidth: 32)
    public struct AF1 {
        /// ETR source selection
        /// These bits select the ETR input source.
        /// Others: Reserved
        @ReadWrite(bits: 14..<18)
        public var etrsel: ETRSEL
    }

    /// TIM3 timer input selection register
    @Register(bitWidth: 32)
    public struct TISEL {
        /// TI1[0] to TI1[15] input selection
        /// These bits select the TI1[0] to TI1[15] input source.
        /// Others: Reserved
        @ReadWrite(bits: 0..<4)
        public var ti1sel: TI1SEL

        /// TI2[0] to TI2[15] input selection
        /// These bits select the TI2[0] to TI2[15] input source.
        /// Others: Reserved
        @ReadWrite(bits: 8..<12)
        public var ti2sel: TI2SEL

        /// TI3[0] to TI3[15] input selection
        /// These bits select the TI3[0] to TI3[15] input source.
        /// Others: Reserved
        @ReadWrite(bits: 16..<20)
        public var ti3sel: TI3SEL
    }
}
