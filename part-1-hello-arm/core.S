.syntax unified
.cpu cortex-m0
.fpu softvfp        //tell compiler to break fp instr into simple
.thumb              //cortex m instruction set

// Global memory locations
.global vtable
.global reset_handler

/* The actual vector table
 * Here is where interrupt triggers are mapped to memory
 * locations where their ISRs reside */
.type vtable, %object
    .word _estack
    .word reset_handler
.size vtable, .-vtable
