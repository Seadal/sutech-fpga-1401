LIBRARY ieee;
USE ieee.std_logic_1164.all;

--...................................................................................--

entity seg
	Port (
		display : in std_logic_vector ( 1 downto 0);
		seg: out std_logic_vector (6 downto 0)
	      );
END seg;

--...................................................................................--

architecture of ssd is
	begin
		ssd <= "1001000" when display = "01" 
		else
			"1111110";
end architecture;