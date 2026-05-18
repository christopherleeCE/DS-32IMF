
module font_lut(
    input logic [7:0] ascii_val,
    output logic [7:0] sprite_start_ptr
);

    localparam logic [7:0] CTRL_CHAR  = 8'd0;
    localparam logic [7:0] UNIMP_CHAR = 8'd1;

    always_comb begin
        unique case(ascii_val)

            8'd0    : sprite_start_ptr = CTRL_CHAR;
            8'd1    : sprite_start_ptr = CTRL_CHAR;
            8'd2    : sprite_start_ptr = CTRL_CHAR;
            8'd3    : sprite_start_ptr = CTRL_CHAR;
            8'd4    : sprite_start_ptr = CTRL_CHAR;
            8'd5    : sprite_start_ptr = CTRL_CHAR;
            8'd6    : sprite_start_ptr = CTRL_CHAR;
            8'd7    : sprite_start_ptr = CTRL_CHAR;
            8'd8    : sprite_start_ptr = CTRL_CHAR;
            8'd9    : sprite_start_ptr = CTRL_CHAR;
            8'd10   : sprite_start_ptr = CTRL_CHAR;
            8'd11   : sprite_start_ptr = CTRL_CHAR;
            8'd12   : sprite_start_ptr = CTRL_CHAR;
            8'd13   : sprite_start_ptr = CTRL_CHAR;
            8'd14   : sprite_start_ptr = CTRL_CHAR;
            8'd15   : sprite_start_ptr = CTRL_CHAR;
            8'd16   : sprite_start_ptr = CTRL_CHAR;
            8'd17   : sprite_start_ptr = CTRL_CHAR;
            8'd18   : sprite_start_ptr = CTRL_CHAR;
            8'd19   : sprite_start_ptr = CTRL_CHAR;
            8'd20   : sprite_start_ptr = CTRL_CHAR;
            8'd21   : sprite_start_ptr = CTRL_CHAR;
            8'd22   : sprite_start_ptr = CTRL_CHAR;
            8'd23   : sprite_start_ptr = CTRL_CHAR;
            8'd24   : sprite_start_ptr = CTRL_CHAR;
            8'd25   : sprite_start_ptr = CTRL_CHAR;
            8'd26   : sprite_start_ptr = CTRL_CHAR;
            8'd27   : sprite_start_ptr = CTRL_CHAR;
            8'd28   : sprite_start_ptr = CTRL_CHAR;
            8'd29   : sprite_start_ptr = CTRL_CHAR;
            8'd30   : sprite_start_ptr = CTRL_CHAR;
            8'd31   : sprite_start_ptr = CTRL_CHAR;
            8'd32   : sprite_start_ptr = 8'd2;
            8'd33   : sprite_start_ptr = 8'd3;
            8'd34   : sprite_start_ptr = 8'd4;
            8'd35   : sprite_start_ptr = 8'd5;
            8'd36   : sprite_start_ptr = 8'd6;
            8'd37   : sprite_start_ptr = 8'd7;
            8'd38   : sprite_start_ptr = 8'd8;
            8'd39   : sprite_start_ptr = 8'd9;
            8'd40   : sprite_start_ptr = 8'd10;
            8'd41   : sprite_start_ptr = 8'd11;
            8'd42   : sprite_start_ptr = 8'd12;
            8'd43   : sprite_start_ptr = 8'd13;
            8'd44   : sprite_start_ptr = 8'd14;
            8'd45   : sprite_start_ptr = 8'd15;
            8'd46   : sprite_start_ptr = 8'd16;
            8'd47   : sprite_start_ptr = 8'd17;
            8'd48   : sprite_start_ptr = 8'd18;
            8'd49   : sprite_start_ptr = 8'd19;
            8'd50   : sprite_start_ptr = 8'd20;
            8'd51   : sprite_start_ptr = 8'd21;
            8'd52   : sprite_start_ptr = 8'd22;
            8'd53   : sprite_start_ptr = 8'd23;
            8'd54   : sprite_start_ptr = 8'd24;
            8'd55   : sprite_start_ptr = 8'd25;
            8'd56   : sprite_start_ptr = 8'd26;
            8'd57   : sprite_start_ptr = 8'd27;
            8'd58   : sprite_start_ptr = 8'd28;
            8'd59   : sprite_start_ptr = 8'd29;
            8'd60   : sprite_start_ptr = 8'd30;
            8'd61   : sprite_start_ptr = 8'd31;
            8'd62   : sprite_start_ptr = 8'd32;
            8'd63   : sprite_start_ptr = 8'd33;
            8'd64   : sprite_start_ptr = 8'd34;
            8'd65   : sprite_start_ptr = 8'd35;
            8'd66   : sprite_start_ptr = 8'd36;
            8'd67   : sprite_start_ptr = 8'd37;
            8'd68   : sprite_start_ptr = 8'd38;
            8'd69   : sprite_start_ptr = 8'd39;
            8'd70   : sprite_start_ptr = 8'd40;
            8'd71   : sprite_start_ptr = 8'd41;
            8'd72   : sprite_start_ptr = 8'd42;
            8'd73   : sprite_start_ptr = 8'd43;
            8'd74   : sprite_start_ptr = 8'd44;
            8'd75   : sprite_start_ptr = 8'd45;
            8'd76   : sprite_start_ptr = 8'd46;
            8'd77   : sprite_start_ptr = 8'd47;
            8'd78   : sprite_start_ptr = 8'd48;
            8'd79   : sprite_start_ptr = 8'd49;
            8'd80   : sprite_start_ptr = 8'd50;
            8'd81   : sprite_start_ptr = 8'd51;
            8'd82   : sprite_start_ptr = 8'd52;
            8'd83   : sprite_start_ptr = 8'd53;
            8'd84   : sprite_start_ptr = 8'd54;
            8'd85   : sprite_start_ptr = 8'd55;
            8'd86   : sprite_start_ptr = 8'd56;
            8'd87   : sprite_start_ptr = 8'd57;
            8'd88   : sprite_start_ptr = 8'd58;
            8'd89   : sprite_start_ptr = 8'd59;
            8'd90   : sprite_start_ptr = 8'd60;
            8'd91   : sprite_start_ptr = 8'd61;
            8'd92   : sprite_start_ptr = 8'd62;
            8'd93   : sprite_start_ptr = 8'd63;
            8'd94   : sprite_start_ptr = 8'd64;
            8'd95   : sprite_start_ptr = 8'd65;
            8'd96   : sprite_start_ptr = 8'd66;
            8'd97   : sprite_start_ptr = 8'd67;
            8'd98   : sprite_start_ptr = 8'd68;
            8'd99   : sprite_start_ptr = 8'd69;
            8'd100  : sprite_start_ptr = 8'd70;
            8'd101  : sprite_start_ptr = 8'd71;
            8'd102  : sprite_start_ptr = 8'd72;
            8'd103  : sprite_start_ptr = 8'd73;
            8'd104  : sprite_start_ptr = 8'd74;
            8'd105  : sprite_start_ptr = 8'd75;
            8'd106  : sprite_start_ptr = 8'd76;
            8'd107  : sprite_start_ptr = 8'd77;
            8'd108  : sprite_start_ptr = 8'd78;
            8'd109  : sprite_start_ptr = 8'd79;
            8'd110  : sprite_start_ptr = 8'd80;
            8'd111  : sprite_start_ptr = 8'd81;
            8'd112  : sprite_start_ptr = 8'd82;
            8'd113  : sprite_start_ptr = 8'd83;
            8'd114  : sprite_start_ptr = 8'd84;
            8'd115  : sprite_start_ptr = 8'd85;
            8'd116  : sprite_start_ptr = 8'd86;
            8'd117  : sprite_start_ptr = 8'd87;
            8'd118  : sprite_start_ptr = 8'd88;
            8'd119  : sprite_start_ptr = 8'd89;
            8'd120  : sprite_start_ptr = 8'd90;
            8'd121  : sprite_start_ptr = 8'd91;
            8'd122  : sprite_start_ptr = 8'd92;
            8'd123  : sprite_start_ptr = 8'd93;
            8'd124  : sprite_start_ptr = 8'd94;
            8'd125  : sprite_start_ptr = 8'd95;
            8'd126  : sprite_start_ptr = 8'd96;
            8'd127  : sprite_start_ptr = CTRL_CHAR;
            8'd128  : sprite_start_ptr = UNIMP_CHAR;
            8'd129  : sprite_start_ptr = UNIMP_CHAR;
            8'd130  : sprite_start_ptr = UNIMP_CHAR;
            8'd131  : sprite_start_ptr = UNIMP_CHAR;
            8'd132  : sprite_start_ptr = UNIMP_CHAR;
            8'd133  : sprite_start_ptr = UNIMP_CHAR;
            8'd134  : sprite_start_ptr = UNIMP_CHAR;
            8'd135  : sprite_start_ptr = UNIMP_CHAR;
            8'd136  : sprite_start_ptr = UNIMP_CHAR;
            8'd137  : sprite_start_ptr = UNIMP_CHAR;
            8'd138  : sprite_start_ptr = UNIMP_CHAR;
            8'd139  : sprite_start_ptr = UNIMP_CHAR;
            8'd140  : sprite_start_ptr = UNIMP_CHAR;
            8'd141  : sprite_start_ptr = UNIMP_CHAR;
            8'd142  : sprite_start_ptr = UNIMP_CHAR;
            8'd143  : sprite_start_ptr = UNIMP_CHAR;
            8'd144  : sprite_start_ptr = UNIMP_CHAR;
            8'd145  : sprite_start_ptr = UNIMP_CHAR;
            8'd146  : sprite_start_ptr = UNIMP_CHAR;
            8'd147  : sprite_start_ptr = UNIMP_CHAR;
            8'd148  : sprite_start_ptr = UNIMP_CHAR;
            8'd149  : sprite_start_ptr = UNIMP_CHAR;
            8'd150  : sprite_start_ptr = UNIMP_CHAR;
            8'd151  : sprite_start_ptr = UNIMP_CHAR;
            8'd152  : sprite_start_ptr = UNIMP_CHAR;
            8'd153  : sprite_start_ptr = UNIMP_CHAR;
            8'd154  : sprite_start_ptr = UNIMP_CHAR;
            8'd155  : sprite_start_ptr = UNIMP_CHAR;
            8'd156  : sprite_start_ptr = UNIMP_CHAR;
            8'd157  : sprite_start_ptr = 8'd97;
            8'd158  : sprite_start_ptr = UNIMP_CHAR;
            8'd159  : sprite_start_ptr = UNIMP_CHAR;
            8'd160  : sprite_start_ptr = UNIMP_CHAR;
            8'd161  : sprite_start_ptr = UNIMP_CHAR;
            8'd162  : sprite_start_ptr = UNIMP_CHAR;
            8'd163  : sprite_start_ptr = UNIMP_CHAR;
            8'd164  : sprite_start_ptr = UNIMP_CHAR;
            8'd165  : sprite_start_ptr = UNIMP_CHAR;
            8'd166  : sprite_start_ptr = UNIMP_CHAR;
            8'd167  : sprite_start_ptr = UNIMP_CHAR;
            8'd168  : sprite_start_ptr = UNIMP_CHAR;
            8'd169  : sprite_start_ptr = UNIMP_CHAR;
            8'd170  : sprite_start_ptr = UNIMP_CHAR;
            8'd171  : sprite_start_ptr = UNIMP_CHAR;
            8'd172  : sprite_start_ptr = UNIMP_CHAR;
            8'd173  : sprite_start_ptr = UNIMP_CHAR;
            8'd174  : sprite_start_ptr = 8'd98;
            8'd175  : sprite_start_ptr = 8'd99;
            8'd176  : sprite_start_ptr = 8'd100;
            8'd177  : sprite_start_ptr = 8'd101;
            8'd178  : sprite_start_ptr = 8'd102;
            8'd179  : sprite_start_ptr = 8'd103;
            8'd180  : sprite_start_ptr = 8'd104;
            8'd181  : sprite_start_ptr = 8'd105;
            8'd182  : sprite_start_ptr = 8'd106;
            8'd183  : sprite_start_ptr = 8'd107;
            8'd184  : sprite_start_ptr = 8'd108;
            8'd185  : sprite_start_ptr = 8'd109;
            8'd186  : sprite_start_ptr = 8'd110;
            8'd187  : sprite_start_ptr = 8'd111;
            8'd188  : sprite_start_ptr = 8'd112;
            8'd189  : sprite_start_ptr = 8'd113;
            8'd190  : sprite_start_ptr = 8'd114;
            8'd191  : sprite_start_ptr = 8'd115;
            8'd192  : sprite_start_ptr = 8'd116;
            8'd193  : sprite_start_ptr = 8'd117;
            8'd194  : sprite_start_ptr = 8'd118;
            8'd195  : sprite_start_ptr = 8'd119;
            8'd196  : sprite_start_ptr = 8'd120;
            8'd197  : sprite_start_ptr = 8'd121;
            8'd198  : sprite_start_ptr = 8'd122;
            8'd199  : sprite_start_ptr = 8'd123;
            8'd200  : sprite_start_ptr = 8'd124;
            8'd201  : sprite_start_ptr = 8'd125;
            8'd202  : sprite_start_ptr = 8'd126;
            8'd203  : sprite_start_ptr = 8'd127;
            8'd204  : sprite_start_ptr = 8'd128;
            8'd205  : sprite_start_ptr = 8'd129;
            8'd206  : sprite_start_ptr = 8'd130;
            8'd207  : sprite_start_ptr = 8'd131;
            8'd208  : sprite_start_ptr = 8'd132;
            8'd209  : sprite_start_ptr = 8'd133;
            8'd210  : sprite_start_ptr = 8'd134;
            8'd211  : sprite_start_ptr = 8'd135;
            8'd212  : sprite_start_ptr = 8'd136;
            8'd213  : sprite_start_ptr = 8'd137;
            8'd214  : sprite_start_ptr = 8'd138;
            8'd215  : sprite_start_ptr = 8'd139;
            8'd216  : sprite_start_ptr = 8'd140;
            8'd217  : sprite_start_ptr = 8'd141;
            8'd218  : sprite_start_ptr = 8'd142;
            8'd219  : sprite_start_ptr = 8'd143;
            8'd220  : sprite_start_ptr = 8'd144;
            8'd221  : sprite_start_ptr = 8'd145;
            8'd222  : sprite_start_ptr = 8'd146;
            8'd223  : sprite_start_ptr = 8'd147;
            8'd224  : sprite_start_ptr = UNIMP_CHAR;
            8'd225  : sprite_start_ptr = UNIMP_CHAR;
            8'd226  : sprite_start_ptr = UNIMP_CHAR;
            8'd227  : sprite_start_ptr = UNIMP_CHAR;
            8'd228  : sprite_start_ptr = UNIMP_CHAR;
            8'd229  : sprite_start_ptr = UNIMP_CHAR;
            8'd230  : sprite_start_ptr = UNIMP_CHAR;
            8'd231  : sprite_start_ptr = UNIMP_CHAR;
            8'd232  : sprite_start_ptr = UNIMP_CHAR;
            8'd233  : sprite_start_ptr = UNIMP_CHAR;
            8'd234  : sprite_start_ptr = UNIMP_CHAR;
            8'd235  : sprite_start_ptr = UNIMP_CHAR;
            8'd236  : sprite_start_ptr = UNIMP_CHAR;
            8'd237  : sprite_start_ptr = UNIMP_CHAR;
            8'd238  : sprite_start_ptr = UNIMP_CHAR;
            8'd239  : sprite_start_ptr = UNIMP_CHAR;
            8'd240  : sprite_start_ptr = 8'd148;
            8'd241  : sprite_start_ptr = 8'd149;
            8'd242  : sprite_start_ptr = 8'd150;
            8'd243  : sprite_start_ptr = 8'd151;
            8'd244  : sprite_start_ptr = 8'd152;
            8'd245  : sprite_start_ptr = 8'd153;
            8'd246  : sprite_start_ptr = 8'd154;
            8'd247  : sprite_start_ptr = 8'd155;
            8'd248  : sprite_start_ptr = 8'd156;
            8'd249  : sprite_start_ptr = 8'd157;
            8'd250  : sprite_start_ptr = 8'd158;
            8'd251  : sprite_start_ptr = 8'd159;
            8'd252  : sprite_start_ptr = UNIMP_CHAR;
            8'd253  : sprite_start_ptr = UNIMP_CHAR;
            8'd254  : sprite_start_ptr = 8'd160;
            8'd255  : sprite_start_ptr = UNIMP_CHAR;
            default : sprite_start_ptr = UNIMP_CHAR;


        endcase
    end
