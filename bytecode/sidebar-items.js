initSidebarItems({"fn":[["print_targets_for_test","Print function targets for testing and debugging."]],"mod":[["access_path","This file contains an abstraction of concrete access paths, which are canonical names for a particular cell in memory. Some examples of concrete paths are:"],["access_path_trie","The obvious approach to abstracting a set of concrete paths is using a set of abstract paths. An access path trie represents a set of paths in a way that avoids redundant representations of the same memory. Root nodes are access path roots and each internal node is an access path offset. Each node is (optionally) associated with abstract value of a generic type `T`."],["annotations",""],["borrow_analysis","Data flow analysis computing borrow information for preparation of memory_instrumentation."],["clean_and_optimize",""],["compositional_analysis",""],["data_invariant_instrumentation","Transformation which injects data invariants into the bytecode."],["dataflow_analysis","Adapted from AbstractInterpreter for Bytecode, this module defines the data-flow analysis framework for stackless bytecode."],["debug_instrumentation","Transformation which injects trace instructions which are used to visualize execution."],["eliminate_imm_refs",""],["function_data_builder","Provides a builder for `FunctionData`, including building expressions and rewriting bytecode."],["function_target",""],["function_target_pipeline",""],["global_invariant_instrumentation",""],["global_invariant_instrumentation_v2",""],["graph",""],["livevar_analysis",""],["loop_analysis",""],["memory_instrumentation",""],["mono_analysis","Analysis which computes information needed in backends for monomorphization. This computes the distinct type instantiations in the model for structs and inlined functions. It also eliminates type quantification (`forall coin_type: type:: P`)."],["mut_ref_instrumentation",""],["options",""],["packed_types_analysis",""],["pipeline_factory",""],["reaching_def_analysis",""],["read_write_set_analysis","The read/write set analysis is a compositional analysis that starts from the leaves of the call graph and analyzes each procedure once. The result is a summary of the abstract paths read/written by each procedure and the value(s) returned by the procedure."],["spec_instrumentation",""],["stackless_bytecode",""],["stackless_bytecode_generator",""],["stackless_control_flow_graph","Adapted from control_flow_graph for Bytecode, this module defines the control-flow graph on Stackless Bytecode used in analysis as part of Move prover."],["usage_analysis",""],["verification_analysis","Analysis which computes an annotation for each function whether it is verified or inlined."]]});