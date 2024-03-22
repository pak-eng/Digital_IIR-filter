// Project name: Filter
// Author: P. P. Kolbenkov
// File description: Testbench for filter

`timescale 1ns/1ns

`define M_PI 3.14159265358979323846

parameter int Samples = 250;
parameter real freq_step = 0.01;
parameter int freq_N = 0.5/freq_step;

module filter_tb;

    logic clk = 1'b1;
    logic clk_div_3 = 1'b1;
    logic clk_enable = 1'b0;
    logic reset = 1'b0;

    initial begin // Adding test clock to testbench
        forever #50 clk = !clk;
    end

    initial begin // Adding divided frequency test clock to testbench
        forever #150 clk_div_3 = !clk_div_3;
    end 

    initial begin // Providing a clock enable status and reset impulse to set all D-Flops to 0
    @(posedge clk);
    @(posedge clk);
        clk_enable = 1'b1;
        reset = 1'b1;
    repeat(16) @(posedge clk);
    reset = 1'b0;
    end

    real freq;
    logic signed [10:0] signal_in = '0;
    logic signed [10:0] signal_out;

    // Instantiating top-level of our design under test (IIR filter)
    filter_top inst_filter(
        .clk        (clk),
        .clk_div_3  (clk_div_3),
        .reset      (reset),
        .in         (signal_in),
        .out        (signal_out)
    );

    // Adding delays from .sdf file
    initial $sdf_annotate("../Source/Phys_Syn_Res/filter_phys_delays.sdf", inst_filter);

    // The input signal cleaning task, will be used later in other tasks to separate 
    // them from each other
    task automatic clr();
        begin
            for(int i=0; i<Samples/10; i=i+1) begin
                signal_in <= '0;
                freq = 0;
                @(posedge clk);
            end
        end
    endtask

    // Test case to simulate response to a sine wave input signal of given frequency
    task automatic test1(input real freq);
        begin
            @(posedge clk_div_3);
            for(int i=0; i<Samples; i=i+1) begin
                @(negedge clk);
                signal_in <= (2**10-1)*$sin(2*`M_PI*freq*i);
            end
        end
    endtask

    // Test case to simulate filter-response characteristic by inputting a sine signal 
    // of gradually increasing frequency from 0 to 0.5 sampling rate
    task automatic test2();
        begin
            for(int freq_i=0; freq_i<freq_N; freq_i=freq_i+1) begin
                freq = freq_step*freq_i;
                test1(freq_step*freq_i);
                clr();
            end
        end
    endtask

    // Test case to simulate filtering ability of a filter by inputting a sum of three signals,
    // only one of which is withthin filter's passband
    task automatic test3();
        begin
            for(int i=0; i<Samples; i=i+1) begin
                signal_in <= (2**10-1)*$sin(2*`M_PI*0.1*i)
                            +(2**10-1)*$sin(2*`M_PI*0.25*i)
                            +(2**10-1)*$sin(2*`M_PI*0.4*i);
                @(posedge clk);
            end
            clr();
        end
    endtask

    // Testcase of inputting a sawtooth signal
    task automatic test4();
        begin
            for(int i=0; i<Samples; i=i+1) begin
                signal_in <= 512*i;
                @(posedge clk);
            end
            clr();
        end
    endtask

    // Test case to compare design after each stage of synthesis to the Simulink model
    // stimulus.mem and reference.mem - files containing data exported from Simulink
    localparam int delay = 6;
    logic signed [10:0] stimulus [0:127];
    logic signed [10:0] reference [0:127];
    logic signed [10:0] signal_out_ref;
    logic test_in_progress = '0;
    
    initial $readmemb("../Scripts/stimulus.mem", stimulus);
    initial $readmemb("../Scripts/reference.mem", reference);

    task automatic test5();
        begin
            test_in_progress <= '1;
            for(int i=0; i<128; ++i) begin
                signal_in <= stimulus[i];

                if ((i-delay)<0) begin
                    signal_out_ref <= '0;
                end
                else begin
                    signal_out_ref <= reference[i-delay];
                end
                @(posedge clk);
            end
            test_in_progress <= '0;
            clr();
        end
    endtask

    // Auto-checker whether everything is allright, if it spots a difference between output of DUT 
    // and Simulink model the test will end with an error
    logic signed [10:0] err;
    assign err = (signal_out - signal_out_ref)*test_in_progress;

    always @(negedge clk) begin : auto_check
        if (err != 0) begin
            $display("THERE IS DIFFERENCE BETWEEN MODEL AND NETLIST");
            $fatal;
        end
    end

    initial begin @(negedge reset);
        clr();
        freq = 0.21; // Input frequency in [0:0.5] (Filter passband is []) 
        test1(freq);
        test2();
        test3();
        test4();
        test5();
        $display("SIMULATION FINISHED SUCCESSFULLY");
        $finish();
    end
endmodule
