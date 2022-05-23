`default_nettype none

module top(
	   input wire clk,
	   input wire btn,
	   output wire q
	   );

    wire clk100mhz, clk200mhz;

    clk_wiz_0 clk_wiz_0_i (
                           // Clock out ports
                           .clk_out1(clk100mhz), // output clk_out1
                           .clk_out2(clk200mhz), // output clk_out1
			   // Status and control signals
			   .reset(0),
			   .locked(),
                           // Clock in ports
                           .clk_in1(clk)   // input clk_in1_n 
			   );

    // 200MHz
    (* mark_debug *) reg [31:0] counter_200mhz = 32'h0;
    always @(posedge clk200mhz) begin
	counter_200mhz <= counter_200mhz + 1;
    end

    (* mark_debug *) wire synch_clock_rcv;
    reg btn_d0 = 0;
    reg btn_d1 = 0;
    (* mark_debug *) reg kick = 0;
    always @(posedge clk200mhz) begin
	btn_d0 <= btn;
	btn_d1 <= btn_d0;
	if(btn_d0 == 1 && btn_d1 == 0) begin
	    kick <= 1;
	end else if(synch_clock_rcv == 1) begin
	    kick <= 0;
	end
    end

    // XPM(200MHz -> 100MHz)
    (* mark_debug *) wire [31:0] synch_clock_dout;
    (* mark_debug *) wire synch_clock_dout_valid;

    xpm_cdc_handshake #(.DEST_EXT_HSK(0),   // DECIMAL; 0=internal handshake, 1=external handshake
			.DEST_SYNC_FF(2),   // DECIMAL; range: 2-10
                        .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
                        .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
                        .SRC_SYNC_FF(2),    // DECIMAL; range: 2-10
                        .WIDTH(64)           // DECIMAL; range: 1-1024
                        )
    xpm_cdc_handshake_inst (
                            .dest_out(synch_clock_dout),
                            .dest_req(synch_clock_dout_valid), // 1-bit output: Assertion of this signal indicates that new dest_out data has been
                            // received and is ready to be used or captured by the destination logic. When
                            // DEST_EXT_HSK = 1, this signal will deassert once the source handshake
                            // acknowledges that the destination clock domain has received the transferred data.
                            // When DEST_EXT_HSK = 0, this signal asserts for one clock period when dest_out bus
                            // is valid. This output is registered.
                            .src_rcv(synch_clock_rcv),   // 1-bit output: Acknowledgement from destination logic that src_in has been
                            // received. This signal will be deasserted once destination handshake has fully
                            // completed, thus completing a full data transfer. This output is registered.
                            .dest_ack(1'b0), // 1-bit input: optional; required when DEST_EXT_HSK = 1
                            .dest_clk(clk100mhz), // 1-bit input: Destination clock.
                            .src_clk(clk200mhz),   // 1-bit input: Source clock.
                            .src_in(counter_200mhz),     // WIDTH-bit input: Input bus that will be synchronized to the destination clock domain.
                            .src_send(kick)  // 1-bit input: Assertion of this signal allows the src_in bus to be synchronized to
                            // the destination clock domain. This signal should only be asserted when src_rcv is
                            // deasserted, indicating that the previous data transfer is complete. This signal
                            // should only be deasserted once src_rcv is asserted, acknowledging that the src_in
                            // has been received by the destination logic.
                            );

    // 100MHz
    (* mark_debug *) reg [31:0] counter_100mhz = 32'h0;
    always @(posedge clk100mhz) begin
	if(synch_clock_dout_valid == 1) begin
	    counter_100mhz <= synch_clock_dout;
	end else begin
	    counter_100mhz <= counter_100mhz + 1;
	end
    end

    assign q = counter_100mhz[23];


endmodule // top

`default_nettype wire
