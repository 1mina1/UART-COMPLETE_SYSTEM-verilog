// FILE NAME: DATA_SYNC.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 19/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: Synchronized MUX-Select Synchronization Scheme, multi clock system, clock domain crossing,crc
//------------------------------------------------
// PURPOSE:\this is a Parameterized Synchronized MUX-Select 
// ynchronization Scheme used with pulse generator to make 
// output enable signal high for only one clk cycle\
module DATA_SYNC #(parameter STAGES =2, parameter WIDTH=8) (
  input    wire    [WIDTH-1:0]    DataSync_unsync_bus,
  input    wire                   DataSync_bus_enable,
  input    wire                   DataSync_CLK,
  input    wire                   DataSync_RST,
  output   reg     [WIDTH-1:0]    DataSync_sync_bus,
  output   reg                    DataSync_enable_pulse);
  
  reg    [STAGES-1:0]    FFSTAGES;
  reg                    PulseGenFF;
  wire                   Enable;
  reg    [WIDTH-1:0]     SyncBusFF_IN;
  ////////////////MULTI STAGE sequentional logic///////////
  always@(posedge DataSync_CLK or negedge DataSync_RST)
  begin
    if(!DataSync_RST)
      begin
        FFSTAGES <= 'b0;
      end
    else
      begin
        FFSTAGES <= {FFSTAGES[STAGES-2:0],DataSync_bus_enable};
      end
  end
  ////////////////Pulse Generator/////////////////////////
  always@(posedge DataSync_CLK or negedge DataSync_RST)
  begin
    if(!DataSync_RST)
      begin
        PulseGenFF <= 1'b0;
      end
    else
      PulseGenFF <= FFSTAGES[STAGES-1];
  end
  
  assign Enable = (~PulseGenFF)&(FFSTAGES[STAGES-1]);
  
  ////////////////////////MUX//////////////////////////
  always@(*)
  begin
    case(Enable)
      1'b0       : begin
                    SyncBusFF_IN = DataSync_sync_bus;
                   end
      1'b1       : begin
                    SyncBusFF_IN = DataSync_unsync_bus;
                   end
      default    : begin
                    SyncBusFF_IN = DataSync_sync_bus;
                   end
    endcase
  end
  ////////////////////output Sequentional Logic////////
  always@(posedge DataSync_CLK or negedge DataSync_RST)
  begin
    if(!DataSync_RST)
      begin
       DataSync_enable_pulse <= 1'b0;
       DataSync_sync_bus <= 'b0;
      end
    else
      begin
        DataSync_enable_pulse <= Enable;
        DataSync_sync_bus <= SyncBusFF_IN;
      end
  end
endmodule