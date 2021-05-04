create or replace function consultarUsuarios( entrada text, out par_total numeric,out par_cod_res text)

RETURNS record
LANGUAGE 'plpgsql'
COST 100
VOLATILE
AS $BODY$

declare 
consulta Record;
var_consultanum NUMERIC;

c_consultarusuarios cursor for 
select user_user from aut_tuser;


begin
par_cod_res='hola';
	for consulta in c_consultarusuarios loop
	raise notice 'id de usuario:%',consulta.user_user;
	
	end loop;

select count (user_user)  into var_consultanum from aut_tuser;
	par_total:=var_consultanum;

end;
$BODY$
;
drop function consultarUsuarios;






DO $$
DECLARE
   v_salida2 text;
 v_record record;
 v_total numeric;

BEGIN

 
  select * from consultarUsuarios('gelou') into v_total,v_salida2;
	--v_total:=v_record.par_total;/

raise notice 'total usuarios:%',v_total;

EXCEPTION
   WHEN OTHERS THEN
   RAISE NOTICE '[%]', SQLERRM;

END;
$$ 
