/* Program that counts consecutive 1s */

          .text                   // executable code follows
          .global _start     
		  
_start:   MOV	  R5, #0		  // initialize longest 1s to 0
		  MOV	  R6, #0		  // initialize longest 0s 
		  MOV     R7, #0		  // initialize longest alternate
		  
		  MOV	  R8, #0		  // initialize current 1s to 0
		  MOV	  R9, #0		  // initialize current 0s 
		  MOV     R10, #0		  // initialize current alternate
		  
		  MOV     R3, #TEST_NUM   // load the data word ...


MAIN:	  CMP	  R5, R8          // check if last 1s has longer string
		  MOVLE	  R5, R8 		  // 
		  CMP	  R6, R9          // check if last 0s has longer string
		  MOVLE	  R6, R9 		  // 
		  CMP	  R7, R10         // check if last alternate has longer string
		  MOVLE	  R7, R10 		  // 
		   

          LDR     R1, [R3]        // move current word into R1
		  CMP	  R1, #0          // checks if loaded data word was 0, ends program if true
		  BEQ	  END
		  MOV     R8, #0		  // reset 1s counter
		  MOV     R9, #0 	      // reset 0s counter
		  MOV     R10,#0          // reset alternate counter
		  B       ONES
		  
ONES:     CMP     R1, #0          // loop until the data contains no more 1's
          BEQ     ZEROPREP             
          LSR     R2, R1, #1      // perform SHIFT, followed by AND
          AND     R1, R1, R2      
          ADD     R8, #1          // count the string length so far
          B       ONES  

ZEROPREP: LDR	  R1, [R3]		  // restore current word
		  MVN     R1, R1		  // invert the word
		  B		  ZEROS
		  
ZEROS:	  CMP     R1, #0          // loop until the data contains no more 1's
          BEQ     ALTERNATEPREP             
          LSR     R2, R1, #1      // perform SHIFT, followed by AND
          AND     R1, R1, R2      
          ADD     R9, #1          // count the string length so far
          B       ZEROS
		  
ALTERNATEPREP:    LDR R1, [R3]	  // restore current word
				  MOV R11, #XOR_CHECK
				  LDR R11, [R11]
				  CMP R1, R11 	  // check MSB of word
				  MOV R11, #XOR_CONSTANT_MSB_ONE     // if MSB is equal to 1 (no z flag)
				  MOVEQ R11, #XOR_CONSTANT_MSB_ONE  // if MSB is 1 but (with z flag) 
				  MOVLT R11, #XOR_CONSTANT_MSB_ZERO // if MSB is equal to 0
 
				  LDR R11, [R11] 
				  EOR R1, R11
				  
ALTERNATE:		  CMP     R1, #0          // loop until the data contains no more 1's
				  ADDEQ	  R3, #4		  // move forward in list
				  BEQ     MAIN             
				  LSR     R2, R1, #1      // perform SHIFT, followed by AND
				  AND     R1, R1, R2      
				  ADD     R10, #1          // count the string length so far
				  B       ALTERNATE


		  
END:      B       END  

TEST_NUM: .word   0x103fe00f,0x0009E3FF,0x07FFFFFF
		  .word   0x03F80FFF,0x000B80FF,0x00FF5507
		  .word   0x7FFFFFFF,0x00000001,0xAAAAAAA0
		  .word   0x00000000
		  

XOR_CHECK: .word 0x80000000		  
		  
XOR_CONSTANT_MSB_ZERO: .word 0xAAAAAAAA
XOR_CONSTANT_MSB_ONE: .word 0x55555555

