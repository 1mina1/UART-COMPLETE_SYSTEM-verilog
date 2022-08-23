# UART-COMPLETE_SYSTEM-verilog
this is the complete multi clock domain uart system done using low power techniques such as latch based glock gating and based on the following diagram<br />
![Untitled Diagram drawio](https://user-images.githubusercontent.com/81904314/184952971-3abded0b-24ca-4764-82d1-e71a4f224892.png)
-we can see that there 10 main blocks(the same colour ones are in the same clock domain) :<br />
1-System control<br />
2-Uart receiver<br />
3-Uart transmitter<br />
4-clock gating<br />
5-clock dividor<br />
6-ALU<br />
7-register file<br />
8-2x reset synchronizer<br />
9-2x Data synchronizer<br />
10-Bit synchronizer<br />
# System control
-this block consists of two main controller one for the receiver and one for the transmitter as the uart is full duplex which means can transmit and send at the same time<br />
# Uart Receiver
-this block is used for receiving data more details here :https://github.com/1mina1/Uart-Receiver-verilog<br />
# Uart Transmitter
-this block is used for transmitting the data coming from the system controller more details here :https://github.com/1mina1/Uart-transmitter-verilog<br />
# clock gating 
-this block is used to save power when alu is not used, its latch based clock gating<br />
# clock dividor
-this block used to divide the clock as the tx is slower than the rx<br />
# ALU
-an arithmetic logic unit used for mathematical computitions, it might have the biggest area in the whole system as their is multiplication and division support in it <br />
# register file
-the register file used to store values and it has 4 reserved spots <br />
-0x0(used for OperA input for ALU)<br />
-0x1(used for OperB input for ALU)<br />
-0x2(used for uart config REG2[0] used for parity enable ,REG2[1] used for parity type ,REG[2:7] for prescelar )<br />
-0x3(used for clock dividing ratio, only the first 4 bits are used) <br />
# reset synchronizer
-used for asynchronous reset assertion and synchronous reset deassertion, there are 2 of them because there are 2 clock domains<br />
# Data synchronizer
-used to pass the data from clock domain to another<br />
# Bit synchronizer
-used to pass the data from clock domain to another<br />
# Notes
-the uart system have the following commands :<br />
1-0xAA for register writing and here the receiver waits for another 2 frames to get the address and the data<br />
2-0xBB for register Reading and here the receiver waits for another frame to get the address and wil send the data after processing<br />
3-0xCC for writing OperA and OperB and do an ALU operation then send the data<br />
4-0xDD for preforming ALU operation on previous operands of ALU<br />
# Synthesis
-the next step after making the code is to synthesis it using synopsys Design compiler and making sure that there is no timing violation wether it is setup or hold<br />
-so we are going to make constraints on the ref clock to be 50 Mhz and rx clock to be 115.2Khz *8 where 115.2khz is the supposed clock of the TX then we are going to 
generate the TX clock form the Rx and divide by 8, the same thing for Alu clock it is a generated clock but with divide by 1 and we are going to add input and output 
delay of 20% of the clock which is Uart clock as all inputs and outputs are interfacing with uart clock and we are going to add driving cells to simulate reeal pads 
input transitions and add constraint of load to be 0.5 pf.<br />
# formality post synthesis
-we are going to make formality to check functunality of the synthesiable circuit made to make sure that it was synthesised correctlly so the netlist and the rtl code <br />
should match
# Dft
-next we are going to insert dft scan chains with 3 scan chains and we are going to mux every reset input with scan_rst and every clock input with scan_clock <br /> 
as for the clock dividor we are going to mux its output and for the alu clock we are going to make a passing point in the clock gating,timing should be met 
without any violations
# formality post dft
-the same steps as the formality post syn, this step is needed to verify functunality post dft, the netlist and rtl should match but we should not verify the scan chain <br />
# pnr
-this is the step needed to add the floorplanning, input and output ports definitions, placement ,add tie low and tie high cells ,Clock tree synthesis, routing and 
and signing off the chip, timing should be also met without any violations, then GDS file is extracted.<br />
![image](https://user-images.githubusercontent.com/81904314/186119409-02c07b76-e5fd-4532-90cc-59849bf69807.png)
# formality post pnr
-the same steps as the formality post syn and dft, this step is needed to verify functunality post pnr, the netlist and rtl should match but we should not 
verify the scan chain <br />
