//     ################################################################ TRANSACTION #######################################################################
class txn;
        rand  bit	[31:0] 	instn	;
	rand  bit 	[6:0]	opcode	;
	rand  bit 	[2:0]	fun3	;
	      bit 	    	lb	;
              bit               lh	;
    	      bit  		lw	;
    	      bit  		lbu	;
    	      bit  	    	lhu	;
    	      bit 	    	lwu	;
   	      bit 	    	ld	;
   	      bit 	    	sd	;
    	      bit  	    	sb	;
    	      bit  	    	sh	;
    	      bit  	    	sw	;
   	      bit 	[4:0]	rd	;
   	      bit 	[4:0]	rs1	;
   	      bit 	[4:0]	rs2	;
   	      bit 	[11:0]	imm     ; 

        function void display(string name);
            $display("--------------------------");
            $display("%s",name);
            $display("--------------------------");
            $display(" instn   =    %0b ,     
                       opcode  =    %0b , 
                       fun3    =    %0b ,   
                       lb	   =    %0b , 
                       lh	   =    %0b , 
                       lw	   =    %0b ,
                       lbu	   =    %0b , 
                       lhu	   =    %0b ,     
                       lwu	   =    %0b , 
                       ld	   =    %0b , 
                       sd	   =    %0b , 
                       sb	   =    %0b , 
                       sh	   =    %0b , 
                       sw	   =    %0b , 
                       rd	   =    %0d , 
                       rs1	   =    %0d , 
                       rs2	   =    %0d , 
                       imm     =    %0d ",instn,opcode,fun3,lb,lh,lw,lbu,lhu,lwu,ld,sd,sb,sh,sw,rd,rs1,rs2,imm); 
            $display("--------------------------------------");
        endfunction
    endclass

// ############################################################# GENERATOR ###############################################################################

class generator;

    rand txn    txn1;
    int rpc;
    mailbox gen2driv;
    event ended;

    function mbg(mailbox gen2driv);
	    this.gen2driv	=	gen2driv;
	endfunction

    task main();
     	repeat(rpc)
	begin
		txn1	=	new();
     		if (!txn1.randomize())
		     $fatal("------- Randomization failed");
		gen2driv.put(txn1);
	end
      ->ended;
     endtask
    endclass

// ########################################################## INTERFACE ##############################################################################


interface intf(input clk);
	logic	[31:0] 	instn	;
        logic	[6:0]	opcode	;
        logic	[2:0]	fun3	;
	logic		lb  	; 
	logic		lh  	;
	logic		lw  	;
	logic		lbu 	;
	logic		lhu 	;
	logic		lwu 	;
	logic		ld  	;	
	logic		sd  	;
	logic		sb  	;
	logic		sh  	;
	logic		sw  	;
	logic	[4:0]	rd  	;
	logic	[4:0]	rs1 	;
	logic	[4:0]	rs2 	;
	logic	[11:0]	imm	;
endinterface



// ######################################################### DRIVER ######################################################################################

class driver;
	virtual intf vi	;
	mailbox gen2driv;
	int n_txn	;

	function mbg(virtual intf vi,mailbox gen2driv);
		this.vi		=	this.vi		;
		this.gen2driv	=	this.gen2driv	;
	endfunction
		
	task main;
		txn	txn1		;
		gen2driv.get(txn1)	;

		@(posedge vi.clk)	;
		vi.instn	<=	txn1.instn	;	
	        vi.opcode	<=	txn1.opcode	;	
                vi.fun3		<=	txn1.fun3	;
                vi.lb  		<=	txn1.lb  	;
                vi.lh  		<=	txn1.lh  	;
                vi.lw  		<=       txn1.lw  	;
                vi.lbu 		<=	txn1.lbu 	;
                vi.lhu 		<=	txn1.lhu 	;
                vi.lwu 		<=	txn1.lwu 	;
                vi.ld  		<=	txn1.ld  	;
                vi.sd  		<=	txn1.sd  	;
                vi.sb  		<=	txn1.sb  	;
                vi.sh  		<=	txn1.sh  	;
                vi.sw  		<=	txn1.sw  	;
                vi.rd  		<=	txn1.rd  	;
                vi.rs1 		<=	txn1.rs1 	;
                vi.rs2 		<=	txn1.rs2 	;
                vi.imm		<=	txn1.imm	;
		n_txn++;
		endtask
endclass

// ##################################### ENVIRONMENT #####################################

class env;
	generator gen		;
	driver	  driv		;

	mailbox	  gen2driv	;
	virtual	  intf vi	;

	function mbg(virtual intf vi);
		this.vi	=	vi;
		gen2driv	=	new();
		gen	=	new(gen2driv);
		driv	=	new(vi.gen2driv);
	endfunction


	task test();
		fork
			gen.main();
			driv.main();
		join_any
	endtask

	task post_test();
		wait(gen.ended.triggered);
		wait(gen.rpc	==	driv.n_txn);
	endtask

	task run;
		test();
		post_test();
		$finish;
	endtask

endclass

// ####################################### Randomization ####################################### 

program test(intf vi);

	env e;

	initial
	begin
		e	=	new(vi);
		e.gen.rpc	=	10	;
		e.run();
	end
endprogram


// ##################################### TESTBENCH TOP MODEL #####################################

module tb_top;
bit clk;

always	#5	clk	=	~clk	;

intf vi0(clk);
test t1(vi0);

ldnst ad0(
	.clk	(clk)		,
	.instn  (vi0.instn)	,
        .opcode (vi0.opcode)	,
        .fun3   (vi0.fun3)	, 
        .lb     (vi0.lb)	,
        .lh     (vi0.lh)	, 
        .lw     (vi0.lw)	, 
        .lbu    (vi0.lbu)	, 
        .lhu    (vi0.lhu)	, 
        .lwu    (vi0.lwu)	, 
        .ld     (vi0.ld)	, 
        .sd     (vi0.sd)	, 
        .sb     (vi0.sb)	, 
        .sh     (vi0.sh)	, 
        .sw     (vi0.sw)	, 
        .rd     (vi0.rd)	, 
        .rs1    (vi0.rs1)	, 
        .rs2    (vi0.rs2)	, 
        .imm    (vi0.imm)	);

endmodule
