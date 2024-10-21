# CMake Tutorial Notes

# ----------------------------------------
# Stage 1: A Basic Starting Point
# ----------------------------------------

# 1. Building a Basic Project
#    - Understand project structure:
#      - Organizing files into appropriate directories is crucial for maintainability:
#        - `src`: Contains source files (.cpp) that implement the application's logic.
#        - `include`: Holds header files (.h) that declare functions and classes used in your project.
#        - `lib`: Contains source files for libraries that can be compiled into static or shared libraries.
#      - This organization helps keep code manageable as projects grow, making it easier for developers to find and modify files.
#
#    - Create a simple CMakeLists.txt:
#      - This file is essential for CMake to understand how to build your project.
#      - Define the minimum CMake version required using `cmake_minimum_required(VERSION <version>)`.
#      - Set the project name and version with `project(<ProjectName> VERSION <version>)`.
#      - These declarations help in ensuring compatibility with various CMake versions and providing basic metadata about the project.
#
# 2. Specifying the C++ Standard
#    - Learn how to set the C++ standard:
#      - Use `set(CMAKE_CXX_STANDARD <standard>)` to define the version of C++ to use (e.g., C++17).
#      - This directive tells the compiler which language standard to adhere to when compiling the source files.
#      - Ensuring that the appropriate standard is set helps maintain code compatibility and allows developers to utilize modern C++ features effectively.
#
# 3. Adding a Version Number and Configured Header File
#    - Specify project versioning:
#      - Use `project(<ProjectName> VERSION <version>)` to manage the version of your project.
#      - This is useful for tracking changes and ensuring compatibility with different builds.
#      - It allows consumers of your library or application to check the version and understand what features or fixes are included.
#
#    - Learn about creating a config header file:
#      - A configuration header file (e.g., `config.h`) can store version information, feature flags, and other configuration settings.
#      - This header can be included in source files to conditionally compile code based on defined features.
#      - Creating a config header allows for greater flexibility and adaptability in different build environments.

# ----------------------------------------
# Stage 2: Adding a Library
# ----------------------------------------

# 1. Creating a Library
#    - Learn how to create a static library:
#      - Use `add_library(<LibraryName> STATIC <source_files>)` to compile source files into a library.
#      - Static libraries are linked at compile time and are included in the final executable.
#      - They provide code reusability, allowing you to maintain and update library code independently without recompiling the entire application.
#
# 2. Adding an Option
#    - Understand how to create build options for your library:
#      - Use `option(<OptionName> "<Description>" <DEFAULT_VALUE>)` to create options for users.
#      - This allows users to enable or disable features at build time (e.g., using the MathFunctions library).
#      - Providing options enhances flexibility, enabling users to customize their builds according to their specific needs.
#
# 3. Including Header Files
#    - Properly include header files:
#      - Use `include_directories(<directory_path>)` to make headers available globally to all targets.
#      - This ensures that source files can find necessary declarations and reduces repetitive include statements in each target's CMake configuration.
#      - Managing header inclusions effectively is vital for avoiding issues related to unresolved identifiers and compilation errors.
#
# 4. Linking Libraries
#    - Link the library to the executable conditionally:
#      - Use `target_link_libraries(<target> <link_library>)` to link libraries to executables.
#      - If the option to use the library is enabled, linking ensures that the executable has access to the library's functions.
#      - This promotes a modular design approach, making it easier to swap or update libraries as needed.

# ----------------------------------------
# Stage 3: Adding Usage Requirements for a Library
# ----------------------------------------

# 1. Adding Usage Requirements for a Library
#    - Learn how to define usage requirements for libraries:
#      - Use `target_include_directories(<library> PUBLIC <include_path>)` to specify public include paths.
#      - This ensures that any target linking against the library also has access to the necessary headers.
#      - Defining usage requirements helps maintain a clear API and encapsulation in your library, making it easier for other developers to use it correctly.
#
# 2. Setting the C++ Standard with Interface Libraries
#    - Understand interface libraries:
#      - Create an interface library using `add_library(<LibraryName> INTERFACE)`.
#      - This is used to centralize settings like the C++ standard (e.g., `target_compile_features(<library> INTERFACE cxx_std_17)`).
#      - Interface libraries promote consistency across all targets in the project by ensuring that they all use the same configuration settings.
#      - This simplifies maintenance, reduces the risk of conflicting settings, and helps maintain a clean project structure.
#
# 3. Usage of Interface Libraries
#    - Interface libraries do not produce binaries but instead propagate usage requirements to consumers.
#      - This is beneficial when multiple targets need to share the same settings or dependencies.
#      - Helps prevent duplicate code and ensures that updates to settings or dependencies are made in one place.

# ----------------------------------------
# Stage 4: Generator Expressions
# ----------------------------------------

# In Stage 4, we focused on **Generator Expressions** in CMake. These expressions are evaluated during build system generation and provide flexibility in specifying build properties, targets, and conditions based on build configurations like `Debug` or `Release`.

