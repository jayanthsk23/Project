module ldnst(
		input		[31:0] 	instn	,
		input		[6:0]	opcode	,
		input		[2:0]	fun3	,
		output	reg		lb	,
		output	reg 		lh	,
		output 	reg 		lw	,
		output 	reg 		lbu	,
		output 	reg 		lhu	,
		output 	reg		lwu	,
		output	reg		ld	,
		output	reg		sd	,
		output 	reg 		sb	,
		output 	reg 		sh	,
		output 	reg 		sw	,
		output	reg	[4:0]	rd	,
		output	reg	[4:0]	rs1	,
		output	reg	[4:0]	rs2	,
		output	reg	[11:0]	imm	);

	
		assign	opcode[6:0]	=	instn[6:0]	;
		assign	fun3[2:0]	=	instn[14:12]	;

		always @ (*)
		begin
			case(opcode)
				7'b0000011:
				begin
					case(fun3)
						3'b000:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b1		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;
							
						end
						
						3'b001:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b1		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;
						end	
						3'b010:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b1		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;

						end
						3'b100:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b1		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;
						end
						3'b101:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b1		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;

						end
						3'b110:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b1		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;
	
						end
						3'b011:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rd[4:0]		<=	instn[11:7]	;
							imm[11:0]	<=	instn[31:20]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b1		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;
	
						end
					endcase
				end
				7'b0100011:
				begin
					case(fun3)
						3'b000:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rs2[4:0]	<=	instn[24:20]	;
							imm[4:0]	<=	instn[11:7]	;
							imm[11:5]	<=	instn[31:25]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b1		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;

						end
						3'b001:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rs2[4:0]	<=	instn[24:20]	;
							imm[4:0]	<=	instn[11:7]	;
							imm[11:5]	<=	instn[31:25]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b1		;
							sw		<=	1'b0		;

						end
						3'b010:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rs2[4:0]	<=	instn[24:20]	;
							imm[4:0]	<=	instn[11:7]	;
							imm[11:5]	<=	instn[31:25]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b0		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b1		;

						end
						3'b011:
						begin
							rs1[4:0]	<=	instn[19:15]	;
							rs2[4:0]	<=	instn[24:20]	;
							imm[4:0]	<=	instn[11:7]	;
							imm[11:5]	<=	instn[31:25]	;
							lb		<=	1'b0		;
							lh		<=	1'b0		;	
							lw		<=	1'b0		;
							lbu		<=	1'b0		;
							lhu		<=	1'b0		;
							lwu		<=	1'b0		;
							ld		<=	1'b0		;
							sd		<=	1'b1		;
							sb		<=	1'b0		;
							sh		<=	1'b0		;
							sw		<=	1'b0		;

						end
					endcase
				end
			endcase
		end			
endmodule
