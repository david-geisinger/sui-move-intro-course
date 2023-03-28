module first_lesson::exercise1 {

    use std::string;
    public fun hello_world(): string::String {
       string::utf8(b"Hello World!")
    }

}

#[test_only]
module first_lesson::managed_tests {

   use first_lesson::exercise1;


    #[test]
    fun simple_test() {
        exercise1::hello_world();
    }
}