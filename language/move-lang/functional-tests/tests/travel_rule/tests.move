//! account: freddy_mac

//! new-transaction
//! sender: freddy_mac
script{
    use 0x1::DualAttestationLimit;
    fun main() {
        DualAttestationLimit::get_cur_microlibra_limit();
    }
}
// check: EXECUTED

//! new-transaction
script{
// DD: refactor
//    use 0x1::DualAttestationLimit::{Self, UpdateDualAttestationThreshold};
    use 0x1::DualAttestationLimit::{Self};
//    use 0x1::CoreAddresses;
// DD: refactor    
//    use 0x1::Roles;
    fun main(not_blessed: &signer) {
        // DD: refactor
        // let r = Roles::extract_privilege_to_capability<UpdateDualAttestationThreshold>(not_blessed);
        // DualAttestationLimit::set_microlibra_limit(&r, CoreAddresses::TREASURY_COMPLIANCE_ADDRESS(),  99);
        // Roles::restore_capability_to_privilege(not_blessed, r)
        DualAttestationLimit::set_microlibra_limit(not_blessed, 99);
    }
}
// check: ABORTED
// check: 3

// too low limit

//! new-transaction
//! sender: blessed
script{
// DD: refactor
//    use 0x1::DualAttestationLimit::{Self, UpdateDualAttestationThreshold};
    use 0x1::DualAttestationLimit::{Self};
//    use 0x1::CoreAddresses;
// DD: refactor
//    use 0x1::Roles;
    fun main(not_blessed: &signer) {
        // DD: refactor
        // let r = Roles::extract_privilege_to_capability<UpdateDualAttestationThreshold>(not_blessed);
        // DualAttestationLimit::set_microlibra_limit(&r, CoreAddresses::TREASURY_COMPLIANCE_ADDRESS(),  999);
        // Roles::restore_capability_to_privilege(not_blessed, r)
        DualAttestationLimit::set_microlibra_limit(not_blessed, 999);
    }
}
// check: ABORTED

//! new-transaction
//! sender: blessed
script{
// DD: refactor
//    use 0x1::DualAttestationLimit::{Self, UpdateDualAttestationThreshold};
    use 0x1::DualAttestationLimit::{Self};
//    use 0x1::CoreAddresses;
// DD: refactor    
//    use 0x1::Roles;
    fun main(not_blessed: &signer) {
        // DD: refactor
        // let r = Roles::extract_privilege_to_capability<UpdateDualAttestationThreshold>(not_blessed);
        // DualAttestationLimit::set_microlibra_limit(&r, CoreAddresses::TREASURY_COMPLIANCE_ADDRESS(),  1001);
        // Roles::restore_capability_to_privilege(not_blessed, r)
        DualAttestationLimit::set_microlibra_limit(not_blessed, 1001);
    }
}
// check: EXECUTED
