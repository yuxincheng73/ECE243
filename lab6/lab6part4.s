			.equ		EDGE_TRIGGERED,         0x1
			.equ		LEVEL_SENSITIVE,        0x0
			.equ		CPU0,         				0x01	// bit-mask; bit 0 represents cpu0
			.equ		ENABLE, 						0x1

			.equ		KEY0, 						0b0001
			.equ		KEY1, 						0b0010
			.equ		KEY2,							0b0100
			.equ		KEY3,							0b1000

			.equ		RIGHT,						1
			.equ		LEFT,							2

			.equ		USER_MODE,					0b10000
			.equ		FIQ_MODE,					0b10001
			.equ		IRQ_MODE,					0b10010
			.equ		SVC_MODE,					0b10011
			.equ		ABORT_MODE,					0b10111
			.equ		UNDEF_MODE,					0b11011
			.equ		SYS_MODE,					0b11111

			.equ		INT_ENABLE,					0b01000000
			.equ		INT_DISABLE,				0b11000000




/* This files provides address values that exist in the system */

/* Memory */
        .equ  DDR_BASE,	            0x00000000
        .equ  DDR_END,              0x3FFFFFFF
        .equ  A9_ONCHIP_BASE,	      0xFFFF0000
        .equ  A9_ONCHIP_END,        0xFFFFFFFF
        .equ  SDRAM_BASE,    	      0xC0000000
        .equ  SDRAM_END,            0xC3FFFFFF
        .equ  FPGA_ONCHIP_BASE,	   0xC8000000
        .equ  FPGA_ONCHIP_END,      0xC803FFFF
        .equ  FPGA_CHAR_BASE,   	   0xC9000000
        .equ  FPGA_CHAR_END,        0xC9001FFF

/* Cyclone V FPGA devices */
        .equ  LEDR_BASE,             0xFF200000
        .equ  HEX3_HEX0_BASE,        0xFF200020
        .equ  HEX5_HEX4_BASE,        0xFF200030
        .equ  SW_BASE,               0xFF200040
        .equ  KEY_BASE,              0xFF200050
        .equ  JP1_BASE,              0xFF200060
        .equ  JP2_BASE,              0xFF200070
        .equ  PS2_BASE,              0xFF200100
        .equ  PS2_DUAL_BASE,         0xFF200108
        .equ  JTAG_UART_BASE,        0xFF201000
        .equ  JTAG_UART_2_BASE,      0xFF201008
        .equ  IrDA_BASE,             0xFF201020
        .equ  TIMER_BASE,            0xFF202000
        .equ  AV_CONFIG_BASE,        0xFF203000
        .equ  PIXEL_BUF_CTRL_BASE,   0xFF203020
        .equ  CHAR_BUF_CTRL_BASE,    0xFF203030
        .equ  AUDIO_BASE,            0xFF203040
        .equ  VIDEO_IN_BASE,         0xFF203060
        .equ  ADC_BASE,              0xFF204000

/* Cyclone V HPS devices */
        .equ   HPS_GPIO1_BASE,       0xFF709000
        .equ   HPS_TIMER0_BASE,      0xFFC08000
        .equ   HPS_TIMER1_BASE,      0xFFC09000
        .equ   HPS_TIMER2_BASE,      0xFFD00000
        .equ   HPS_TIMER3_BASE,      0xFFD01000
        .equ   FPGA_BRIDGE,          0xFFD0501C
/* ARM A9 MPCORE devices */
        .equ   PERIPH_BASE,          0xFFFEC000   /* base address of peripheral devices */
        .equ   MPCORE_PRIV_TIMER,    0xFFFEC600   /* PERIPH_BASE + 0x0600 */

        /* Interrupt controller (GIC) CPU interface(s) */
        .equ   MPCORE_GIC_CPUIF,     0xFFFEC100   /* PERIPH_BASE + 0x100 */
        .equ   ICCICR,               0x00         /* CPU interface control register */
        .equ   ICCPMR,               0x04         /* interrupt priority mask register */
        .equ   ICCIAR,               0x0C         /* interrupt acknowledge register */
        .equ   ICCEOIR,              0x10         /* end of interrupt register */
        /* Interrupt controller (GIC) distributor interface(s) */
        .equ   MPCORE_GIC_DIST,      0xFFFED000   /* PERIPH_BASE + 0x1000 */
        .equ   ICDDCR,               0x00         /* distributor control register */
        .equ   ICDISER,              0x100        /* interrupt set-enable registers */
        .equ   ICDICER,              0x180        /* interrupt clear-enable registers */
        .equ   ICDIPTR,              0x800        /* interrupt processor targets registers */
        .equ   ICDICFR,              0xC00        /* interrupt configuration registers */



