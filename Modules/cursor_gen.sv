
module cursor_gen(
    input logic [9:0] pix_x,
    input logic [9:0] pix_y,
    input clk,
    output logic [2:0] cursor_pix_row
);
    logic [7:0] norm_pix_x;
    logic [7:0] norm_pix_y;
    logic [4:0] cursor_y_cord;

    assign norm_pix_x = pix_x[9:2];
    assign norm_pix_y = pix_y[9:2];

    counter #(
        .BW(3+2),
        .OVERFLOW_VAL(8*4)
    )cursor_y_cord_counter(
        .inc((pix_x == 10'h3FF) && (norm_pix_y < 8'd112)), // or norm_pix_x == 159
        .clk,
        .rst((pix_x != 10'h3FF) || (pix_y != 10'h8)),
        .cnt(cursor_y_cord)
    );

    always_comb begin
        unique case(cursor_y_cord[4:2])

            3'd0    : cursor_pix_row = 3'b100;
            3'd1    : cursor_pix_row = 3'b010;
            3'd2    : cursor_pix_row = 3'b001;
            3'd3    : cursor_pix_row = 3'b010;
            3'd4    : cursor_pix_row = 3'b100;
            3'd5    : cursor_pix_row = 3'b000;
            3'd6    : cursor_pix_row = 3'b000;
            3'd7    : cursor_pix_row = 3'b000;
            default : cursor_pix_row = 3'b000;

        endcase
    end


endmodule