script {
    use 0x1::LibraSystem;
    // DD: refactor
    // use 0x1::Roles::{Self, LibraRootRole};

    /// Adding `to_remove` to the set of pending validator removals. Fails if
    /// the `to_remove` address is already in the validator set or already in the pending removals.
    /// Callable by Validator's operator.
    fun remove_validator(lr_account: &signer, validator_address: address) {
        // DD: refactor
        // let assoc_root_role = Roles::extract_privilege_to_capability<LibraRootRole>(account);
        // LibraSystem::remove_validator(&assoc_root_role, validator_address);
        LibraSystem::remove_validator(lr_account, validator_address);
        // Roles::restore_capability_to_privilege(account, assoc_root_role);
    }
}
