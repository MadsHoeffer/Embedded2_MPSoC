library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_24 is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (23 downto 0));
end counter_24;

architecture Behavioral of counter_24 is
signal count_sig: unsigned(23 downto 0);

begin
process(clk, rst)
    begin
    if(rst = '1') then 
       count_sig <= (others=>'0');   
    elsif(rising_edge(clk)) then
        if(count_sig <= 15000000) then
            count_sig <= count_sig + 1;
        else
            count_sig <= (others => '0');
        end if;
    end if;
 end process;
 count <= std_logic_vector(count_sig);
 end Behavioral;
        