endmodule

    // always_comb begin

    //     if((ascii_val <= 8'd31) || (ascii_val == 8'd127)) begin

    //         sprite_start_ptr = CTRL_CHAR;

    //     end else if((8'd32 <= ascii_val) && (ascii_val <= 8'd126)) begin

    //         sprite_start_ptr = ascii_val - 8'd30;

    //     end else if(ascii_val == 8'd157) begin

    //         sprite_start_ptr = 8'd97;

    //     end else if((8'd174 <= ascii_val) && (ascii_val <= 8'd223)) begin

    //         sprite_start_ptr = ascii_val - 8'd76;

    //     end else if((8'd240 <= ascii_val) && (ascii_val <= 8'd251)) begin

    //         sprite_start_ptr = ascii_val - 8'd92;

    //     end else if(((8'd128 <= ascii_val) && (ascii_val <= 8'd156)) ||
    //                 ((8'd158 <= ascii_val) && (ascii_val <= 8'd173)) ||
    //                 ((8'd224 <= ascii_val) && (ascii_val <= 8'd239)) ||
    //                 (ascii_val == 8'd252) ||
    //                 (ascii_val == 8'd253) ||
    //                 (ascii_val == 8'd255)) begin

    //         sprite_start_ptr = UNIMP_CHAR;

