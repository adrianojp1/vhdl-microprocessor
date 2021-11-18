library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registrador is
    port(
        clk         :   in std_logic;
        rst         :   in std_logic;
        wr_en       :   in std_logic;
        data_in     :   in  unsigned(15 downto 0);
        data_out    :   out unsigned(15 downto 0)
    );
end entity registrador;


architecture a_registrador of registrador is
    signal registro : unsigned(15 downto 0);
begin
    process(clk,rst,wr_en)
    begin
        if rst='1' then
            registro <= x"0000";
        elsif wr_en='1' then
            if rising_edge(clk) then
                registro <= data_in;
            end if;
        end if;
    end process;
    
    data_out <= registro;
end architecture a_registrador;

