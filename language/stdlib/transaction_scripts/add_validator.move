script {
    use 0x1::LibraSystem;
    // DD: refactor
    // use 0x1::Roles::{Self, LibraRootRole};

    /// Add `new_validator` to the pending validator set.
    /// Fails if the `new_validator` address is already in the validator set
    /// or does not have a `ValidatorConfig` resource stored at the address.
    fun add_validator(lr_account: &signer, validator_address: address) {
        // DD: refactor
        // let assoc_root_role = Roles::extract_privilege_to_capability<LibraRootRole>(account);
        // LibraSystem::add_validator(&assoc_root_role, validator_address);
        LibraSystem::add_validator(lr_account, validator_address);
        // Roles::restore_capability_to_privilege(account, assoc_root_role);
    }
}