//     8'd0    : sprite_start_ptr = CTRL_CHAR;
//     8'd1    : sprite_start_ptr = CTRL_CHAR;
//     8'd2    : sprite_start_ptr = CTRL_CHAR;
//     8'd3    : sprite_start_ptr = CTRL_CHAR;
//     8'd4    : sprite_start_ptr = CTRL_CHAR;
//     8'd5    : sprite_start_ptr = CTRL_CHAR;
//     8'd6    : sprite_start_ptr = CTRL_CHAR;
//     8'd7    : sprite_start_ptr = CTRL_CHAR;
//     8'd8    : sprite_start_ptr = CTRL_CHAR;
//     8'd9    : sprite_start_ptr = CTRL_CHAR;
//     8'd10   : sprite_start_ptr = CTRL_CHAR;
//     8'd11   : sprite_start_ptr = CTRL_CHAR;
//     8'd12   : sprite_start_ptr = CTRL_CHAR;
//     8'd13   : sprite_start_ptr = CTRL_CHAR;
//     8'd14   : sprite_start_ptr = CTRL_CHAR;
//     8'd15   : sprite_start_ptr = CTRL_CHAR;
//     8'd16   : sprite_start_ptr = CTRL_CHAR;
//     8'd17   : sprite_start_ptr = CTRL_CHAR;
//     8'd18   : sprite_start_ptr = CTRL_CHAR;
//     8'd19   : sprite_start_ptr = CTRL_CHAR;
//     8'd20   : sprite_start_ptr = CTRL_CHAR;
//     8'd21   : sprite_start_ptr = CTRL_CHAR;
//     8'd22   : sprite_start_ptr = CTRL_CHAR;
//     8'd23   : sprite_start_ptr = CTRL_CHAR;
//     8'd24   : sprite_start_ptr = CTRL_CHAR;
//     8'd25   : sprite_start_ptr = CTRL_CHAR;
//     8'd26   : sprite_start_ptr = CTRL_CHAR;
//     8'd27   : sprite_start_ptr = CTRL_CHAR;
//     8'd28   : sprite_start_ptr = CTRL_CHAR;
//     8'd29   : sprite_start_ptr = CTRL_CHAR;
//     8'd30   : sprite_start_ptr = CTRL_CHAR;
//     8'd31   : sprite_start_ptr = CTRL_CHAR;
//     8'd32   : sprite_start_ptr = 8'd2;
//     8'd33   : sprite_start_ptr = 8'd3;
//     8'd34   : sprite_start_ptr = 8'd4;
//     8'd35   : sprite_start_ptr = 8'd5;
//     8'd36   : sprite_start_ptr = 8'd6;
//     8'd37   : sprite_start_ptr = 8'd7;
//     8'd38   : sprite_start_ptr = 8'd8;
//     8'd39   : sprite_start_ptr = 8'd9;
//     8'd40   : sprite_start_ptr = 8'd10;
//     8'd41   : sprite_start_ptr = 8'd11;
//     8'd42   : sprite_start_ptr = 8'd12;
//     8'd43   : sprite_start_ptr = 8'd13;
//     8'd44   : sprite_start_ptr = 8'd14;
//     8'd45   : sprite_start_ptr = 8'd15;
//     8'd46   : sprite_start_ptr = 8'd16;
//     8'd47   : sprite_start_ptr = 8'd17;
//     8'd48   : sprite_start_ptr = 8'd18;
//     8'd49   : sprite_start_ptr = 8'd19;
//     8'd50   : sprite_start_ptr = 8'd20;
//     8'd51   : sprite_start_ptr = 8'd21;
//     8'd52   : sprite_start_ptr = 8'd22;
//     8'd53   : sprite_start_ptr = 8'd23;
//     8'd54   : sprite_start_ptr = 8'd24;
//     8'd55   : sprite_start_ptr = 8'd25;
//     8'd56   : sprite_start_ptr = 8'd26;
//     8'd57   : sprite_start_ptr = 8'd27;
//     8'd58   : sprite_start_ptr = 8'd28;
//     8'd59   : sprite_start_ptr = 8'd29;
//     8'd60   : sprite_start_ptr = 8'd30;
//     8'd61   : sprite_start_ptr = 8'd31;
//     8'd62   : sprite_start_ptr = 8'd32;
//     8'd63   : sprite_start_ptr = 8'd33;
//     8'd64   : sprite_start_ptr = 8'd34;
//     8'd65   : sprite_start_ptr = 8'd35;
//     8'd66   : sprite_start_ptr = 8'd36;
//     8'd67   : sprite_start_ptr = 8'd37;
//     8'd68   : sprite_start_ptr = 8'd38;
//     8'd69   : sprite_start_ptr = 8'd39;
//     8'd70   : sprite_start_ptr = 8'd40;
//     8'd71   : sprite_start_ptr = 8'd41;
//     8'd72   : sprite_start_ptr = 8'd42;
//     8'd73   : sprite_start_ptr = 8'd43;
//     8'd74   : sprite_start_ptr = 8'd44;
//     8'd75   : sprite_start_ptr = 8'd45;
//     8'd76   : sprite_start_ptr = 8'd46;
//     8'd77   : sprite_start_ptr = 8'd47;
//     8'd78   : sprite_start_ptr = 8'd48;
//     8'd79   : sprite_start_ptr = 8'd49;
//     8'd80   : sprite_start_ptr = 8'd50;
//     8'd81   : sprite_start_ptr = 8'd51;
//     8'd82   : sprite_start_ptr = 8'd52;
//     8'd83   : sprite_start_ptr = 8'd53;
//     8'd84   : sprite_start_ptr = 8'd54;
//     8'd85   : sprite_start_ptr = 8'd55;
//     8'd86   : sprite_start_ptr = 8'd56;
//     8'd87   : sprite_start_ptr = 8'd57;
//     8'd88   : sprite_start_ptr = 8'd58;
//     8'd89   : sprite_start_ptr = 8'd59;
//     8'd90   : sprite_start_ptr = 8'd60;
//     8'd91   : sprite_start_ptr = 8'd61;
//     8'd92   : sprite_start_ptr = 8'd62;
//     8'd93   : sprite_start_ptr = 8'd63;
//     8'd94   : sprite_start_ptr = 8'd64;
//     8'd95   : sprite_start_ptr = 8'd65;
//     8'd96   : sprite_start_ptr = 8'd66;
//     8'd97   : sprite_start_ptr = 8'd67;
//     8'd98   : sprite_start_ptr = 8'd68;
//     8'd99   : sprite_start_ptr = 8'd69;
//     8'd100  : sprite_start_ptr = 8'd70;
//     8'd101  : sprite_start_ptr = 8'd71;
//     8'd102  : sprite_start_ptr = 8'd72;
//     8'd103  : sprite_start_ptr = 8'd73;
//     8'd104  : sprite_start_ptr = 8'd74;
//     8'd105  : sprite_start_ptr = 8'd75;
//     8'd106  : sprite_start_ptr = 8'd76;
//     8'd107  : sprite_start_ptr = 8'd77;
//     8'd108  : sprite_start_ptr = 8'd78;
//     8'd109  : sprite_start_ptr = 8'd79;
//     8'd110  : sprite_start_ptr = 8'd80;
//     8'd111  : sprite_start_ptr = 8'd81;
//     8'd112  : sprite_start_ptr = 8'd82;
//     8'd113  : sprite_start_ptr = 8'd83;
//     8'd114  : sprite_start_ptr = 8'd84;
//     8'd115  : sprite_start_ptr = 8'd85;
//     8'd116  : sprite_start_ptr = 8'd86;
//     8'd117  : sprite_start_ptr = 8'd87;
//     8'd118  : sprite_start_ptr = 8'd88;
//     8'd119  : sprite_start_ptr = 8'd89;
//     8'd120  : sprite_start_ptr = 8'd90;
//     8'd121  : sprite_start_ptr = 8'd91;
//     8'd122  : sprite_start_ptr = 8'd92;
//     8'd123  : sprite_start_ptr = 8'd93;
//     8'd124  : sprite_start_ptr = 8'd94;
//     8'd125  : sprite_start_ptr = 8'd95;
//     8'd126  : sprite_start_ptr = 8'd96;
//     8'd127  : sprite_start_ptr = CTRL_CHAR;
//     8'd128  : sprite_start_ptr = UNIMP_CHAR;
//     8'd129  : sprite_start_ptr = UNIMP_CHAR;
//     8'd130  : sprite_start_ptr = UNIMP_CHAR;
//     8'd131  : sprite_start_ptr = UNIMP_CHAR;
//     8'd132  : sprite_start_ptr = UNIMP_CHAR;
//     8'd133  : sprite_start_ptr = UNIMP_CHAR;
//     8'd134  : sprite_start_ptr = UNIMP_CHAR;
//     8'd135  : sprite_start_ptr = UNIMP_CHAR;
//     8'd136  : sprite_start_ptr = UNIMP_CHAR;
//     8'd137  : sprite_start_ptr = UNIMP_CHAR;
//     8'd138  : sprite_start_ptr = UNIMP_CHAR;
//     8'd139  : sprite_start_ptr = UNIMP_CHAR;
//     8'd140  : sprite_start_ptr = UNIMP_CHAR;
//     8'd141  : sprite_start_ptr = UNIMP_CHAR;
//     8'd142  : sprite_start_ptr = UNIMP_CHAR;
//     8'd143  : sprite_start_ptr = UNIMP_CHAR;
//     8'd144  : sprite_start_ptr = UNIMP_CHAR;
//     8'd145  : sprite_start_ptr = UNIMP_CHAR;
//     8'd146  : sprite_start_ptr = UNIMP_CHAR;
//     8'd147  : sprite_start_ptr = UNIMP_CHAR;
//     8'd148  : sprite_start_ptr = UNIMP_CHAR;
//     8'd149  : sprite_start_ptr = UNIMP_CHAR;
//     8'd150  : sprite_start_ptr = UNIMP_CHAR;
//     8'd151  : sprite_start_ptr = UNIMP_CHAR;
//     8'd152  : sprite_start_ptr = UNIMP_CHAR;
//     8'd153  : sprite_start_ptr = UNIMP_CHAR;
//     8'd154  : sprite_start_ptr = UNIMP_CHAR;
//     8'd155  : sprite_start_ptr = UNIMP_CHAR;
//     8'd156  : sprite_start_ptr = UNIMP_CHAR;
//     8'd157  : sprite_start_ptr = 8'd97;
//     8'd158  : sprite_start_ptr = UNIMP_CHAR;
//     8'd159  : sprite_start_ptr = UNIMP_CHAR;
//     8'd160  : sprite_start_ptr = UNIMP_CHAR;
//     8'd161  : sprite_start_ptr = UNIMP_CHAR;
//     8'd162  : sprite_start_ptr = UNIMP_CHAR;
//     8'd163  : sprite_start_ptr = UNIMP_CHAR;
//     8'd164  : sprite_start_ptr = UNIMP_CHAR;
//     8'd165  : sprite_start_ptr = UNIMP_CHAR;
//     8'd166  : sprite_start_ptr = UNIMP_CHAR;
//     8'd167  : sprite_start_ptr = UNIMP_CHAR;
//     8'd168  : sprite_start_ptr = UNIMP_CHAR;
//     8'd169  : sprite_start_ptr = UNIMP_CHAR;
//     8'd170  : sprite_start_ptr = UNIMP_CHAR;
//     8'd171  : sprite_start_ptr = UNIMP_CHAR;
//     8'd172  : sprite_start_ptr = UNIMP_CHAR;
//     8'd173  : sprite_start_ptr = UNIMP_CHAR;
//     8'd174  : sprite_start_ptr = 8'd98;
//     8'd175  : sprite_start_ptr = 8'd99;
//     8'd176  : sprite_start_ptr = 8'd100;
//     8'd177  : sprite_start_ptr = 8'd101;
//     8'd178  : sprite_start_ptr = 8'd102;
//     8'd179  : sprite_start_ptr = 8'd103;
//     8'd180  : sprite_start_ptr = 8'd104;
//     8'd181  : sprite_start_ptr = 8'd105;
//     8'd182  : sprite_start_ptr = 8'd106;
//     8'd183  : sprite_start_ptr = 8'd107;
//     8'd184  : sprite_start_ptr = 8'd108;
//     8'd185  : sprite_start_ptr = 8'd109;
//     8'd186  : sprite_start_ptr = 8'd110;
//     8'd187  : sprite_start_ptr = 8'd111;
//     8'd188  : sprite_start_ptr = 8'd112;
//     8'd189  : sprite_start_ptr = 8'd113;
//     8'd190  : sprite_start_ptr = 8'd114;
//     8'd191  : sprite_start_ptr = 8'd115;
//     8'd192  : sprite_start_ptr = 8'd116;
//     8'd193  : sprite_start_ptr = 8'd117;
//     8'd194  : sprite_start_ptr = 8'd118;
//     8'd195  : sprite_start_ptr = 8'd119;
//     8'd196  : sprite_start_ptr = 8'd120;
//     8'd197  : sprite_start_ptr = 8'd121;
//     8'd198  : sprite_start_ptr = 8'd122;
//     8'd199  : sprite_start_ptr = 8'd123;
//     8'd200  : sprite_start_ptr = 8'd124;
//     8'd201  : sprite_start_ptr = 8'd125;
//     8'd202  : sprite_start_ptr = 8'd126;
//     8'd203  : sprite_start_ptr = 8'd127;
//     8'd204  : sprite_start_ptr = 8'd128;
//     8'd205  : sprite_start_ptr = 8'd129;
//     8'd206  : sprite_start_ptr = 8'd130;
//     8'd207  : sprite_start_ptr = 8'd131;
//     8'd208  : sprite_start_ptr = 8'd132;
//     8'd209  : sprite_start_ptr = 8'd133;
//     8'd210  : sprite_start_ptr = 8'd134;
//     8'd211  : sprite_start_ptr = 8'd135;
//     8'd212  : sprite_start_ptr = 8'd136;
//     8'd213  : sprite_start_ptr = 8'd137;
//     8'd214  : sprite_start_ptr = 8'd138;
//     8'd215  : sprite_start_ptr = 8'd139;
//     8'd216  : sprite_start_ptr = 8'd140;
//     8'd217  : sprite_start_ptr = 8'd141;
//     8'd218  : sprite_start_ptr = 8'd142;
//     8'd219  : sprite_start_ptr = 8'd143;
//     8'd220  : sprite_start_ptr = 8'd144;
//     8'd221  : sprite_start_ptr = 8'd145;
//     8'd222  : sprite_start_ptr = 8'd146;
//     8'd223  : sprite_start_ptr = 8'd147;
//     8'd224  : sprite_start_ptr = UNIMP_CHAR;
//     8'd225  : sprite_start_ptr = UNIMP_CHAR;
//     8'd226  : sprite_start_ptr = UNIMP_CHAR;
//     8'd227  : sprite_start_ptr = UNIMP_CHAR;
//     8'd228  : sprite_start_ptr = UNIMP_CHAR;
//     8'd229  : sprite_start_ptr = UNIMP_CHAR;
//     8'd230  : sprite_start_ptr = UNIMP_CHAR;
//     8'd231  : sprite_start_ptr = UNIMP_CHAR;
//     8'd232  : sprite_start_ptr = UNIMP_CHAR;
//     8'd233  : sprite_start_ptr = UNIMP_CHAR;
//     8'd234  : sprite_start_ptr = UNIMP_CHAR;
//     8'd235  : sprite_start_ptr = UNIMP_CHAR;
//     8'd236  : sprite_start_ptr = UNIMP_CHAR;
//     8'd237  : sprite_start_ptr = UNIMP_CHAR;
//     8'd238  : sprite_start_ptr = UNIMP_CHAR;
//     8'd239  : sprite_start_ptr = UNIMP_CHAR;
//     8'd240  : sprite_start_ptr = 8'd148;
//     8'd241  : sprite_start_ptr = 8'd149;
//     8'd242  : sprite_start_ptr = 8'd150;
//     8'd243  : sprite_start_ptr = 8'd151;
//     8'd244  : sprite_start_ptr = 8'd152;
//     8'd245  : sprite_start_ptr = 8'd153;
//     8'd246  : sprite_start_ptr = 8'd154;
//     8'd247  : sprite_start_ptr = 8'd155;
//     8'd248  : sprite_start_ptr = 8'd156;
//     8'd249  : sprite_start_ptr = 8'd157;
//     8'd250  : sprite_start_ptr = 8'd158;
//     8'd251  : sprite_start_ptr = 8'd159;
//     8'd252  : sprite_start_ptr = UNIMP_CHAR;
//     8'd253  : sprite_start_ptr = UNIMP_CHAR;
//     8'd254  : sprite_start_ptr = 8'd160;
//     8'd255  : sprite_start_ptr = UNIMP_CHAR;
//     default : sprite_start_ptr = UNIMP_CHAR;

