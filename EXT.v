`include "ctrl_encode_def.v"

module EXT(ext_in, ext_op, ext_out);

input	[15:0]		ext_in;
input	[1:0]		ext_op;

output reg[31:0]	ext_out;

integer i; //逻辑计数

initial
	ext_out = 0;

always@(ext_in or ext_op)begin
	case(ext_op)
		`EXT_ZERO:begin
			for(i = 0; i < 32; i = i + 1)begin
				if(i < 16)begin
					ext_out[i] = ext_in[i];
				end
				else begin
					ext_out[i] = 0;
				end
			end
		end
		`EXT_SIGNED:begin
			for(i = 0; i < 32; i = i + 1)begin
				if(i < 16)begin
					ext_out[i] = ext_in[i];
				end
				else begin
					ext_out[i] = ext_in[15];
				end
			end
		end
		`EXT_HIGHPOS:begin
		  for(i = 0; i < 32; i = i + 1)begin
		    if(i < 16)begin
		      ext_out[i] = 0;
		    end
		    else begin
		      ext_out[i] = ext_in[i - 16];
		    end
		  end
		end
	endcase
end

endmodule