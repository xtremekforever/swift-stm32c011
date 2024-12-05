extension USART1 {
    public func configure(baud: UInt32) {
        // Set the baud rate to 12MHz
        // TODO: Clock speed configuration
        self.brr.modify { $0.raw.storage = 12_000_000 / baud }
    }

    public func enable(enableRx: Bool = true, enableTx: Bool = true) {
        self.cr1_disabled.modify { rw in
            rw.raw.ue = 1
            rw.raw.re = enableRx ? 1 : 0
            rw.raw.te = enableTx ? 1 : 0
        }
    }

    public func waitTxBufferEmpty() {
        while self.isr_disabled.read().raw.txe == 0 {}
    }

    public func tx(value: UInt8) {
        self.tdr.write { $0.raw.tdr_field = UInt32(value) }
    }

    public func waitRxBufferFull() {
        while self.isr_disabled.read().raw.rxne == 0 {}
    }

    public func rx() -> UInt8 {
        UInt8(self.rdr.read().raw.rdr_field)
    }
}
