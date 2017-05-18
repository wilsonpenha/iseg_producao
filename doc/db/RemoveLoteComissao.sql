/* Remover Lote de Comissão */

select * from bordero_comissao where corretora_id = 1155419 AND nro_extrato in ('604424')

delete from PROPOSTA_COMISSAO where proposta_id in (
       select proposta_id from bordero_lancamento where bordero_comissao_id in (2283141) and (proposta_id = 360324)
)
delete from REPASSE_COMISSAO where bordero_lancamento_id in (
       select id from bordero_lancamento where bordero_comissao_id in (1896514,2106399,2293784)
)
--delete from bordero_lancamento where bordero_comissao_id in (1896514,2106399,2293784)
--delete from bordero_comissao where id in (1896514,2106399,2293784)


--Ajusta o repasse do MARCIO LEMOS em 80%
select id from comissionado_proposta where pessoa_id = 2062992
select * from repasse_comissao where corretora_id = 1872772
       and percentual_repasse <> 80
       and comissionado_id in (select id from comissionado_proposta where pessoa_id = 2062992)
update repasse_comissao set
       percentual_repasse = 80
       , valor_pago = round((valor_base * .8)::numeric, 2)
where id in (
      select id from repasse_comissao where corretora_id = 1872772
       and percentual_repasse <> 80
       and comissionado_id in (select id from comissionado_proposta where pessoa_id = 2062992)
)
commit
select round((1.229)::numeric, 2)

001388-9
SELECT * FROM veiculo_modelo order by id desc limit 10
update veiculo_modelo set
       codigo_fipe = '509029-6'
where id = 2358302

select * from REPASSE_COMISSAO where bordero_lancamento_id in (2283161)
select * from bordero_lancamento where bordero_comissao_id in (2283141) and (proposta_id = 360324)
update bordero_lancamento set
       situacao = 0
where id in (2283161)
update bordero_comissao set
       situacao = 0
where id in (2283141)


select * from PARCELAS_PROPOSTA where proposta_id = 358234 order by id
select * from bordero_lancamento bl where bl.proposta_id = 353937
select * from bordero_lancamento bl where bl.bordero_comissao_id = 2313390

select * from bordero_comissao bc where bc.id = 1883598
select * from bordero_comissao bc where bc.corretora_id = 374250 order by id desc limit 100

delete from PROPOSTA_COMISSAO where proposta_id in (
       select proposta_id from bordero_lancamento where bordero_comissao_id in (2313390)
)
delete from REPASSE_COMISSAO where bordero_lancamento_id in (
       select id from bordero_lancamento where bordero_comissao_id in (2313390)
)
delete from bordero_lancamento where bordero_comissao_id = 2313390
delete from bordero_comissao where id = 2313390

