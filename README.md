# circle-bwbasic

## Overview

If like me you play with 80's computers, 
you remembered the time where computer have all-in-one OS & Language BASIC.a

My goal is to have an equivalent with the Raspberry PI 

The goal of this project is to provide BASIC support for the PI Computer

This project use
- Raspberry Pi bare metal environment [Circle](https://github.com/rsta2/circle).
- C and C++ standard library support for Circle [Circle-stdlib](https://github.com/smuehlst/circle-stdlib).
- A small C basic interpreter [Bwbasic](https://sourceforge.net/projects/bwbasic/)

## Getting Started

### Prerequisites

* same prerequisites than circle-stdlib
* Successfully tested with:
  * gcc-arm-8.2-2019.01-x86_64-arm-eabi
    * gcc-arm-8.2-2019.01-x86_64-arm-eabi.tar.xz from https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads
* Successfully tested with PI 1
	
### Building the Libraries
	
* Install circle (provided as example)<br>

    cd $HOME/opt 
    git clone https://github.com/rsta2/circle.git 
	
* Build circle (provided as example)

in $HOME/opt/circle create Config.mk<br>  

    RASPPI = 1    
    PREFIX = arm-eabi-  

    cd $HOME/opt/circle  
    ./makeall clean  
    ./makeall  

* Install circle-stdlib (provided as example)<br>

    cd $HOME/opt
    git clone --recursive https://github.com/smuehlst/circle-stdlib.git
	
* Build circle-stdlib (provided as example)

    cd $HOME/opt/circle-stdlib
    ./configure
    make
	
* Build circle-bwbasic<br>

    cd $HOME/opt/circle-stdlib/samples
    git clone --recursive https://github.com/fbockelee/circle-bwbasic.git
    make

Then copy these files to SD :<br>

    kernel.img
    profile.bas
    TEST.bas
   
## Current Release [v0.1](https://github.com/fbockelee/circle-bwbasic/releases/tag/v0.1)

* Use [Circle Step 40](https://github.com/rsta2/circle/releases/tag/Step40).
* Use [Circle-stdlib v11](https://github.com/smuehlst/circle-stdlib/releases/tag/v11.0).
* Use [Bwbasic v3.20](https://sourceforge.net/projects/bwbasic/).

Initial build of circle-bwbasic with Circle, Circle-stdlib 

### What's working
* The banner of bwbasic is ok, so stdout work
* Input in command-line, so stdin work
* some basic BASIC test work (example : 100 PRINT "HELLO")

### Known issues
* Access to files hang the system (basic command : CLOAD TEST.BAS)
* some function may not be called : sleep(),chdir(),mkdir(),rmdir() - Missing in stdlib-circle ?
* I have a french keyboard, i need to change mapping in circle (in progress)
* When compiling, message for TRUE/FALSE redefined : conflict between STDLIB define and bywater define  (in progress)
* When no keyboard, scrolling with false input (minor)
* CLS do nothing (clearscreen)
* Many commands/functions not tested

### Which script created/updated
* Create kernel.cpp,kernel.h,main.cpp
* Create Makefile 
* Update of bwbasic files :
	- bwbasic.c
		replace
			extern int main (int argc, char **argv);
		by
			#if defined(NO_MAIN)
			extern int main_bwbasic (int argc, char **argv);
			#else
			extern int main (int argc, char **argv);
			#endif
	- bwbasic.h
		uncomment #include "bwb_user.h"
		replace
			extern int main (int argc, char **argv);
		by
			#if defined(NO_MAIN)
			extern int main_bwbasic (int argc, char **argv);
			#else
			extern int main (int argc, char **argv);
			#endif
* add  bwb_user.h file
		#define HAVE_UNIX TRUE 
		#define DIRECTORY_CMDS FALSE 
		#define NO_MAIN 
		#define HAVE_UNIX_GCC FALSE 

### Explanations
* HAVE_UNIX TRUE added to compile with stdlib
* NO_MAIN created replace main by main_bwbasic
* DIRECTORY_CMDS FALSE added to avoid use of chdir(),mkdir(),rmdir()
* HAVE_UNIX_GCC FALSE  added to avoid use of sleep() 

## Action plan

* Stabilization of BWBASIC --> will be the new reference (actually my reference is BWBASIC on linux)
* Creation of PIBASIC = BWBASIC with enhancements (speed, editor, most hardware connection with circle, best method to add command) 

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE
Version 3 - see the [LICENSE](LICENSE) file for details

## Acknowledgements

* Rene Stange for [Circle](https://github.com/rsta2/circle).
* Stephan Mühlstrasser for [Circle-stdlib](https://github.com/smuehlst/circle-stdlib).
* Ted A. Campbell,Jon B. Volkoff,Dale DePriest,Howard Wulf
  for [Bwbasic](https://sourceforge.net/projects/bwbasic/).
* The Newlib team for [Newlib](https://sourceware.org/newlib/).
* The mbed TLS team for [mbed TLS](https://tls.mbed.org/).