// 00000 00100 01010 00000 00100 00000 00100 00100 00010 01000 00000 00000 00000 00000 00000 00000 01110 00100 01110 01110 00010 11111 00110 11111 01110 011100
// 00000 00100 01010 01010 01111 10001 11110 00100 00100 00100 00100 00100 00000 00000 00000 00001 10001 01100 10001 10001 00110 10000 01000 00001 10001 100010
// 00000 00100 00000 11111 10100 00010 00101 00000 01000 00010 10101 00100 00000 00000 00000 00010 10011 10100 00001 00001 01010 10000 10000 00001 10001 100010
// 00000 00100 00000 01010 01110 00100 01110 00000 01000 00010 01110 11111 00000 11111 00000 00100 10101 00100 00010 01110 10010 11110 11110 00010 01110 011110
// 00000 00100 00000 11111 00101 01000 00101 00000 01000 00010 10101 00100 00000 00000 00000 01000 11001 00100 00100 00001 11111 00001 10001 00010 10001 000010
// 00000 00000 00000 01010 11110 10001 11110 00000 00100 00100 00100 00100 00010 00000 00000 10000 10001 00100 01000 10001 00010 00001 10001 00100 10001 100010
// 00000 00100 00000 00000 00100 00000 00100 00000 00010 01000 00000 00000 00100 00000 00100 00000 01110 11111 11111 01110 00010 11110 01110 00100 01110 011100

