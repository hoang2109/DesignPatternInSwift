// Abstraction
protocol PaymentProcessor {
    func processPayment(amount: Double)
}

// Concrete Implementor
protocol PaymentGateway {
    func processPayment(amount: Double)
}

class PayPalGateway: PaymentGateway {
    func processPayment(amount: Double) {
        print("Processing payment of $\(amount) via PayPal")
    }
}

class StripeGateway: PaymentGateway {
    func processPayment(amount: Double) {
        print("Processing payment of $\(amount) via Stripe")
    }
}

// Refined Abstraction
class PaymentProcessorImplementation: PaymentProcessor {
    private let paymentGateway: PaymentGateway
    
    init(paymentGateway: PaymentGateway) {
        self.paymentGateway = paymentGateway
    }
    
    func processPayment(amount: Double) {
        paymentGateway.processPayment(amount: amount)
    }
}

// Client Code
let paypalGateway = PayPalGateway()
let paymentProcessor = PaymentProcessorImplementation(paymentGateway: paypalGateway)
paymentProcessor.processPayment(amount: 100.0)

let stripeGateway = StripeGateway()
let paymentProcessor2 = PaymentProcessorImplementation(paymentGateway: stripeGateway)
paymentProcessor2.processPayment(amount: 200.0)