/* This files provides interrupt IDs */
/* FPGA interrupts (there are 64 in total; only a few are defined below) */
			.equ	INTERVAL_TIMER_IRQ, 			72
			.equ	KEYS_IRQ, 						73
			.equ	FPGA_IRQ2, 						74
			.equ	FPGA_IRQ3, 						75
			.equ	FPGA_IRQ4, 						76
			.equ	FPGA_IRQ5, 						77
			.equ	AUDIO_IRQ, 						78
			.equ	PS2_IRQ, 						79
			.equ	JTAG_IRQ, 						80
			.equ	IrDA_IRQ, 						81
			.equ	FPGA_IRQ10,						82
			.equ	JP1_IRQ,							83
			.equ	JP2_IRQ,							84
			.equ	FPGA_IRQ13,						85
			.equ	FPGA_IRQ14,						86
			.equ	FPGA_IRQ15,						87
			.equ	FPGA_IRQ16,						88
			.equ	PS2_DUAL_IRQ,					89
			.equ	FPGA_IRQ18,						90
			.equ	FPGA_IRQ19,						91

/* ARM A9 MPCORE devices (there are many; only a few are defined below) */
			.equ	MPCORE_GLOBAL_TIMER_IRQ,	27
			.equ	MPCORE_PRIV_TIMER_IRQ,		29
			.equ	MPCORE_WATCHDOG_IRQ,			30

/* HPS devices (there are many; only a few are defined below) */
			.equ	HPS_UART0_IRQ,   				194
			.equ	HPS_UART1_IRQ,   				195
			.equ	HPS_GPIO0_IRQ,          	196
			.equ	HPS_GPIO1_IRQ,          	197
			.equ	HPS_GPIO2_IRQ,          	198
			.equ	HPS_TIMER0_IRQ,         	199
			.equ	HPS_TIMER1_IRQ,         	200
			.equ	HPS_TIMER2_IRQ,         	201
			.equ	HPS_TIMER3_IRQ,         	202
			.equ	HPS_WATCHDOG0_IRQ,     		203
			.equ	HPS_WATCHDOG1_IRQ,     		204





