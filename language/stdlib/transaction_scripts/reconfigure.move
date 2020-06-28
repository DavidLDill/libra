script {
    use 0x1::LibraSystem;
    // DD: refactor
    // use 0x1::Roles::{Self, LibraRootRole};

    /// Update configs of all the validators and emit reconfiguration event.
    fun reconfigure(lr_account: &signer) {
        // let assoc_root_role = Roles::extract_privilege_to_capability<LibraRootRole>(account);
        // LibraSystem::update_and_reconfigure(&assoc_root_role);
        LibraSystem::update_and_reconfigure(lr_account);
        // Roles::restore_capability_to_privilege(lr_account, assoc_root_role);
    }
}
