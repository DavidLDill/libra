address 0x1 {

module DualAttestationLimit {
    use 0x1::LBR::LBR;
    use 0x1::Libra;
    use 0x1::LibraConfig::{Self, CreateOnChainConfig};
    use 0x1::Signer;
    use 0x1::CoreAddresses;
    use 0x1::Roles::{Capability, assert_has_update_dual_attestation_threshold_privilege};

    resource struct UpdateDualAttestationThreshold {}

    struct DualAttestationLimit {
        micro_lbr_limit: u64,
    }

    // A wrapped capability to allow updating of limit on-chain config by Blessed
    resource struct ModifyLimitCapability {
        cap: LibraConfig::ModifyConfigCapability<Self::DualAttestationLimit>,
    }

    // Will fail if `account` does not have the treasury-compliance role
    // DD: refactor
    // public fun grant_privileges(account: &signer) {
    //     Roles::add_privilege_to_account_treasury_compliance_role(account, UpdateDualAttestationThreshold{});
    // }

    /// Travel rule limit set during genesis
    ///
    /// >TODO: add in_genesis assertion here.
    /// 
    /// >TODO: kill CreateOnChainConfig capability
    public fun initialize(
        account: &signer,
        tc_account: &signer,
        create_on_chain_config_capability: &Capability<CreateOnChainConfig>,
    ) {
        assert(Signer::address_of(account) == CoreAddresses::LIBRA_ROOT_ADDRESS(), 1);
        let cap = LibraConfig::publish_new_config_with_capability<DualAttestationLimit>(
            account,
            create_on_chain_config_capability,
            DualAttestationLimit { micro_lbr_limit: 1000 * Libra::scaling_factor<LBR>() },
        );
        move_to(tc_account, ModifyLimitCapability { cap })
    }

    // Anyone can fetch the current set limit
    public fun get_cur_microlibra_limit(): u64 {
        LibraConfig::get<DualAttestationLimit>().micro_lbr_limit
    }

    public fun set_microlibra_limit(
        tc_account: &signer,
        micro_lbr_limit: u64
    ) acquires ModifyLimitCapability {
        assert_has_update_dual_attestation_threshold_privilege(tc_account);
        assert(
            micro_lbr_limit >= 1000,
            4
        );
        let tc_address = Signer::address_of(tc_account);
        let modify_cap = &borrow_global<ModifyLimitCapability>(tc_address).cap;
        LibraConfig::set_with_capability<DualAttestationLimit>(
            modify_cap,
            DualAttestationLimit { micro_lbr_limit },
        );
    }
}

}
