# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

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
CMAKE_SOURCE_DIR = /home/pi/voice_control_rpi/simon

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/voice_control_rpi/simon/build

# Include any dependencies generated for this target.
include SampleApp/src/CMakeFiles/SampleApp.dir/depend.make

# Include the progress variables for this target.
include SampleApp/src/CMakeFiles/SampleApp.dir/progress.make

# Include the compile flags for this target's objects.
include SampleApp/src/CMakeFiles/SampleApp.dir/flags.make

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o: SampleApp/src/CMakeFiles/SampleApp.dir/flags.make
SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o: ../SampleApp/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/voice_control_rpi/simon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o"
	cd /home/pi/voice_control_rpi/simon/build/SampleApp/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SampleApp.dir/main.cpp.o -c /home/pi/voice_control_rpi/simon/SampleApp/src/main.cpp

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SampleApp.dir/main.cpp.i"
	cd /home/pi/voice_control_rpi/simon/build/SampleApp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/voice_control_rpi/simon/SampleApp/src/main.cpp > CMakeFiles/SampleApp.dir/main.cpp.i

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SampleApp.dir/main.cpp.s"
	cd /home/pi/voice_control_rpi/simon/build/SampleApp/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/voice_control_rpi/simon/SampleApp/src/main.cpp -o CMakeFiles/SampleApp.dir/main.cpp.s

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.requires:

.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.requires

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.provides: SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.requires
	$(MAKE) -f SampleApp/src/CMakeFiles/SampleApp.dir/build.make SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.provides.build
.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.provides

SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.provides.build: SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o


# Object files for target SampleApp
SampleApp_OBJECTS = \
"CMakeFiles/SampleApp.dir/main.cpp.o"

# External object files for target SampleApp
SampleApp_EXTERNAL_OBJECTS =

SampleApp/src/SampleApp: SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o
SampleApp/src/SampleApp: SampleApp/src/CMakeFiles/SampleApp.dir/build.make
SampleApp/src/SampleApp: ../distribution/ifly/lib/libifly.so
SampleApp/src/SampleApp: SampleApp/src/CMakeFiles/SampleApp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/voice_control_rpi/simon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable SampleApp"
	cd /home/pi/voice_control_rpi/simon/build/SampleApp/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SampleApp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
SampleApp/src/CMakeFiles/SampleApp.dir/build: SampleApp/src/SampleApp

.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/build

SampleApp/src/CMakeFiles/SampleApp.dir/requires: SampleApp/src/CMakeFiles/SampleApp.dir/main.cpp.o.requires

.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/requires

SampleApp/src/CMakeFiles/SampleApp.dir/clean:
	cd /home/pi/voice_control_rpi/simon/build/SampleApp/src && $(CMAKE_COMMAND) -P CMakeFiles/SampleApp.dir/cmake_clean.cmake
.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/clean

SampleApp/src/CMakeFiles/SampleApp.dir/depend:
	cd /home/pi/voice_control_rpi/simon/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/voice_control_rpi/simon /home/pi/voice_control_rpi/simon/SampleApp/src /home/pi/voice_control_rpi/simon/build /home/pi/voice_control_rpi/simon/build/SampleApp/src /home/pi/voice_control_rpi/simon/build/SampleApp/src/CMakeFiles/SampleApp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : SampleApp/src/CMakeFiles/SampleApp.dir/depend

