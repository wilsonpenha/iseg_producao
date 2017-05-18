UPDATE PESSOA SET telefone_alternativo = NULL where telefone_alternativo = '(__) ____-____'
drop table tmp_endereco_vazio
select * into tmp_endereco_vazio from endereco en where en.logradouro is null or replace(en.logradouro, ' ', '') = ''
delete from endereco where id in (select id from tmp_endereco_vazio)
select * from pessoa where id = 371030

--Exporta tabela de clientes
SELECT
      p.nome AS "NOME_CLIENTE"
      ,CASE
           WHEN pf.id is not null THEN 'F'
           ELSE 'J'
      END AS "TIPO_PESSOA"
      ,COALESCE(p.cpf_ou_cnpj, '') AS "CPF_OU_CNPJ"
      ,CASE
           WHEN pf.id is not null THEN pf.data_nascimento
           ELSE null
      END AS "DATA_NASCIMENTO"
      ,CASE
           WHEN pj.id is not null THEN pj.data_fundacao
           ELSE null
      END AS "DATA_FUNDACAO"
      ,COALESCE(p.telefone_preferencial, '') AS "TELEFONE_PREFERENCIAL"
      ,COALESCE(p.telefone_celular, '') AS "TELEFONE_CELULAR"
      ,COALESCE(p.telefone_alternativo, '') AS "TELEFONE_ALTERNATIVO"
      ,COALESCE(en.logradouro, '') AS "ENDERECO_LOGRADOURO"
      ,COALESCE(en.numero, '') AS "ENDERECO_NUMERO"
      ,COALESCE(en.complemento, '') AS "ENDERECO_COMPLEMENTO"
      ,COALESCE(en.bairro, '') AS "ENDERECO_BAIRRO"
      ,COALESCE(en.cidade, '') AS "ENDERECO_CIDADE"
      ,COALESCE(en.uf, '') AS "ENDERECO_UF"
FROM pessoa p
LEFT JOIN pessoa_fisica pf ON pf.id = p.id
LEFT JOIN pessoa_juridica pj ON pj.id = p.id
LEFT JOIN endereco en ON en.pessoa_id = p.id
WHERE
      p.corretora_id = 371030
ORDER BY
      p.nome

--Exporta tabela de apólices
SELECT
      p.numero                AS "LOCALIZADOR"
      ,p.cpf_ou_cnpj          AS "CPF_OU_CNPJ"
      ,seg.nome               AS "SEGURADORA"
      ,r.nome                 AS "RAMO"
      ,p.inicio_vigencia      AS "INICIO_VIGENCIA"
      ,p.termino_vigencia     AS "TERMINO_VIGENCIA"
      ,p.fator                AS "COMISSAO"
      ,p.premio_liquido       AS "PREMIO_LIQUIDO"
      ,p.custo_apolice        AS "CUSTO_APOLICE"
      ,p.adicional            AS "ADICIONAL"
      ,p.premio_total         AS "PREMIO_TOTAL"
      ,p.nro_apolice          AS "APOLICE"
      ,f.nome                 AS "FABRICANTE"
      ,vm.descricao           AS "MODELO"
      ,a.ano_fabricacao       AS "ANO_FABRICACAO"
      ,a.ano_modelo           AS "ANO_MODELO"
      ,a.nro_placa            AS "PLACA"
      ,a.nro_chassis          AS "CHASSIS"
      ,a.codigo_fipe          AS "FIPE"
FROM proposta p
LEFT JOIN pessoa seg ON seg.id = p.seguradora_id
LEFT JOIN ramo r ON r.id = p.ramo_id
LEFT JOIN automovel a ON a.proposta_id = p.id
LEFT JOIN veiculo_modelo vm on vm.id = a.modelo_veiculo_id
LEFT JOIN fabricante f on f.id = vm.fabricante_id
WHERE
      p.corretora_id = 371030
ORDER BY
      p.id

      