// 00000 00000 00000 00000 00000 01110 00000 01110 11110 01110 11100 11111 11111 01110 10001 11111 11111 10001 10000 10001 10001 01110 11110 01110 11110 011100
// 00000 00000 00010 00000 01000 10001 01110 10001 10001 10001 10010 10000 10000 10001 10001 00100 00100 10010 10000 11011 11001 10001 10001 10001 10001 100010
// 00100 00100 00100 01110 00100 00001 10001 10001 10001 10000 10001 10000 10000 10000 10001 00100 00100 10100 10000 11111 11101 10001 10001 10001 10001 100000
// 00000 00000 01000 00000 00010 00010 10101 11111 11110 10000 10001 11111 11111 10111 11111 00100 00100 11000 10000 10101 10101 10001 11110 10001 11110 011100
// 00100 00100 00100 01110 00100 00100 10010 10001 10001 10000 10001 10000 10000 10001 10001 00100 00100 10100 10000 10001 10111 10001 10000 10101 10001 000010
// 00000 01000 00010 00000 01000 00000 01000 10001 10001 10001 10010 10000 10000 10001 10001 00100 10100 10010 10000 10001 10011 10001 10000 10010 10001 100010
// 00000 00000 00000 00000 00000 00100 00111 10001 11110 01110 11100 11111 10000 01110 10001 11111 01000 10001 11111 10001 10001 01110 10000 01101 10001 011100

