/*  */monitora propostas cujo o Produtor não é o Supervisor do Grupo de Venda */
select * from pessoa where id = 1521626

select proposta.corretora_id,* from proposta proposta
inner join grupo_de_venda gv on gv.id = proposta.grupo_de_venda_id
where
     proposta.corretora_id in (1323250,1521626,419986,650263,422411,617410,374250,639132,680556)
     and proposta.grupo_de_venda_id is not null
     and gv.produtor_gerente_id <> proposta.produtor_id
     and proposta.data_proposta > to_date('01/01/2013', 'DD/MM/YYYY')

update proposta set
       produtor_id = gv.produtor_gerente_id
from grupo_de_venda gv
where
     proposta.corretora_id in (1323250,1521626,419986,650263,422411,617410,374250,639132,680556)
     and proposta.grupo_de_venda_id is not null
     and gv.id = proposta.grupo_de_venda_id
     and gv.produtor_gerente_id <> proposta.produtor_id
     and proposta.data_proposta > to_date('01/01/2013', 'DD/MM/YYYY')
     
     
