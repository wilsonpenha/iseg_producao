--Verifica Repasse de Comissão sem corretora_id  (erro)
select * from repasse_comissao rc where rc.corretora_id is null

--Corrige Repasse de Comissão sem corretora_id  (erro)
delete from repasse_comissao where corretora_id is null


select * from bordero_comissao where id = 1470680
select * from bordero_lancamento where bordero_comissao_id = 1470680 order by id
select * from repasse_comissao where bordero_lancamento_id = 1470694
select * from bordero_lancamento order by id desc limit 100

select
      rc.*
      ,bl.*
from repasse_comissao rc
inner join bordero_lancamento bl on bl.id = rc.bordero_lancamento_id
where bl.bordero_comissao_id in (1469810, 1470680, 1553737, 1553739, 1896514, 2105155)
order by bl.id

select * from usuario where id = 1157600