# ### What are Generator Expressions?
# - Generator expressions are used to set properties or specify target behaviors conditionally.
# - They are evaluated at **generate time**, making them dynamic depending on the build type, compiler, or other target-specific conditions.
# - The syntax: `$<...>`, where the contents inside the angle brackets define the condition.

# ### Why Use Generator Expressions?
# - To **avoid hardcoding** specific configurations like compiler flags or build types.
# - They help **streamline the build process** by applying settings dynamically based on conditions like `CMAKE_BUILD_TYPE` (e.g., `Debug`, `Release`).

# ### Most Important Example Usages:

# 1. **Applying Flags Based on Build Type**:
#    - Apply different flags based on the build configuration (`Debug` or `Release`):
#      ```cmake
#      target_compile_options(ProjectTarget PRIVATE
#          $<$<CONFIG:Debug>:-g>       # Debug flags
#          $<$<CONFIG:Release>:-O3>    # Release optimization flags
#          $<$<CXX_COMPILER_ID:GNU>:-Wshadow>     #Warning Flags
#      )
#      ```

# 2. **Setting Include Directories Conditionally**:
#    - Use different include directories based on the build configuration:
#      ```cmake
#      target_include_directories(ProjectTarget PRIVATE
#          $<$<CONFIG:Debug>:/path/to/debug/includes>
#          $<$<CONFIG:Release>:/path/to/release/includes>
#      )
#      ```

# 3. **Compiler-Specific Features**:
#    - Set features based on the compiler used:
#      ```cmake
#      target_compile_features(ProjectTarget PRIVATE
#          $<$<CXX_COMPILER_ID:GNU>:cxx_std_17>      # Use C++17 if GNU compiler
#          $<$<CXX_COMPILER_ID:MSVC>:cxx_std_20>     # Use C++20 if MSVC compiler
#      )
#      ```

# 4. **Conditional Library Linking Based on Platform**:
#    - Link libraries based on the target platform (Windows or Linux):
#      ```cmake
#      target_link_libraries(ProjectTarget PRIVATE
#          $<$<PLATFORM_ID:Windows>:winmm>
#          $<$<PLATFORM_ID:Linux>:pthread>
#      )
#      ```

# 5. **Use Different Libraries Based on Build Type**:
#    - Link different libraries depending on whether the build is `Debug` or `Release`:
#      ```cmake
#      target_link_libraries(ProjectTarget PRIVATE
#          $<$<CONFIG:Debug>:debug_library>
#          $<$<CONFIG:Release>:optimized_library>
#      )
#      ```

# 6. **Setting Custom Output Directories Based on Configuration**:
#    - Specify output directories conditionally:
#      ```cmake
#      set_target_properties(ProjectTarget PROPERTIES
#          ARCHIVE_OUTPUT_DIRECTORY $<$<CONFIG:Debug>:${CMAKE_BINARY_DIR}/Debug>
#          ARCHIVE_OUTPUT_DIRECTORY $<$<CONFIG:Release>:${CMAKE_BINARY_DIR}/Release>
#      )
#      ```



# Specify the minimum version of CMake required to build this project.
# This ensures that all the features used are supported in this version or later.
# cmake_minimum_required(VERSION 3.16)
# project(CMakeTut VERSION 1.0)

# # Set the C++ standard to a modern version
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED True)

# # Optionally, turn on warnings as errors for best practices
# add_compile_options(-Wall -Wextra -Werror)

# # Create an interface library for project-wide settings
# add_library(ProjectSettings INTERFACE)
# target_compile_features(ProjectSettings INTERFACE cxx_std_17)

# # Include the headers globally (modern approach)
# include_directories(${CMAKE_SOURCE_DIR}/include)
# # Add an option to build the MathFunctions library
# option(USE_MATH_FUNCTIONS "Use the MathFunctions library" ON)

# message(STATUS "USE_MATH_FUNCTIONS: ${USE_MATH_FUNCTIONS}")

# if (USE_MATH_FUNCTIONS)

#     # Add the library from lib/MathFunctions
#     add_library(MathFunctions STATIC lib/MathFunctions/MathFunctions.cpp)
    
#     # Properly set the include directories for the library
#     target_include_directories(MathFunctions PUBLIC ${CMAKE_SOURCE_DIR}/include)
# endif()

# # Add the executable and link to the library if available
# add_executable(CMakeTut src/main.cpp)

# if (USE_MATH_FUNCTIONS)
#     target_link_libraries(CMakeTut PRIVATE MathFunctions)
#     target_compile_definitions(CMakeTut PRIVATE USE_MATH_FUNCTIONS)
# else()
#     target_link_libraries(CMakeTut PRIVATE ProjectSettings)   
# endif()

# # Apply generator expressions to add warning flags in Debug mode
# target_compile_options(CMakeTut PRIVATE
#     $<$<CONFIG:Debug>:-Wpedantic>
#     $<$<CXX_COMPILER_ID:GNU>:-Wshadow>
# )


