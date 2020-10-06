//! account: alice, 0, 0, address
//! account: bob, 1000000, 0, validator

//! new-transaction
//! sender: libraroot
//! args: 0, {{alice}}, {{alice::auth_key}}, b"alice"
stdlib_script::create_validator_operator_account
// check: "Keep(EXECUTED)"

//! block-prologue
//! proposer-address: 0x0
//! block-time: 0
// check: "Keep(EXECUTED)"

//! new-transaction
//! sender: bob
script {
    use 0x1::LibraTimestamp;
    use 0x1::ValidatorConfig;
    fun main(account: &signer) {
        assert(LibraTimestamp::now_microseconds() == 0, 999);
        // register alice as bob's delegate
        ValidatorConfig::set_operator(account, {{alice}});
    }
}

// check: "Keep(EXECUTED)"

//! new-transaction
//! sender: alice
script {
    use 0x1::ValidatorConfig;
    fun main(account: &signer) {
        // set a new config locally
        ValidatorConfig::set_config(account, {{bob}},
                                    x"3d4017c3e843895a92b70aa74d1b7ebc9c982ccf2ec4968cc0cd55f12af4660c",
                                    x"", x"");
    }
}

// check: "Keep(EXECUTED)"

//! new-transaction
//! sender: alice
script {
    use 0x1::LibraSystem;
    fun main(account: &signer) {
        // update is too soon, will fail
        LibraSystem::update_config_and_reconfigure(account, {{bob}});
    }
}

// check: "Keep(ABORTED { code: 6,"

//! block-prologue
//! proposer: bob
//! block-time: 300000

// check: "Keep(EXECUTED)"

//! new-transaction
//! sender: alice
script {
    use 0x1::LibraTimestamp;
    use 0x1::LibraSystem;
    fun main(account: &signer) {
        // update is too soon, will not trigger the reconfiguration
        assert(LibraTimestamp::now_microseconds() == 300000, 999);
        LibraSystem::update_config_and_reconfigure(account, {{bob}});
    }
}

// check: "Keep(ABORTED { code: 6,"

//! block-prologue
//! proposer: bob
//! block-time: 300001

// check: "Keep(EXECUTED)"

//! new-transaction
//! sender: alice
script {
    use 0x1::LibraTimestamp;
    use 0x1::LibraSystem;
    fun main(account: &signer) {
        // update is in exactly 5 minutes and 1 microsecond, so will succeed
        assert(LibraTimestamp::now_microseconds() == 300001, 999);
        LibraSystem::update_config_and_reconfigure(account, {{bob}});
    }
}

// check: NewEpochEvent
// check: "Keep(EXECUTED)"
