#[test_only]
module hello_world::managed_tests {

   use hello_world::hello_world::{Self, HelloWorldObject};
    use std::string;
    use std::debug;
    use sui::test_scenario::{Self};

    #[test]
    fun trial() {
         // Initialize a mock sender address
        let addr1 = @0x1;

        // Begins a multi transaction scenario with addr1 as the sender
        let scenario_val = test_scenario::begin(addr1);
        let scenario = &mut scenario_val;
        
        // Run the managed coin module init function
        {
            hello_world::mint(test_scenario::ctx(scenario))
        };

        test_scenario::next_tx(scenario, addr1);
        {
            let w = test_scenario::take_from_sender<HelloWorldObject>(scenario);
            debug::print(&w);
            assert!(hello_world::text(&w) == string::utf8(b"Hello World!"), 0);
            test_scenario::return_to_sender<HelloWorldObject>(scenario, w);
        };

        test_scenario::end(scenario_val);
    }

}