CONFIG_GIC:
				PUSH		{LR}
    			/* Configure the A9 Private Timer interrupt, FPGA KEYs, and FPGA Timer
				/* CONFIG_INTERRUPT (int_ID (R0), CPU_target (R1)); */
    			MOV		R0, #MPCORE_PRIV_TIMER_IRQ
    			MOV		R1, #CPU0
    			BL			CONFIG_INTERRUPT
    			MOV		R0, #INTERVAL_TIMER_IRQ
    			MOV		R1, #CPU0
    			BL			CONFIG_INTERRUPT
    			MOV		R0, #KEYS_IRQ
    			MOV		R1, #CPU0
    			BL			CONFIG_INTERRUPT

				/* configure the GIC CPU interface */
    			LDR		R0, =0xFFFEC100		// base address of CPU interface
    			/* Set Interrupt Priority Mask Register (ICCPMR) */
    			LDR		R1, =0xFFFF 			// enable interrupts of all priorities levels
    			STR		R1, [R0, #0x04]
    			/* Set the enable bit in the CPU Interface Control Register (ICCICR). This bit
				 * allows interrupts to be forwarded to the CPU(s) */
    			MOV		R1, #1
    			STR		R1, [R0]
    
    			/* Set the enable bit in the Distributor Control Register (ICDDCR). This bit
				 * allows the distributor to forward interrupts to the CPU interface(s) */
    			LDR		R0, =0xFFFED000
    			STR		R1, [R0]    
    
    			POP     	{PC}
/* 
 * Configure registers in the GIC for an individual interrupt ID
 * We configure only the Interrupt Set Enable Registers (ICDISERn) and Interrupt 
 * Processor Target Registers (ICDIPTRn). The default (reset) values are used for 
 * other registers in the GIC
 * Arguments: R0 = interrupt ID, N
 *            R1 = CPU target
*/
CONFIG_INTERRUPT:
    			PUSH		{R4-R5, LR}
    
    			/* Configure Interrupt Set-Enable Registers (ICDISERn). 
				 * reg_offset = (integer_div(N / 32) * 4
				 * value = 1 << (N mod 32) */
    			LSR		R4, R0, #3							// calculate reg_offset
    			BIC		R4, R4, #3							// R4 = reg_offset
				LDR		R2, =0xFFFED100
				ADD		R4, R2, R4							// R4 = address of ICDISER
    
    			AND		R2, R0, #0x1F   					// N mod 32
				MOV		R5, #1								// enable
    			LSL		R2, R5, R2							// R2 = value

				/* now that we have the register address (R4) and value (R2), we need to set the
				 * correct bit in the GIC register */
    			LDR		R3, [R4]								// read current register value
    			ORR		R3, R3, R2							// set the enable bit
    			STR		R3, [R4]								// store the new register value

    			/* Configure Interrupt Processor Targets Register (ICDIPTRn)
     			 * reg_offset = integer_div(N / 4) * 4
     			 * index = N mod 4 */
    			BIC		R4, R0, #3							// R4 = reg_offset
				LDR		R2, =0xFFFED800
				ADD		R4, R2, R4							// R4 = word address of ICDIPTR
    			AND		R2, R0, #0x3						// N mod 4
				ADD		R4, R2, R4							// R4 = byte address in ICDIPTR

				/* now that we have the register address (R4) and value (R2), write to (only)
				 * the appropriate byte */
				STRB		R1, [R4]
    
    			POP		{R4-R5, PC}



                .section .vectors, "ax"  
                B        _start              // reset vector
                B        SERVICE_UND         // undefined instruction vector
                B        SERVICE_SVC         // software interrupt vector
                B        SERVICE_ABT_INST    // aborted prefetch vector
                B        SERVICE_ABT_DATA    // aborted data vector
                .word    0                   // unused vector
                B        SERVICE_IRQ         // IRQ interrupt vector
                B        SERVICE_FIQ         // FIQ interrupt vector



.text
.global _start
_start:
MOV R1, #0b11010010  
MSR CPSR_c, R1
LDR SP, =0xFFFFFFFC  //set IRQ stack pointer

MOV R1, #0b11010011 //go into SVC mode with disabled interrupts
MSR CPSR_c, R1
LDR SP, =0x3FFFFFFC //SVC stack pointer set
 

BL CONFIG_GIC //config GIC for interrupts

//config push buttons

LDR R0,=KEY_BASE
MOV R1, #0xF //enable interrupts for all four keys
STR R1, [R0, #8]

BL CONFIG_TIMER
BL CONFIG_PRIVATE_TIMER

MOV R0, #0b01010011 //enable  interrupts in SVC mode
MSR CPSR_c, R0


LDR R4,=COUNT
LDR R6,=RUN
LDR R3, =LEDR_BASE
LDR R8,=TIME

LOOP:
LDR R5, [R4]
STR R5, [R3]
LDR R9,[R8]


B LOOP



SERVICE_IRQ:    PUSH     {R0-R7, LR}     
                LDR      R4, =0xFFFEC100 // GIC CPU interface base address
                LDR      R5, [R4, #0x0C] // read the ICCIAR in the CPU
                                         // interface

KEYS_HANDLER:                       
CHECK_PUSH:   	CMP      R5, #73         // check the interrupt ID
				
                BNE     CHECK_TIMER     // if not recognized, stop here
          	BL 	KEY_ISR
                B       EXIT_IRQ
CHECK_TIMER:    CMP 	R5, #72
		BNE     CHECK_PRIVATE_TIMER
		BL      TIMER_ISR
                B       EXIT_IRQ
                
CHECK_PRIVATE_TIMER:
		CMP R5, #29
                BNE UNEXPECTED
                BL  PRIVATE_TIMER_ISR
                B EXIT_IRQ
                
                
UNEXPECTED:     B        UNEXPECTED

EXIT_IRQ:       STR      R5, [R4, #0x10] // write to the End of Interrupt
                                         // Register (ICCEOIR)
                POP      {R0-R7, LR}     
                SUBS     PC, LR, #4      // return from exception


CONFIG_TIMER:
LDR R0,=TIMER_BASE
LDR R1,=0b0111100001000000

//load counterLow
STR R1,[R0,#8]
//load counterHigh
LDR R1,=0b101111101
STR R1, [R0,#12]

//start timer
LDR R1,=0b111
STR R1, [R0, #4]

MOV PC, LR

CONFIG_PRIVATE_TIMER:
LDR R0,=MPCORE_PRIV_TIMER


LDR R1,=2000000
STR R1, [R0] //load timer

LDR R1,=0b111 //controls
STR R1, [R0,#8] //start timer

MOV PC, LR


PRIVATE_TIMER_ISR:
PUSH {LR}
PUSH {R4-R10}

LDR R10,=GO_TIME
LDR R10,[R10]

LDR R7,=SECONDS
LDR R8,[R7]  //R8 holds the number of seconds
LDR R4,=HEX3_HEX0_BASE
MOV R5, #0 //R5 is pattern register
LDR R0, =MPCORE_PRIV_TIMER
LDR R1, =1 //clear timer
STR R1, [R0,#0xC]

//load hundred of seconds and seconds (Time is hundredths of seconds)
LDR R0,=TIME
LDR R1,[R0]


CMP R10, #1
ADDEQ R1, #1
CMP R1, #100
MOVEQ R1, #0
ADDEQ R8, #1
CMP R8, #60
MOVEQ R8, #0
STR R8, [R7]



STR R1, [R0]

MOV R0, R1
BL DIVIDE

MOV R6, R1 //save quotient in R6
BL SEG7_CODE



ORR R5, R0, R5

MOV R0,R6
BL SEG7_CODE
LSL R0, #8
ORR R5, R0, R5


MOV R0, R8
BL DIVIDE
MOV R6, R1 //save quotient in R6
BL SEG7_CODE
LSL R0, #16
ORR R5, R0, R5

MOV R0, R6
BL SEG7_CODE
LSL R0, #24
ORR R5, R0, R5

STR R5, [R4]


END_PRIVATE_TIMER_ISR:
POP {R4-R10}
POP {LR}

MOV PC, LR



TIMER_ISR:

PUSH {R0,R1,R2}
//clear interrupt
LDR R0,=TIMER_BASE
MOV R1, #0
STR R1, [R0]

LDR R0, =COUNT
LDR R1, [R0]

LDR R2,=RUN
LDR R2, [R2]
AND R2, #1
CMP R2, #1

ADDEQ R1, #1


STR R1, [R0]

POP {R0, R1,R2}


MOV PC, LR


KEY_ISR:
PUSH {R5}
//clear ISR
LDR R0,=KEY_BASE
LDR R1, [R0, #0xC]
STR R1, [R0, #0xC] //clear ISR

MOV R3, R1 //save r1 in r3 (R1 gets toggled on and off)

LDR R0, =RUN
LDR R2, [R0]

EOR R1,R2,R1
STR R1, [R0] //toggles run KEY_0

LDR R0,=TIMER_BASE
CHECK_KEY_1:
LDR R2,=0b10
ANDS R2, R2, R3
BEQ CHECK_KEY_2
BNE HALVE_TIMER


CHECK_KEY_2:
LDR R2, = 0b100
ANDS R2, R2, R3
BEQ CHECK_KEY_3
BNE DOUBLE_TIMER


CHECK_KEY_3:
LDR R2, =0b1000
ANDS R2, R2, R3
BEQ EXIT_KEY_ISR
BNE SET_GO_TIMER

SET_GO_TIMER:
LDR R2,=GO_TIME
LDR R1, [R2]

EOR R1, R1, #1
STR R1, [R2]
B EXIT_KEY_ISR


HALVE_TIMER:
LDR R2,=0b1000
STR R2, [R0,#4] //stop timer
LDR R2, [R0,#0xC]
LSL R2, #16
LDR R5, [R0, #0x8]
ORR R2, R5, R2

LSR R2, #1

STRH R2, [R0, #0x8]
LSR R2, #16
STRH R2, [R0, #0xC]
B EXIT_KEY_ISR

DOUBLE_TIMER:
LDR R2,=0b1000
STR R2, [R0,#4] //stop timer
LDR R2, [R0,#0xC]
LSL R2, #16
LDR R5, [R0, #0x8]
ORR R2, R5, R2

LSL R2, #1

STRH R2, [R0, #0x8]
LSR R2, #16
STRH R2, [R0, #0xC]


EXIT_KEY_ISR:
//restart timer
LDR R2,=0b0111
STR R2, [R0,#4]
POP {R5}
MOV PC, LR

    
SEG7_CODE:  LDR    R1,=BIT_CODES  
            ADD     R1, R0         // index into the BIT_CODES "array"
            LDRB    R0, [R1]       // load the bit pattern (to be returned)
            MOV     PC, LR              

BIT_CODES:  .byte   0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110
            .byte   0b01101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111
            .skip   2      // pad with 2 bytes to maintain word alignment



SERVICE_UND:               B        SERVICE_UND         // undefined instruction vector
SERVICE_SVC:   			B        SERVICE_SVC         // software interrupt vector
SERVICE_ABT_INST:   		B        SERVICE_ABT_INST    // aborted prefetch vector
SERVICE_ABT_DATA:           B        SERVICE_ABT_DATA    // aborted data vector  

SERVICE_FIQ:              	B        SERVICE_FIQ         // FIQ interrupt vector

DIVIDE:     MOV    R2, #0
CONT:       CMP    R0, #10
            BLT    DIV_END
            SUB    R0, #10
            ADD    R2, #1
            B      CONT
DIV_END:    MOV    R1, R2     // quotient in R1 (remainder in R0)
            MOV    PC, LR







KEY_HOLD: .word 0b0000
COUNT: .word 0x0
RUN:  .word 0x0
TIME: .word 0x0
SECONDS: .word 0x0
GO_TIME: .word 0x0




				.end