// 11111 10001 10001 10001 10001 10001 11111 01110 00000 01110 00100 00000 00100 00000 10000 00000 00001 00000 00110 01100 01000 00100 00010 01000 01100 000000
// 00100 10001 10001 10001 10001 10001 10001 01000 10000 00010 01010 00000 00010 01110 10000 00000 00001 01110 01000 10010 01000 00000 00000 01000 00100 000000
// 00100 10001 10001 10001 01010 01010 00010 01000 01000 00010 00000 00000 00000 00001 10000 01110 00001 10001 01000 10010 01000 00100 00010 01001 00100 100000
// 00100 10001 01010 10101 00100 00100 00100 01000 00100 00010 00000 00000 00000 01111 11110 10001 01111 11111 11110 01110 01110 00100 00010 01010 00100 110100
// 00100 10001 01010 10101 01010 00100 01000 01000 00010 00010 00000 00000 00000 10001 10001 10000 10001 10000 01000 00010 01001 00100 00010 01100 00100 101010
// 00100 10001 00100 10101 10001 00100 10001 01000 00001 00010 00000 00000 00000 10001 10001 10001 10001 10001 01000 10010 01001 00100 10010 01010 00100 101010
// 00100 01110 00100 01010 10001 00100 11111 01110 00000 01110 00000 11111 00000 01110 11110 01110 01111 01110 01000 01100 01001 00110 01100 01001 01110 101010

// 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00110 00100 01100 00000 00000 00000 00000 10001 10101 10101 00100 00100 001000
// 00000 00000 01110 01110 00000 00000 00100 00000 00000 00000 00000 10001 00000 01000 00100 00010 00000 10001 00000 00000 00100 00000 01010 00100 00100 001000
// 10000 01110 01001 10010 01010 01111 00100 10001 10001 10001 10001 10001 11111 01000 00100 00010 01000 01010 01001 10010 00000 10101 10101 00100 00100 111000
// 11110 10001 01001 10010 01100 10000 01110 10001 10001 10001 01010 01111 00010 11000 00100 00011 10101 11111 10010 01001 10101 00000 01010 00100 11100 001000
// 10001 10001 01110 01110 01000 01110 00100 10001 10001 10101 00100 00001 00100 01000 00100 00010 00010 00100 01001 10010 00000 10101 10101 00100 00100 111000
// 10001 10001 01000 00011 01000 00001 00100 10001 01010 10101 01010 00001 01000 01000 00100 00010 00000 11111 00000 00000 00100 00000 01010 00100 00100 001000
// 10001 01110 01000 00010 01000 11110 00110 01110 00100 01010 10001 01110 11111 00110 00100 01100 00000 00100 00000 00000 10001 10101 10101 00100 00100 001000

// 01010 00000 00000 01010 01010 00000 01010 01010 00100 00000 00100 00100 00000 00100 00000 00100 00100 01010 01010 00000 01010 00000 01010 00000 01010 001000
// 01010 00000 00000 01010 01010 00000 01010 01010 00100 00000 00100 00100 00000 00100 00000 00100 00100 01010 01010 00000 01010 00000 01010 00000 01010 001000
// 01010 00000 11100 11010 01010 11110 11010 01010 11100 00000 00100 00100 00000 00100 00000 00100 00111 01010 01011 01111 11011 11111 01011 11111 11011 111110
// 11010 11110 00100 00010 01010 00010 00010 11110 00100 11100 00111 11111 11111 00111 11111 11111 00100 01011 01000 01000 00000 00000 01000 00000 00000 000000
// 01010 01010 11100 11010 01010 11010 11110 00000 11100 00100 00000 00000 00100 00100 00000 00100 00111 01010 01111 01011 11111 11011 01011 11111 11011 111110
// 01010 01010 00100 01010 01010 01010 00000 00000 00000 00100 00000 00000 00100 00100 00000 00100 00100 01010 00000 01010 00000 01010 01010 00000 01010 000000
// 01010 01010 00100 01010 01010 01010 00000 00000 00000 00100 00000 00000 00100 00100 00000 00100 00100 01010 00000 01010 00000 01010 01010 00000 01010 000000

// 01010 00000 00000 01010 00100 00000 00000 01010 00100 00100 00000 11111 00000 11100 00111 11111 00000 00100 00000 00000 00010 00100 00000 00000 00100 000000
// 01010 00000 00000 01010 00100 00000 00000 01010 00100 00100 00000 11111 00000 11100 00111 11111 11111 00100 01000 00010 00100 00100 00100 01000 01010 000000
// 01010 11111 00000 01010 00111 00111 00000 01010 11111 00100 00000 11111 00000 11100 00111 11111 00000 11111 00100 00100 00100 00100 00000 10101 00100 000000
// 11111 00000 11111 01111 00100 00100 01111 11111 00100 11100 00111 11111 11111 11100 00111 11111 11111 00100 00010 01000 00100 00100 11111 00010 00000 001000
// 00000 11111 01010 00000 00111 00111 01010 01010 11111 00000 00100 11111 11111 11100 00111 00000 00000 00100 00100 00100 00100 00100 00000 00000 00000 000000
// 00000 00100 01010 00000 00000 00100 01010 01010 00100 00000 00100 11111 11111 11100 00111 00000 11111 11111 01000 00010 00100 00100 00100 11111 00000 000000
// 00000 00100 01010 00000 00000 00100 01010 01010 00100 00000 00100 11111 11111 11100 00111 00000 00000 00000 01110 01110 00100 01000 00000 00000 00000 000000

