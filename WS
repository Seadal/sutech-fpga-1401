--..........................Watering system.........................................--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--...................................................................................--
--testing
--this is not working

Entity myFsm is
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
End myFsm;

--...................................................................................--

Architecture fsm of myFsm is
	Type stateT is (st0, st1); -- state type
	Signal ps, ns : stateT; -- ps:present state - ns:next state
Begin

--...................................................................................--
	process(ps)
	Begin
		case ps is
		when st0 => 
			myState <= "00" ; mySeg <= "1000000" ; --for -
		when st1 =>
			myState <= "01" ; mySeg <= "1110110" ;--for H
		--when others =>
		end case ;
	end process;

--...................................................................................--		

	process(clock, ns, reset)
	Begin
		if (reset = '1') then ps <= st0; -- not watering state
		Elsif (clock = '1' ) then ps <= ns; -- next state transition
		End if;
	End process ;

--...................................................................................--