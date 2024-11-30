import CortexM

extension I2C {
    public var state: BitFlagState {
        BitFlagState(rawValue: i2c.cr1.read().raw.pe) ?? .disabled
    }

    public func setState(_ state: BitFlagState) {
        i2c.cr1.modify { rw in
            rw.raw.pe = state.rawValue
        }
    }

    /// Wait for I2C to not be busy
    func waitBusy() {
        while self.isr.read().raw.busy != 0 {
            checkError()
            // todo: implement timeout
        }
    }

    /// Wait until TXIS is set
    func waitTxis() {
        while self.isr.read().raw.txis != 1 {
            checkError()
            // todo: implement timeout
        }
    }

    /// Wait until TC is either set or cleared
    func waitTc(_ value: UInt32) {
        while self.isr.read().raw.tc != value {
            checkError()
            // todo: implement timeout
        }
    }

    func waitTcr(_ value: UInt32) {
        while self.isr.read().raw.tcr != value {
            // todo: implement timeout
        }
    }

    /// Wait on RXNE to be set
    func waitRxne() {
        while self.isr.read().raw.rxne != 1 {
            checkError()
            // todo: implement timeout
        }
    }

    /// Wait on STOPF to be set
    func waitStopf() {
        while self.isr.read().raw.stopf != 1 {
            checkError()
            // todo: implement timeout
        }
    }

    func checkError() {
        if self.isr.read().raw.nackf != 1 {
            return
        }

        self.icr.modify { _, w in
            w.raw.nackcf = 1
        }

        while self.isr.read().raw.stopf != 1 {
            // todo: implement timeout
        }
    }

    enum RequestType: UInt32 {
        case noStartStop = 0x0
        case stop = 0x1
        case startRead = 0x2
        case startWrite = 0x3
    }

    enum EndMode {
        case softEnd
        case reload
        case autoEnd
    }

    func configureTransfer(
        _ address: UInt32, _ numberOfBytes: UInt32, _ request: RequestType, endMode: EndMode
    ) {
        self.cr2.modify { rw in
            rw.raw.sadd = address
            rw.raw.nbytes = numberOfBytes
            rw.raw.rd_wrn = request == .startRead ? 1 : 0
            rw.raw.start = (request == .startRead || request == .startWrite) ? 1 : 0
            rw.raw.stop = request == .stop ? 1 : 0
            rw.raw.reload = endMode == .reload ? 1 : 0
            rw.raw.autoend = endMode == .autoEnd ? 1 : 0
        }
    }

    func configureMemoryRead(slaveAddress: UInt32, register: UInt8) {
        self.configureTransfer(slaveAddress, 1, .startWrite, endMode: .softEnd)
        self.waitTxis()
        self.txdr.modify { rw in
            rw.raw.txdata = UInt32(register)
        }
        // Wait until TC flag is set
        self.waitTc(1)
    }

    func configureMemoryWrite(slaveAddress: UInt32, register: UInt8) {
        self.configureTransfer(slaveAddress, 1, .startWrite, endMode: .reload)
        self.waitTxis()
        self.txdr.modify { rw in
            rw.raw.txdata = UInt32(register)
        }
        // Wait until TCR flag is set
        self.waitTcr(1)
    }

    public func readMemory(
        slaveAddress: UInt32, register: UInt8, data: UnsafeMutablePointer<UInt8>, length: UInt16
    ) {
        self.waitBusy()

        // Set slave address and register address
        self.configureMemoryRead(slaveAddress: slaveAddress, register: register)

        // Set number of bytes
        self.configureTransfer(slaveAddress, UInt32(length), .startRead, endMode: .autoEnd)

        // Read the length of bytes
        for index in 0..<Int(length) {
            // Wait for byte to be ready
            self.waitRxne()

            // Read the byte
            data[index] = UInt8(self.rxdr.read().raw.rxdata)
        }

        // Finish transaction
        self.waitStopf()
        self.icr.modify { _, w in
            w.raw.stopcf = 1
        }
    }

    public func writeMemory(
        slaveAddress: UInt32, register: UInt8, data: UnsafePointer<UInt8>, length: UInt16
    ) {
        self.waitBusy()

        // Set slave address and register address
        self.configureMemoryWrite(slaveAddress: slaveAddress, register: register)

        // Set number of bytes
        self.configureTransfer(slaveAddress, UInt32(length), .noStartStop, endMode: .autoEnd)

        // Read the length of bytes
        for index in 0..<Int(length) {
            // Wait for TXDR to be empty
            self.waitTxis()

            // Write the byte
            self.txdr.modify { rw in
                rw.raw.txdata = UInt32(data[index])
            }
        }

        // Finish transaction
        self.waitStopf()
        self.icr.modify { _, w in
            w.raw.stopcf = 1
        }
    }
}
