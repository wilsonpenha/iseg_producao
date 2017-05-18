--Corrige Referência nas parcelas de Seguro do tipo FATURA
update parcelas_proposta set
       referencia_parcela = to_date('01/'||date_part('month', parcelas_proposta.referencia_parcela)::text||'/'||date_part('year', parcelas_proposta.referencia_parcela)::text, 'dd/MM/yyyy')
from proposta p
where
     p.id = parcelas_proposta.proposta_id
     and date_part('day', parcelas_proposta.referencia_parcela) > 1
     and p.is_fatura = true

--Consulta Referência nas parcelas de Seguro do tipo FATURA com dia diferente de 01
select
     pp.*
from parcelas_proposta pp
inner join proposta p on p.id = pp.proposta_id and p.is_fatura = true
where
     pp.referencia_parcela is not null
     and date_part('day', pp.referencia_parcela) > 1
order by
      pp.proposta_id
      , pp.referencia_parcela
      

