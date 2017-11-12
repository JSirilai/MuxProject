library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity MUX is
	port (
		S : in STD_LOGIC_VECTOR (1 downto 0);       -- S0 connected with PIN B18 and S1 connected with PIN A18
		LED : out STD_LOGIC;                        -- connected with A17
	CLK : in STD_LOGIC);                          -- 12MHz clock connected with L17
end MUX;

architecture Behavioral of MUX is

	component F_gen_00 is                         -- 1Hz 50% duty cycle generator
		port (
			CLK_IN : in STD_LOGIC;                    -- 12MHz clock signal
		S_OUT : out STD_LOGIC);                     -- 1Hz 50% duty cycle clock signal
	end component;

	component F_gen_01 is                         -- 1Hz 10% duty cycle generator
		port (
			CLK_IN : in STD_LOGIC;                    -- 12MHz clock signal
		S_OUT : out STD_LOGIC);                     -- 1Hz 10% duty cycle clock signal
	end component;

	component F_gen_10 is                         -- 10Hz 50% duty cycle generator
		port (
			CLK_IN : in STD_LOGIC;                    -- 12MHz clock signal
		S_OUT : out STD_LOGIC);                     -- 10Hz 50% duty cycle
	end component;

	component F_gen_11 is                         -- 1kHz 50% duty cycle generator
		port (
			CLK_IN : in STD_LOGIC;                    -- 12MHz clock signal
		S_OUT : out STD_LOGIC);                     -- 1kHz 50% duty cycle generator
	end component;

	signal SIGNAL00, SIGNAL01, SIGNAL10, SIGNAL11, SIGNAL12 : STD_LOGIC;

begin
	SG1 : F_Gen_00
	port map(CLK, SIGNAL00);                      -- F_gen_00 called
	SG2 : F_Gen_01
	port map(CLK, SIGNAL01);                      -- F_gen_01 called
	sG3 : F_Gen_10
	port map(CLK, SIGNAL10);                      -- F_gen_10 called
	SG4 : F_Gen_11
	port map(CLK, SIGNAL11);                      -- F_gen_11 called
	Multiplexer : process (S) begin
		case S is
			when "00" => LED <= SIGNAL00;             -- LED receive signal from SG1 when S0 = '0' and S1 = '0'
			when "01" => LED <= SIGNAL01;             -- LED receive signal from SG2 when S0 = '0' and S1 = '1'
			when "10" => LED <= SIGNAL10;             -- LED receive signal from SG3 when S0 = '1' and S1 = '0'
			when "11" => LED <= SIGNAL11;             -- LED receive signal from SG4 when S0 = '1' and S1 = '1'
      when others => LED <= '0';
		end case;
	end process;

end Behavioral;
