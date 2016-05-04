# Xubuntu 16.04 desktop for C++ development

:warning: This is work in progress, use at your own risk! See section "Under construction" below.

Based on a Xubuntu 16.04 installation, this Vagrant file installs the "4C" development environment with:

- **C**lang 3.7
- **C**make (newest, currently 3.5.1)
- **C**Lion 2016.1.1 IDE
- **C**onan (newest, currently 0.9.0) package manager for C++

... and some more useful stuff like lldb and of course git.

## Installation and first launch

### VirtualBox

Download and install Oracle VirtualBox from https://www.virtualbox.org/

### Vagrant

Download and install Vagrant from https://www.vagrantup.com/

You may also want to install the Vagrant plugin for VirtualBox Guest Additions. 
The base box used comes with the Guest Additions for 5.0.18, and the plugin will take care 
to install the correct Guest Additions if your version of VirtualBox differs from that.
To do so simply call 

    vagrant plugin install vagrant-vbguest
	
### Download the repo and launch!

Clone the git repository or download and unpack the zip archive. 
Open a shell in the directory containing the `Vagrantfile` and run

    vagrant up

This will take a while when you run it for the first time.
Vagrant will download the base box, launch the virtual machine and install the software mentioned above.

### Login and finish installation

When the software installation is complete, log into the VM (user and password are "vagrant").

#### CLion

Inside the VM, open a terminal and run 

    /opt/clion-2016.1.1/bin/clion.sh
	
It wil start the actual installation wizard for CLion. 
You may or may not switch to `/usr/bin/cmake` from the one the comes with CLion; currently both are the same version.
For the compiler just use the default `/usr/bin/c++`

## Configuration

Aside from CLion there is not much to configure. `/usr/bin/c++` has already been set to `clang++` and the conan configuration will also be set to Clang.

## Building the first 4C project

I'll use the ["getting started" example](http://docs.conan.io/en/latest/getting_started.html) from Conan.io to show how CLion, CMake and Conan play together.

Go through the example like it is stated on Conan's page:

1. Create the source files or clone the git repository
2. If you cloned the repository, open `.gitignore` and add `.idea/` as additional line. That is the directory CLion uses for its configuration stuff.
3. In `CMakeLists.txt`, change the line 
        
		`include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)`
	
    to
	
	    `include(build/conanbuildinfo.cmake)`
		
4. Continue normally with `mkdir build && cd build`
5. There are no compiled binaries for all packages needen, so we need to tell Conan to build them as needed:
 
    `conan install .. --build missing`
	
6. Instead of calling CMake manually, start CLion and open the directory with the sources as new project.
7. You can now simply build from within CLion.

## Under construction

There's still a lot to be done, e.g. adding `conan install` as automated pre-build step and upgrading to Clang 3.8 which was not supported out of the box by Conan when I started.
I also am rather new to Vargant, CLion etc, so I welcome any remarks, constructive criticism and pull requests that you might have.
 










