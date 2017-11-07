/*
---------------------
BEHAVIORAL MODELLING
---------------------

-----------------------------------------------
FIRST RESPONSE DETECTOR
-----------------------------------------------
Mini-Project: CO202 - Design Of Digital Systems
-----------------------------------------------
Reg.No.
Palak Singhal 	16CO129
Sharanya Kamath 16CO140
-----------------------------------------------

---------
Abstract: 
---------
The idea of this mini project is to create a circuit which determines which participant has reponded the earliest.
These type of circuits are useful in the buzzer rounds of quiz shows.

In first response rounds of quiz contests, the question is thrown open to all the teams.
The person who knows the answer hits his switch first and then answers the question. 
Sometimes two or more players hit the switch almost simultaneously and it is very difficult to detect which of
them has pressed the switch first.
-------------------------------------------------------------------------------------------------------------------

----------------
Functionalities
----------------

-------------------------------------------------------------------------------------------------------------------
------------------------------
Brief Description of the Code
------------------------------

--------------------------------------------------------------------------------------------------------------------

*/
module main(   
		output flag,          //flag-turns 0 as soon as another player presses the switch                      
		input [3:0]player,    // vector of 4 players 
		output [6:0]display,  // vector of output in seven segment display
		output [3:0]decimal   // output in decimal number corresponding to the winner
		);
	
	wire [3:0]player;
	reg [6:0]display;
	reg [3:0]decimal;
	reg flag;

	always @*					//Execute this case block whenever there is a change in the input
		begin
			case (player)                        
				4'b0000: flag=1'b1;	// flag bit is kept at 1 as long as only 1 or 0 player presses the switch

				4'b0011: flag=1'b0;	// flag is turned to 0 for any further cases i.e cases when more than 1 player
			                           	//presses the switch and it remains at 0 for all those cases and resets to 
				4'b0101: flag=1'b0;	//1 again when all players turn the switch off  
		
				4'b1001: flag=1'b0; 
	
				4'b0110: flag=1'b0;

				4'b1010: flag=1'b0;

				4'b1100: flag=1'b0; 
		        endcase
		end


	always @*					//Execute this case block whenever there is a change in the input
		if(flag)				//Execute following statements only if flag bit is 1                         
     			begin                           
				case (player)		// according to the number of player the corresponding case is chosen
	
					4'b0000: begin display=7'b1111110; decimal=4'b0000; end	// when no player presses display 0
	
					4'b0001: begin display=7'b0110000; decimal=4'b0001; end	// display 1 when player 1 presses first 
		
					4'b0010: begin display=7'b1101101; decimal=4'b0010; end	// display 1 when player 2 presses first
	
					4'b0100: begin display=7'b1111001; decimal=4'b0011; end	// display 1 when player 3 presses first  
	
					4'b1000: begin display=7'b0110011; decimal=4'b0100; end	// display 1 when player 4 presses first
			        endcase
    			end
	endmodule
