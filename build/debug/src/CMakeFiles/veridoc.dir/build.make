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

# Include any dependencies generated for this target.
include src/CMakeFiles/veridoc.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/veridoc.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/veridoc.dir/flags.make

src/CMakeFiles/veridoc.dir/main.c.o: src/CMakeFiles/veridoc.dir/flags.make
src/CMakeFiles/veridoc.dir/main.c.o: ../../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/voxygen/verilog-doc/build/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/veridoc.dir/main.c.o"
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/veridoc.dir/main.c.o   -c /home/ubuntu/voxygen/verilog-doc/src/main.c

src/CMakeFiles/veridoc.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/veridoc.dir/main.c.i"
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/voxygen/verilog-doc/src/main.c > CMakeFiles/veridoc.dir/main.c.i

src/CMakeFiles/veridoc.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/veridoc.dir/main.c.s"
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/voxygen/verilog-doc/src/main.c -o CMakeFiles/veridoc.dir/main.c.s

# Object files for target veridoc
veridoc_OBJECTS = \
"CMakeFiles/veridoc.dir/main.c.o"

# External object files for target veridoc
veridoc_EXTERNAL_OBJECTS =

bin/veridoc: src/CMakeFiles/veridoc.dir/main.c.o
bin/veridoc: src/CMakeFiles/veridoc.dir/build.make
bin/veridoc: lib/libverilogparser.a
bin/veridoc: lib/libveridoccore.a
bin/veridoc: lib/libverilogparser.a
bin/veridoc: src/CMakeFiles/veridoc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/voxygen/verilog-doc/build/debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/veridoc"
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/veridoc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/veridoc.dir/build: bin/veridoc

.PHONY : src/CMakeFiles/veridoc.dir/build

src/CMakeFiles/veridoc.dir/clean:
	cd /home/ubuntu/voxygen/verilog-doc/build/debug/src && $(CMAKE_COMMAND) -P CMakeFiles/veridoc.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/veridoc.dir/clean

src/CMakeFiles/veridoc.dir/depend:
	cd /home/ubuntu/voxygen/verilog-doc/build/debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/voxygen/verilog-doc /home/ubuntu/voxygen/verilog-doc/src /home/ubuntu/voxygen/verilog-doc/build/debug /home/ubuntu/voxygen/verilog-doc/build/debug/src /home/ubuntu/voxygen/verilog-doc/build/debug/src/CMakeFiles/veridoc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/veridoc.dir/depend
