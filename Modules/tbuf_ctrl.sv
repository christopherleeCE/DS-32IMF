//im not sure whats worse, this or a two ~150 wide lookup tables

module tbuf_ctrl(
    input logic clk,
    input logic rst,
    input logic [7:0] norm_pix_x,
    input logic [7:0] norm_pix_y,
    input logic pix_vis,
    output logic [2:0] char_pix_x,
    output logic [2:0] char_pix_y,
    output logic [9:0] tbuf_addr,
    output logic whitespace_en
);

    //TTODO EST 3, 8 AND 4, 16

    logic [4:0] sub_char_pix_x;
    logic [4:0] sub_char_pix_y;
    logic [4:0] char_x_cord;
    logic [3:0] char_y_cord;

    logic inc_en;
    assign inc_en = 
                ((norm_pix_x != 8'd0) && 
                (norm_pix_x != 8'd1) && 
                (norm_pix_x != 8'd2) && 
                (norm_pix_x != 8'd3) && 
                (norm_pix_x != 8'd9) && 
                (norm_pix_x != 8'd15) && 
                (norm_pix_x != 8'd21) && 
                (norm_pix_x != 8'd27) && 
                (norm_pix_x != 8'd33) && 
                (norm_pix_x != 8'd39) && 
                (norm_pix_x != 8'd45) && 
                (norm_pix_x != 8'd51) && 
                (norm_pix_x != 8'd57) && 
                (norm_pix_x != 8'd63) && 
                (norm_pix_x != 8'd69) && 
                (norm_pix_x != 8'd75) && 
                (norm_pix_x != 8'd81) && 
                (norm_pix_x != 8'd87) && 
                (norm_pix_x != 8'd93) && 
                (norm_pix_x != 8'd99) && 
                (norm_pix_x != 8'd105) && 
                (norm_pix_x != 8'd111) && 
                (norm_pix_x != 8'd117) && 
                (norm_pix_x != 8'd123) && 
                (norm_pix_x != 8'd129) && 
                (norm_pix_x != 8'd135) && 
                (norm_pix_x != 8'd141) && 
                (norm_pix_x != 8'd147) && 
                (norm_pix_x != 8'd153) && 
                (norm_pix_x != 8'd159) &&
                (norm_pix_y != 8'd0) &&
                (norm_pix_y != 8'd8) &&
                (norm_pix_y != 8'd16) &&
                (norm_pix_y != 8'd24) &&
                (norm_pix_y != 8'd32) &&
                (norm_pix_y != 8'd40) &&
                (norm_pix_y != 8'd48) &&
                (norm_pix_y != 8'd56) &&
                (norm_pix_y != 8'd64) &&
                (norm_pix_y != 8'd72) &&
                (norm_pix_y != 8'd80) &&
                (norm_pix_y != 8'd88) &&
                (norm_pix_y != 8'd96) &&
                (norm_pix_y != 8'd104) &&
                (norm_pix_y < 8'd112) &&
                pix_vis);
    assign whitespace_en = ~inc_en;

    counter #(
        .BW(3+2),
        .OVERFLOW_VAL(5*4) //*4 overrflow val to compensate for displayed reduced resolution in x axis
    )char_pix_x_counter(
        .inc(inc_en),
        .clk,
        .rst(norm_pix_x != '0),
        .cnt(sub_char_pix_x)

    );

    counter #(
        .BW(5),
        .OVERFLOW_VAL(26)
    )char_x_cord_counter(
        .inc((sub_char_pix_x == 5'd19) & inc_en),
        .clk,
        .rst(norm_pix_x != '0),
        .cnt(char_x_cord)

    );

    counter #(
        .BW(3+2),
        .OVERFLOW_VAL(7*4) //*4 overrflow val to compensate for displayed reduced resolution in y axis
    ) char_pix_y_counter(
        .inc((char_x_cord == 5'd25) && (sub_char_pix_x == 5'd19) && inc_en),
        .clk,
        .rst,
        .cnt(sub_char_pix_y)

    );

    counter #(
        .BW(4),
        .OVERFLOW_VAL(14)
    )char_y_cord_counter(
        .inc((sub_char_pix_y == 5'd27) &&
            (char_x_cord == 5'd25) &&
            (sub_char_pix_x == 5'd19) && inc_en),
        .clk,
        .rst,
        .cnt(char_y_cord)

    );

    assign char_pix_x = sub_char_pix_x[4:2];
    assign char_pix_y = sub_char_pix_y[4:2];
    assign tbuf_addr = 5'd26*char_y_cord + char_x_cord;

endmodule