// 00000 00011 00000 11111 11111 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00000 00010 11111 10001 10001 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00000 00010 11111 10001 10001 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00100 00010 11111 10101 10001 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00000 10010 11111 10001 10001 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00000 01010 11111 10001 10001 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000
// 00000 00100 00000 11111 11111 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 00000 000000


// 11111
// 10001
// 10001
// 10101
// 10001
// 10001
// 11111

// 11111
// 10001
// 10001
// 10001
// 10001
// 10001
// 11111

// 00000
// 00000
// 00000
// 00000
// 00000
// 00000
// 00000

// 00100
// 00100
// 00100
// 00100
// 00100
// 00000
// 00100

// 01010
// 01010
// 00000
// 00000
// 00000
// 00000
// 00000

// 00000
// 01010
// 11111
// 01010
// 11111
// 01010
// 00000

// 00100
// 01111
// 10100
// 01110
// 00101
// 11110
// 00100

// 00000
// 10001
// 00010
// 00100
// 01000
// 10001
// 00000

// 00100
// 11110
// 00101
// 01110
// 00101
// 11110
// 00100

// 00100
// 00100
// 00000
// 00000
// 00000
// 00000
// 00000

// 00010
// 00100
// 01000
// 01000
// 01000
// 00100
// 00010

// 01000
// 00100
// 00010
// 00010
// 00010
// 00100
// 01000

// 00000
// 00100
// 10101
// 01110
// 10101
// 00100
// 00000

// 00000
// 00100
// 00100
// 11111
// 00100
// 00100
// 00000

// 00000
// 00000
// 00000
// 00000
// 00000
// 00010
// 00100

// 00000
// 00000
// 00000
// 11111
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 00000
// 00000
// 00000
// 00100

// 00000
// 00001
// 00010
// 00100
// 01000
// 10000
// 00000

// 01110
// 10001
// 10011
// 10101
// 11001
// 10001
// 01110

// 00100
// 01100
// 10100
// 00100
// 00100
// 00100
// 11111

// 01110
// 10001
// 00001
// 00010
// 00100
// 01000
// 11111

// 01110
// 10001
// 00001
// 01110
// 00001
// 10001
// 01110

// 00010
// 00110
// 01010
// 10010
// 11111
// 00010
// 00010

// 11111
// 10000
// 10000
// 11110
// 00001
// 00001
// 11110

// 00110
// 01000
// 10000
// 11110
// 10001
// 10001
// 01110

// 11111
// 00001
// 00001
// 00010
// 00010
// 00100
// 00100

// 01110
// 10001
// 10001
// 01110
// 10001
// 10001
// 01110

// 01110
// 10001
// 10001
// 01111
// 00001
// 10001
// 01110

// 00000
// 00000
// 00100
// 00000
// 00100
// 00000
// 00000

// 00000
// 00000
// 00100
// 00000
// 00100
// 01000
// 00000

// 00000
// 00010
// 00100
// 01000
// 00100
// 00010
// 00000

// 00000
// 00000
// 01110
// 00000
// 01110
// 00000
// 00000

// 00000
// 01000
// 00100
// 00010
// 00100
// 01000
// 00000

// 01110
// 10001
// 00001
// 00010
// 00100
// 00000
// 00100

// 00000
// 01110
// 10001
// 10101
// 10010
// 01000
// 00111

// 01110
// 10001
// 10001
// 11111
// 10001
// 10001
// 10001

// 11110
// 10001
// 10001
// 11110
// 10001
// 10001
// 11110

// 01110
// 10001
// 10000
// 10000
// 10000
// 10001
// 01110

// 11100
// 10010
// 10001
// 10001
// 10001
// 10010
// 11100

// 11111
// 10000
// 10000
// 11111
// 10000
// 10000
// 11111

// 11111
// 10000
// 10000
// 11111
// 10000
// 10000
// 10000

// 01110
// 10001
// 10000
// 10111
// 10001
// 10001
// 01110

// 10001
// 10001
// 10001
// 11111
// 10001
// 10001
// 10001

// 11111
// 00100
// 00100
// 00100
// 00100
// 00100
// 11111

// 11111
// 00100
// 00100
// 00100
// 00100
// 10100
// 01000

// 10001
// 10010
// 10100
// 11000
// 10100
// 10010
// 10001

// 10000
// 10000
// 10000
// 10000
// 10000
// 10000
// 11111

// 10001
// 11011
// 11111
// 10101
// 10001
// 10001
// 10001

// 10001
// 11001
// 11101
// 10101
// 10111
// 10011
// 10001

// 01110
// 10001
// 10001
// 10001
// 10001
// 10001
// 01110

// 11110
// 10001
// 10001
// 11110
// 10000
// 10000
// 10000

// 01110
// 10001
// 10001
// 10001
// 10101
// 10010
// 01101

// 11110
// 10001
// 10001
// 11110
// 10001
// 10001
// 10001

// 01110
// 10001
// 10000
// 01110
// 00001
// 10001
// 01110

// 11111
// 00100
// 00100
// 00100
// 00100
// 00100
// 00100

// 10001
// 10001
// 10001
// 10001
// 10001
// 10001
// 01110

// 10001
// 10001
// 10001
// 01010
// 01010
// 00100
// 00100

// 10001
// 10001
// 10001
// 10101
// 10101
// 10101
// 01010

// 10001
// 10001
// 01010
// 00100
// 01010
// 10001
// 10001

// 10001
// 10001
// 01010
// 00100
// 00100
// 00100
// 00100

// 11111
// 10001
// 00010
// 00100
// 01000
// 10001
// 11111

// 01110
// 01000
// 01000
// 01000
// 01000
// 01000
// 01110

// 00000
// 10000
// 01000
// 00100
// 00010
// 00001
// 00000

// 01110
// 00010
// 00010
// 00010
// 00010
// 00010
// 01110

// 00100
// 01010
// 00000
// 00000
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 00000
// 00000
// 00000
// 11111

// 00100
// 00010
// 00000
// 00000
// 00000
// 00000
// 00000

// 00000
// 01110
// 00001
// 01111
// 10001
// 10001
// 01110

// 10000
// 10000
// 10000
// 11110
// 10001
// 10001
// 11110

// 00000
// 00000
// 01110
// 10001
// 10000
// 10001
// 01110

// 00001
// 00001
// 00001
// 01111
// 10001
// 10001
// 01111

// 00000
// 01110
// 10001
// 11111
// 10000
// 10001
// 01110

// 00110
// 01000
// 01000
// 11110
// 01000
// 01000
// 01000

// 01100
// 10010
// 10010
// 01110
// 00010
// 10010
// 01100

// 01000
// 01000
// 01000
// 01110
// 01001
// 01001
// 01001

// 00100
// 00000
// 00100
// 00100
// 00100
// 00100
// 00110

