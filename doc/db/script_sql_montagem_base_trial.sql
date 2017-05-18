--Importar os arquivos tmp_pf.dmp e tmp_pj.dmp
--psql -h localhost -U postgres -d trial -f "/backup/tmp_pf.dmp
--psql -h localhost -U postgres -d trial -f "/backup/tmp_pj.dmp


CREATE SEQUENCE tmp_id START 1;

select setval('tmp_id', 1)
update tmp_pf set id = nextval('tmp_id')

select setval('tmp_id', 1)
update empresa set id = nextval('tmp_id')

select setval('tmp_id', 1)
ALTER TABLE pessoa_fisica ADD COLUMN tmp_id numeric(19,0);
update pessoa_fisica set tmp_id = nextval('tmp_id')

select setval('tmp_id', 1)
ALTER TABLE pessoa_juridica ADD COLUMN tmp_id numeric(19,0);
update pessoa_juridica set tmp_id = nextval('tmp_id')

update pessoa set 
	nome = n.nome
	,cpf_ou_cnpj = n.cpf
	,referencia_pessoal = null
	,telefone_alternativo = null
	,telefone_celular = '(62) 8252-6063'
	,telefone_preferencial = '(62) 3091-3398'
	,email = 'romero@i9t.com.br'
from 
	pessoa_fisica pf, tmp_pf n
where 
	pf.id = pessoa.id
	and n.id = pf.tmp_id

update pessoa set 
	nome = n.razao_social
	,referencia_pessoal = null
	,telefone_alternativo = null
	,telefone_celular = '(62) 8252-6063'
	,telefone_preferencial = '(62) 3091-3398'
	,email = 'romero@i9t.com.br'
from 
	pessoa_juridica pj, tmp_pj n
where 
	pj.id = pessoa.id
	and n.id = pj.tmp_id	
	and pessoa.id not in (select id from seguradora)
	and pessoa.id not in (select id from corretora)
	and pessoa.id not in (select id from vistoriadora)
	and pessoa.id not in (select id from oficina)

update pessoa_juridica set 
	razao_social = n.razao_social
	,site_home_page = 'www.'
	,pessoa_contato = 'LUIZ ROMERO MACHADO'
	,inscr_estadual = null
	,inscricao_municipal = null
from 
	tmp_pj n
where 
	n.id = pessoa_juridica.tmp_id	
	and pessoa_juridica.id not in (select id from seguradora)
	and pessoa_juridica.id not in (select id from corretora)
	and pessoa_juridica.id not in (select id from vistoriadora)
	and pessoa_juridica.id not in (select id from oficina)	

update proposta set
	cpf_ou_cnpj = p.cpf_ou_cnpj
	,cliente_nome = p.nome
from
	pessoa p
where
	p.id = proposta.cliente_id

update endereco set
	telefone = '(62) 8252-6063'
	,fax = '(62) 3091-3389'

update proposta_endereco set
	telefone = '(62) 8252-6063'
	,fax = '(62) 3091-3389'


--Exporta update da tabela de grupo de venda
select 
	'update grupo_de_venda set nome_do_grupo = ''GRUPO ' || cast((g.id * 337 - 123) AS varchar(8)) || ''' where id = ' || cast(g.id as varchar(8)) || ';'
from 
	grupo_de_venda g

--Altera a logo das corretoras
update corretora set imagem_logo = 'logo.jpg'

--Altera o nome dos produtores
update produtor set
	apelido = substring(p.nome from 1 for 10)
from
	pessoa p
where
	p.id = produtor.id
	

--Exporta update da tabela de corretoras
select 
	'update pessoa set nome = ''NUMERO ' || cast((p.id * 337 - 123) AS varchar(8)) || ' SEGUROS'', referencia_pessoal = null, telefone_alternativo = null, telefone_celular = ''(62) 8252-6063'', telefone_preferencial = ''(62) 3091-3398'', email = ''romero@i9t.com.br'' where id = ' || cast(p.id as varchar(8)) || ';'
from
	pessoa p
	join pessoa_juridica pj on pj.id = p.id
	join corretora c on c.id = p.id

select 
	'update pessoa_juridica set razao_social = ''NUMERO ' || cast(p.id * 337 - 123 AS varchar(8)) || ' CORRETORA DE SEGUROS'', site_home_page = ''www.'', pessoa_contato = ''LUIZ ROMERO MACHADO'', inscr_estadual = null, inscricao_municipal = null where id = ' || cast(p.id as varchar(8)) || ';'
from
	pessoa p
	join pessoa_juridica pj on pj.id = p.id
	join corretora c on c.id = p.id
