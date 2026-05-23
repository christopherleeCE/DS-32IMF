Continued work by Christopher Lee on the group capstone project found [here](https://github.com/christopherleeCE/DS32IMF_MicroProcessor). The previous iteration was a 5 staged pipelined microprocessor with full data hazard handling, gcc toolchain compatibility, 4kb dmem and 16kb imem, 5MHz operating clk, and compliance with the RV32IM ISA. This iteration (will) contain the additional float (F) RISC-V extension, graphical output via VGA with both a graphic mode and text mode, and additional miscellaneous additions. 

Additional features that have been implemented in this iteration of the project are...
- Increased memory capacity to 96Kb + 80Kb (96K of executable, 42.5K of general
purpose DMEM, 384B dedicated to a text buffer, 37.5K dedicated to a frame buffer)
- Implementation of a graphical mode to a 160x120 VGA output
- Implementation of a text mode (26x14 char text buffer, same 160x120 VGA output)



The readme for the previous iteration is shown below.
```
Collaborative project for ASU's EEE488/489 Senior Design Laboratory. Group members are Ayomide Laguda, Christopher Lee, Edgar Gastelum, Mark Zaldivar, Holden Laughlin.

This project is synthesizing and deploying a RV32IM 5 stage pipelined microprocessor to an FPGA that is capable of running compiled C code from the RV32 GCC toolchain.
Design is a split memory architecture pipelined design with hazard control. The verification side uses automated directed and randomized testing.
Simulation for verification is done in Questa, using powershell, bash, and python scripting to accelerate the verification process.

The group portion of this project concluded on 5/1/2026, branch main is the final state of the group portion. Continued work is done in forks of this repo (non group work)
```
