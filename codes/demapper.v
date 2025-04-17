module demapper (
    input wire [6:0] rx_flip,
    input wire [6:0] rx_rotation,
    input wire [6:0] rx_polarity,
    output reg [15:0] rx_data
);

wire muxa0,muxa1,muxa2,muxa3,muxa4,muxa5,muxb0,muxb1,muxb2,muxb3,muxb4,muxb5,mux6;
reg [12:0] mux_values;
assign {mux6,muxb5,muxa5,muxb4,muxa4,muxb3,muxa3,muxb2,muxa2,muxb1,muxa1,muxb0,muxa0}=mux_values;

reg [5:0] temp_signal;
always@(*)
    begin       
                    ///code for muxs values //////////
        case (rx_flip)
        7'h00: begin
            mux_values = 13'b0_00_00_00_00_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'hx;
            temp_signal[5:4] = 2'h0;
        end
        7'h01: begin
            mux_values = 13'b1_01_01_01_01_01_01;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h1;
        end
        7'h02: begin
            mux_values = 13'b1_01_01_01_01_01_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h1;
        end
        7'h04: begin
            mux_values = 13'b1_01_01_01_01_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h1;
        end
        7'h08: begin
            mux_values = 13'b1_01_01_01_00_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h1;
        end
        7'h10: begin
            mux_values = 13'b1_01_01_00_00_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h2;
        end
        7'h20: begin
            mux_values = 13'b1_01_00_00_00_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h2;
        end
        7'h40: begin
            mux_values = 13'b1_00_00_00_00_00_00;
            temp_signal[1:0] = 2'hx;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h2;
        end
        7'h03: begin
            mux_values = 13'b1_10_10_10_10_10_10;
            temp_signal[1:0] = 2'h0;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h2;
        end
        7'h05: begin
            mux_values = 13'b1_10_10_10_10_10_01;
            temp_signal[1:0] = 2'h1;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h2;
        end
        7'h09: begin
            mux_values = 13'b1_10_10_10_10_01_01;
            temp_signal[1:0] = 2'h2;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h2;
        end
        7'h11: begin
            mux_values = 13'b1_10_10_10_01_01_01;
            temp_signal[1:0] = 2'h3;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h2;
        end
        7'h21: begin
            mux_values = 13'b1_10_10_01_01_01_01;
            temp_signal[1:0] = 2'h0;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h3;
        end
        7'h41: begin
            mux_values = 13'b1_10_01_01_01_01_01;
            temp_signal[1:0] = 2'h1;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h3;
        end
        7'h06: begin
            mux_values = 13'b1_10_10_10_10_10_00;
            temp_signal[1:0] = 2'h2;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h3;
        end
        7'h0a: begin
            mux_values = 13'b1_10_10_10_10_01_00;
            temp_signal[1:0] = 2'h3;
            temp_signal[3:2] = 2'h0;
            temp_signal[5:4] = 2'h3;
        end
        7'h12: begin
            mux_values = 13'b1_10_10_10_01_01_00;
            temp_signal[1:0] = 2'h0;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h3;
        end
        7'h22: begin
            mux_values = 13'b1_10_10_01_01_01_00;
            temp_signal[1:0] = 2'h1;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h3;
        end
        7'h42: begin
            mux_values = 13'b1_10_01_01_01_01_00;
            temp_signal[1:0] = 2'h2;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h3;
        end
        7'h0c: begin
            mux_values = 13'b1_10_10_10_10_00_00;
            temp_signal[1:0] = 2'h3;
            temp_signal[3:2] = 2'h1;
            temp_signal[5:4] = 2'h3;
        end
        7'h14: begin
            mux_values = 13'b1_10_10_10_01_00_00;
            temp_signal[1:0] = 2'h0;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h3;
        end
        7'h24: begin
            mux_values = 13'b1_10_10_01_01_00_00;
            temp_signal[1:0] = 2'h1;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h3;
        end
        7'h44: begin
            mux_values = 13'b1_10_01_01_01_00_00;
            temp_signal[1:0] = 2'h2;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h3;
        end
        7'h18: begin
            mux_values = 13'b1_10_10_10_00_00_00;
            temp_signal[1:0] = 2'h3;
            temp_signal[3:2] = 2'h2;
            temp_signal[5:4] = 2'h3;
        end
        7'h28: begin
            mux_values = 13'b1_10_10_01_00_00_00;
            temp_signal[1:0] = 2'h0;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h3;
        end
        7'h48: begin
            mux_values = 13'b1_10_01_01_00_00_00;
            temp_signal[1:0] = 2'h1;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h3;
        end
        7'h30: begin
            mux_values = 13'b1_10_10_00_00_00_00;
            temp_signal[1:0] = 2'h2;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h3;
        end
        7'h50: begin
            mux_values = 13'b1_10_01_00_00_00_00;
            temp_signal[1:0] = 2'h3;
            temp_signal[3:2] = 2'h3;
            temp_signal[5:4] = 2'h3;
        end
    endcase
                                     /////code for RX_data///////////

    case ({muxb0,muxa0})                  ////first mux
        2'b00: begin
            rx_data[0] = rx_polarity[0];
            rx_data[1] = rx_rotation[0];
        end
        2'b01: begin
            rx_data[0] = rx_polarity[1];
            rx_data[1] = rx_rotation[1];
        end
        2'b10: begin
            rx_data[0] = rx_polarity[2];
            rx_data[1] = rx_rotation[2];
        end
        default: begin
            rx_data[0] = 1'b0;
            rx_data[1] = 1'b0;
        end
    endcase
    case ({muxb1,muxa1})                  ////second mux
        2'b00: begin
            rx_data[2] = rx_polarity[1];
            rx_data[3] = rx_rotation[1];
        end
        2'b01: begin
            rx_data[2] = rx_polarity[2];
            rx_data[3] = rx_rotation[2];
        end
        2'b10: begin
            rx_data[2] = rx_polarity[3];
            rx_data[3] = rx_rotation[3];
        end
        default: begin
            rx_data[2] = 1'b0;
            rx_data[3] = 1'b0;
        end
    endcase
    case ({muxb2,muxa2})                  ////third mux
        2'b00: begin
            rx_data[4] = rx_polarity[2];
            rx_data[5] = rx_rotation[2];
        end
        2'b01: begin
            rx_data[4] = rx_polarity[3];
            rx_data[5] = rx_rotation[3];
        end
        2'b10: begin
            rx_data[4] = rx_polarity[4];
            rx_data[5] = rx_rotation[4];
        end
        default: begin
            rx_data[4] = 1'b0;
            rx_data[5] = 1'b0;
        end
    endcase
    case ({muxb3,muxa3})                  ////fourth mux
        2'b00: begin
            rx_data[6] = rx_polarity[3];
            rx_data[7] = rx_rotation[3];
        end
        2'b01: begin
            rx_data[6] = rx_polarity[4];
            rx_data[7] = rx_rotation[4];
        end
        2'b10: begin
            rx_data[6] = rx_polarity[5];
            rx_data[7] = rx_rotation[5];
        end
        default: begin
            rx_data[6] = 1'b0;
            rx_data[7] = 1'b0;
        end
    endcase
    case ({muxb4,muxa4})                  ////fifth mux
        2'b00: begin
            rx_data[8] = rx_polarity[4];
            rx_data[9] = rx_rotation[4];
        end
        2'b01: begin
            rx_data[8] = rx_polarity[5];
            rx_data[9] = rx_rotation[5];
        end
        2'b10: begin
            rx_data[8] = rx_polarity[6];
            rx_data[9] = rx_rotation[6];
        end
        default: begin
            rx_data[8] = 1'b0;
            rx_data[9] = 1'b0;
        end
    endcase
    case ({muxb5,muxa5})                  ////sixth mux
        2'b00: begin
            rx_data[10] = rx_polarity[5];
            rx_data[11] = rx_rotation[5];
        end
        2'b01: begin
            rx_data[10] = rx_polarity[6];
            rx_data[11] = rx_rotation[6];
        end
        2'b10: begin
            rx_data[10] = temp_signal[0];
            rx_data[11] = temp_signal[1];
        end
        default: begin
            rx_data[10] = 1'b0;
            rx_data[11] = 1'b0;
        end
    endcase
    if (!mux6) begin
        rx_data[12] = rx_polarity[6];
        rx_data[13] = rx_rotation[6];
    end else begin
        rx_data[12] = temp_signal[2];
        rx_data[13] = temp_signal[3];
    end
    rx_data[14] = temp_signal[4];
    rx_data[15] = temp_signal[5];
    end
endmodule