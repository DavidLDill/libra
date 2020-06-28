address 0x1 {

module Coin1 {
    use 0x1::Libra::{Self,
    // DD: refactor
    // RegisterNewCurrency
    };
    use 0x1::FixedPoint32;
    // DD: refactor
    // use 0x1::Roles::Capability;

    struct Coin1 { }

    public fun initialize(
        account: &signer,
        // DD: refactor
        // register_currency_capability: &Capability<RegisterNewCurrency>,
        tc_account: &signer,
    ): (Libra::MintCapability<Coin1>, Libra::BurnCapability<Coin1>) {
        // Register the Coin1 currency.
        Libra::register_currency<Coin1>(
            account,
            // DD: refactor
            // register_currency_capability,
            tc_account,
            FixedPoint32::create_from_rational(1, 2), // exchange rate to LBR
            false,   // is_synthetic
            1000000, // scaling_factor = 10^6
            100,     // fractional_part = 10^2
            b"Coin1",
        )
    }
}

}
