#[test_only]
module first_lesson::tests {

   use first_lesson::exercise1;


    #[test]
    fun simple_test() {
        exercise1::hello_world();
    }
}