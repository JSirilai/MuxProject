library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity F_Gen_00 is
	port (
		CLK_IN : in STD_LOGIC;                      -- clock signal input
	S_OUT : out STD_LOGIC);                       -- clock signal output
end F_Gen_00;

architecture Behavioral of F_Gen_00 is
	signal temp : STD_LOGIC;
	signal count : integer range 0 to 6000000 - 1;
begin
	S_OUT <= temp;
	process (CLK_IN) begin
	if rising_edge(CLK_IN) then
		if (count = 6000000 - 1) then               -- Rising edge of generated signal
			temp <= not(temp);                        -- low -> high
			count <= 0;
		else
			count <= count + 1;
		end if;
	end if;
end process;
