--Verifica lançamento de comissão que não gerou repasse
select
      p.numero as localizador
      , case when p.is_fatura = true then 'FATURA' else 'ANUAL' end as tipoProposta
      , p.cliente_nome
      , bc.nro_extrato
      , bc.data_documento as data_extrato
      , bc.data_lancamento as data_lancamento
      , bl.valor_comissao
      , pp.referencia_parcela
      , cp_p.nome as comissionado_na_proposta_fatura
      , rc.valor_base
      , rc.percentual_repasse
      , rc.valor_pago
from bordero_lancamento bl
inner join bordero_comissao bc on bc.id = bl.bordero_comissao_id
inner join proposta p on p.id = bl.proposta_id
left join parcelas_proposta pp on pp.proposta_id = p.id and pp.referencia_parcela = bl.referencia_parcela
left join comissionado_proposta cp on cp.proposta_id = p.id and cp.parcelas_proposta_id = pp.id
left join pessoa cp_p on cp_p.id = cp.pessoa_id
left join repasse_comissao rc on rc.bordero_lancamento_id = bl.id
where
     p.corretora_id = 420417
     and p.is_fatura = true
     --and pp.referencia_parcela is null
     --and rc.id is null
order by
      p.id
      , bl.referencia_parcela
      , rc.referencia_parcela
      
--Verifica lançamento de comissão que não gerou repasse
select distinct
      p.id as proposta_id
      , p.numero as localizador
      , case when p.is_fatura = true then 'FATURA' else 'ANUAL' end as tipoProposta
      , p.cliente_nome
      , bc.nro_extrato
      , bc.data_documento as data_extrato
      , bc.data_lancamento as data_lancamento
      , bl.valor_comissao
      , bl.referencia_parcela
      --, pp.referencia_parcela
      , case when ag.id is null then cp_p.nome else ag_p.nome end as comissionado
      , case when ag.id is null then cp.comissao else ag.percentual_agenciamento end as percentual_comissionado
      , rc.valor_base
      , rc.percentual_repasse
      , rc.valor_pago
from bordero_lancamento bl
inner join bordero_comissao bc on bc.id = bl.bordero_comissao_id
inner join proposta p on p.id = bl.proposta_id
left join comissionado_proposta cp on cp.proposta_id = p.id
left join pessoa cp_p on cp_p.id = cp.pessoa_id
left join agenciamento ag on ag.proposta_id = p.id
left join pessoa ag_p on ag_p.id = ag.produtor_id
left join repasse_comissao rc on rc.comissionado_id = cp.id OR rc.agenciado_id = ag.id
where
     p.corretora_id = 420417
     and p.is_fatura = false
     --and pp.referencia_parcela is null
     --and rc.id is null
order by
      p.id
      , bl.referencia_parcela
      , bc.data_documento
      --, rc.referencia_parcela
      
      


select
      p.numero
      , p.cliente_nome
      , bc.nro_extrato
      , bc.data_documento as data_extrato
      , bc.data_lancamento as data_lancamento
      , cpnf_p.nome as comissinado_na_proposta_nao_fatura
      , bl.valor_comissao
      , pp.referencia_parcela
      , cp_p.nome as comissionado_na_proposta_fatura
      , rc.valor_base
      , rc.percentual_repasse
      , rc.valor_pago
from bordero_lancamento bl
inner join bordero_comissao bc on bc.id = bl.bordero_comissao_id
inner join proposta p on p.id = bl.proposta_id
left join comissionado_proposta cpnf on cpnf.proposta_id = p.id
left join pessoa cpnf_p on cpnf_p.id = cpnf.pessoa_id
left join parcelas_proposta pp on pp.proposta_id = p.id and pp.referencia_parcela = bl.referencia_parcela
left join comissionado_proposta cp on cp.proposta_id = p.id and cp.parcelas_proposta_id = pp.id
left join pessoa cp_p on cp_p.id = cp.pessoa_id
left join repasse_comissao rc on rc.bordero_lancamento_id = bl.id
where
     p.corretora_id = 420417
     and pp.referencia_parcela is null
     --and rc.id is null
order by
      p.id
      , bl.referencia_parcela
      , cpnf.id
      , rc.referencia_parcela
      
      
      


select * from parcelas_proposta where proposta_id = 333715 order by id

select * from bordero_lancamento bl where bl.proposta_id = 333715 order by id
select * from bordero_comissao bc where bc.id = 2344385

select * from comissionado_proposta cp where cp.proposta_id = 333715 and parcelas_proposta_id = 2344854 order by id

select rc.* from repasse_comissao rc
inner join bordero_lancamento bl on bl.id = rc.bordero_lancamento_id
inner join proposta p on p.id = bl.proposta_id
where
     p.id = 333715
     --and rc.bordero_lancamento_id = 2344841
order by
      rc.referencia_parcela
      , rc.id

update bordero_lancamento set
       situacao = 0, usuario_id = 422163
where id = 2344841
update bordero_comissao set
       situacao = 0
where id = 2344385

