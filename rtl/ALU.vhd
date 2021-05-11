-- ALU
-- Unidade lógica e aritmética

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
--		enable	: in std_logic;
		add_sub	: in std_logic;
		a		   : in std_logic_vector ((DATA_WIDTH-1) downto 0);
		b		   : in std_logic_vector ((DATA_WIDTH-1) downto 0);
		result	: out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of alu is

	signal temp : std_logic_vector ((DATA_WIDTH-1) downto 0);
	
begin

	-- Função 
	with add_sub select
		temp <= std_logic_vector(unsigned(a) + unsigned(b))	when	'0',
				  std_logic_vector(unsigned(a) - unsigned(b))	when	'1';
	--Buffer
--	with enable select
--		result <= temp when '1',
--					 (others=>'Z') when '0';
					 
	-- Atualiza o barramento de saída com o valor registrado
	result <= temp;

end rtl;
