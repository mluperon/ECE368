# ECE368
Group repository for ECE 368: Digital Design

Repository Contents  (* -  In progress): 

-General Purpose Register Bank 
-Data Memory 
-Alu_Data Register – Output from DPU.
- Dst_Addr Register – Output from DPU.
- ASrc_reg Register – Output from register bank Aout and input to ALU select
- BSrc_reg Register – Output from register bank Bout and input to ALU select
- ALU – Component that implements the executable portion of all instructions
defined in table 1.
- ALU Control Block
- Memory management unit – Data Path unit used to move data memory blocks into
or out of memory or between memory areas.

Data Path Control Entity 
-Program Counter
-Instruction Register
-Instruction Phase controller
-instruction decoder
-instruction memory 
-Control Modules 
    -Fetch at time To 
    -Decode at Time T1
    -etc



Notes: 
-Create a signal table that defines all signals 
-Create a test bench 
-Integrate your control unit and data path unit with your modified debug unit from lab 3??
***Design a small program to test your design using all of the instructions in Table 1 and at least two registers
