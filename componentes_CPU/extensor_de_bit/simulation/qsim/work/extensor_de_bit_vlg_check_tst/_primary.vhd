library verilog;
use verilog.vl_types.all;
entity extensor_de_bit_vlg_check_tst is
    port(
        dadoExtendido   : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end extensor_de_bit_vlg_check_tst;
