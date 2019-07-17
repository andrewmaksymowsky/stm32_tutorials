.syntax unified
.cpu cortex-m0
.fpu softvfp        //tell compiler to break fp instr into simple
.thumb              //cortex m instruction set

// Global memory locations
.global vtable
.global Reset_Handler

/* The actual vector table
 * Here is where interrupt triggers are mapped to memory
 * locations where their ISRs reside */
.type vtable, %object
vtable:
    .word _estack
    .word Reset_Handler
.size vtable, .-vtable


/*
 * The Reset handler. Called on reset. ie. what runs on bootup
 */
.type Reset_Handler, %function
Reset_Handler:
    // Set the stack pointer to the end of the stack
    // The '_estack value is defined in our linker script
    LDR r0, =_estack
    MOV sp, r0

    // Set some dummy values. When we see these values
    // in our debugger, we'll know that our program
    // is loaded on the chip and working
    LDR r7, =0xDEADBEEF
    MOVS r0, #0

    main_loop:
        // Add 1 to register 'r0'.
        ADDS r0, r0, #1
        // Loop forever
        B   main_loop

.size Reset_Handler, .-Reset_Handler
