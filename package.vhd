library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
--...................................................................................--

package wsystem is
    
    subtype stateT is std_ulogic_vector(1 downto 0);
    constant st0 : stateT:= "00";
    constant st1 : stateT:= "01";
--...................................................................................--
    component WS is
        Port 
		(
		temp, light, clock, reset : in std_logic;
	        moist : in std_logic_vector (2 downto 0);
		myState : out std_logic_vector(1 downto 0);
		mySeg : out std_logic_vector(6 downto 0);
		moistOut : out std_logic_vector (2 downto 0);
		tempOut : out std_logic;
		lightOut : out std_logic
		);
    end component WS;
--...................................................................................--
    component seg
        Port (
		display : in std_logic_vector ( 1 downto 0);
		ssd: out std_logic_vector (6 downto 0)
	      );
    end component seg;
--...................................................................................--
end package wsystem;