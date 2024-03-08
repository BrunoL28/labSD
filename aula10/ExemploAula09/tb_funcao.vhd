library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_funcao is  
end tb_funcao;

architecture teste of tb_funcao is
	
	component funcao is 
	
		port (
			x : in std_logic_vector( 3 downto 0 );
			result : out std_logic_vector( 7 downto 0 )
		);
		
	end component;
	
	signal data_in : std_logic_vector( 3 downto 0 );
	signal data_out : std_logic_vector( 7 downto 0 );
	type vector is array(0 to 3) of integer;
	signal expected_output : vector := ( 52, 108, 100, 72 );
	constant max_val : natural := 4;
	constant min_val : natural := 1;
	signal read_data_in : std_logic := '0';
	signal writing : std_logic := '0';
	
	file inputs_data_in : text open read_mode is "data_in.txt";
	file outputs : text open write_mode is "saida1.txt";
	file outputs2 : text open write_mode is "saida2.txt";
	
	constant PERIOD     : time := 20 ns;
	constant DUTY_CYCLE : real := 0.5;
	constant OFFSET     : time := 5 ns;
	
	begin
	
	UUT: funcao port map( x => data_in, result => data_out );
	
	------------------------------------------------------------------------------------
	----------------- processo para leer os dados do arquivo data_in.txt
	------------------------------------------------------------------------------------
	read_inputs_data_in:process
			variable linea : line;
			variable input : std_logic_vector( 3 downto 0 );
			begin
			while not endfile(inputs_data_in) loop
					if read_data_in = '1' then
						readline(inputs_data_in,linea);
						read(linea,input);
						data_in <= input;
				  end if;
				  wait for PERIOD;
			end loop;
			wait;
		end process read_inputs_data_in;	
		
		------------------------------------------------------------------------------------
		----------------- processo para gerar os estimulos de entrada
		------------------------------------------------------------------------------------
			
			tb_stimulus : process
			begin
				  WAIT FOR (OFFSET + 3*PERIOD);
						read_data_in <= '1';		
							for i in min_val to max_val loop
							wait for PERIOD;
					 end loop;
					read_data_in <= '0';		
				WAIT;
			end process tb_stimulus;	

		------------------------------------------------------------------------------------
		------ processo para gerar os estimulos de escrita do arquivo de saida
		------------------------------------------------------------------------------------   
   
		escreve_outputs : PROCESS
		begin
        WAIT FOR (4*PERIOD);
            writing <= '1';
				for i in min_val to max_val loop
		        wait for PERIOD;
		    end loop;
            writing <= '0';			
			WAIT;
		end process escreve_outputs;   
   
	------------------------------------------------------------------------------------
	------ processo para escrever os dados de saida no arquivo saida1.txt
	------------------------------------------------------------------------------------   
   
	write_outputs:process
	variable linea  : line;
	variable output : std_logic_vector (7 downto 0);
	begin
		while true loop
			if (writing ='1')then
				output := data_out;
				write(linea,output);
				writeline(outputs,linea);
			end if;
			wait for PERIOD;
		end loop; 
	end process write_outputs; 

	------------------------------------------------------------------------------------
	------ processo para comparar os dados de saida1.txt e saida2.txt
	------------------------------------------------------------------------------------
	
	write_compare_output:process
	variable linha : line;
	variable output : std_logic_vector (7 downto 0);
	constant espaco : string := "   ";
	constant coincide : string := "resultados conferem";
	constant nao_coincide : string := "resultados nao conferem";
	
	begin
		wait for (OFFSET + 4*PERIOD);
		for i in 0 to 3 loop
			if (writing ='1')then
				output := data_out; 
	
				write(linha, output);
				write(linha, espaco);
				write(linha, expected_output(i));
				write(linha, espaco);
				
				if (unsigned(output) /= to_unsigned(expected_output(i), 8)) then
					write(linha,nao_coincide);
				else
					write(linha,coincide);
				end if;
				
				writeline(outputs2,linha);
				
				assert (unsigned(output) = to_unsigned(expected_output(i), 8)) report "saida nao corresponde ao esperado" severity note;
				assert (unsigned(output) /= to_unsigned(expected_output(i), 8)) report "saida corresponde ao esperado" severity note;
				
			end if;
			wait for PERIOD;
		end loop;
	end process;
end teste;