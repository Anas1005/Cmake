add_test( LibraryTest.AddBook /home/anassaif/CMakeTut/build/TestLibrary [==[--gtest_filter=LibraryTest.AddBook]==] --gtest_also_run_disabled_tests)
set_tests_properties( LibraryTest.AddBook PROPERTIES WORKING_DIRECTORY /home/anassaif/CMakeTut/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test( LibraryTest.FindBook /home/anassaif/CMakeTut/build/TestLibrary [==[--gtest_filter=LibraryTest.FindBook]==] --gtest_also_run_disabled_tests)
set_tests_properties( LibraryTest.FindBook PROPERTIES WORKING_DIRECTORY /home/anassaif/CMakeTut/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test( LibraryTest.RemoveBook /home/anassaif/CMakeTut/build/TestLibrary [==[--gtest_filter=LibraryTest.RemoveBook]==] --gtest_also_run_disabled_tests)
set_tests_properties( LibraryTest.RemoveBook PROPERTIES WORKING_DIRECTORY /home/anassaif/CMakeTut/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test( LibraryTest.UserBorrowBook /home/anassaif/CMakeTut/build/TestLibrary [==[--gtest_filter=LibraryTest.UserBorrowBook]==] --gtest_also_run_disabled_tests)
set_tests_properties( LibraryTest.UserBorrowBook PROPERTIES WORKING_DIRECTORY /home/anassaif/CMakeTut/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test( LibraryTest.UserReturnBook /home/anassaif/CMakeTut/build/TestLibrary [==[--gtest_filter=LibraryTest.UserReturnBook]==] --gtest_also_run_disabled_tests)
set_tests_properties( LibraryTest.UserReturnBook PROPERTIES WORKING_DIRECTORY /home/anassaif/CMakeTut/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set( TestLibrary_TESTS LibraryTest.AddBook LibraryTest.FindBook LibraryTest.RemoveBook LibraryTest.UserBorrowBook LibraryTest.UserReturnBook)
