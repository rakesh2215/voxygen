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
CMAKE_BINARY_DIR = /home/ubuntu/voxygen/verilog-doc/build/coverage

# Include any dependencies generated for this target.
include src/verilog-parser/src/CMakeFiles/parser.dir/depend.make

# Include the progress variables for this target.
include src/verilog-parser/src/CMakeFiles/parser.dir/progress.make

# Include the compile flags for this target's objects.
include src/verilog-parser/src/CMakeFiles/parser.dir/flags.make

src/verilog-parser/src/CMakeFiles/parser.dir/main.o: src/verilog-parser/src/CMakeFiles/parser.dir/flags.make
src/verilog-parser/src/CMakeFiles/parser.dir/main.o: ../../src/verilog-parser/src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/voxygen/verilog-doc/build/coverage/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/verilog-parser/src/CMakeFiles/parser.dir/main.o"
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/parser.dir/main.o   -c /home/ubuntu/voxygen/verilog-doc/src/verilog-parser/src/main.c

src/verilog-parser/src/CMakeFiles/parser.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/parser.dir/main.i"
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/voxygen/verilog-doc/src/verilog-parser/src/main.c > CMakeFiles/parser.dir/main.i

src/verilog-parser/src/CMakeFiles/parser.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/parser.dir/main.s"
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/voxygen/verilog-doc/src/verilog-parser/src/main.c -o CMakeFiles/parser.dir/main.s

# Object files for target parser
parser_OBJECTS = \
"CMakeFiles/parser.dir/main.o"

# External object files for target parser
parser_EXTERNAL_OBJECTS =

bin/parser: src/verilog-parser/src/CMakeFiles/parser.dir/main.o
bin/parser: src/verilog-parser/src/CMakeFiles/parser.dir/build.make
bin/parser: lib/libverilogparser.a
bin/parser: src/verilog-parser/src/CMakeFiles/parser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/voxygen/verilog-doc/build/coverage/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../bin/parser"
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/verilog-parser/src/CMakeFiles/parser.dir/build: bin/parser

.PHONY : src/verilog-parser/src/CMakeFiles/parser.dir/build

src/verilog-parser/src/CMakeFiles/parser.dir/clean:
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src && $(CMAKE_COMMAND) -P CMakeFiles/parser.dir/cmake_clean.cmake
.PHONY : src/verilog-parser/src/CMakeFiles/parser.dir/clean

src/verilog-parser/src/CMakeFiles/parser.dir/depend:
	cd /home/ubuntu/voxygen/verilog-doc/build/coverage && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/voxygen/verilog-doc /home/ubuntu/voxygen/verilog-doc/src/verilog-parser/src /home/ubuntu/voxygen/verilog-doc/build/coverage /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src /home/ubuntu/voxygen/verilog-doc/build/coverage/src/verilog-parser/src/CMakeFiles/parser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/verilog-parser/src/CMakeFiles/parser.dir/depend