# cmake_minimum_required(VERSION 3.16)
# project(CMakeTut VERSION 1.0)

# # Set the C++ standard to a modern version
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED True)

# # Optionally, turn on warnings as errors for best practices
# add_compile_options(-Wall -Wextra -Werror)

# # Create an interface library for project-wide settings
# add_library(ProjectSettings INTERFACE)
# target_compile_features(ProjectSettings INTERFACE cxx_std_17)

# # Include the headers globally (modern approach)
# include_directories(${CMAKE_SOURCE_DIR}/include)

# # Add an option to build the MathFunctions library
# option(USE_MATH_FUNCTIONS "Use the MathFunctions library" ON)

# message(STATUS "USE_MATH_FUNCTIONS: ${USE_MATH_FUNCTIONS}")

# if (USE_MATH_FUNCTIONS)
#     # Add the library from lib/MathFunctions
#     add_library(MathFunctions STATIC lib/MathFunctions/MathFunctions.cpp)
    
#     # Properly set the include directories for the library
#     target_include_directories(MathFunctions PUBLIC ${CMAKE_SOURCE_DIR}/include)
# endif()

# # Add the executable and link to the library if available
# add_executable(CMakeTut src/main.cpp)

# if (USE_MATH_FUNCTIONS)
#     target_link_libraries(CMakeTut PRIVATE MathFunctions)
#     target_compile_definitions(CMakeTut PRIVATE USE_MATH_FUNCTIONS)
# else()
#     target_link_libraries(CMakeTut PRIVATE ProjectSettings)   
# endif()

# # Apply generator expressions to add warning flags in Debug mode
# target_compile_options(CMakeTut PRIVATE
#     $<$<CONFIG:Debug>:-Wpedantic>
#     $<$<CXX_COMPILER_ID:GNU>:-Wshadow>
# )

# # Add testing support
# enable_testing()

# # Add a new target for tests only if GTest is available
# find_package(GTest REQUIRED)
# include(GoogleTest)

# # Add the test executable
# add_executable(TestMathFunctions tests/TestMathFunctions.cpp)

# # Link the test executable to GTest and MathFunctions library
# target_link_libraries(TestMathFunctions PRIVATE GTest::GTest GTest::Main MathFunctions)

# # Add include directories for tests
# target_include_directories(TestMathFunctions PRIVATE ${CMAKE_SOURCE_DIR}/include)

# # Register the test with CMake
# gtest_discover_tests(TestMathFunctions)


cmake_minimum_required(VERSION 3.16)
project(CMakeTut VERSION 1.0)

# Set the C++ standard to a modern version
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Optionally, turn on warnings as errors for best practices
add_compile_options(-Wall -Wextra -Werror)

# Create an interface library for project-wide settings
add_library(ProjectSettings INTERFACE)
target_compile_features(ProjectSettings INTERFACE cxx_std_17)

# Include the headers globally (modern approach)
include_directories(${CMAKE_SOURCE_DIR}/include)

# Add the executable for the main application
add_executable(CMakeTut src/main.cpp)

# Add an option to build the Library Management System
option(USE_LIBRARY "Use the Library Management System" ON)

message(STATUS "USE_LIBRARY: ${USE_LIBRARY}")

if (USE_LIBRARY)
    # Add the library from lib/Library
    add_library(Library STATIC lib/Library/Library.cpp lib/Library/User.cpp lib/Library/Book.cpp)

    # Properly set the include directories for the library
    target_include_directories(Library PUBLIC ${CMAKE_SOURCE_DIR}/include)

    # Link the main executable to the Library
    target_link_libraries(CMakeTut PRIVATE Library)

    target_compile_definitions(CMakeTut PRIVATE USE_LIBRARY)
else()
    # Link ProjectSettings
    target_link_libraries(CMakeTut PRIVATE ProjectSettings)
    message(STATUS "Library Management System is disabled.")
endif()

# Apply generator expressions to add warning flags in Debug mode
target_compile_options(CMakeTut PRIVATE
    $<$<CONFIG:Debug>:-Wpedantic>
    $<$<CXX_COMPILER_ID:GNU>:-Wshadow>
)

# Add testing support
enable_testing()

# Find GTest
find_package(GTest REQUIRED)
include(GoogleTest)

# Add the test executable for the Library Management System if USE_LIBRARY is ON
if (USE_LIBRARY)
    # Add the test executable for the Library Management System
    add_executable(TestLibrary tests/TestLibrary.cpp)

    # Link the test executable to GTest and the Library
    target_link_libraries(TestLibrary PRIVATE GTest::GTest GTest::Main Library)

    # Add include directories for tests
    target_include_directories(TestLibrary PRIVATE ${CMAKE_SOURCE_DIR}/include)

    # Register the test with CMake
    gtest_discover_tests(TestLibrary)
endif()
