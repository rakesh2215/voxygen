# CMake generated Testfile for 
# Source directory: /home/ubuntu/voxygen/verilog-doc/src
# Build directory: /home/ubuntu/voxygen/verilog-doc/build/debug/src
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(veridoc_0 "/home/ubuntu/voxygen/verilog-doc/build/debug/bin/veridoc" "-c" "./build/debug/bin/assets/veridoc.cfg" "-F" "./build/debug/bin/assets/test_manifest.txt" "-v")
set_tests_properties(veridoc_0 PROPERTIES  WORKING_DIRECTORY "../" _BACKTRACE_TRIPLES "/home/ubuntu/voxygen/verilog-doc/src/CMakeLists.txt;84;add_test;/home/ubuntu/voxygen/verilog-doc/src/CMakeLists.txt;0;")
subdirs("verilog-parser")
