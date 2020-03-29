use work.bv_arithmetic.all;
use work.dlx_types.all;

entity dlx_register is
	generic (prop_delay: Time := 10 ns);
	port (
		in_val: in dlx_word;
		clock: in bit;
		out_val: out dlx_word
	);
end entity dlx_register;

architecture behavior1 of dlx_register is
begin
	process(in_val,clock)
	begin
		if clock = '1' then
			out_val <= in_val after prop_delay;
		end if;
	end process;
end architecture behavior1;

use work.bv_arithmetic.all;
use work.dlx_types.all;

entity reg_file is
	generic (prop_delay: Time := 15 ns);
	port(
		data_in : in dlx_word;
		readnotwrite, clock: in bit;
		data_out: out dlx_word;
		reg_number : in register_index
	);
end entity reg_file;

architecture behavior1 of reg_file is
   type reg_type is array (0 to 31) of dlx_word;

begin
   process(data_in, readnotwrite, clock, reg_number)
      variable registers : reg_type;
   begin
	if clock = '1' then
		if readnotwrite = '0' then
			registers(bv_to_integer(reg_number)) := data_in;
		end if;
	else
		data_out <= registers(bv_to_integer(reg_number)) after prop_delay;
	end if;
   end process;
end architecture behavior1;

use work.bv_arithmetic.all;
use work.dlx_types.all;

entity mux is
	generic(prop_delay : Time := 5 ns);
	port (
		input_1,input_0 : in dlx_word;
		which: in bit;
		output: out dlx_word
	);
end entity mux;

architecture behavior1 of mux is
begin
	process(input_1,input_0,which)
	begin
		if which = '0' then
			output <= input_0 after prop_delay;
		else
			output <= input_1 after prop_delay;
		end if;
	end process;
end architecture behavior1;

use work.bv_arithmetic.all;
use work.dlx_types.all;

entity pcplusone is
	generic(prop_delay: Time := 5 ns);
	port (
		input: in dlx_word;
		clock: in bit;
		output: out dlx_word);
end entity pcplusone;

architecture behavior1 of pcplusone is
begin
   process(input, clock)
	variable isOverflowing: boolean;
	variable res: dlx_word;
   begin
	res := x"00000000";
	if clock = '1' then
		bv_addu(input, x"00000001", res, isOverflowing);
		if isOverflowing then
			output <= x"00000000" after prop_delay;
		end if;
	end if;
	output <= res after prop_delay;
   end process;
end architecture behavior1;