// Adaptee
class OldPaymentProcessor {
    func pay(amount: Float) -> String {
        return "Paid $\(amount) with old payment processor."
    }
}

// Target
protocol PaymentProcessor {
    func processPayment(amount: Float) -> String
}

// Adapter
class PaymentProcessorAdapter: PaymentProcessor {
    private var oldProcessor: OldPaymentProcessor

    init(oldProcessor: OldPaymentProcessor) {
        self.oldProcessor = oldProcessor
    }

    func processPayment(amount: Float) -> String {
        let result = oldProcessor.pay(amount: amount)
        return "Converted result: \(result)"
    }
}

// Client
class PaymentClient {
    var paymentProcessor: PaymentProcessor

    init(paymentProcessor: PaymentProcessor) {
        self.paymentProcessor = paymentProcessor
    }

    func performPayment(amount: Float) -> String {
        return paymentProcessor.processPayment(amount: amount)
    }
}

// Usage
let oldProcessor = OldPaymentProcessor()
let adapter = PaymentProcessorAdapter(oldProcessor: oldProcessor)
let client = PaymentClient(paymentProcessor: adapter)
let result = client.performPayment(amount: 100.0)
print(result)
