if(EXISTS "/home/anassaif/CMakeTut/build/TestLibrary[1]_tests.cmake")
  include("/home/anassaif/CMakeTut/build/TestLibrary[1]_tests.cmake")
else()
  add_test(TestLibrary_NOT_BUILT TestLibrary_NOT_BUILT)
endif()