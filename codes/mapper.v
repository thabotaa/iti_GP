module mapper (
    input wire [15:0] tx_data,
    output reg [6:0] tx_rotation,
    output reg [6:0] tx_polarity,
    output reg [6:0] tx_flip
);

wire mux0,muxa1,muxa2,muxa3,muxa4,muxa5,muxa6,muxb1,muxb2,muxb3,muxb4,muxb5,muxb6;
reg [12:0] mux_values;
assign {muxb6,muxa6,muxb5,muxa5,muxb4,muxa4,muxb3,muxa3,muxb2,muxa2,muxb1,muxa1,mux0}=mux_values;

always@(*)
    begin
                    ////code for muxs values and flip signals//////////
        if(tx_data[15:10]>=6'h00 &&tx_data[15:10] <=6'h0f) begin
        
            mux_values = 13'b10_10_10_10_10_01_0;
            tx_flip = 7'h00;
        end
        else if (tx_data[15:10]>=6'h10 &&tx_data[15:10] <=6'h13) begin
                 mux_values=13'b 01_01_01_01_01_00_1;
                 tx_flip=7'h01;
        end
        else if (tx_data[15:10]>=6'h14 &&tx_data[15:10] <=6'h17) begin
                 mux_values=13'b 01_01_01_01_01_10_0;
                 tx_flip=7'h02;
        end
        else if (tx_data[15:10]>=6'h18 &&tx_data[15:10] <=6'h1b) begin
                 mux_values=13'b 01_01_01_01_11_01_0;
                 tx_flip=7'h04;
        end
         else if (tx_data[15:10]>=6'h1c &&tx_data[15:10] <=6'h1f) begin
                 mux_values=13'b 01_01_01_11_10_01_0;
                 tx_flip=7'h08;
        end
         else if (tx_data[15:10]>=6'h20 &&tx_data[15:10] <=6'h23) begin
                 mux_values=13'b 01_01_11_10_10_01_0;
                 tx_flip=7'h10;
        end
         else if (tx_data[15:10]>=6'h24 &&tx_data[15:10] <=6'h27) begin
                 mux_values=13'b 01_11_10_10_10_01_0; 
                 tx_flip=7'h20;
        end
        else if (tx_data[15:10]>=6'h28 &&tx_data[15:10] <=6'h2B) begin
                 mux_values=13'b 11_10_10_10_10_01_0; 
                 tx_flip=7'h40;
        end
        else 
        case(tx_data[15:10])
            6'h2c: begin
                mux_values=13'b 00_00_00_00_00_10_1;
                tx_flip=7'h03;
            end
            6'h2d: begin
                mux_values=13'b 00_00_00_00_11_00_1;
                tx_flip=7'h05;
            end
            6'h2e: begin
                mux_values=13'b 00_00_00_11_01_00_1;
                tx_flip=7'h09;
            end
            6'h2f: begin
                mux_values=13'b 00_00_11_01_01_00_1;
                tx_flip=7'h11;
            end
            6'h30: begin
                mux_values=13'b 00_11_01_01_01_00_1;
                                 
                tx_flip=7'h21;
            end
            6'h31: begin
                mux_values=13'b 11_01_01_01_01_00_1;
                tx_flip=7'h41;
            end
            6'h32: begin
                mux_values=13'b 00_00_00_00_11_10_0;
                tx_flip=7'h06;
            end
            6'h33: begin
                mux_values=13'b 00_00_00_11_01_10_1;
                tx_flip=7'h0a;
            end
            6'h34: begin
                mux_values=13'b 00_00_11_01_01_10_0;
                tx_flip=7'h12;
            end
            6'h35: begin
                mux_values=13'b 00_11_01_01_01_10_0;
                tx_flip=7'h22;
            end
            6'h36: begin
                mux_values=13'b 11_01_01_01_01_10_0;
                tx_flip=7'h42;
            end
            6'h37: begin
                mux_values=13'b 00_00_00_11_11_01_0;
                tx_flip=7'h0c;
            end
            6'h38: begin
                mux_values=13'b 00_00_11_01_11_01_0;
                tx_flip=7'h14;
            end
            6'h39: begin
                mux_values=13'b 00_11_01_01_11_01_0;
                tx_flip=7'h24;
            end
            6'h3a: begin
                mux_values=13'b 11_01_01_01_11_01_0;
                tx_flip=7'h44;
            end
            6'h3b: begin
                mux_values=13'b 00_00_11_11_10_01_0;
                tx_flip=7'h18;
            end
            6'h3c: begin
                mux_values=13'b 00_11_01_11_10_01_0;
                tx_flip=7'h28;
            end
            6'h3d: begin
                mux_values=13'b 11_01_01_11_10_01_0;
                tx_flip=7'h48;
            end
            6'h3e: begin
                mux_values=13'b 00_11_11_10_10_01_0;
                tx_flip=7'h30;
            end
            6'h3f: begin
                mux_values=13'b 11_01_11_10_10_01_0;
                tx_flip=7'h50;
            end
            default: begin
                mux_values=13'b 00_00_00_00_00_00_0;
                tx_flip=7'h00;
            end
    endcase

    ////code for tx_polarity and tx_rotation signals/////////
    if (!mux0) begin
        tx_polarity[0] = tx_data[0];
        tx_rotation[0] = tx_data[1];
    end else begin
        tx_polarity[0] = 1'b0;
        tx_rotation[0] = 1'b0;
    end
    case({muxb1,muxa1})
        2'b00: begin
            tx_polarity[1] = tx_data[0];
            tx_rotation[1] = tx_data[1];
        end
        2'b01: begin
            tx_polarity[1] = tx_data[2];
            tx_rotation[1] = tx_data[3];
        end
        2'b10: begin
            tx_polarity[1] = 1'b0;
            tx_rotation[1] = 1'b0;
        end
        default: begin
            tx_polarity[1] = 1'b0;
            tx_rotation[1] = 1'b0;
        end
    endcase
    case({muxb2,muxa2})
        2'b00: begin
            tx_polarity[2] = tx_data[0];
            tx_rotation[2] = tx_data[1];
        end
        2'b01: begin
            tx_polarity[2] = tx_data[2];
            tx_rotation[2] = tx_data[3];
        end
        2'b10: begin
            tx_polarity[2] = tx_data[4];
            tx_rotation[2] = tx_data[5];
            end
        2'b11: begin
            tx_polarity[2] = 1'b0;
            tx_rotation[2] = 1'b0;
        end
        default: begin
            tx_polarity[2] = 1'b0;
            tx_rotation[2] = 1'b0;
        end
    endcase
    case({muxb3,muxa3})
        2'b00: begin
            tx_polarity[3] = tx_data[2];
            tx_rotation[3] = tx_data[3];
        end
        2'b01: begin
            tx_polarity[3] = tx_data[4];
            tx_rotation[3] = tx_data[5];
        end
        2'b10: begin
            tx_polarity[3] = tx_data[6];
            tx_rotation[3] = tx_data[7];
        end
        2'b11: begin
            tx_polarity[3] = 1'b0;
            tx_rotation[3] = 1'b0;
        end
        default: begin
            tx_polarity[3] = 1'b0;
            tx_rotation[3] = 1'b0;
        end
        endcase
    case({muxb4,muxa4})
        2'b00: begin
            tx_polarity[4] = tx_data[4];
            tx_rotation[4] = tx_data[5];
        end
        2'b01: begin
            tx_polarity[4] = tx_data[6];
            tx_rotation[4] = tx_data[7];
        end
        2'b10: begin
            tx_polarity[4] = tx_data[8];
            tx_rotation[4] = tx_data[9];
        end
        2'b11: begin
            tx_polarity[4] = 1'b0;
            tx_rotation[4] = 1'b0;
        end
        default: begin
            tx_polarity[4] = 1'b0;
            tx_rotation[4] = 1'b0;
        end
    endcase
    case({muxb5,muxa5})
        2'b00: begin
            tx_polarity[5] = tx_data[6];
            tx_rotation[5] = tx_data[7];
        end
        2'b01: begin
            tx_polarity[5] = tx_data[8];
            tx_rotation[5] = tx_data[9];
        end
        2'b10: begin
            tx_polarity[5] = tx_data[10];
            tx_rotation[5] = tx_data[11];
        end
        2'b11: begin
            tx_polarity[5] = 1'b0;
            tx_rotation[5] = 1'b0;
        end
        default: begin
            tx_polarity[5] = 1'b0;
            tx_rotation[5] = 1'b0;
        end
    endcase
    case({muxb6,muxa6})
        2'b00: begin
            tx_polarity[6] = tx_data[8];
            tx_rotation[6] = tx_data[9];
        end
        2'b01: begin
            tx_polarity[6] = tx_data[10];
            tx_rotation[6] = tx_data[11];
        end
        2'b10: begin
            tx_polarity[6] = tx_data[12];
            tx_rotation[6] = tx_data[13];
        end
        2'b11: begin
            tx_polarity[6] = 1'b0;
            tx_rotation[6] = 1'b0;
        end
        default: begin
            tx_polarity[6] = 1'b0;
            tx_rotation[6] = 1'b0;
        end
    endcase
    end

endmodule