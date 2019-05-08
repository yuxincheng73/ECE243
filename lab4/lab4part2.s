/* Program that counts consecutive 1s */

          .text                   // executable code follows
          .global _start     
		  
_start:   MOV	  R5, #0		  // intialize longest string to 0
		  MOV	  R0, #0		  // intialize current string length to 0
		  MOV     R3, #TEST_NUM   // load the data word ...


MAIN:	  CMP	  R5, R0          // check if last word has longer string
		  MOVLE	  R5, R0 		  // if last word has longer string
		  

          LDR     R1, [R3]        // into R1
		  CMP	  R1, #0          // checks if loaded data word was 0, ends program if true
		  BEQ	  END
		  MOV     R0, #0		  // reset R0 counter
		  B       ONES
		  
ONES:     CMP     R1, #0          // loop until the data contains no more 1's
		  ADDEQ	  R3, #4		  // move forward in list
          BEQ     MAIN             
          LSR     R2, R1, #1      // perform SHIFT, followed by AND
          AND     R1, R1, R2      
          ADD     R0, #1          // count the string length so far
          B       ONES   
		  
END:      B       END  
		  
TEST_NUM: .word   0x103fe00f,0x0009E3FF,0x07FFFFFF,0x03F80FFF,0x000B80FF,0x00FF5507,0x7FFFFFFF,0x00000001,0x00000000