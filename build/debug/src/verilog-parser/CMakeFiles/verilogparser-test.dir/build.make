# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/voxygen/verilog-doc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/voxygen/verilog-doc/build/debug

# Utility rule file for verilogparser-test.

# Include the progress variables for this target.
include src/verilog-parser/CMakeFiles/verilogparser-test.dir/progress.make

src/verilog-parser/CMakeFiles/verilogparser-test:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/voxygen/verilog-doc/build/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running Test Suite"
	cd /home/ubuntu/voxygen/verilog-doc/src/verilog-parser && ./bin/run-tests.sh

verilogparser-test: src/verilog-parser/CMakeFiles/verilogparser-test
verilogparser-test: src/verilog-parser/CMakeFiles/verilogparser-test.dir/build.make

.PHONY : verilogparser-test

# Rule to build all files generated by this target.
src/verilog-parser/CMakeFiles/verilogparser-test.dir/build: verilogparser-test

.PHONY : src/verilog-parser/CMakeFiles/verilogparser-test.dir/build

src/verilog-parser/CMakeFiles/verilogparser-test.dir/clean:
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src/verilog-parser && $(CMAKE_COMMAND) -P CMakeFiles/verilogparser-test.dir/cmake_clean.cmake
.PHONY : src/verilog-parser/CMakeFiles/verilogparser-test.dir/clean

src/verilog-parser/CMakeFiles/verilogparser-test.dir/depend:
	cd /home/ubuntu/voxygen/verilog-doc/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/voxygen/verilog-doc /home/ubuntu/voxygen/verilog-doc/src/verilog-parser /home/ubuntu/voxygen/verilog-doc/build/debug /home/ubuntu/voxygen/verilog-doc/build/debug/src/verilog-parser /home/ubuntu/voxygen/verilog-doc/build/debug/src/verilog-parser/CMakeFiles/verilogparser-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/verilog-parser/CMakeFiles/verilogparser-test.dir/depend
