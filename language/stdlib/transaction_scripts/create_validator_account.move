script {
    use 0x1::LibraAccount;
    // DD: refactor
    // use 0x1::Roles::{Self, LibraRootRole};

    /// Create a validator account at `new_validator_address` with `auth_key_prefix`.
    fun create_validator_account(
        creator: &signer,
        new_account_address: address,
        auth_key_prefix: vector<u8>,
        ) {
        // DD: refactor
        // let assoc_root_role = Roles::extract_privilege_to_capability<LibraRootRole>(creator);
        LibraAccount::create_validator_account(
            creator,
            // DD: refactor
            // &assoc_root_role,
            new_account_address,
            auth_key_prefix
        );
        // Roles::restore_capability_to_privilege(creator, assoc_root_role);
    }
}