// 00010
// 00000
// 00010
// 00010
// 00010
// 10010
// 01100

// 01000
// 01000
// 01001
// 01010
// 01100
// 01010
// 01001

// 01100
// 00100
// 00100
// 00100
// 00100
// 00100
// 01110

// 00000
// 00000
// 10000
// 11010
// 10101
// 10101
// 10101

// 00000
// 00000
// 10000
// 11110
// 10001
// 10001
// 10001

// 00000
// 00000
// 01110
// 10001
// 10001
// 10001
// 01110

// 00000
// 01110
// 01001
// 01001
// 01110
// 01000
// 01000

// 00000
// 01110
// 10010
// 10010
// 01110
// 00011
// 00010

// 00000
// 00000
// 01010
// 01100
// 01000
// 01000
// 01000

// 00000
// 00000
// 01111
// 10000
// 01110
// 00001
// 11110

// 00000
// 00100
// 00100
// 01110
// 00100
// 00100
// 00110

// 00000
// 00000
// 10001
// 10001
// 10001
// 10001
// 01110

// 00000
// 00000
// 10001
// 10001
// 10001
// 01010
// 00100

// 00000
// 00000
// 10001
// 10001
// 10101
// 10101
// 01010

// 00000
// 00000
// 10001
// 01010
// 00100
// 01010
// 10001

// 00000
// 10001
// 10001
// 01111
// 00001
// 00001
// 01110

// 00000
// 00000
// 11111
// 00010
// 00100
// 01000
// 11111

// 00110
// 01000
// 01000
// 11000
// 01000
// 01000
// 00110

// 00100
// 00100
// 00100
// 00100
// 00100
// 00100
// 00100

// 01100
// 00010
// 00010
// 00011
// 00010
// 00010
// 01100

// 00000
// 00000
// 01000
// 10101
// 00010
// 00000
// 00000

// 00000
// 10001
// 01010
// 11111
// 00100
// 11111
// 00100

// 00000
// 00000
// 01001
// 10010
// 01001
// 00000
// 00000

// 00000
// 00000
// 10010
// 01001
// 10010
// 00000
// 00000

// 10001
// 00100
// 00000
// 10101
// 00000
// 00100
// 10001

// 10101
// 00000
// 10101
// 00000
// 10101
// 00000
// 10101

// 10101
// 01010
// 10101
// 01010
// 10101
// 01010
// 10101

// 00100
// 00100
// 00100
// 00100
// 00100
// 00100
// 00100

// 00100
// 00100
// 00100
// 11100
// 00100
// 00100
// 00100

// 00100
// 00100
// 11100
// 00100
// 11100
// 00100
// 00100

// 01010
// 01010
// 01010
// 11010
// 01010
// 01010
// 01010

// 00000
// 00000
// 00000
// 11110
// 01010
// 01010
// 01010

// 00000
// 00000
// 11100
// 00100
// 11100
// 00100
// 00100

// 01010
// 01010
// 11010
// 00010
// 11010
// 01010
// 01010

// 01010
// 01010
// 01010
// 01010
// 01010
// 01010
// 01010

// 00000
// 00000
// 11110
// 00010
// 11010
// 01010
// 01010

// 01010
// 01010
// 11010
// 00010
// 11110
// 00000
// 00000

// 01010
// 01010
// 01010
// 11110
// 00000
// 00000
// 00000

// 00100
// 00100
// 11100
// 00100
// 11100
// 00000
// 00000

// 00000
// 00000
// 00000
// 11100
// 00100
// 00100
// 00100

// 00100
// 00100
// 00100
// 00111
// 00000
// 00000
// 00000

// 00100
// 00100
// 00100
// 11111
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 11111
// 00100
// 00100
// 00100

// 00100
// 00100
// 00100
// 00111
// 00100
// 00100
// 00100

// 00000
// 00000
// 00000
// 11111
// 00000
// 00000
// 00000

// 00100
// 00100
// 00100
// 11111
// 00100
// 00100
// 00100

// 00100
// 00100
// 00111
// 00100
// 00111
// 00100
// 00100

// 01010
// 01010
// 01010
// 01011
// 01010
// 01010
// 01010

// 01010
// 01010
// 01011
// 01000
// 01111
// 00000
// 00000

// 00000
// 00000
// 01111
// 01000
// 01011
// 01010
// 01010

// 01010
// 01010
// 11011
// 00000
// 11111
// 00000
// 00000

// 00000
// 00000
// 11111
// 00000
// 11011
// 01010
// 01010

// 01010
// 01010
// 01011
// 01000
// 01011
// 01010
// 01010

// 00000
// 00000
// 11111
// 00000
// 11111
// 00000
// 00000

// 01010
// 01010
// 11011
// 00000
// 11011
// 01010
// 01010

// 00100
// 00100
// 11111
// 00000
// 11111
// 00000
// 00000

// 01010
// 01010
// 01010
// 11111
// 00000
// 00000
// 00000

// 00000
// 00000
// 11111
// 00000
// 11111
// 00100
// 00100

// 00000
// 00000
// 00000
// 11111
// 01010
// 01010
// 01010

// 01010
// 01010
// 01010
// 01111
// 00000
// 00000
// 00000

// 00100
// 00100
// 00111
// 00100
// 00111
// 00000
// 00000

// 00000
// 00000
// 00111
// 00100
// 00111
// 00100
// 00100

// 00000
// 00000
// 00000
// 01111
// 01010
// 01010
// 01010

// 01010
// 01010
// 01010
// 11111
// 01010
// 01010
// 01010

// 00100
// 00100
// 11111
// 00100
// 11111
// 00100
// 00100

// 00100
// 00100
// 00100
// 11100
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 00111
// 00100
// 00100
// 00100

// 11111
// 11111
// 11111
// 11111
// 11111
// 11111
// 11111

// 00000
// 00000
// 00000
// 11111
// 11111
// 11111
// 11111

// 11100
// 11100
// 11100
// 11100
// 11100
// 11100
// 11100

// 00111
// 00111
// 00111
// 00111
// 00111
// 00111
// 00111

// 11111
// 11111
// 11111
// 11111
// 00000
// 00000
// 00000

// 00000
// 11111
// 00000
// 11111
// 00000
// 11111
// 00000

// 00100
// 00100
// 11111
// 00100
// 00100
// 11111
// 00000

// 00000
// 01000
// 00100
// 00010
// 00100
// 01000
// 01110

// 00000
// 00010
// 00100
// 01000
// 00100
// 00010
// 01110

// 00010
// 00100
// 00100
// 00100
// 00100
// 00100
// 00100

// 00100
// 00100
// 00100
// 00100
// 00100
// 00100
// 01000

// 00000
// 00100
// 00000
// 11111
// 00000
// 00100
// 00000

// 00000
// 01000
// 10101
// 00010
// 00000
// 11111
// 00000

// 00100
// 01010
// 00100
// 00000
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 00100
// 00000
// 00000
// 00000

// 00000
// 00000
// 00000
// 00100
// 00000
// 00000
// 00000

// 00011
// 00010
// 00010
// 00010
// 10010
// 01010
// 00100

// 00000
// 11111
// 11111
// 11111
// 11111
// 11111
// 00000
