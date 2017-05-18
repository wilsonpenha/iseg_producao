/*==============================================================*/
/* Table: profissao                                             */
/*==============================================================*/
CREATE TABLE profissao
(
  id bigint NOT NULL,
  descricao character varying(80),
  cbo character varying(15),
  CONSTRAINT pk_profissao PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: acessorios                                            */
/*==============================================================*/
create table acessorios (
   id                   INT8                 not null,
   tipo_acessorio_id    INT8                 null,
   descricao            VARCHAR(20)          null,
   constraint PK_ACESSORIOS primary key (id)
);

-- Table: acesso_seguradora

-- DROP TABLE acesso_seguradora;

CREATE TABLE acesso_seguradora
(
  id bigint NOT NULL,
  codigo_aux1 character varying(255),
  codigo_aux2 character varying(255),
  codigo_aux3 character varying(255),
  codigo_corretor character varying(255),
  senha character varying(255),
  corretora_id bigint,
  seguradora_id bigint,
  CONSTRAINT acesso_seguradora_pkey PRIMARY KEY (id),
  CONSTRAINT fk64e18dca80066ae FOREIGN KEY (seguradora_id)
      REFERENCES seguradora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE acesso_seguradora OWNER TO postgres;

-- Table: fin_agencia_bancaria

-- DROP TABLE fin_agencia_bancaria;

CREATE TABLE fin_agencia_bancaria
(
  id bigint NOT NULL,
  codigo character varying(10),
  digito character varying(3),
  nome character varying(150),
  banco_id bigint,
  cidade_id bigint,
  CONSTRAINT pk_agencia_bancaria PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE fin_agencia_bancaria OWNER TO postgres;

/*==============================================================*/
/* Table: automovel_orc_acessorios                              */
/*==============================================================*/
create table automovel_orc_acessorios (
   id                   INT8                 not null,
   automovel_orcamento_id INT8                 not null,
   acessorio_id         INT8                 null,
   constraint PK_AUTOMOVEL_ORC_ACESSORIOS primary key (id)
);

/*==============================================================*/
/* Table: tipo_cobertura                                        */
/*==============================================================*/
create table tipo_cobertura (
   id                   INT8                 not null,
   descricao            VARCHAR(15)          null,
   codigo_suzep         VARCHAR(10)          null,
   constraint PK_TIPO_COBERTURA primary key (id)
);

-- Table: orcamento

-- DROP TABLE orcamento;

CREATE TABLE orcamento
(
  id bigint NOT NULL,
  data_orcamento timestamp without time zone,
  numero integer,
  validade timestamp without time zone,
  orcamento_seguradora_id bigint,
  orcamento_seguro_id bigint,
  usuario_id bigint,
  CONSTRAINT orcamento_pkey PRIMARY KEY (id),
  CONSTRAINT fkacb0b1f098936207 FOREIGN KEY (orcamento_seguro_id)
      REFERENCES orcamento_seguro (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkacb0b1f0e13d7c07 FOREIGN KEY (orcamento_seguradora_id)
      REFERENCES orcamento_seguradora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkacb0b1f0feef29e6 FOREIGN KEY (usuario_id)
      REFERENCES usuario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE orcamento OWNER TO postgres;

-- Table: pagamentos

-- DROP TABLE pagamentos;

CREATE TABLE pagamentos
(
  id bigint NOT NULL,
  numero numeric(8,0),
  data_pagamento timestamp without time zone,
  situacao smallint,
  base_encargos numeric(12,2),
  valor_encargos numeric(12,2),
  valor_pagamento numeric(12,2),
  percentual_encargos numeric(8,2),
  usuario_criacao_id bigint,
  data_criacao timestamp without time zone,
  usuario_estorno_id bigint,
  data_estorno timestamp without time zone,
  corretora_id bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE pagamentos OWNER TO postgres;

-- Table: pagamentos_repasse

-- DROP TABLE pagamentos_repasse;

CREATE TABLE pagamentos_repasse
(
  id bigint NOT NULL,
  pagamento_id bigint,
  repasse_comissao_id bigint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE pagamentos_repasse OWNER TO postgres;

-- Table: proposta_automovel

-- DROP TABLE proposta_automovel;

CREATE TABLE proposta_automovel
(
  id bigint NOT NULL,
  proposta_id bigint,
  proposta_original_id bigint,
  automovel_id bigint,
  data_exclusao timestamp without time zone,
  data_inclusao timestamp without time zone,
  numero_item numeric(10,0),
  CONSTRAINT pk_proposta_automovel PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE proposta_automovel OWNER TO postgres;

-- Table: seguradora_coberturas

-- DROP TABLE seguradora_coberturas;

CREATE TABLE seguradora_coberturas
(
  id bigint NOT NULL,
  descricao_seguradora character varying(255),
  coberturas_iseg_id bigint,
  seguradora_id bigint,
  CONSTRAINT seguradora_coberturas_pkey PRIMARY KEY (id),
  CONSTRAINT fk9e57bbd66139af2f FOREIGN KEY (coberturas_iseg_id)
      REFERENCES coberturas_iseg (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk9e57bbd6a80066ae FOREIGN KEY (seguradora_id)
      REFERENCES seguradora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE seguradora_coberturas OWNER TO postgres;

-- Table: seguradora_servicos

-- DROP TABLE seguradora_servicos;

CREATE TABLE seguradora_servicos
(
  id bigint NOT NULL,
  descricao_seguradora character varying(255),
  seguradora_id bigint,
  servicos_iseg_id bigint,
  CONSTRAINT seguradora_servicos_pkey PRIMARY KEY (id),
  CONSTRAINT fkcc5487aa2a5ee2d7 FOREIGN KEY (servicos_iseg_id)
      REFERENCES servicos_iseg (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkcc5487aaa80066ae FOREIGN KEY (seguradora_id)
      REFERENCES seguradora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE seguradora_servicos OWNER TO postgres;
/*==============================================================*/
/* Table: automovel_orcamento                                   */
/*==============================================================*/
create table automovel_orcamento (
   id                   int8                 not null,
   seguradora_id        int8                 null,
   fim_vig_apolice_anterior DATE                 null,
   nro_apolice_anterior VARCHAR(30)          null,
   classe_bonus         VARCHAR(3)           null,
   codigo_identificacao_anterior VARCHAR(30)          null,
   is_apolice_cancelada BOOL                 null,
   motivo               VARCHAR(100)         null,
   qtd_sinistro         INT2                 null,
   observacao           VARCHAR(500)         null,
   veiculo_modelo_id    int8                 null,
   modelo_veiculo_id    int8                 null,
   ano_fabricacao       VARCHAR(4)           null,
   ano_modelo           VARCHAR(4)           null,
   is_zero_km           BOOL                 null,
   nro_nf               VARCHAR(10)          null,
   tipo_combustivel_id  int8                 null,
   is_segurado_proprietario BOOL                 null,
   renavan              VARCHAR(15)          null,
   nro_placa            VARCHAR(10)          null,
   nro_chassis          VARCHAR(30)          null,
   cor_predominante     VARCHAR(30)          null,
   is_kit_gas           BOOL                 null,
   tipo_financiamento_id INT8                 null,
   nome_banco           VARCHAR(30)          null,
   cnpj_banco           VARCHAR(15)          null,
   tipo_franquia_id     int8                 null,
   tipo_residencia_id   INT8                 null,
   cep_residencia       VARCHAR(15)          null,
   cep_trabalho         VARCHAR(15)          null,
   cep_circulacao       VARCHAR(8)           null,
   cep_pernoite         VARCHAR(8)           null,
   qtd_outros_veiculos  INT2                 null,
   tipo_garagem_id      INT8                 null,
   utilizacao_veiculo_id INT8                 null,
   quilometragem        VARCHAR(10)          null,
   capacidade           VARCHAR(3)           null,
   categoria            VARCHAR(20)          null,
   codigo_fipe          VARCHAR(10)          null,
   codigo_identificacao VARCHAR(30)          null,
   gravame_alienacao    VARCHAR(20)          null,
   possui_anti_furto    VARCHAR(3)           null,
   rastreamento_satelite VARCHAR(3)          null,
   regiao_tarifacao     VARCHAR(8)           null,
   renovacao            VARCHAR(3)           null,
   status               VARCHAR(10)          null,
   terceiro_eixo        VARCHAR(3)           null,
   categoria_veiculo_id int8                 null,
   linha_vazia          bool                 null,
   numero_item          int4                 null,
   usuario_id           int8                 null,
   orcamento_id         int8                 null,
   proprietario_arrendatario_id   int8       null,
   uso_veiculo_id       INT8                 null,
   valor_casco          NUMERIC(12,2)        null,
   lmi_normal           NUMERIC(12,2)        null,
   lmi_reduzido         NUMERIC(12,2)        null,
   tipo_indenizacao     VARCHAR(20)          null,
   percentual_referenciado NUMERIC(6,2)      null,
   rastreador_iseg_id   int8                 null,
   bloqueador_iseg_id   int8                 null,
   outro_rastreador     VARCHAR(50)          null,
   outro_bloqueador     VARCHAR(50)          null,
   constraint automovel_orcamento_pkey primary key (id)
)
without oids;

-- set table ownership
alter table automovel_orcamento owner to postgres
;
/*==============================================================*/
/* Index: fk_automovel_modelo_fk2                               */
/*==============================================================*/
create  index fk_automovel_modelo_fk2 on automovel_orcamento (
tipo_combustivel_id
);

/*==============================================================*/
/* Table: automovel_proprietario                                */
/*==============================================================*/
create table automovel_proprietario (
   id                   INT8                 not null,
   automovel_orcamento_id INT8                 null,
   automovel_id INT8                 null,
   cpf_ou_cnpj          VARCHAR(15)          null,
   nome                 VARCHAR(40)          null,
   telefone             VARCHAR(10)          null,
   data_nascimento      DATE                 null,
   tempo_habilitacao    VARCHAR(10)          null,
   tipo_pessoa          VARCHAR(2)           null,
   constraint PK_AUTOMOVEL_PROPRIETARIO primary key (id)
);

/*==============================================================*/
/* Table: coberturas_iseg                                       */
/*==============================================================*/
create table coberturas_iseg (
   id                   int8                 not null,
   informa_franquia     bool                 null,
   descricao            VARCHAR(50)          null,
   nome_longo           VARCHAR(250)         null,
   informacao           VARCHAR(1024)        null,
   sequencia            int8                 null,
   tipo_cobertura       VARCHAR(255)         null,
   status               VARCHAR(10)          null,
   is_ativa             bool                 null,
   ramo_id              INT8                 null,
   constraint coberturas_iseg_pkey primary key (id)
)
without oids;

/*==============================================================*/
/* Table: servicos_iseg                                         */
/*==============================================================*/
create table servicos_iseg (
   id                   int8                 not null,
   informa_descricao    bool                 null,
   informa_franquia     bool                 null,
   descricao            VARCHAR(255)         null,
   nome_longo           VARCHAR(250)         null,
   informacao           VARCHAR(1024)        null,
   sequencia            int8                 null,
   status               VARCHAR(6)           null,
   is_ativa             bool                 null default true,
   ramo_id              INT8                 null,
   constraint servicos_iseg_pkey primary key (id)
)
without oids;

/*==============================================================*/
/* Table: proprietario_arrendatario                             */
/*==============================================================*/
create table proprietario_arrendatario (
   id                   INT8                 not null,
   automovel_id 	    INT8                 null,
   nome                 VARCHAR(30)          null,
   cpf_ou_cnpj          VARCHAR(15)          null,
   telefone             VARCHAR(20)          null,
   data_nascimento      DATE                 null,
   tempo_habilitacao    VARCHAR(3)           null,
   tipo_pessoa 	 		INT2                 null,
   relacao_seg_prop_id  INT8                 null,
   constraint PK_PROPRIETARIO_ARRENDATARIO primary key (id)
)
without oids;

/*==============================================================*/
/* Table: situacao                                              */
/*==============================================================*/
create table situacao (
   id                   INT8                 not null,
   descricao            VARCHAR(20)          null,
   is_ativo             BOOL                 null,
   constraint PK_SITUACAO primary key (id)
);

/*==============================================================*/
/* Table: orcamento_seguro                                      */
/*==============================================================*/
create table orcamento_seguro (
   id                   int8                 not null,
   nome_banco           varchar(30)          null,
   nro_banco            int8                 null,
   codigo_agencia       varchar(10)          null,
   conta_corrente       int8                 null,
   conta_digito         char(2)              null,
   inicio_vigencia      DATE                 null,
   termino_vigencia     DATE                 null,
   numero               int8                 not null,
   tipo_proposta        int8                 null,
   titular_ccorrente    varchar(60)          null,
   cliente_id           int8                 null,
   data_orcamento       DATE                 null,
   corretora_id         int8                 null,
   profissao_id         int8                 null,
   proposta_id          int8                 null,
   grupo_de_venda_id    int8                 null,
   produtor_id          int8                 null,
   ramo_id              int8                 null,
   usuario_id           int8                 null,
   situacao             int8                 null default 0,
   cliente_nome         varchar(60)          null,
   cpf_ou_cnpj          varchar(20)          null,
   fator                NUMERIC(6,2)         null default (0)::double precision,
   is_generic           bool                 null default false,
   email                varchar(100)         null,
   telefone_alternativo varchar(20)          null,
   telefone_celular     varchar(20)          null,
   telefone_preferencial varchar(20)         null,
   referencia_pessoal   varchar(60)          null,
   cnh                  varchar(20)          null,
   data_1a_habilitacao  date                 null,
   data_nascimento      date                 null,
   estado_civil         varchar(20)          null,
   sexo                 varchar(20)          null,
   tipo_pessoa          INT2                 null,
   cli_condutor_principal varchar(3)         null,
   tipo_cobertura_id    INT8                 null,
   orcamento_seguro_id  int8                 null,
   situacao_id          int8                 null,
   data_validade        DATE                 null,
   data_agendamento     DATE                 null,
   outra_profissao      varchar(20)          null,
   observacao           varchar(255)         null,
   constraint orcamento_seguro_pkey primary key (id)
)
without oids;

/*==============================================================*/
/* Table: orcamento_seguradora                                  */
/*==============================================================*/
create table orcamento_seguradora (
   id                   INT8                 not null,
   item                 VARCHAR(8)           null,
   rotulo               VARCHAR(30)          null,
   custo_apolice        NUMERIC(12,8)        null,
   iof                  NUMERIC(12,8)        null,
   qtde_parcelas        int8                 null,
   orcamento_id         int8                 null,
   seguradora_id        int8                 null,
   data_calculo         DATE                 null,
   usuario_id           int8                 null,
   observacao           VARCHAR(255)         null,
   fator                NUMERIC(6,2)         null,
   constraint orcamento_seguradora_pkey primary key (id)
)
without oids;

/*==============================================================*/
/* Table: orcamento_franquias                                   */
/*==============================================================*/
create table orcamento_franquias (
   id                   INT8                 not null,
   orcamento_seguradora_id INT8                 null,
   premio_total         numeric(12,2)        null,
   valor_franquia       NUMERIC(14,2)        null,
   premio_liquido       numeric(12,2)        null,
   percentual_franquia  NUMERIC(7,2)         null,
   observacao           VARCHAR(200)         null,
   custo_apolice        numeric(14,2)        null,
   iof                  numeric(14,2)        null,
   tipo_franquia_id     INT8                 null,
   constraint PK_ORCAMENTO_FRANQUIAS primary key (id)
)
without oids;

-- Table: parcelas_orcamento

-- DROP TABLE parcelas_orcamento;

CREATE TABLE parcelas_orcamento
(
  id bigint NOT NULL,
  qtd_parcela_debito smallint,
  valor_parcela_debito numeric(14,2),
  orcamento_franquias_id bigint,
  valor_parcela_credito numeric(14,2),
  valor_parcela_carne numeric(14,2),
  valor_parcela_cheque numeric(14,2),
  qtd_parcela_carne smallint,
  qtd_parcela_credito smallint,
  qtd_parcela_cheque smallint,
  forma_pagamento smallint,
  qtd_parcelas smallint,
  is_selected boolean,
  CONSTRAINT pk_parcelas_orcamento PRIMARY KEY (id)  
)
WITH (
  OIDS=FALSE
);
ALTER TABLE parcelas_orcamento OWNER TO postgres;


/*==============================================================*/
/* Table: orcamento_servicos                                    */
/*==============================================================*/
create table orcamento_servicos (
   id                   int8                 not null,
   descricao            VARCHAR(100)         null,
   franquia             float8               null,
   premio               float8               null,
   quantidade           int8                 null,
   servico_contratado   VARCHAR(255)         null,
   texto_franquia       VARCHAR(255)         null,
   informa_franquia     bool                 null,
   texto_descricao      VARCHAR(60)          null,
   sequencia            int8                 null,
   usuario_id           int8                 null,
   orcamento_seguradora_id INT8                 null,
   servicos_id          int8                 null,
   servicos_iseg_id     int8                 null,
   constraint automovel_servicos_iseg_pkey primary key (id)
)
without oids;


/*==============================================================*/
/* Table: orcamento_cobertura                                   */
/*==============================================================*/
create table orcamento_cobertura (
   id                   int8                 not null,
   franquia             float8               null,
   lmi                  float8               null,
   premio               float8               null,
   texto_franquia       VARCHAR(255)         null,
   descricao            VARCHAR(60)          null,
   informa_franquia     bool                 null,
   sequencia            int8                 null,
   usuario_id           int8                 null,
   cobertura_contratada CHAR(3)              null default 'Nao'::bpchar,
   orcamento_seguradora_id INT8                 null,
   coberturas_id        int8                 null,
   coberturas_iseg_id   int8                 null,
   constraint automovel_cobertura_iseg_pkey primary key (id)
)
without oids;


/*==============================================================*/
/* Table: orcamento_servicos_iseg                               */
/*==============================================================*/
create table orcamento_servicos_iseg (
   id                   int8                 not null,
   servicos_iseg_id     int8                 null,
   descricao            varchar(100)         null,
   franquia             float8               null,
   premio               float8               null,
   quantidade           int8                 null,
   servico_contratado   varchar(255)         null,
   texto_franquia       varchar(255)         null,
   informa_franquia     bool                 null,
   texto_descricao      varchar(60)          null,
   sequencia            int8                 null,
   usuario_id           int8                 null,
   orcamento_seguro_id  int8                 null,
   is_ativa             bool                 null,
   constraint orcamento_servicos_iseg_pkey primary key (id)
)
without oids;

/*==============================================================*/
/* Table: orcamento_cobertura_iseg                              */
/*==============================================================*/
create table orcamento_cobertura_iseg (
   id                   int8                 not null,
   franquia             float8               null,
   lmi                  float8               null,
   premio               float8               null,
   texto_franquia       varchar(255)         null,
   descricao            varchar(60)          null,
   informa_franquia     bool                 null,
   sequencia            int8                 null,
   usuario_id           int8                 null,
   cobertura_contratada char(3)              null default 'Nao'::bpchar,
   orcamento_seguro_id  int8                 null,
   coberturas_iseg_id   int8                 null,
   constraint orcamento_cobertura_iseg_pkey primary key (id)
)
without oids;


/*==============================================================*/
/* Table: corretora_coberturas_iseg                             */
/*==============================================================*/
create table corretora_coberturas_iseg (
   id                   INT8                 not null,
   lmi                  NUMERIC(8,2)         null,
   corretora_id         INT8                 null,
   coberturas_iseg_id   INT8                 null,
   constraint PK_CORRETORA_COBERTURAS_ISEG primary key (id)
);


/*==============================================================*/
/* Table: seguradoras_prefer                                    */
/*==============================================================*/
create table seguradoras_prefer (
   id                   INT8                 not null,
   franquias            VARCHAR(150)         null,
   seguradora_id        INT8                 null,
   corretora_id         INT8                 null,
   constraint PK_SEGURADORAS_PREFER primary key (id)
);

/*==============================================================*/
/* Table: corretora_servicos_iseg                               */
/*==============================================================*/
create table corretora_servicos_iseg (
   id                   INT8                 not null,
   lmi                  NUMERIC(8,2)         null,
   corretora_id         INT8                 null,
   servicos_iseg_id     INT8                 null,
   constraint PK_CORRETORA_SERVICOS_ISEG primary key (id)
);


/*==============================================================*/
/* Table: banco_relacionamento                                  */
/*==============================================================*/
create table banco_relacionamento (
   id                   int8                 not null,
   nome                 varchar(50)          null,
   constraint PK_BANCO_RELACIONAMENTO primary key (id)
);

/*==============================================================*/
/* Table: tipo_conta_relacionamento                             */
/*==============================================================*/
create table tipo_conta_relacionamento (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   banco_relacionamento_id int8                 null,
   constraint PK_TIPO_CONTA_RELACIONAMENTO primary key (id)
);

/*==============================================================*/
/* Table: orcamento_bancos                                      */
/*==============================================================*/
create table orcamento_bancos (
   id                   int8                 not null,
   orcamento_seguro_id  int8                 null,
   agencia              varchar(10)          null,
   conta                varchar(20)          null,
   digito               varchar(2)           null,
   tipo_conta_relacionamento_id int8                 null,
   banco_relacionamento_id int8                 null,
   constraint PK_ORCAMENTO_BANCOS primary key (id)
);

/*==============================================================*/
/* Table: proposta_bancos                                       */
/*==============================================================*/
create table proposta_bancos (
   id                   int8                 not null,
   proposta_id          int8                 null,
   agencia              varchar(10)          null,
   conta                varchar(20)          null,
   digito               varchar(2)           null,
   tipo_conta_relacionamento_id int8                 null,
   banco_relacionamento_id int8                 null,
   constraint PK_PROPOSTA_BANCOS primary key (id)
);


/*==============================================================*/
/* Table: escolaridade                                          */
/*==============================================================*/
create table escolaridade (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   sequencia            int2                 null,
   constraint PK_ESCOLARIDADE primary key (id)
);

/*==============================================================*/
/* Table: automovel_prop_acessorios                             */
/*==============================================================*/
create table automovel_prop_acessorios (
   id                   int8                 not null,
   automovel_id         int8                 null,
   acessorio_id         int8                 null,
   constraint PK_AUTOMOVEL_PROP_ACESSORIOS primary key (id)
);

/*==============================================================*/
/* Table: perfil_proposta                                       */
/*==============================================================*/
create table perfil_proposta (
   id                   int8                 not null,
   tipo_residencia_id   int8                 null,
   cep_residencia       varchar(15)          null,
   cep_pernoite         varchar(15)          null,
   cep_trabalho         varchar(15)          null,
   qtd_outros_veiculos  int2                 null,
   tipo_garagem_id      int8                 null,
   utilizacao_veiculo_id int8                 null,
   quilometragem        varchar(50)          null,
   proposta_id          int8                 null,
   constraint PK_PERFIL_PROPOSTA primary key (id)
);

/*==============================================================*/
/* Table: perfil_orcamento                                      */
/*==============================================================*/
create table perfil_orcamento (
   id                   int8                 not null,
   tipo_residencia_id   int8                 null,
   cep_residencia       varchar(15)          null,
   cep_pernoite         varchar(15)          null,
   cep_trabalho         varchar(15)          null,
   qtd_outros_veiculos  int2                 null,
   tipo_garagem_id      int8                 null,
   utilizacao_veiculo_id int8                 null,
   quilometragem        varchar(50)          null,
   orcamento_seguro_id  int8                 null,
   constraint PK_PERFIL_ORCAMENTO primary key (id)
);

/*==============================================================*/
/* Table: servicos_email                                        */
/*==============================================================*/
create table servicos_email (
   id                   INT8                 not null,
   host                 varchar(100)         null,
   porta                INT4                 null,
   protocolo            varchar(30)          null,
   email_servidor       varchar(50)          null,
   senha_email_servidor varchar(50)          null,
   is_autenticacao      BOOL                 null,
   email_corretora      varchar(50)          null,
   corretora_id         int8                 null,
   constraint PK_SERVICOS_EMAIL primary key (id)
);

/*==============================================================*/
/* Table: template_mensagem                                        */
/*==============================================================*/
create table template_mensagem (
   id                   INT8                 not null,
   assunto              VARCHAR(50)          null,
   corpo_texto          VARCHAR(2000)        null,
   status               bool                 null,
   tipo_mensagem_id     INT8                 null,
   inmidia              INT2                 null,
   corretora_id         INT8                 null,
   is_padrao            bool                 null,
   constraint PK_TEMPLATE_MENSAGEM primary key (id)
);

/*==============================================================*/
/* Table: tipo_mensagem                                         */
/*==============================================================*/
create table tipo_mensagem (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   status               bool                 null,
   constraint PK_TIPO_MENSAGEM primary key (id)
);

/*==============================================================*/
/* Table: rastreador_iseg                                       */
/*==============================================================*/
create table rastreador_iseg (
   id                   INT8                 not null,
   descricao            varchar(100)         null,
   status               BOOL                 null,
   constraint PK_RASTREADOR_ISEG primary key (id)
);

/*==============================================================*/
/* Table: bloqueador_iseg                                       */
/*==============================================================*/
create table bloqueador_iseg (
   id                   INT8                 not null,
   descricao            varchar(100)         null,
   status               BOOL                 null,
   constraint PK_BLOQUEADOR_ISEG primary key (id)
);

/*==============================================================*/
/* Table: carroceria_iseg                                       */
/*==============================================================*/
create table carroceria_iseg (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   status               bool                 null,
   constraint PK_CARROCERIA_ISEG primary key (id)
);

/*==============================================================*/
/* Table: semireboque_iseg                                      */
/*==============================================================*/
create table semireboque_iseg (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   status               bool                 null,
   constraint PK_SEMIREBOQUE_ISEG primary key (id)
);

/*==============================================================*/
/* Table: tipo_veiculo                                          */
/*==============================================================*/
create table tipo_veiculo (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   status               bool                 null,
   constraint PK_TIPO_VEICULO primary key (id)
);

/*==============================================================*/
/* Table: carga_iseg                                       */
/*==============================================================*/
create table carga_iseg (
   id                   int8                 not null,
   descricao            varchar(50)          null,
   status               bool                 null,
   constraint PK_CARGA_ISEG primary key (id)
);



/*==============================================================*/
/* Table: resposta_perfil                                     */ 
/*==============================================================*/ 
-- Column: orcamento_seguro_id

-- ALTER TABLE automovel_servico DROP COLUMN coberturas_iseg_id;

ALTER TABLE resposta_perfil ADD COLUMN orcamento_seguro_id bigint;

/*==============================================================*/
/* Table: proposta_anexo                                     */ 
/*==============================================================*/ 
-- Column: orcamento_seguradora_id

-- ALTER TABLE proposta_anexo DROP COLUMN coberturas_iseg_id;

ALTER TABLE proposta_anexo ADD COLUMN orcamento_seguradora_id bigint;

/*==============================================================*/
/* Table: automovel_servicos                                    */ 
/*==============================================================*/ 
-- Column: servicos_iseg_id

-- ALTER TABLE automovel_servicos DROP COLUMN servicos_iseg_id;

/*==============================================================*/
/* Table: acessorios                                            */
/*==============================================================*/
-- set table ownership
alter table acessorios owner to postgres;
alter table acessorios
   add constraint FK_ACESSORI_REFERENCE_DOMINIO_ foreign key (tipo_acessorio_id)
      references dominio_esp (id)
      on delete restrict on update restrict;
      
/*==============================================================*/      
/* Table: automovel_orc_acessorios                              */      
/*==============================================================*/      
-- set table ownership
alter table automovel_orc_acessorios owner to postgres;
alter table automovel_orc_acessorios
   add constraint FK_AUTOMOVE_REFERENCE_AUTOMOVE foreign key (automovel_orcamento_id)
      references automovel_orcamento (id)
      on delete restrict on update restrict;

alter table automovel_orc_acessorios
   add constraint FK_AUTOMOVE_REFERENCE_ACESSORI foreign key (acessorio_id)
      references acessorios (id)
      on delete restrict on update restrict;


/*==============================================================*/
/* Table: coberturas_iseg                                       */
/*==============================================================*/

-- set table ownership
alter table coberturas_iseg owner to postgres;
alter table coberturas_iseg
   add constraint FK_COBERTUR_REFERENCE_RAMO foreign key (ramo_id)
      references ramo (id)
      on delete restrict on update restrict;
      
/*==============================================================*/      
/* Table: servicos_iseg                                         */      
/*==============================================================*/      
-- set table ownership
alter table servicos_iseg owner to postgres;
alter table servicos_iseg
   add constraint FK_SERVICOS_REFERENCE_RAMO foreign key (ramo_id)
      references ramo (id)
      on delete restrict on update restrict;
      
/*==============================================================*/      
/* Table: automovel_orcamento                                   */      
/*==============================================================*/      
-- set table ownership
alter table automovel_orcamento owner to postgres;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_USOVEICULO_DOMINIO_ foreign key (uso_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_ORCA_AU_DOMINIO_ foreign key (tipo_combustivel_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_ORC_A_DOMINIO_ foreign key (categoria_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_AUTO_ORC_DOMINIO_ foreign key (tipo_franquia_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_ORC_DOMINIO_ foreign key (tipo_residencia_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_AUTO_DOMINIO_ foreign key (tipo_garagem_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_ORC_AUTO_DOMINIO_ foreign key (utilizacao_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_REF_AUTO_DOMINIO_ foreign key (tipo_financiamento_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_A_ORCAM_DOMINIO_ foreign key (modelo_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_REFERENCE_USUARIO foreign key (usuario_id)
      references usuario (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint FK_AUTOMOVE_REFERENCE_ORCAMENT foreign key (orcamento_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint fk_auto_orc_seguradora foreign key (seguradora_id)
      references seguradora (id)
      on delete restrict on update restrict;

alter table automovel_orcamento
   add constraint fk_veiculo_modelo foreign key (veiculo_modelo_id)
      references veiculo_modelo (id);
      
alter table automovel_orcamento
   add constraint fk_proprietario_arrendatario foreign key (proprietario_arrendatario_id)
      references proprietario_arrendatario (id);
      
alter table automovel_orcamento
   add constraint fk_proprietario_rastreador_iseg foreign key (rastreador_iseg_id)
      references rastreador_iseg (id);
      
alter table automovel_orcamento
   add constraint fk_proprietario_bloqueador_iseg foreign key (bloqueador_iseg_id)
      references bloqueador_iseg (id);

/*==============================================================*/
/* Table: proprietario_arrendatario                             */
/*==============================================================*/
-- set table ownership
alter table proprietario_arrendatario owner to postgres;
alter table proprietario_arrendatario
   add constraint FK_PROPRIET_REFERENCE_DOMINIO_ foreign key (relacao_seg_prop_id)
      references dominio_esp (id)
      on delete restrict on update restrict;
      
/*==============================================================*/
/* Table: automovel_proprietario                                */
/*==============================================================*/
-- set table ownership
alter table automovel_proprietario owner to postgres;
alter table automovel_proprietario
   add constraint FK_AUTOMOVE_REFERENCE_AUTO_ORC foreign key (automovel_orcamento_id)
      references automovel_orcamento (id)
      on delete restrict on update restrict;
      
alter table automovel_proprietario
   add constraint FK_AUTOMOVE_REFERENCE_AUTOMOVE foreign key (automovel_id)
      references automovel (id)
      on delete restrict on update restrict;
  

/*==============================================================*/
/* Table: resposta_perfil                                       */
/*==============================================================*/

alter table resposta_perfil
   add constraint fk_orcamento_seguro_id foreign key (orcamento_seguro_id)
      references orcamento_seguro (id);
    
/*==============================================================*/      
/* Table: orcamento_seguro                                      */      
/*==============================================================*/      
-- set table ownership
alter table orcamento_seguro owner to postgres;
alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_TIPO_COB foreign key (tipo_cobertura_id)
      references tipo_cobertura (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_GRUPO_DE foreign key (grupo_de_venda_id)
      references grupo_de_venda (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_USUARIO foreign key (usuario_id)
      references usuario (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_PRODUTOR foreign key (produtor_id)
      references produtor (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_ORCAMENT foreign key (orcamento_seguro_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_SITUACAO foreign key (situacao_id)
      references situacao (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_RAMO foreign key (ramo_id)
      references ramo (id)
      on delete restrict on update restrict;

alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_PESSOA foreign key (cliente_id)
      references pessoa (id)
      on delete restrict on update restrict;
      
alter table orcamento_seguro
   add constraint FK_ORCAMENT_REFERENCE_PROFISSAO foreign key (profissao_id)
      references profissao (id)
      on delete restrict on update restrict;
      
alter table orcamento_seguro 
   add constraint FK_ORCAMENT_REFERENCE_PROPOSTA foreign key (proposta_id) 
      references proposta (id)      
      on delete restrict on update restrict;      
      
      
/*==============================================================*/      
/* Table: orcamento_seguradora =================================*/
/*==============================================================*/
-- set table ownership
alter table orcamento_seguradora owner to postgres;
alter table orcamento_seguradora
   add constraint FK_ORCAMENT_REFERENCE_USUARIO foreign key (usuario_id)
      references usuario (id)
      on delete restrict on update restrict;

alter table orcamento_seguradora
   add constraint FK_ORCAMENT_REFERENCE_SEGURADO foreign key (seguradora_id)
      references seguradora (id)
      on delete restrict on update restrict;

alter table orcamento_seguradora
   add constraint FK_ORCAMENT_REFERENCE_ORCAMENT foreign key (orcamento_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;
      

/*==============================================================*/
/* Table: proposta_anexo                                        */
/*==============================================================*/
-- set table ownership
alter table proposta_anexo owner to postgres;
alter table proposta_anexo
   add constraint FK_PROPOSTA_REFERENCE_ORCAMENT foreign key (orcamento_seguradora_id)
      references orcamento_seguradora (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: orcamento_franquias                                   */
/*==============================================================*/

-- set table ownership
alter table orcamento_franquias owner to postgres;
alter table orcamento_franquias
   add constraint FK_ORCAMENT_REFERENCE_ORCAMENT foreign key (orcamento_seguradora_id)
      references orcamento_seguradora (id)
      on delete restrict on update restrict;

alter table orcamento_franquias
   add constraint FK_ORCAMENT_REFERENCE_DOMINIO_ foreign key (tipo_franquia_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: parcelas_orcamento                                    */
/*==============================================================*/

alter table parcelas_orcamento
   add constraint fkOrcamentoFranquiasId foreign key (orcamento_franquias_id)
      references orcamento_franquias (id);
      
/*==============================================================*/
/* Table: orcamento_servicos                                    */
/*==============================================================*/

-- set table ownership
alter table orcamento_servicos owner to postgres;

alter table orcamento_servicos
   add constraint FK_ORCAMENT_REFERENCE_USUARIO foreign key (usuario_id)
      references usuario (id)
      on delete restrict on update restrict;

alter table orcamento_servicos
   add constraint FK_ORCAMENT_REFERENCE_SERVICOS foreign key (servicos_iseg_id)
      references servicos_iseg (id)
      on delete restrict on update restrict;

alter table orcamento_servicos
   add constraint FK_ORCAMENT_REFERENCE_ORCAMENT foreign key (orcamento_seguradora_id)
      references orcamento_seguradora (id)
      on delete restrict on update restrict;


/*==============================================================*/
/* Table: orcamento_cobertura                                   */
/*==============================================================*/

-- set table ownership
alter table orcamento_cobertura owner to postgres;
alter table orcamento_cobertura
   add constraint FK_ORCAMENT_REFERENCE_COBERTUR foreign key (coberturas_id)
      references coberturas (id)
      on delete restrict on update restrict;

alter table orcamento_cobertura
   add constraint FK_ORCAMENT_REFERENCE_USUARIO foreign key (usuario_id)
      references usuario (id)
      on delete restrict on update restrict;

alter table orcamento_cobertura
   add constraint FK_ORCAMENT_REFERENCE_COB_ISEG foreign key (coberturas_iseg_id)
      references coberturas_iseg (id)
      on delete restrict on update restrict;

alter table orcamento_cobertura
   add constraint FK_ORCAMENT_REFERENCE_ORCAMENT foreign key (orcamento_seguradora_id)
      references orcamento_seguradora (id)
      on delete restrict on update restrict;


/*==============================================================*/
/* Table: orcamento_servicos_iseg                               */
/*==============================================================*/

-- set table ownership
alter table orcamento_servicos_iseg owner to postgres;
alter table orcamento_servicos_iseg
   add constraint fk_orcament_reference_orcament foreign key (orcamento_seguro_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;

alter table orcamento_servicos_iseg
   add constraint fk_orcament_reference_servicos foreign key (servicos_iseg_id)
      references servicos_iseg (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: orcamento_cobertura_iseg                              */
/*==============================================================*/
-- set table ownership
alter table orcamento_cobertura_iseg owner to postgres;
alter table orcamento_cobertura_iseg
   add constraint fk_orcament_reference_cobertur foreign key (coberturas_iseg_id)
      references coberturas_iseg (id)
      on delete restrict on update restrict;

alter table orcamento_cobertura_iseg
   add constraint fk_orcament_reference_orcament foreign key (orcamento_seguro_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;
      
/*==============================================================*/
/* Table: corretora_coberturas_iseg                             */
/*==============================================================*/

alter table corretora_coberturas_iseg
   add constraint FK_CORRETOR_REFERENCE_COBERTUR foreign key (coberturas_iseg_id)
      references coberturas_iseg (id)
      on delete restrict on update restrict;

alter table corretora_coberturas_iseg
   add constraint FK_CORRETOR_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;
      
      
/*==============================================================*/
/* Table: seguradoras_prefer                                    */
/*==============================================================*/

alter table seguradoras_prefer
   add constraint FK_SEGURADO_REFERENCE_SEGURADO foreign key (seguradora_id)
      references seguradora (id)
      on delete restrict on update restrict;

alter table seguradoras_prefer
   add constraint FK_SEGURADO_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: corretora_servicos_iseg                               */
/*==============================================================*/
alter table corretora_servicos_iseg
   add constraint FK_CORRETOR_REFERENCE_SERVICOS foreign key (servicos_iseg_id)
      references servicos_iseg (id)
      on delete restrict on update restrict;

alter table corretora_servicos_iseg
   add constraint FK_CORRETOR_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;

      
/*==============================================================*/
/* Table: coberturas                                            */      
/*==============================================================*/      
-- Column: coberturas_iseg_id

-- ALTER TABLE coberturas DROP COLUMN coberturas_iseg_id;

ALTER TABLE coberturas ADD COLUMN coberturas_iseg_id bigint;

alter table coberturas
   add constraint FK_COBERTUR_REFERENCE_COBERTUR foreign key (coberturas_iseg_id)
      references coberturas_iseg (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: servicos                                              */      
/*==============================================================*/ 
-- Column: coberturas_iseg_id

-- ALTER TABLE servicos DROP COLUMN coberturas_iseg_id;

ALTER TABLE servicos ADD COLUMN servicos_iseg_id bigint;

alter table servicos
   add constraint FK_SERVICOS_REFERENCE_SERVICOS foreign key (servicos_iseg_id)
      references servicos_iseg (id)
      on delete restrict on update restrict;


/*==============================================================*/
/* Table: automovel_cobertura                                   */ 
/*==============================================================*/ 
-- Column: coberturas_iseg_id

-- ALTER TABLE automovel_cobertura DROP COLUMN coberturas_iseg_id;

ALTER TABLE automovel_cobertura ADD COLUMN coberturas_iseg_id bigint;

alter table automovel_cobertura
   add constraint FK_AUTOMOVE_REFERENCE_COBERTUR foreign key (coberturas_iseg_id)
      references coberturas_iseg (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: automovel_servico                                     */ 
/*==============================================================*/ 
-- Column: coberturas_iseg_id

-- ALTER TABLE automovel_servico DROP COLUMN coberturas_iseg_id;

ALTER TABLE automovel_servicos ADD COLUMN servicos_iseg_id bigint;

alter table automovel_servicos
  add constraint FK_AUTOMOVE_REFERENCE_SERVICOS foreign key (servicos_iseg_id)
     references servicos_iseg (id)
     on delete restrict on update restrict;

/*==============================================================*/      
/* Table: pessoa_fisica                                         */ 
/*==============================================================*/ 
ALTER TABLE pessoa_fisica ADD COLUMN profissao_id bigint;
alter table pessoa_fisica
   add constraint FK_PESSOA_FIS_REFERENCE_PROFISSAO foreign key (profissao_id)
      references profissao (id)
      on delete restrict on update restrict;
      
     
/*==============================================================*/     
/* Table: proposta                                              */     
/*==============================================================*/
ALTER TABLE proposta ADD COLUMN versao int2;       
ALTER TABLE proposta ADD COLUMN orcamento_seguro_id bigint;     

alter table proposta
   add constraint fk_proposta_reference_orcamento_seguro foreign key (orcamento_seguro_id)      
      references orcamento_seguro (id)      
      on delete restrict on update restrict;
      
/*==============================================================*/     
/* Table: condutor                                              */     
/*==============================================================*/           
ALTER TABLE condutor ADD COLUMN is_condutor_principal boolean; 
ALTER TABLE condutor ADD COLUMN orcamento_seguro_id bigint; 
ALTER TABLE condutor ADD COLUMN profissao_id bigint;
ALTER TABLE condutor ADD COLUMN escolaridade_id bigint;
ALTER TABLE condutor ADD COLUMN relacao_condutor_seg_id bigint;
ALTER TABLE condutor ADD COLUMN email varchar(50);


alter table condutor
 add constraint fk_condutor_reference_orcamento_seguro foreign key (orcamento_seguro_id)
    references orcamento_seguro (id)      
    on delete restrict on update restrict;

alter table condutor
 add constraint fk_condutor_reference_profissao foreign key (profissao_id)
    references profissao (id)      
    on delete restrict on update restrict;
    
alter table condutor
 add constraint fk_condutor_reference_escolaridade foreign key (escolaridade_id)
    references escolaridade (id)      
    on delete restrict on update restrict;
    
alter table condutor
 add constraint fk_condutor_reference_dominio_esp foreign key (relacao_condutor_seg_id)
    references dominio_esp (id)      
    on delete restrict on update restrict;
    
/*==============================================================*/     
/* Table: coberturas                                            */     
/*==============================================================*/ 
ALTER TABLE coberturas ADD COLUMN codigo_na_seguradora character varying(20);

/*==============================================================*/     
/* Table: servicos                                              */     
/*==============================================================*/ 
ALTER TABLE servicos ADD COLUMN codigo_na_seguradora character varying(20);

/*==============================================================*/ 
/* Table: automovel                                             */ 
/*==============================================================*/ 

ALTER TABLE automovel ADD COLUMN is_apolice_cancelada boolean;
ALTER TABLE automovel ADD COLUMN  motivo character varying(255) null;
ALTER TABLE automovel ADD COLUMN qtdSinistro INT2;
ALTER TABLE automovel ADD COLUMN  observacao character varying(255) null;
ALTER TABLE automovel ADD COLUMN is_zero_km boolean;
ALTER TABLE automovel ADD COLUMN is_segurado_proprietario boolean;
ALTER TABLE automovel ADD COLUMN is_kit_gas boolean;
ALTER TABLE automovel ADD COLUMN  nome_banco character varying(50) null;
ALTER TABLE automovel ADD COLUMN  cnpj_banco character varying(20) null;
ALTER TABLE automovel ADD COLUMN lmi_normal numeric(14,2) null;
ALTER TABLE automovel ADD COLUMN lmi_reduzido numeric(14,2) null;
ALTER TABLE automovel ADD COLUMN tipo_financiamento_id bigint null;
ALTER TABLE automovel ADD COLUMN uso_veiculo_id bigint null;
ALTER TABLE automovel ADD COLUMN proprietario_arrendatario_id bigint null;
ALTER TABLE automovel ADD COLUMN rastreador_iseg_id bigint null;
ALTER TABLE automovel ADD COLUMN bloqueador_iseg_id bigint null;
ALTER TABLE automovel ADD COLUMN  outro_rastreador character varying(50) null;
ALTER TABLE automovel ADD COLUMN  outro_bloqueador character varying(50) null;
ALTER TABLE automovel ADD COLUMN semireboque_iseg_id bigint null;
ALTER TABLE automovel ADD COLUMN tipo_veiculo_id bigint null;
ALTER TABLE automovel ADD COLUMN carroceria_iseg_id bigint null;
ALTER TABLE automovel ADD COLUMN carga_iseg_id bigint null;
ALTER TABLE automovel ADD COLUMN eixos int2 null;
ALTER TABLE automovel ADD COLUMN qtd_portas int2 null;

ALTER TABLE automovel
  ADD CONSTRAINT fk_tipo_financiamento FOREIGN KEY (tipo_financiamento_id)
      REFERENCES dominio_esp (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
ALTER TABLE automovel
  ADD CONSTRAINT fk_uso_veiculo FOREIGN KEY (uso_veiculo_id)
      REFERENCES dominio_esp (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
ALTER TABLE automovel
  ADD CONSTRAINT fk_proprietario_arrendatario_automovel FOREIGN KEY (proprietario_arrendatario_id)
      REFERENCES proprietario_arrendatario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
alter table automovel
   add constraint FK_AUTOMOVE_REFERENCE_SEMIREBO foreign key (semireboque_iseg_id)
      references semireboque_iseg (id)
      on delete restrict on update restrict;
      
alter table automovel
   add constraint FK_AUTOMOVE_REFERENCE_TIPO_VEI foreign key (tipo_veiculo_id)
      references tipo_veiculo (id)
      on delete restrict on update restrict;

alter table automovel
   add constraint FK_AUTOMOVE_REFERENCE_CARROCER foreign key (carroceria_iseg_id)
      references carroceria_iseg (id)
      on delete restrict on update restrict;
      
alter table automovel
   add constraint FK_AUTOMOVE_REFERENCE_CARGA foreign key (carga_iseg_id)
      references carga_iseg (id)
      on delete restrict on update restrict;
      
/*==============================================================*/ 
/* Table: acessorios                                            */ 
/*==============================================================*/ 

ALTER TABLE acessorios DROP COLUMN descricao;
ALTER TABLE acessorios ADD COLUMN descricao character varying(50);


/*==============================================================*/ 
/* Table: tipo_cobertura                                        */ 
/*==============================================================*/ 
ALTER TABLE tipo_cobertura DROP COLUMN descricao;

ALTER TABLE tipo_cobertura ADD COLUMN descricao character varying(30);

/*==============================================================*/ 
/* Table: orcamento_franquias                                   */ 
/*==============================================================*/ 
ALTER TABLE orcamento_franquias ADD COLUMN descricao character varying(100);
ALTER TABLE orcamento_franquias
  ADD CONSTRAINT fk_tipo_franquia_dominio_esp FOREIGN KEY (tipo_franquia_id)
      REFERENCES dominio_esp (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
/*==============================================================*/ 
/* Table: tipo_conta_relacionamento                             */ 
/*==============================================================*/ 
alter table tipo_conta_relacionamento
   add constraint FK_TIPO_CON_REFERENCE_BANCO_RE foreign key (banco_relacionamento_id)
      references banco_relacionamento (id)
      on delete restrict on update restrict;

/*==============================================================*/ 
/* Table: orcamento_bancos                                      */ 
/*==============================================================*/       

alter table orcamento_bancos
   add constraint FK_ORCAMENT_REFERENCE_BANCO_RE foreign key (banco_relacionamento_id)
      references banco_relacionamento (id)
      on delete restrict on update restrict;

alter table orcamento_bancos
   add constraint FK_ORC_BANCO_REFERENCE_ORCAMENTO foreign key (orcamento_seguro_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;
      
alter table orcamento_bancos
   add constraint FK_ORCAMENT_REFERENCE_TIPO_CON foreign key (tipo_conta_relacionamento_id)
      references tipo_conta_relacionamento (id)
      on delete restrict on update restrict;
      
/*==============================================================*/ 
/* Table: proposta_bancos                                       */ 
/*==============================================================*/       

alter table proposta_bancos
   add constraint FK_PROPOSTA_REFERENCE_BANCO_RE foreign key (banco_relacionamento_id)
      references banco_relacionamento (id)
      on delete restrict on update restrict;

alter table proposta_bancos
   add constraint FK_PROPOSTA_REFERENCE_PROPOSTA foreign key (proposta_id)
      references proposta (id)
      on delete restrict on update restrict;

alter table proposta_bancos
   add constraint FK_PROPOSTA_REFERENCE_TIPO_CON foreign key (tipo_conta_relacionamento_id)
      references tipo_conta_relacionamento (id)
      on delete restrict on update restrict;

/*==============================================================*/ 
/* Table: automovel_prop_acessorios                             */ 
/*==============================================================*/    
alter table automovel_prop_acessorios
   add constraint FK_AUTOMOVE_REFERENCE_AUTOMOVE foreign key (automovel_id)
      references automovel (id)
      on delete restrict on update restrict;

alter table automovel_prop_acessorios
   add constraint FK_AUTOMOVE_REFERENCE_ACESSORI foreign key (acessorio_id)
      references acessorios (id)
      on delete restrict on update restrict;


/*==============================================================*/
/* Table: perfil_proposta                                       */
/*==============================================================*/
alter table perfil_proposta
   add constraint FK_PERFIL_P_REFERENCE_DOMTPGARAGEM foreign key (tipo_garagem_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_proposta
   add constraint FK_PERFIL_P_REFERENCE_DOMTPRESDID foreign key (tipo_residencia_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_proposta
   add constraint FK_PERFIL_P_REFERENCE_DOMUTVEI foreign key (utilizacao_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_proposta
   add constraint FK_PERFIL_P_REFERENCE_PROPOSTA foreign key (proposta_id)
      references proposta (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: perfil_orcamento                                      */
/*==============================================================*/
alter table perfil_orcamento
   add constraint FK_PERFIL_O_REFERENCE_TIPOG foreign key (tipo_garagem_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_orcamento
   add constraint FK_PERFIL_O_REFERENCE_UTIVEIC foreign key (utilizacao_veiculo_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_orcamento
   add constraint FK_PERFIL_O_REFERENCE_TIPORES foreign key (tipo_residencia_id)
      references dominio_esp (id)
      on delete restrict on update restrict;

alter table perfil_orcamento
   add constraint FK_PERFIL_O_REFERENCE_ORCAMENT foreign key (orcamento_seguro_id)
      references orcamento_seguro (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: servicos_email                                        */
/*==============================================================*/
alter table servicos_email
   add constraint FK_SERVICOS_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;
      
/*==============================================================*/
/* Table: template_mensagem                                        */
/*==============================================================*/
alter table template_mensagem
   add constraint FK_TEMPLATE_REFERENCE_TIPO_MEN foreign key (tipo_mensagem_id)
      references tipo_mensagem (id)
      on delete restrict on update restrict;

alter table template_mensagem
   add constraint FK_TEMPLATE_REFERENCE_CORRETOR foreign key (corretora_id)
      references corretora (id)
      on delete restrict on update restrict;

/*==============================================================*/
/* Table: corretora                                             */
/*==============================================================*/
ALTER TABLE corretora ADD COLUMN is_orcamento_cobertura boolean null;
ALTER TABLE corretora ADD COLUMN is_orcamento_por_email boolean null;
ALTER TABLE corretora ADD COLUMN is_orcamento_sms_cliente boolean null;
ALTER TABLE corretora ADD COLUMN is_orcamento_sms_produtor boolean null;
      
/*=============================================================*/
/*=====================SEQUENCIAS==============================*/
/*=============================================================*/

CREATE SEQUENCE seq_automovel_orc_acessorios
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_automovel_orc_acessorios OWNER TO postgres;

CREATE SEQUENCE seq_automovel_prop_acessorios
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_automovel_prop_acessorios OWNER TO postgres;

CREATE SEQUENCE seq_automovel_orcamento
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_automovel_orcamento OWNER TO postgres;

CREATE SEQUENCE seq_automovel_proprietario
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_automovel_proprietario OWNER TO postgres;

CREATE SEQUENCE seq_cobertura_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_cobertura_iseg OWNER TO postgres;

CREATE SEQUENCE seq_coberturas_cotacao
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_coberturas_cotacao OWNER TO postgres;

CREATE SEQUENCE seq_corretora_coberturas_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 10
  CACHE 1;
ALTER TABLE seq_corretora_coberturas_iseg OWNER TO postgres;

CREATE SEQUENCE seq_corretora_servicos_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 10
  CACHE 1;
ALTER TABLE seq_corretora_servicos_iseg OWNER TO postgres;

CREATE SEQUENCE seq_orcamento
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_cobertura
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 200
  CACHE 1;
ALTER TABLE seq_orcamento_cobertura OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_cobertura_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_cobertura_iseg OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_franquias
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_franquias OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_seguradora
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_seguradora OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_seguro
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_seguro OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_servicos
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 200
  CACHE 1;
ALTER TABLE seq_orcamento_servicos OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_servicos_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_servicos_iseg OWNER TO postgres;

CREATE SEQUENCE seq_parcelas_orcamento
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_parcelas_orcamento OWNER TO postgres;

CREATE SEQUENCE seq_profissao
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_profissao OWNER TO postgres;

CREATE SEQUENCE seq_proprietario_arrendatario
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_proprietario_arrendatario OWNER TO postgres;

CREATE SEQUENCE seq_seguradora_coberturas
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_seguradora_coberturas OWNER TO postgres;

CREATE SEQUENCE seq_seguradora_servicos
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_seguradora_servicos OWNER TO postgres;

CREATE SEQUENCE seq_seguradoras_prefer
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 10
  CACHE 1;
ALTER TABLE seq_seguradoras_prefer OWNER TO postgres;


CREATE SEQUENCE seq_servicos_cotacao
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_servicos_cotacao OWNER TO postgres;

CREATE SEQUENCE seq_servicos_iseg
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_servicos_iseg OWNER TO postgres;

CREATE SEQUENCE seq_situacao
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_situacao OWNER TO postgres;

CREATE SEQUENCE seq_tipo_cobertura
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_tipo_cobertura OWNER TO postgres;

CREATE SEQUENCE seq_orcamento_bancos
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_orcamento_bancos OWNER TO postgres;

CREATE SEQUENCE seq_proposta_bancos
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_proposta_bancos OWNER TO postgres;

CREATE SEQUENCE seq_perfil_orcamento
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_perfil_orcamento OWNER TO postgres;

CREATE SEQUENCE seq_perfil_proposta
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE seq_perfil_proposta OWNER TO postgres;

/*===========================INSERCAO=======================*/
/*===========================SITUACAO=======================*/
INSERT INTO situacao (id, descricao, is_ativo) VALUES (1, 'PEDIDO DE CALCULO', true);
INSERT INTO situacao (id, descricao, is_ativo) VALUES (2, 'CALCULANDO', true);
INSERT INTO situacao (id, descricao, is_ativo) VALUES (3, 'CALCULADO', true);
INSERT INTO situacao (id, descricao, is_ativo) VALUES (4, 'EFETIVADO', true);
INSERT INTO situacao (id, descricao, is_ativo) VALUES (5, 'VERSIONADO', true);
INSERT INTO situacao (id, descricao, is_ativo) VALUES (6, 'CANCELADO', true);


INSERT INTO dominio (id, is_recursivo, nome) VALUES (14, 0, 'USOVEICULO');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (15, 0, 'RELACAOSEGURADOPROPRIETARIO');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (16, 0, 'TIPOFINANCIAMENTO');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (12212, 0, 'TIPORESIDENCIA');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (12213, 0, 'TIPOGARAGEM');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (12214, 0, 'UTILIZACAOVEICULO');
INSERT INTO dominio (id, is_recursivo, nome) VALUES (12215, 0, 'TIPOFRANQUIA');



INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11937, NULL, 0, NULL, 'SOMENTE NA FACULDADE', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11938, NULL, 0, NULL, 'NA RESIDÊNCIA/TRABALHO/FACULDADE', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11930, NULL, 0, NULL, 'LEASING', 16, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11929, NULL, 0, NULL, 'CDC', 16, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11928, NULL, 0, NULL, 'NAO', 16, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11921, NULL, 0, NULL, 'COMERCIAL', 14, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11922, NULL, 0, NULL, 'PASSEIO', 14, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11923, NULL, 0, NULL, 'CONJUGE', 15, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11924, NULL, 0, NULL, 'EMPREGADO', 15, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11925, NULL, 0, NULL, 'FILHO', 15, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11926, NULL, 0, NULL, 'IRMÃO', 15, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11927, NULL, 0, NULL, 'PAI/MÃE', 15, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11931, NULL, 0, NULL, 'APARTAMENTO', 12212, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11932, NULL, 0, NULL, 'CASA', 12212, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11933, NULL, 0, NULL, 'CONDOM͍NIO FECHADO', 12212, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11934, NULL, 0, NULL, 'OUTROS', 12212, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11935, NULL, 0, NULL, 'SOMENTE NA RESIDÊNCIA', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11939, NULL, 0, NULL, 'NA RESIDÊNCIA/TRABALHO', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11940, NULL, 0, NULL, 'NA RESIDÊNCIA/FACULDADE', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11941, NULL, 0, NULL, 'NO TRABALHO/FACULDADE', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11936, NULL, 0, NULL, 'SOMENTE NO TRABALHO', 12213, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11942, NULL, 0, NULL, 'LAZER', 12214, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11943, NULL, 0, NULL, 'IDA E VOLTA AO TRABALHO', 12214, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11944, NULL, 0, NULL, 'ESTUDO - COLÉGIO/FACULDADE/PÓS', 12214, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11945, NULL, 0, NULL, 'PROFISSIONAL (USO COMERCIAL)', 12214, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11946, NULL, 0, NULL, 'SEGURANCA', NULL, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11947, NULL, 0, NULL, 'OPCIONAIS', NULL, NULL);

INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11948, NULL, 0, NULL, 'REDUZIDA', 12215, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11949, NULL, 0, NULL, 'NORMAL', 12215, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11950, NULL, 0, NULL, 'REDUZIDA I', 12215, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11951, NULL, 0, NULL, 'REDUZIDA II', 12215, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11952, NULL, 0, NULL, 'MAJORADA I', 12215, NULL);
INSERT INTO dominio_esp (id, data_exclusao, excluido, is_veicular, valor, dominio_id, dominio_esp_pai_id) VALUES (11953, NULL, 0, NULL, 'MAJORADA II', 12215, NULL);

INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (180, false, 'RCF - DANOS MATERIAIS', 'RESPONSABILIDADE CIVIL FACULTATIVA DO VEÍCULO (RCF-V) - DANOS MATERIAIS A TERCEIROS', 'Garante o reembolso das indenizações que o Segurado for obrigado a pagar por danos materiais, causados involuntariamente a terceiros, além de despesas com custas judiciais e honorários de advogados, desde que decorram de reclamações relacionadas com os riscos cobertos.', 1, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (181, false, 'RCF - DANOS CORPORAIS', 'RESPONSABILIDADE CIVIL FACULTATIVA DO VEÍCULO (RCF-V) - DANOS DANOS CORPORAIS A TERCEIROS', 'Garante o reembolso das indenizações que o Segurado for obrigado a pagar por danos corporais, causados involuntariamente a terceiros, além de despesas com custas judiciais e honorários de advogados, desde que decorram de reclamações relacionadas com os riscos cobertos.', 2, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (176, false, 'APP - MORTE', 'ACIDENTE PESSOAIS DE PASSAGEIRO (APP) - MORTE', 'Garante o pagamento de indenizações por morte dos passageiros do veículo, incluindo o Segurado, decorrentes de acidentes pessoais com os mesmos, de acordo com os riscos cobertos.', 3, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (177, false, 'APP - INVALIDEZ', 'ACIDENTE PESSOAIS DE PASSAGEIRO (APP) - INVALIDEZ', 'Garante o pagamento de indenizações por invalidez permanente, parcial ou total, dos passageiros do veículo, incluindo o Segurado, decorrentes de acidentes pessoais com os mesmos, de acordo com os riscos cobertos.', 4, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (179, false, 'DANOS MORAIS', '', 'Garante ao Segurado, até o Limite Máximo de Indenização estipulado na apólice para a mesma, o reembolso de indenização por danos morais causados a terceiros pelos quais o Segurado venha a ser responsabilizado civilmente em sentença judicial transitada em julgado ou em acordo judicial autorizado de modo expresso pela Seguradora, que decorram direta e estritamente de danos corporais decorrentes de acidente de trânsito coberto e indenizável envolvendo o veículo segurado.', 6, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (186, false, 'SEGURO DA FRANQUIA', '', 'Garante ao Segurado, exclusivamente no primeiro sinistro de perda parcial coberto e indenizável, o pagamento do valor integral da franquia estipulada na apólice para o veículo segurado.', 7, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (187, false, 'RCF - GARANTIA ÚNICA', '', 'Garante o reembolso das indenizações que o Segurado for obrigado a pagar por danos materiais e/ou danos corporais, causados involuntariamente a terceiros, além de despesas com custas judiciais e honorários de advogados, desde que decorram de reclamações relacionadas com os riscos cobertos.', 8, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (188, false, 'DESPESAS EXTRAORDINÁRIAS', '', 'Garante o pagamento de despesas extras, independentemente de comprovação, decorrentes exclusivamente de sinistro coberto de indenização integral (colisão, incêndio, roubo ou furto).', 9, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (189, false, 'BLINDAGEM', '', 'Garante, na ocorrência de um dos riscos previstos na cobertura contratada para o veículo, cobertura securitária para a blindagem.', 10, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (192, false, 'CARROCERIA', '', 'Com esta cobertura, a carroceria do veículo segurado está garantida contra os riscos cobertos.', 13, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (185, false, 'RESP CIVL FAMILIAR', 'RESPONSABILIDADE CIVIL FAMILIAR', 'Garante o reembolso pela Seguradora, das quantias pagas pelo proprietário ou locatário do imóvel segurado, relativas às reparações por danos corporais e/ou materiais involuntariamente causados a terceiros, por negligência ou imprudência do próprio segurado, seu cônjuge, de filhos menores que estiverem sob sua responsabilidade e de empregados no exercício do trabalho, e pelos objetos ou seu lançamento em lugar indevido.', 29, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (210, false, 'VENDAVAL', '', NULL, 32, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (195, false, 'DIÁRIAS POR INDISPONIBILIDADE', '', 'Garante ao Segurado, recebimento do valor de diárias contratadas, por período máximo especificado (normalmente 15 ou 30 dias).', 16, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (196, false, 'OPERAÇÃO DE BASCULAMENTO', '', 'Garante ao Segurado, cobertura para o veículo e sua carroceria para acidentes que ocorrerem aos mesmos durante a operação de basculamento.', 17, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (190, false, 'ACESSÓRIOS', '', 'Garante, na ocorrência de um dos riscos previstos na cobertura contratada para o veículo, cobertura securitária para acessórios fixados em caráter permanente no veículo segurado.', 11, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (191, false, 'EQUIPAMENTOS', '', 'Garante, na ocorrência de um dos riscos previstos na cobertura contratada para o veículo, cobertura securitária para equipamentos, desde que eles estejam no veículo fixados em caráter permanente.', 12, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (193, false, 'RCTR INTERNO', 'DANOS MATERIAIS E/OU DANOS CORPORAIS A TERCEIROS TRANSPORTADOS (RCTR INTERNO)', 'Garante ao segurado, reembolso das indenizações que o Segurado for obrigado a pagar por danos materiais e/ou danos corporais, causados involuntariamente a terceiros transportados (passageiros), além das despesas com custas judiciais e honorários de advogados, desde que as reclamações decorram de acidentes de trânsito e estejam relacionadas com os riscos  cobertos.', 14, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (194, false, 'RCTR EXTERNO', 'DANOS MATERIAIS E/OU DANOS CORPORAIS A TERCEIROS NÃO-TRANSPORTADOS (RCTR EXTERNO)', 'Garante o segurado, reembolso das indenizações que o Segurado for obrigado a pagar por danos materiais e/ou danos corporais, causados involuntariamente a terceiros não-transportados (externos), além das despesas com custas judiciais e honorários de advogados, desde que as reclamações decorram de acidentes de trânsito e estejam relacionadas com os riscos cobertos.', 15, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (197, false, 'EXTENSÃO DE PERÍMETRO', '', 'Garante ao segurado, cobertura a prejuízos causados a terceiros em qualquer país da América do Sul.', 18, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (198, false, 'CARTA VERDE', '', 'Garante ao segurado, cobertura de Responsabilidade Civil por danos pessoais e materiais causados a terceiros não transportados pelo veículo segurado em viagem internacional no âmbito do Mercosul.', 19, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (199, false, 'EXT COB VEÍCULOS REBOCADOS', 'EXTENSÃO DE COBERTURA PARA VEÍCULOS REBOCADOS', 'Garante ao Segurado, reembolso das quantias que for obrigado a pagar em decorrência de danos materiais causados exclusivamente a veículos rebocados (automotor de via terrestre), durante a operação de reboque, desde que o acidente se verifique fora dos locais de propriedade do Segurado ou por ele ocupados.', 20, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (200, false, 'REPOSIÇÃO VEÍCULO NOVO', '', 'Garante ao segurado, indenização integral corresponderá ao valor de mercado de veículo 0KM de mesmas características do veículo segurado.', 21, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (201, false, 'EXTENSÃO DE REBOQUE', '', 'Garante ao segurado, reboque ou transporte do veículo segurado.', 22, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (202, false, 'GARANTIA DE COBERTURA', '', 'Garante ao Segurado, quando houver indenização integral do veículo segurado, cobertura securitária para o novo veículo que ele venha a adquirir pelo período que restar para término de vigência da apólice.', 23, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (203, false, 'RECEITA GARANTIDA', '', 'Garante ao Segurado o pagamento de uma quantia fixa em reais, de acordo com o valor por ele contratado e estipulado na apólice, como remuneração pelos dias em que o veículo segurado ficar paralisado, em decorrência de sinistro coberto e indenizável.', 24, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (204, false, 'KIT GÁS', 'COBERTURA DE KIT GÁS', 'Garante cobertura do kit gás (devidamente homologado pelos órgãos públicos competentes) fixado no veículo segurado em caráter permanente.', 25, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (205, false, 'REP INDUMENTÁRIA DE PROTEÇÃO', 'REPOSIÇÃO DE INDUMENTÁRIA DE PROTEÇÃO', 'Garante ao Segurado, reembolso para custear despesas que ele venha a ter por danos causados em seu vestuário de proteção, em virtude de sinistro coberto de colisão parcial ou colisão total envolvendo a motocicleta segurada.', 26, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (206, false, 'DECESSOS', '', 'Garante, na ocorrência de acidente de trânsito com o veículo segurado onde qualquer de seus ocupantes venha a falecer, assistência à família do falecido ou reembolso de desepesas com sepultamento.', 27, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (207, false, 'DESEMPREGO E MORTE ACIDENTAL', '', 'Garante ao segurado o pagamento do capital contratado ao(s) Segurado(s) / Beneficiário(s), caso ocorra o evento coberto.', 28, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (208, false, 'INCÊNDIO, RAIO E EXPLOSÃO', '', NULL, 30, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (209, false, 'DANOS ELÉTRICOS E RAIO', 'DANOS ELÉTRICOS E RAIO FORA DO LOCAL', 'DANOS ELÉTRICOS E RAIO FORA DO LOCAL', 31, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (211, false, 'SUBTRAÇÃO DE BENS', '', NULL, 33, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (178, false, 'APP - DMH', 'ACIDENTE PESSOAIS DE PASSAGEIRO (APP) - DESPESAS MÉDICO-HOSPITALARES (DMH)', 'Garante o reembolso, limitado ao capital segurado, de despesas médicas e hospitalares dos passageiros do veículo, incluindo o Segurado, decorrentes de acidentes pessoais com os mesmos, de acordo com os riscos cobertos.', 5, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (212, NULL, 'PERDA OU ROUBO DE CARTÃO', 'PERDA OU ROUBO DE CARTÃO DE CRÉDITO / DÉBITO', 'Isenção de pagamento de compras indevidas não reconhecidas pelo segurado nas 72 horas anteriores a comunicação, da perda, furto ou roubo do cartão, limitado ao valor da cobertura de seguro.', 34, NULL, '1', true, 2);
INSERT INTO coberturas_iseg (id, informa_franquia, descricao, nome_longo, informacao, sequencia, tipo_cobertura, status, is_ativa, ramo_id) VALUES (213, NULL, 'PERDA OU PAGAMENTO DE ALUGUEL', NULL, '1. Quando o Segurado for o proprietário do imóvel: a indenização cobre a despesa com aluguel que ele tiver de pagar a terceiros, caso seja compelido a alugar outro imóvel para se instalar, ou cobre o aluguel que ele deixar de receber caso o contrato de locação não preveja cláusula responsabilizando o locatário pela continuidade do pagamento. 2. Quando o Segurado for o inquilino: cobre o pagamento do aluguel ao proprietário do imóvel se o contrato de locação obrigar à continuidade do seu pagamento após a ocorrência de sinistro.', 35, NULL, '1', true, 2);

INSERT INTO servicos_iseg (id, informa_descricao, informa_franquia, descricao, sequencia, status, is_ativa, ramo_id) VALUES (92, NULL, false, 'ASSISTÊNCIA 24 HORAS', 1, '1', true, 2);
INSERT INTO servicos_iseg (id, informa_descricao, informa_franquia, descricao, sequencia, status, is_ativa, ramo_id) VALUES (93, NULL, false, 'VIDROS', 3, '1', true, 2);
INSERT INTO servicos_iseg (id, informa_descricao, informa_franquia, descricao, sequencia, status, is_ativa, ramo_id) VALUES (98, NULL, false, 'CARRO RESERVA', 2, '1', true, 2);
INSERT INTO servicos_iseg (id, informa_descricao, informa_franquia, descricao, sequencia, status, is_ativa, ramo_id) VALUES (95, NULL, false, 'LANTERNAS,FARÓIS E RETROVISORES', 4, '1', true, 2);

INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (1, 10000.00, 374250, 176);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (2, 10000.00, 374250, 177);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (3, 10000.00, 374250, 178);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (4, 10000.00, 374250, 179);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (5, 10000.00, 374250, 180);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (6, 10000.00, 374250, 181);
INSERT INTO corretora_coberturas_iseg (id, lmi, corretora_id, coberturas_iseg_id) VALUES (10, 10000.00, 374250, 185);

INSERT INTO corretora_servicos_iseg (id, lmi, corretora_id, servicos_iseg_id) VALUES (2, 10000.00, 374250, 92);
INSERT INTO corretora_servicos_iseg (id, lmi, corretora_id, servicos_iseg_id) VALUES (3, 10000.00, 374250, 93);
INSERT INTO corretora_servicos_iseg (id, lmi, corretora_id, servicos_iseg_id) VALUES (5, 10000.00, 374250, 95);
INSERT INTO corretora_servicos_iseg (id, lmi, corretora_id, servicos_iseg_id) VALUES (8, 10000.00, 374250, 98);

INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (1, 11946, 'Alarme');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (2, 11946, 'Trava Mul-T-Lock');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (3, 11946, 'Rastreador');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (4, 11946, 'Dispositivo corta ignição e combustível');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (5, 11946, 'Trava Carneiro e Similares');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (6, 11946, 'Bloqueador');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (7, 11947, 'Direção Hidráulica');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (8, 11947, 'Banco de Couro');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (9, 11947, 'Cambio Automático');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (10, 11947, 'Ar Condicionado');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (11, 11947, 'Cambio Semi Automático');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (12, 11947, 'Freios Abs');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (13, 11947, 'Air Bag');
INSERT INTO acessorios (id, tipo_acessorio_id, descricao) VALUES (14, 11947, 'Direção Elétrica');

INSERT INTO tipo_cobertura (id, descricao, codigo_suzep) VALUES (1, 'COMPREENSIVA', NULL);
INSERT INTO tipo_cobertura (id, descricao, codigo_suzep) VALUES (2, 'INCÊNDIO E ROUBO', NULL);
INSERT INTO tipo_cobertura (id, descricao, codigo_suzep) VALUES (3, 'RCF/TERCEIROS', NULL);


INSERT INTO seguradoras_prefer (id, franquias, seguradora_id, corretora_id) VALUES (1, '11948/11949', 19481, 374250);
INSERT INTO seguradoras_prefer (id, franquias, seguradora_id, corretora_id) VALUES (2, '11948/11949', 15398, 374250);
INSERT INTO seguradoras_prefer (id, franquias, seguradora_id, corretora_id) VALUES (3, '11948/11949', 14, 374250);
INSERT INTO seguradoras_prefer (id, franquias, seguradora_id, corretora_id) VALUES (4, '11948/11949', 17690, 374250);

INSERT INTO perguntas_perfil (id, ordem, pergunta, tipo_resposta, perfil_id, is_ativa) VALUES (879509, 1, 'POSSUI FILHOS E/OU ENTEADOS DE ATÉ 17 ANOS?', 0, NULL, true);
INSERT INTO perguntas_perfil (id, ordem, pergunta, tipo_resposta, perfil_id, is_ativa) VALUES (879510, 2, 'EXISTEM RESIDENTES E/OU DEPENDENTES ENTRE 17 E 25 ANOS?', 0, NULL, true);
INSERT INTO perguntas_perfil (id, ordem, pergunta, tipo_resposta, perfil_id, is_ativa) VALUES (879511, 3, 'QUER COBERTURA DE SEGURO PARA QUALQUER CONDUTOR EVENTUAL ATÉ 25 ANOS?', 0, NULL, true);
INSERT INTO perguntas_perfil (id, ordem, pergunta, tipo_resposta, perfil_id, is_ativa) VALUES (879512, 4, 'INFORME A DATA DE NASCIMENTO DO MAIS NOVO', 2, NULL, true);

INSERT INTO banco_relacionamento (id, nome) VALUES (1, 'BRADESCO');
INSERT INTO banco_relacionamento (id, nome) VALUES (2, 'BANCO DO BRASIL');

INSERT INTO tipo_conta_relacionamento VALUES(1,'BENEFICIÁRIO DO INSS',1);
INSERT INTO tipo_conta_relacionamento VALUES(2,'CLICK CONTA BRADESCO',1);
INSERT INTO tipo_conta_relacionamento VALUES(3,'CONTA BÔNUS CELULAR BRADESCO',1);
INSERT INTO tipo_conta_relacionamento VALUES(4,'CONTA-CORRENTE',1);
INSERT INTO tipo_conta_relacionamento VALUES(5,'CONTA FÁCIL BRADESCO',1);
INSERT INTO tipo_conta_relacionamento VALUES(6,'CONTA INTERNACIONAL',1);
INSERT INTO tipo_conta_relacionamento VALUES(7,'CONTA-POUPANÇA',1);
INSERT INTO tipo_conta_relacionamento VALUES(8,'CONTA UNIVERSITÁRIA',1);
INSERT INTO tipo_conta_relacionamento VALUES(9,'DIGICONTA BRADESCO',1);

INSERT INTO profissao(id,descricao) VALUES(1,'ADMINISTRADOR'); 
INSERT INTO profissao(id,descricao) VALUES(2,'ADVOGADO'); 
INSERT INTO profissao(id,descricao) VALUES(3,'AGENTE ADMINISTRATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(4,'AGENTE E REPRESENTANTE COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(5,'AGRÔNOMO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(6,'ANALISTA DE SEGUROS E DE SEGURANÇA NO TRABALHO'); 
INSERT INTO profissao(id,descricao) VALUES(7,'ANALISTA DE SISTEMAS'); 
INSERT INTO profissao(id,descricao) VALUES(8,'ESPECIALISTA EM INFORMÁTICA'); 
INSERT INTO profissao(id,descricao) VALUES(9,'APRESENTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(10,'ATLETA, DESPORTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(11,'ATOR'); 
INSERT INTO profissao(id,descricao) VALUES(12,'BANCÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(13,'BIBLIOTECÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(14,'BIÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(15,'BOLSISTA'); 
INSERT INTO profissao(id,descricao) VALUES(16,'BOMBEIRO MILITAR'); 
INSERT INTO profissao(id,descricao) VALUES(17,'CANTOR E COMPOSITOR'); 
INSERT INTO profissao(id,descricao) VALUES(18,'CENÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(19,'CINEGRAFISTA'); 
INSERT INTO profissao(id,descricao) VALUES(20,'COMISSÁRIO DE BORDO'); 
INSERT INTO profissao(id,descricao) VALUES(21,'DECORADOR'); 
INSERT INTO profissao(id,descricao) VALUES(22,'DELEGADO DE POLÍCIA'); 
INSERT INTO profissao(id,descricao) VALUES(23,'DESENHISTA INDUSTRIAL (DESIGNER)'); 
INSERT INTO profissao(id,descricao) VALUES(24,'DESENHISTA TÉCNICO E MODELISTA'); 
INSERT INTO profissao(id,descricao) VALUES(25,'DIPLOMATA E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(26,'DIRETOR DE ORGANISMO NÃO-GOVERNAMENTAL'); 
INSERT INTO profissao(id,descricao) VALUES(27,'DIRETOR DE ESTABELECIMENTO DE ENSINO OU DE OUTRAS ORGANIZAÇÕES'); 
INSERT INTO profissao(id,descricao) VALUES(28,'DIRIGENTE DA ADMINISTRAÇÃO PÚBLICA'); 
INSERT INTO profissao(id,descricao) VALUES(29,'ECONOMISTA'); 
INSERT INTO profissao(id,descricao) VALUES(30,'EMPRESÁRIO E PRODUTOR DE ESPETÁCULOS'); 
INSERT INTO profissao(id,descricao) VALUES(31,'ENFERMEIRO DE NÍVEL SUPERIOR'); 
INSERT INTO profissao(id,descricao) VALUES(32,'ENGENHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(33,'FÍSICO'); 
INSERT INTO profissao(id,descricao) VALUES(34,'FONOAUDIÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(35,'GEÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(36,'GERENTE DE PRODUÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(37,'GERENTE OU SUPERVISOR'); 
INSERT INTO profissao(id,descricao) VALUES(38,'INSPETOR DE POLÍCIA'); 
INSERT INTO profissao(id,descricao) VALUES(39,'INSTRUTOR E PROFESSOR DE ESCOLAS LIVRES'); 
INSERT INTO profissao(id,descricao) VALUES(40,'JOALHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(41,'JORNALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(42,'JUIZ'); 
INSERT INTO profissao(id,descricao) VALUES(43,'LOCUTOR, COMENTARISTA'); 
INSERT INTO profissao(id,descricao) VALUES(44,'MATEMÁTICO'); 
INSERT INTO profissao(id,descricao) VALUES(45,'MÉDICO, ODONTÓLOGO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(46,'MILITAR DA AERONÁUTICA'); 
INSERT INTO profissao(id,descricao) VALUES(47,'MILITAR DA MARINHA'); 
INSERT INTO profissao(id,descricao) VALUES(48,'MILITAR DA RESERVA'); 
INSERT INTO profissao(id,descricao) VALUES(49,'MILITAR DO EXÉRCITO'); 
INSERT INTO profissao(id,descricao) VALUES(50,'MILITAR REFORMADO'); 
INSERT INTO profissao(id,descricao) VALUES(51,'MINISTRO DE TRIBUNAL'); 
INSERT INTO profissao(id,descricao) VALUES(52,'MOTORISTA'); 
INSERT INTO profissao(id,descricao) VALUES(53,'MÚSICO'); 
INSERT INTO profissao(id,descricao) VALUES(54,'OCUPANTE DE CARGO DE DIREÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(55,'OUTROS PROFISSIONAIS DO ESPETÁCULO E DAS ARTES'); 
INSERT INTO profissao(id,descricao) VALUES(56,'PEDAGOGO'); 
INSERT INTO profissao(id,descricao) VALUES(57,'PENSIONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(58,'PESCADOR'); 
INSERT INTO profissao(id,descricao) VALUES(59,'PILOTO DE AERONAVES'); 
INSERT INTO profissao(id,descricao) VALUES(60,'POLICIAL'); 
INSERT INTO profissao(id,descricao) VALUES(61,'PRESIDENTE DA REPÚBLICA'); 
INSERT INTO profissao(id,descricao) VALUES(62,'PRODUTOR NA EXPLORAÇÃO AGROPECUÁRIA'); 
INSERT INTO profissao(id,descricao) VALUES(63,'PROFESSOR DO ENSINO FUNDAMENTAL'); 
INSERT INTO profissao(id,descricao) VALUES(64,'PROFESSOR DO ENSINO MÉDIO'); 
INSERT INTO profissao(id,descricao) VALUES(65,'PROFESSOR DO ENSINO SUPERIOR'); 
INSERT INTO profissao(id,descricao) VALUES(66,'PROFISSIONAL DA EDUCAÇÃO FÍSICA (EXCETO PROFESSOR)'); 
INSERT INTO profissao(id,descricao) VALUES(67,'PROFISSIONAL DE MARKETING'); 
INSERT INTO profissao(id,descricao) VALUES(68,'PROPRIETÁRIO DE IMÓVEL, RECEBENDO RENDIMENTO DE ALUGUEL'); 
INSERT INTO profissao(id,descricao) VALUES(69,'PSICÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(70,'SACERDOTE'); 
INSERT INTO profissao(id,descricao) VALUES(71,'SENADOR'); 
INSERT INTO profissao(id,descricao) VALUES(72,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE FISCALIZAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(73,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE GESTÃO GOVERNAMENTAL'); 
INSERT INTO profissao(id,descricao) VALUES(74,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE PESQUISA ECONÔMICA'); 
INSERT INTO profissao(id,descricao) VALUES(75,'SERVIDOR PÚBLICO ESTADUAL'); 
INSERT INTO profissao(id,descricao) VALUES(76,'SERVIDOR PÚBLICO FEDERAL'); 
INSERT INTO profissao(id,descricao) VALUES(77,'SERVIDOR PÚBLICO MUNICIPAL'); 
INSERT INTO profissao(id,descricao) VALUES(78,'SUPERVISOR DE VENDAS E PRESTAÇÃO DE SERVIÇOS DO COMÉRCIO'); 
INSERT INTO profissao(id,descricao) VALUES(79,'TABELIÃO E DEMAIS SERVENTUÁRIOS DE JUSTIÇA'); 
INSERT INTO profissao(id,descricao) VALUES(80,'TÉCNICO DA PRODUÇÃO AGROPECUÁRIA'); 
INSERT INTO profissao(id,descricao) VALUES(81,'TÉCNICO DAS CIÊNCIAS ADMINISTRATIVAS'); 
INSERT INTO profissao(id,descricao) VALUES(82,'TÉCNICO DE LABORATÓRIO E RAIOS X E OUTROS EQUIPAMENTOS'); 
INSERT INTO profissao(id,descricao) VALUES(83,'TÉCNICO EM BIOLOGIA'); 
INSERT INTO profissao(id,descricao) VALUES(84,'TÉCNICO EM CIÊNCIAS FÍSICAS'); 
INSERT INTO profissao(id,descricao) VALUES(85,'TÉCNICO EM CONSTRUÇÃO CIVIL, DE EDIFICAÇÕES E OBRAS DE INFRA-ESTRUTURA'); 
INSERT INTO profissao(id,descricao) VALUES(86,'TÉCNICO EM ELETRÔNICA'); 
INSERT INTO profissao(id,descricao) VALUES(87,'TÉCNICO EM ELETRO-ELETRÔNICA E FOTÔNICA'); 
INSERT INTO profissao(id,descricao) VALUES(88,'TÉCNICO EM INFORMÁTICA'); 
INSERT INTO profissao(id,descricao) VALUES(89,'TÉCNICO EM METALMECÂNICA'); 
INSERT INTO profissao(id,descricao) VALUES(90,'TÉCNICO EM NAVEGAÇÃO AÉREA'); 
INSERT INTO profissao(id,descricao) VALUES(91,'TÉCNICOS EM ESTATÍSTICA'); 
INSERT INTO profissao(id,descricao) VALUES(92,'TRABALHADOR DA FABRICAÇÃO DE ALIMENTOS'); 
INSERT INTO profissao(id,descricao) VALUES(93,'TRABALHADOR DA FABRICAÇÃO E INSTALAÇÃO ELETRO-ELETRÔNICA'); 
INSERT INTO profissao(id,descricao) VALUES(94,'TRABALHADOR DA INDÚSTRIA EXTRATIVA'); 
INSERT INTO profissao(id,descricao) VALUES(95,'TRABALHADOR DA TRANSFORMAÇÃO DE METAIS E COMPÓSITOS'); 
INSERT INTO profissao(id,descricao) VALUES(96,'TRABALHADOR DAS INDÚSTRIAS DE MADEIRA E DO MOBILIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(97,'TRABALHADOR DA INDÚSTRIA QUÍMICA'); 
INSERT INTO profissao(id,descricao) VALUES(98,'TRABALHADOR DAS INDÚSTRIAS TÊXTEIS, DO CURTIMENTO, DO VESTUÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(99,'TRABALHADOR DE ATENDIMENTO AO PÚBLICO'); 
INSERT INTO profissao(id,descricao) VALUES(100,'TRABALHADOR DE INSTALAÇÕES E MÁQUINAS DE FABRICAÇÃO DE CELULOSE E PAPEL'); 
INSERT INTO profissao(id,descricao) VALUES(101,'TRABALHADOR DE INSTALAÇÕES SIDERÚRGICAS E DE MATERIAIS DE CONSTRUÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(102,'TRABALHADOR DE REPARAÇÃO E MANUTENÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(103,'TRABALHADOR DOS SERVIÇOS DE ADMINISTRAÇÃO DE EDIFÍCIOS'); 
INSERT INTO profissao(id,descricao) VALUES(104,'CABELEREIRO, BARBEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(105,'TRABALHADOR DOS SERVIÇOS DE HOTELARIA'); 
INSERT INTO profissao(id,descricao) VALUES(106,'TRABALHADOR DOS SERVIÇOS DE SAÚDE'); 
INSERT INTO profissao(id,descricao) VALUES(107,'TRABALHADOR DOS SERVIÇOS DOMÉSTICOS EM GERAL'); 
INSERT INTO profissao(id,descricao) VALUES(108,'TRABALHADOR NA EXPLORAÇÃO AGROPECUÁRIA'); 
INSERT INTO profissao(id,descricao) VALUES(109,'TRABALHADORES DA INDÚSTRIA DE CALÇADOS'); 
INSERT INTO profissao(id,descricao) VALUES(110,'PATOLOGISTA (VETERINÁRIO)'); 
INSERT INTO profissao(id,descricao) VALUES(111,'TRABALHADORES DOS SERVIÇOS FUNERÁRIOS'); 
INSERT INTO profissao(id,descricao) VALUES(112,'VENDEDOR'); 
INSERT INTO profissao(id,descricao) VALUES(113,'VETERINÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(114,'TÉCNICO DAS CIÊNCIAS CONTÁBEIS'); 
INSERT INTO profissao(id,descricao) VALUES(115,'CONTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(116,'AUDITOR'); 
INSERT INTO profissao(id,descricao) VALUES(117,'PROCURADOR'); 
INSERT INTO profissao(id,descricao) VALUES(118,'CONSULTOR JURÍDICO'); 
INSERT INTO profissao(id,descricao) VALUES(119,'PROMOTOR DE JUSTIÇA'); 
INSERT INTO profissao(id,descricao) VALUES(120,'DEFENSOR PÚBLICO'); 
INSERT INTO profissao(id,descricao) VALUES(121,'ASSISTENTE ADMINISTRATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(122,'AUXILIAR ADMINISTRATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(123,'CORRETOR DE SEGUROS'); 
INSERT INTO profissao(id,descricao) VALUES(124,'LEILOEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(125,'DESENVOLVEDOR DE SOFTWARE'); 
INSERT INTO profissao(id,descricao) VALUES(126,'ADMINISTRADOR DE REDES'); 
INSERT INTO profissao(id,descricao) VALUES(127,'ADMINISTRADOR DE BANCOS DE DADOS'); 
INSERT INTO profissao(id,descricao) VALUES(128,'ARTISTAS DE ARTES POPULARES E MODELOS'); 
INSERT INTO profissao(id,descricao) VALUES(129,'DIRETOR DE ESPETÁCULOS'); 
INSERT INTO profissao(id,descricao) VALUES(130,'ECONOMIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(131,'ESCRITURÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(132,'DOCUMENTALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(133,'ARQUIVÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(134,'MUSEÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(135,'BIOMÉDICO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(136,'ESTAGIÁRIO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(137,'DECORADOR DE INTERIORES'); 
INSERT INTO profissao(id,descricao) VALUES(138,'FOTÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(139,'GUIA DE TURISMO'); 
INSERT INTO profissao(id,descricao) VALUES(140,'TÉCNICOS EM OPERAÇÃO DE MÁQUINAS DE TRATAMENTO DE DADOS'); 
INSERT INTO profissao(id,descricao) VALUES(141,'AGENTE DE VIAGEM E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(142,'VITRINISTA'); 
INSERT INTO profissao(id,descricao) VALUES(143,'ESCULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(144,'PINTOR ARTÍSTICO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(145,'EMPRESA INDUSTRIAL'); 
INSERT INTO profissao(id,descricao) VALUES(146,'EMPRESA COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(147,'EMPRESA PRESTADORA DE SERVIÇOS'); 
INSERT INTO profissao(id,descricao) VALUES(148,'BAILARINO'); 
INSERT INTO profissao(id,descricao) VALUES(149,'COREÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(150,'NUTRICIONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(151,'FARMACÊUTICO'); 
INSERT INTO profissao(id,descricao) VALUES(152,'QUÍMICO'); 
INSERT INTO profissao(id,descricao) VALUES(153,'METEOROLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(154,'GEÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(155,'OCEANÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(156,'ASTRÔNOMO'); 
INSERT INTO profissao(id,descricao) VALUES(157,'GEOFÍSICO'); 
INSERT INTO profissao(id,descricao) VALUES(158,'FISIOTERAPEUTA'); 
INSERT INTO profissao(id,descricao) VALUES(159,'TERAPEUTA OCUPACIONAL'); 
INSERT INTO profissao(id,descricao) VALUES(160,'HISTORIADOR'); 
INSERT INTO profissao(id,descricao) VALUES(161,'GERENTE DE OPERAÇÕES'); 
INSERT INTO profissao(id,descricao) VALUES(162,'GERENTE DE ÁREAS DE APOIO'); 
INSERT INTO profissao(id,descricao) VALUES(163,'DETETIVE'); 
INSERT INTO profissao(id,descricao) VALUES(164,'VIDREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(165,'CERAMISTA'); 
INSERT INTO profissao(id,descricao) VALUES(166,'REPÓRTER'); 
INSERT INTO profissao(id,descricao) VALUES(167,'DESEMBARGADOR'); 
INSERT INTO profissao(id,descricao) VALUES(168,'ESTATÍSTICO'); 
INSERT INTO profissao(id,descricao) VALUES(169,'ATUÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(170,'MEMBRO DO MINISTÉRIO PÚBLICO'); 
INSERT INTO profissao(id,descricao) VALUES(171,'CONDUTOR E OPERADOR DE ROBÔS'); 
INSERT INTO profissao(id,descricao) VALUES(172,'CONDUTOR E OPERADOR DE VEÍCULOS E EQUIPAMENTOS DE MOVIMENTAÇÃO DE CARGA'); 
INSERT INTO profissao(id,descricao) VALUES(173,'ARRANJADOR'); 
INSERT INTO profissao(id,descricao) VALUES(174,'REGENTE DE ORQUESTRA OU CORAL'); 
INSERT INTO profissao(id,descricao) VALUES(175,'ORIENTADOR EDUCACIONAL'); 
INSERT INTO profissao(id,descricao) VALUES(176,'CAÇADOR'); 
INSERT INTO profissao(id,descricao) VALUES(177,'EXTRATIVISTA FLORESTAL'); 
INSERT INTO profissao(id,descricao) VALUES(178,'PREFEITO'); 
INSERT INTO profissao(id,descricao) VALUES(179,'COMANDANTE DE EMBARCAÇÕES E OFICIAIS DE MÁQUINAS'); 
INSERT INTO profissao(id,descricao) VALUES(180,'GOVERNADOR'); 
INSERT INTO profissao(id,descricao) VALUES(181,'MINISTRO DE ESTADO E DA DIPLOMACIA'); 
INSERT INTO profissao(id,descricao) VALUES(182,'PROFISSIONAL DE PUBLICIDADE'); 
INSERT INTO profissao(id,descricao) VALUES(183,'PROFISSIONAL DA COMERCIALIZAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(184,'PSICANALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(185,'MEMBRO DE ORDENS OU SEITAS RELIGIOSAS'); 
INSERT INTO profissao(id,descricao) VALUES(186,'DEPUTADO ESTADUAL'); 
INSERT INTO profissao(id,descricao) VALUES(187,'VEREADOR'); 
INSERT INTO profissao(id,descricao) VALUES(188,'DEPUTADO FEDERAL'); 
INSERT INTO profissao(id,descricao) VALUES(189,'TÉCNICO EM CIÊNCIAS QUÍMICAS'); 
INSERT INTO profissao(id,descricao) VALUES(190,'SERVENTUÁRIO DA JUSTIÇA'); 
INSERT INTO profissao(id,descricao) VALUES(191,'TÉCNICO EM NAVEGAÇÃO MARÍTIMA'); 
INSERT INTO profissao(id,descricao) VALUES(192,'FISCAL DE TRIBUTAÇÃO DE NÍVEL MÉDIO'); 
INSERT INTO profissao(id,descricao) VALUES(193,'TÉCNICO EM NAVEGAÇÃO FLUVIAL'); 
INSERT INTO profissao(id,descricao) VALUES(194,'TÉCNICO EM NAVEGAÇÃO METROFERROVIÁRIA'); 
INSERT INTO profissao(id,descricao) VALUES(195,'TRABALHADOR DA FABRICAÇÃO DE BEBIDAS'); 
INSERT INTO profissao(id,descricao) VALUES(196,'TRABALHADOR DA FABRICAÇÃO DE  FUMO'); 
INSERT INTO profissao(id,descricao) VALUES(197,'TRABALHADOR DA FABRICAÇÃO DE AGROINDÚSTRIAS'); 
INSERT INTO profissao(id,descricao) VALUES(198,'TRABALHADOR DA CONSTRUÇÃO CIVIL'); 
INSERT INTO profissao(id,descricao) VALUES(199,'TRABALHADOR DAS INDÚSTRIAS DAS ARTES GRÁFICAS'); 
INSERT INTO profissao(id,descricao) VALUES(200,'TRABALHADOR DA INDÚSTRIA PETROQUÍMICA'); 
INSERT INTO profissao(id,descricao) VALUES(201,'TRABALHADOR DA INDÚSTRIA DA BORRACHA E PLÁSTICO E AFINS'); 
INSERT INTO profissao(id,descricao) VALUES(202,'DESPACHANTE'); 
INSERT INTO profissao(id,descricao) VALUES(203,'RECENSEADOR'); 
INSERT INTO profissao(id,descricao) VALUES(204,'MANICURE, PEDICURE'); 
INSERT INTO profissao(id,descricao) VALUES(205,'TRABALHADOR DOS SERVIÇOS DE ALIMENTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(206,'PRESTADOR DE SERVIÇOS DO COMÉRCIO'); 
INSERT INTO profissao(id,descricao) VALUES(207,'AMBULANTE'); 
INSERT INTO profissao(id,descricao) VALUES(208,'CAIXEIRO-VIAJANTE'); 
INSERT INTO profissao(id,descricao) VALUES(209,'CAMELÔ'); 
INSERT INTO profissao(id,descricao) VALUES(210,'ZOOTECNISTA '); 
INSERT INTO profissao(id,descricao) VALUES(211,'SOCIÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(212,'ANTROPÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(213,'ARQUEÓLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(214,'ARQUITETO'); 
INSERT INTO profissao(id,descricao) VALUES(215,'MASSAGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(216,'ESTETICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(217,'OCUPANTE DE CARGO DE ASSESSORAMENTO SUPERIOR'); 
INSERT INTO profissao(id,descricao) VALUES(218,'OCUPANTE DE CARGO DE ASSISTÊNCIA INTERMEDIÁRIA'); 
INSERT INTO profissao(id,descricao) VALUES(219,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE FINANÇAS'); 
INSERT INTO profissao(id,descricao) VALUES(220,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE CONTROLE'); 
INSERT INTO profissao(id,descricao) VALUES(221,'SERVIDOR DE NÍVEL SUPERIOR NAS ATIVIDADES DE PLANEJAMENTO'); 
INSERT INTO profissao(id,descricao) VALUES(222,'TRABALHADOR DOS SERVIÇOS DE CONSERVAÇÃO DE EDIFÍCIOS'); 
INSERT INTO profissao(id,descricao) VALUES(223,'TRABALHADOR DOS SERVIÇOS DE MANUTENÇÃO DE EDIFÍCIOS'); 
INSERT INTO profissao(id,descricao) VALUES(228,'ESTUDANTE'); 
INSERT INTO profissao(id,descricao) VALUES(229,'TRABALHADOR AGRÍCOLA'); 
INSERT INTO profissao(id,descricao) VALUES(230,'RELAÇÕES PÚBLICAS'); 
INSERT INTO profissao(id,descricao) VALUES(231,'PUBLICITÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(232,'AUTÔNOMO'); 
INSERT INTO profissao(id,descricao) VALUES(233,'AÇOUGUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(234,'ADIDO ESTRANGEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(235,'ADJUNTO ADMINISTRATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(236,'ADMINISTRADOR DE AEROPORTO'); 
INSERT INTO profissao(id,descricao) VALUES(237,'ADMINISTRADOR DE EMPRESA'); 
INSERT INTO profissao(id,descricao) VALUES(238,'ADMINISTRADOR DE FAZENDA'); 
INSERT INTO profissao(id,descricao) VALUES(239,'ADMINISTRADOR RURAL'); 
INSERT INTO profissao(id,descricao) VALUES(240,'ADUBADO'); 
INSERT INTO profissao(id,descricao) VALUES(241,'AEROMOÇA'); 
INSERT INTO profissao(id,descricao) VALUES(242,'AERONAUTA'); 
INSERT INTO profissao(id,descricao) VALUES(243,'AEROVIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(244,'AFIADOR DE FERRAMENTAS'); 
INSERT INTO profissao(id,descricao) VALUES(245,'AFIADOR DE METAIS PRECIOSOS'); 
INSERT INTO profissao(id,descricao) VALUES(246,'AGENCIADOR'); 
INSERT INTO profissao(id,descricao) VALUES(247,'AGENTE AUTÔNOMO'); 
INSERT INTO profissao(id,descricao) VALUES(248,'AGENTE COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(249,'AGENTE DE CORREIO'); 
INSERT INTO profissao(id,descricao) VALUES(250,'AGENTE DE ESTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(251,'AGENTE DE FISCALIZAÇÃO DE IMPOSTO'); 
INSERT INTO profissao(id,descricao) VALUES(252,'AGENTE DE INVESTIMENTO'); 
INSERT INTO profissao(id,descricao) VALUES(253,'AGENTE DE POLICIA'); 
INSERT INTO profissao(id,descricao) VALUES(254,'AGENTE DE SEGUROS'); 
INSERT INTO profissao(id,descricao) VALUES(255,'AGENTE DE TELECOMUNICAÇÕES'); 
INSERT INTO profissao(id,descricao) VALUES(256,'AGENTE DE TURISMO'); 
INSERT INTO profissao(id,descricao) VALUES(257,'AGENTE DE VENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(258,'AGENTE EXPORTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(259,'AGENTE FISCAL'); 
INSERT INTO profissao(id,descricao) VALUES(260,'AGENTE PENITENCIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(261,'AGENTE TÉCNICO'); 
INSERT INTO profissao(id,descricao) VALUES(262,'AGENTE TRIBUTÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(263,'AGENTE TRIBUTÁRIO ESTADUAL'); 
INSERT INTO profissao(id,descricao) VALUES(264,'AGRICULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(265,'AGRIMENSOR'); 
INSERT INTO profissao(id,descricao) VALUES(266,'AGROINDUSTRIAL'); 
INSERT INTO profissao(id,descricao) VALUES(267,'AGROPECUARISTA'); 
INSERT INTO profissao(id,descricao) VALUES(268,'AJUDANTE'); 
INSERT INTO profissao(id,descricao) VALUES(269,'AJUDANTE DE ARMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(270,'AJUDANTE DE BOMBEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(271,'AJUDANTE DE CAMINHÃO'); 
INSERT INTO profissao(id,descricao) VALUES(272,'AJUDANTE DE CARPINTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(273,'AJUDANTE DE DESPACHANTE'); 
INSERT INTO profissao(id,descricao) VALUES(274,'AJUDANTE DE ELETRICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(275,'AJUDANTE DE ENCANADOR'); 
INSERT INTO profissao(id,descricao) VALUES(276,'AJUDANTE DE FERREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(277,'AJUDANTE DE FUNILEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(278,'AJUDANTE DE GARÇOM'); 
INSERT INTO profissao(id,descricao) VALUES(279,'AJUDANTE DE LANTERNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(280,'AJUDANTE DE MAQUINISTA'); 
INSERT INTO profissao(id,descricao) VALUES(281,'AJUDANTE DE MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(282,'AJUDANTE DE PEDREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(283,'AJUDANTE DE SERRALHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(284,'AJUDANTE DE VITRINISTA'); 
INSERT INTO profissao(id,descricao) VALUES(285,'AJUDANTE GERAL'); 
INSERT INTO profissao(id,descricao) VALUES(286,'AJUSTADO MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(287,'ALFAIATE'); 
INSERT INTO profissao(id,descricao) VALUES(288,'ALMOXARIFE'); 
INSERT INTO profissao(id,descricao) VALUES(289,'ANALISTA JUDICIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(290,'APICULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(291,'APLICADOR DE SINTECO'); 
INSERT INTO profissao(id,descricao) VALUES(292,'APONTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(293,'APOSENTADO'); 
INSERT INTO profissao(id,descricao) VALUES(294,'ARMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(295,'ARMADOR DE CIMENTO'); 
INSERT INTO profissao(id,descricao) VALUES(296,'ARMADOR DE PESCA'); 
INSERT INTO profissao(id,descricao) VALUES(297,'ARMAZENADOR'); 
INSERT INTO profissao(id,descricao) VALUES(298,'ARMEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(299,'ARQUIVISTA'); 
INSERT INTO profissao(id,descricao) VALUES(300,'ARRENDATÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(301,'ARRUMADEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(302,'ARRUMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(303,'ARTESÃO'); 
INSERT INTO profissao(id,descricao) VALUES(304,'ARTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(305,'ARTISTA PINTOR'); 
INSERT INTO profissao(id,descricao) VALUES(306,'ARTISTA PLÁSTICO'); 
INSERT INTO profissao(id,descricao) VALUES(307,'ASCENSORISTA'); 
INSERT INTO profissao(id,descricao) VALUES(308,'ASSESSOR'); 
INSERT INTO profissao(id,descricao) VALUES(309,'ASSESSOR DE SEGURANÇA AÉREA'); 
INSERT INTO profissao(id,descricao) VALUES(310,'ASSESSOR POSTAL TELEGRÁFICO'); 
INSERT INTO profissao(id,descricao) VALUES(311,'ASSESSOR TÉCNICO'); 
INSERT INTO profissao(id,descricao) VALUES(312,'ASSISTENTE'); 
INSERT INTO profissao(id,descricao) VALUES(313,'ASSISTENTE COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(314,'ASSISTENTE DE ADMINISTRAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(315,'ASSISTENTE DE DIRETOR'); 
INSERT INTO profissao(id,descricao) VALUES(316,'ASSISTENTE DE LABORATÓRIO'); 
INSERT INTO profissao(id,descricao) VALUES(317,'ASSISTENTE SOCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(318,'ASSISTENTE TÉCNICO'); 
INSERT INTO profissao(id,descricao) VALUES(319,'ASTRONAUTA'); 
INSERT INTO profissao(id,descricao) VALUES(320,'ATACADISTA'); 
INSERT INTO profissao(id,descricao) VALUES(321,'ATENDENTE'); 
INSERT INTO profissao(id,descricao) VALUES(322,'ATENDENTE DE ENFERMAGEM'); 
INSERT INTO profissao(id,descricao) VALUES(323,'ATENDENTE DE FARMÁCIA'); 
INSERT INTO profissao(id,descricao) VALUES(324,'ATRIZ'); 
INSERT INTO profissao(id,descricao) VALUES(325,'AUXILIAR. DE TRAFEGO TELEGRÁFICO'); 
INSERT INTO profissao(id,descricao) VALUES(326,'AUXILIAR ACADÊMICO'); 
INSERT INTO profissao(id,descricao) VALUES(327,'AUXILIAR AGRÍCOLA'); 
INSERT INTO profissao(id,descricao) VALUES(328,'AUXILIAR DE ÁREAS GRÁFICAS'); 
INSERT INTO profissao(id,descricao) VALUES(329,'AUXILIAR DE ADMINISTRAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(330,'AUXILIAR DE ALMOXARIFADO'); 
INSERT INTO profissao(id,descricao) VALUES(331,'AUXILIAR DE CARTÓRIO'); 
INSERT INTO profissao(id,descricao) VALUES(332,'AUXILIAR DE CIRURGIA'); 
INSERT INTO profissao(id,descricao) VALUES(333,'AUXILIAR DE COMERCIO'); 
INSERT INTO profissao(id,descricao) VALUES(334,'AUXILIAR DE CONTABILIDADE'); 
INSERT INTO profissao(id,descricao) VALUES(335,'AUXILIAR DE COZINHA'); 
INSERT INTO profissao(id,descricao) VALUES(336,'AUXILIAR DE EDUCAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(337,'AUXILIAR DE ELETRICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(338,'AUXILIAR DE ENFERMAGEM'); 
INSERT INTO profissao(id,descricao) VALUES(339,'AUXILIAR DE ESCRITÓRIO'); 
INSERT INTO profissao(id,descricao) VALUES(340,'AUXILIAR DE EXPEDIENTE'); 
INSERT INTO profissao(id,descricao) VALUES(341,'AUXILIAR DE FARMÁCIA'); 
INSERT INTO profissao(id,descricao) VALUES(342,'AUXILIAR DE INFORMÁTICA'); 
INSERT INTO profissao(id,descricao) VALUES(343,'AUXILIAR DE LABORATÓRIO'); 
INSERT INTO profissao(id,descricao) VALUES(344,'AUXILIAR DE MAGAREFE'); 
INSERT INTO profissao(id,descricao) VALUES(345,'AUXILIAR DE MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(346,'AUXILIAR DE METEOROLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(347,'AUXILIAR DE MONTAGEM'); 
INSERT INTO profissao(id,descricao) VALUES(348,'AUXILIAR DE OBSERVADOR METER.'); 
INSERT INTO profissao(id,descricao) VALUES(349,'AUXILIAR DE PEDREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(350,'AUXILIAR DE PRODUÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(351,'AUXILIAR DE PROFESSOR'); 
INSERT INTO profissao(id,descricao) VALUES(352,'AUXILIAR DE PROPAGANDISTA'); 
INSERT INTO profissao(id,descricao) VALUES(353,'AUXILIAR DE SERVIOS GERAIS'); 
INSERT INTO profissao(id,descricao) VALUES(354,'AUXILIAR DE SOLDADOR'); 
INSERT INTO profissao(id,descricao) VALUES(355,'AUXILIAR DE TESOUREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(356,'AUXILIAR DE TOPÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(357,'AUXILIAR DE TRAFEGO'); 
INSERT INTO profissao(id,descricao) VALUES(358,'AUXILIAR DE VENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(359,'AUXILIAR LEGISLATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(360,'AUXILIAR TÉCNICO'); 
INSERT INTO profissao(id,descricao) VALUES(361,'AVALIADOR'); 
INSERT INTO profissao(id,descricao) VALUES(362,'AVALIADOR COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(363,'AVICULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(364,'AZULEJADOR'); 
INSERT INTO profissao(id,descricao) VALUES(365,'BABA'); 
INSERT INTO profissao(id,descricao) VALUES(366,'BALCONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(367,'BANQUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(368,'BARBEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(369,'BAPTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(370,'BARMAN'); 
INSERT INTO profissao(id,descricao) VALUES(371,'BARQUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(372,'BATERISTA'); 
INSERT INTO profissao(id,descricao) VALUES(373,'BETONEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(374,'BILHETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(375,'BIOQUÍMICO'); 
INSERT INTO profissao(id,descricao) VALUES(376,'BISCATEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(377,'BLOQUISTA'); 
INSERT INTO profissao(id,descricao) VALUES(378,'BOBINADO'); 
INSERT INTO profissao(id,descricao) VALUES(379,'BOIADEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(380,'BOMBEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(381,'BOMBEIRO DE GASOLINA'); 
INSERT INTO profissao(id,descricao) VALUES(382,'BOMBEIRO ELETRICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(383,'BOMBEIRO ENCANADOR'); 
INSERT INTO profissao(id,descricao) VALUES(384,'BOMBEIRO HIDRÁULICO'); 
INSERT INTO profissao(id,descricao) VALUES(385,'BORDADOR'); 
INSERT INTO profissao(id,descricao) VALUES(386,'BORRACHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(387,'BOTÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(388,'BRITADOR'); 
INSERT INTO profissao(id,descricao) VALUES(389,'BROQUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(390,'BUSINESS'); 
INSERT INTO profissao(id,descricao) VALUES(391,'CÔNSUL'); 
INSERT INTO profissao(id,descricao) VALUES(392,'CABELEIREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(393,'CAIXA'); 
INSERT INTO profissao(id,descricao) VALUES(394,'CAIXEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(395,'CALAFATE'); 
INSERT INTO profissao(id,descricao) VALUES(396,'CALCULISTA'); 
INSERT INTO profissao(id,descricao) VALUES(397,'CALDEIREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(398,'CAMAREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(399,'CAMBISTA'); 
INSERT INTO profissao(id,descricao) VALUES(400,'CAMINHONEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(401,'CAMISEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(402,'CAMPEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(403,'CANOEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(404,'CANTOR'); 
INSERT INTO profissao(id,descricao) VALUES(405,'CAPATAZ'); 
INSERT INTO profissao(id,descricao) VALUES(406,'CAPITALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(407,'CAPOTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(408,'CARCEREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(409,'CARPINTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(410,'CARREGADOR'); 
INSERT INTO profissao(id,descricao) VALUES(411,'CARREGADOR DE CAMINHÃO'); 
INSERT INTO profissao(id,descricao) VALUES(412,'CARREGADOR DE MALAS POSTAIS'); 
INSERT INTO profissao(id,descricao) VALUES(413,'CARRETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(414,'CARROCEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(415,'CARTAZISTA'); 
INSERT INTO profissao(id,descricao) VALUES(416,'CARTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(417,'CARTORÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(418,'CARVOEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(419,'CASEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(420,'CATADOR DE PAPEL'); 
INSERT INTO profissao(id,descricao) VALUES(421,'CENARISTA'); 
INSERT INTO profissao(id,descricao) VALUES(422,'CEREALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(423,'CERVEJEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(424,'CHACAREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(425,'CHAPEADOR'); 
INSERT INTO profissao(id,descricao) VALUES(426,'CHAPELEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(427,'CHAPISTA'); 
INSERT INTO profissao(id,descricao) VALUES(428,'CHARRETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(429,'CHAVEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(430,'CHEFE DE ESTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(431,'CHEFE DE TREM'); 
INSERT INTO profissao(id,descricao) VALUES(432,'CICERONE'); 
INSERT INTO profissao(id,descricao) VALUES(433,'CICLISTA'); 
INSERT INTO profissao(id,descricao) VALUES(434,'CIENTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(435,'CINEASTA'); 
INSERT INTO profissao(id,descricao) VALUES(436,'CINETECNICO'); 
INSERT INTO profissao(id,descricao) VALUES(437,'CIRURGIÃO'); 
INSERT INTO profissao(id,descricao) VALUES(438,'CISTERNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(439,'CO PILOTO'); 
INSERT INTO profissao(id,descricao) VALUES(440,'COB. FISCAL INSP.'); 
INSERT INTO profissao(id,descricao) VALUES(441,'COBRADOR'); 
INSERT INTO profissao(id,descricao) VALUES(442,'COBRADOR EM TRANSP. COLETIVO'); 
INSERT INTO profissao(id,descricao) VALUES(443,'COLETOR'); 
INSERT INTO profissao(id,descricao) VALUES(444,'COLHEDOR'); 
INSERT INTO profissao(id,descricao) VALUES(445,'COLOCADOR DE ANDAIMES'); 
INSERT INTO profissao(id,descricao) VALUES(446,'COLONO'); 
INSERT INTO profissao(id,descricao) VALUES(447,'COMANDANTE DE NAVIO'); 
INSERT INTO profissao(id,descricao) VALUES(448,'COMANDANTE DE VÔO'); 
INSERT INTO profissao(id,descricao) VALUES(449,'COMERCIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(450,'COMERCIANTE'); 
INSERT INTO profissao(id,descricao) VALUES(451,'COMISSÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(452,'COMISSÁRIO DE BORDO NAVIO'); 
INSERT INTO profissao(id,descricao) VALUES(453,'COMISSÁRIO DE POLICIA'); 
INSERT INTO profissao(id,descricao) VALUES(454,'COMISSIONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(455,'COMPOSITOR'); 
INSERT INTO profissao(id,descricao) VALUES(456,'COMPOSITOR MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(457,'COMPOSITOR MUSICAL'); 
INSERT INTO profissao(id,descricao) VALUES(458,'COMPOSITORA MUSICAL'); 
INSERT INTO profissao(id,descricao) VALUES(459,'COMUNICAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(460,'CONDUTOR'); 
INSERT INTO profissao(id,descricao) VALUES(461,'CONDUTOR DE GADO'); 
INSERT INTO profissao(id,descricao) VALUES(462,'CONDUTOR DE MALAS'); 
INSERT INTO profissao(id,descricao) VALUES(463,'CONDUTOR MAQUINISTA'); 
INSERT INTO profissao(id,descricao) VALUES(464,'CONFEITEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(465,'CONFERENTE DE CAIS DO PORTO'); 
INSERT INTO profissao(id,descricao) VALUES(466,'CONSTRUTOR'); 
INSERT INTO profissao(id,descricao) VALUES(467,'CONSULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(468,'CONSULTOR FINANCEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(469,'CONTADOR FINANCEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(470,'CONTINUO'); 
INSERT INTO profissao(id,descricao) VALUES(471,'CONTORCIONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(472,'CONTRA ALMIRANTE'); 
INSERT INTO profissao(id,descricao) VALUES(473,'CONTROLADOR DE PRODUÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(474,'COPEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(475,'CORREEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(476,'CORRETOR DE CAFÉ'); 
INSERT INTO profissao(id,descricao) VALUES(477,'CORRETOR DE IMÓVEIS'); 
INSERT INTO profissao(id,descricao) VALUES(478,'COSEDOR'); 
INSERT INTO profissao(id,descricao) VALUES(479,'COSTUREIRA'); 
INSERT INTO profissao(id,descricao) VALUES(480,'COZINHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(481,'CRIADOR DE GADO'); 
INSERT INTO profissao(id,descricao) VALUES(482,'CRONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(483,'DANÇARINO'); 
INSERT INTO profissao(id,descricao) VALUES(484,'DATILOGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(485,'DENTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(486,'DEPARTAMENTO DE PESSOAL'); 
INSERT INTO profissao(id,descricao) VALUES(487,'DESEMPREGADO'); 
INSERT INTO profissao(id,descricao) VALUES(488,'DESENHISTA'); 
INSERT INTO profissao(id,descricao) VALUES(489,'DESIGNER'); 
INSERT INTO profissao(id,descricao) VALUES(490,'DESPACHANTE ADUANEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(491,'DESPACHANTE DO DETRAN'); 
INSERT INTO profissao(id,descricao) VALUES(492,'DESPORTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(493,'DIAGRAMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(494,'DIARISTA'); 
INSERT INTO profissao(id,descricao) VALUES(495,'DIGITADOR'); 
INSERT INTO profissao(id,descricao) VALUES(496,'DIRETOR AGRÍCOLA'); 
INSERT INTO profissao(id,descricao) VALUES(497,'DIRETOR COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(498,'DIRETOR DE COLÉGIO'); 
INSERT INTO profissao(id,descricao) VALUES(499,'DIRETOR DE CORREIOS'); 
INSERT INTO profissao(id,descricao) VALUES(500,'DIRETOR DE FINANÇAS'); 
INSERT INTO profissao(id,descricao) VALUES(501,'DIRETOR DE HOSPITAL'); 
INSERT INTO profissao(id,descricao) VALUES(502,'DIRETOR DE HOTEL'); 
INSERT INTO profissao(id,descricao) VALUES(503,'DIRETOR DE TRANSPORTE'); 
INSERT INTO profissao(id,descricao) VALUES(504,'DIRETOR PECUÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(505,'DIRETORA DE COLÉGIO'); 
INSERT INTO profissao(id,descricao) VALUES(506,'DIRETORA DE HOSPITAL'); 
INSERT INTO profissao(id,descricao) VALUES(507,'DISTRIBUIDOR DE JORNAL'); 
INSERT INTO profissao(id,descricao) VALUES(508,'DO LAR'); 
INSERT INTO profissao(id,descricao) VALUES(509,'DOCEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(510,'ECONOMIARIO'); 
INSERT INTO profissao(id,descricao) VALUES(511,'EDITOR'); 
INSERT INTO profissao(id,descricao) VALUES(512,'EDUCADORA'); 
INSERT INTO profissao(id,descricao) VALUES(513,'ELETRICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(514,'ELETRICITÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(515,'ELETROMECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(516,'ELETROTECNICO'); 
INSERT INTO profissao(id,descricao) VALUES(517,'EMBAIXADOR'); 
INSERT INTO profissao(id,descricao) VALUES(518,'EMBALADOR'); 
INSERT INTO profissao(id,descricao) VALUES(519,'EMBALSAMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(520,'EMPACOTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(521,'EMPAPELADOR'); 
INSERT INTO profissao(id,descricao) VALUES(522,'EMPILHADOR'); 
INSERT INTO profissao(id,descricao) VALUES(523,'EMPREITEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(524,'EMPREITEIRO DE OBRAS'); 
INSERT INTO profissao(id,descricao) VALUES(525,'EMPRESÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(526,'ENCADERNADOR'); 
INSERT INTO profissao(id,descricao) VALUES(527,'ENCAIXOTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(528,'ENCANADOR'); 
INSERT INTO profissao(id,descricao) VALUES(529,'ENCARREGADO'); 
INSERT INTO profissao(id,descricao) VALUES(530,'ENCARREGADO DE OBRAS'); 
INSERT INTO profissao(id,descricao) VALUES(531,'ENCARREGADO DE SERVIÇOS GERAIS'); 
INSERT INTO profissao(id,descricao) VALUES(532,'ENFERMEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(533,'ENGARRAFADOR'); 
INSERT INTO profissao(id,descricao) VALUES(534,'ENGENHEIRO AGRÔNOMO'); 
INSERT INTO profissao(id,descricao) VALUES(535,'ENGENHEIRO CIVIL'); 
INSERT INTO profissao(id,descricao) VALUES(536,'ENGENHEIRO ELETRICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(537,'ENGENHEIRO ELETRÔNICO'); 
INSERT INTO profissao(id,descricao) VALUES(538,'ENGENHEIRO ELETROMECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(539,'ENGENHEIRO FLORESTAL'); 
INSERT INTO profissao(id,descricao) VALUES(540,'ENGENHEIRO MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(541,'ENTALHADOR'); 
INSERT INTO profissao(id,descricao) VALUES(542,'ENTREGADOR'); 
INSERT INTO profissao(id,descricao) VALUES(543,'ENVERNIZADOR'); 
INSERT INTO profissao(id,descricao) VALUES(544,'ESCAFRANDISTA'); 
INSERT INTO profissao(id,descricao) VALUES(545,'ESCREVENTE'); 
INSERT INTO profissao(id,descricao) VALUES(546,'ESCRITOR'); 
INSERT INTO profissao(id,descricao) VALUES(547,'ESCRIVE'); 
INSERT INTO profissao(id,descricao) VALUES(548,'ESCRIVÃO'); 
INSERT INTO profissao(id,descricao) VALUES(549,'ESPECIALISTA DE BELEZA'); 
INSERT INTO profissao(id,descricao) VALUES(550,'ESPORTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(551,'ESTAFETA'); 
INSERT INTO profissao(id,descricao) VALUES(552,'ESTAMPADOR'); 
INSERT INTO profissao(id,descricao) VALUES(553,'ESTEREOTIPISTA'); 
INSERT INTO profissao(id,descricao) VALUES(554,'ESTILISTA'); 
INSERT INTO profissao(id,descricao) VALUES(555,'ESTIVADOR'); 
INSERT INTO profissao(id,descricao) VALUES(556,'ESTOCADOR DE GESSO'); 
INSERT INTO profissao(id,descricao) VALUES(557,'ESTOFADOR'); 
INSERT INTO profissao(id,descricao) VALUES(558,'ETIQUETADOR'); 
INSERT INTO profissao(id,descricao) VALUES(559,'EXECUTIVO'); 
INSERT INTO profissao(id,descricao) VALUES(560,'EXPORTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(561,'FAQUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(562,'FAROLEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(563,'FATURISTA'); 
INSERT INTO profissao(id,descricao) VALUES(564,'FAXINEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(565,'FAZENDEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(566,'FEIRANTE'); 
INSERT INTO profissao(id,descricao) VALUES(567,'FERRAMENTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(568,'FERREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(569,'FERROVIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(570,'FIADOR'); 
INSERT INTO profissao(id,descricao) VALUES(571,'FIANDEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(572,'FINANCISTA'); 
INSERT INTO profissao(id,descricao) VALUES(573,'FISCAL'); 
INSERT INTO profissao(id,descricao) VALUES(574,'FISCAL AGRÍCOLA'); 
INSERT INTO profissao(id,descricao) VALUES(575,'FISCAL DE AEROPORTO'); 
INSERT INTO profissao(id,descricao) VALUES(576,'FISCAL DE OBRA'); 
INSERT INTO profissao(id,descricao) VALUES(577,'FISCAL DE RENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(578,'FISCAL DE RENDAS PÚBLICAS'); 
INSERT INTO profissao(id,descricao) VALUES(579,'FISCAL DE SANEAMENTO'); 
INSERT INTO profissao(id,descricao) VALUES(580,'FISCAL DE TRANSPORTE COLETIVO'); 
INSERT INTO profissao(id,descricao) VALUES(581,'FISCAL FLORESTAL'); 
INSERT INTO profissao(id,descricao) VALUES(582,'FLORICULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(583,'FOGUISTA'); 
INSERT INTO profissao(id,descricao) VALUES(584,'FORJADOR'); 
INSERT INTO profissao(id,descricao) VALUES(585,'FOTOGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(586,'FRENTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(587,'FRETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(588,'FUNCIONÁRIO PÚBLICO ESTADUAL'); 
INSERT INTO profissao(id,descricao) VALUES(589,'FUNCIONÁRIO PÚBLICO FEDERAL'); 
INSERT INTO profissao(id,descricao) VALUES(590,'FUNCIONÁRIO PÚBLICO MUNICIPAL'); 
INSERT INTO profissao(id,descricao) VALUES(591,'FUNDIDOR'); 
INSERT INTO profissao(id,descricao) VALUES(592,'FUNILEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(593,'FUTEBOLISTA'); 
INSERT INTO profissao(id,descricao) VALUES(594,'FUZILEIRO NAVAL'); 
INSERT INTO profissao(id,descricao) VALUES(595,'GALVANIZADOR'); 
INSERT INTO profissao(id,descricao) VALUES(596,'GARÇOM'); 
INSERT INTO profissao(id,descricao) VALUES(597,'GARÇONETE'); 
INSERT INTO profissao(id,descricao) VALUES(598,'GARAGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(599,'GARI'); 
INSERT INTO profissao(id,descricao) VALUES(600,'GARIMPEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(601,'GAROTA DE PROGRAMA'); 
INSERT INTO profissao(id,descricao) VALUES(602,'GENETICISTA'); 
INSERT INTO profissao(id,descricao) VALUES(603,'GEOLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(604,'GERENTE'); 
INSERT INTO profissao(id,descricao) VALUES(605,'GERENTE DE EXPORTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(606,'GERENTE DE FAZENDA'); 
INSERT INTO profissao(id,descricao) VALUES(607,'GERENTE DE LOJA'); 
INSERT INTO profissao(id,descricao) VALUES(608,'GERENTE DE POSTO'); 
INSERT INTO profissao(id,descricao) VALUES(609,'GESSEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(610,'GOVERNANTA'); 
INSERT INTO profissao(id,descricao) VALUES(611,'GRÁFICO'); 
INSERT INTO profissao(id,descricao) VALUES(612,'GRANITEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(613,'GRANJEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(614,'GRAVADOR'); 
INSERT INTO profissao(id,descricao) VALUES(615,'GRAXEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(616,'GUARDA'); 
INSERT INTO profissao(id,descricao) VALUES(617,'GUARDA BANCÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(618,'GUARDA DE CARRO'); 
INSERT INTO profissao(id,descricao) VALUES(619,'GUARDA NOTURNO'); 
INSERT INTO profissao(id,descricao) VALUES(620,'GUARDA VIDAS'); 
INSERT INTO profissao(id,descricao) VALUES(621,'GUILHOTINADO'); 
INSERT INTO profissao(id,descricao) VALUES(622,'GUINCHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(623,'GUITARRISTA'); 
INSERT INTO profissao(id,descricao) VALUES(624,'HISTORIADOR'); 
INSERT INTO profissao(id,descricao) VALUES(625,'IMEDIATO DE NAVIO'); 
INSERT INTO profissao(id,descricao) VALUES(626,'IMOBILIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(627,'IMPORTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(628,'IMPRESSOR'); 
INSERT INTO profissao(id,descricao) VALUES(629,'INCORPORADOR'); 
INSERT INTO profissao(id,descricao) VALUES(630,'INDUSTRIÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(631,'INDUSTRIAL'); 
INSERT INTO profissao(id,descricao) VALUES(632,'INSPETOR'); 
INSERT INTO profissao(id,descricao) VALUES(633,'INSTRUMENTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(634,'INSTRUTOR DE AUTO ESCOLA'); 
INSERT INTO profissao(id,descricao) VALUES(635,'INSTRUTOR DE MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(636,'INSTRUTOR DE MUSCULAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(637,'INSUFILMADOR DE VEICULO'); 
INSERT INTO profissao(id,descricao) VALUES(638,'INTERPRETE'); 
INSERT INTO profissao(id,descricao) VALUES(639,'JÓQUEI'); 
INSERT INTO profissao(id,descricao) VALUES(640,'JARDINEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(641,'JOGADOR DE FUTEBOL'); 
INSERT INTO profissao(id,descricao) VALUES(642,'JORNALEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(643,'JUBILADO'); 
INSERT INTO profissao(id,descricao) VALUES(644,'JUIZ CRIMINAL'); 
INSERT INTO profissao(id,descricao) VALUES(645,'JUIZ DE FUTEBOL'); 
INSERT INTO profissao(id,descricao) VALUES(646,'JURISTA'); 
INSERT INTO profissao(id,descricao) VALUES(647,'LADRILHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(648,'LAMINADOR'); 
INSERT INTO profissao(id,descricao) VALUES(649,'LANTERNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(650,'LAPIDÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(651,'LAVADEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(652,'LAVADOR DE CARROS'); 
INSERT INTO profissao(id,descricao) VALUES(653,'LAVOURISTA'); 
INSERT INTO profissao(id,descricao) VALUES(654,'LAVRADOR'); 
INSERT INTO profissao(id,descricao) VALUES(655,'LEITEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(656,'LEITURISTA'); 
INSERT INTO profissao(id,descricao) VALUES(657,'LENHADOR'); 
INSERT INTO profissao(id,descricao) VALUES(658,'LIMPADOR DE PÁRA-BRISA'); 
INSERT INTO profissao(id,descricao) VALUES(659,'LINOTIPISTA'); 
INSERT INTO profissao(id,descricao) VALUES(660,'LITÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(661,'LIVREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(662,'LIXADOR'); 
INSERT INTO profissao(id,descricao) VALUES(663,'LOCADOR DE APARELHO DE SOM'); 
INSERT INTO profissao(id,descricao) VALUES(664,'LOCUTOR'); 
INSERT INTO profissao(id,descricao) VALUES(665,'LOCUTOR DE RODEIO'); 
INSERT INTO profissao(id,descricao) VALUES(666,'LUSTRADOR'); 
INSERT INTO profissao(id,descricao) VALUES(667,'LUTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(668,'MADEIREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(669,'MAESTRO'); 
INSERT INTO profissao(id,descricao) VALUES(670,'MAGAREFE'); 
INSERT INTO profissao(id,descricao) VALUES(671,'MAGISTRADO'); 
INSERT INTO profissao(id,descricao) VALUES(672,'MANEQUIM'); 
INSERT INTO profissao(id,descricao) VALUES(673,'MANICURE'); 
INSERT INTO profissao(id,descricao) VALUES(674,'MANIPULADOR PRODUTO QUÍMICO'); 
INSERT INTO profissao(id,descricao) VALUES(675,'MAQUETISTA'); 
INSERT INTO profissao(id,descricao) VALUES(676,'MAQUILADOR'); 
INSERT INTO profissao(id,descricao) VALUES(677,'MAQUINISTA'); 
INSERT INTO profissao(id,descricao) VALUES(678,'MAQUINISTA DE BORDO'); 
INSERT INTO profissao(id,descricao) VALUES(679,'MARÍTIMO'); 
INSERT INTO profissao(id,descricao) VALUES(680,'MARCENEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(681,'MARINHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(682,'MARMORISTA'); 
INSERT INTO profissao(id,descricao) VALUES(683,'MASCATE'); 
INSERT INTO profissao(id,descricao) VALUES(684,'MASSOTERAPEUTA'); 
INSERT INTO profissao(id,descricao) VALUES(685,'MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(686,'MECÂNICO DE AERONAVE'); 
INSERT INTO profissao(id,descricao) VALUES(687,'MECÂNICO DE ELETRÔNICA'); 
INSERT INTO profissao(id,descricao) VALUES(688,'MECÂNICO OPERADOR'); 
INSERT INTO profissao(id,descricao) VALUES(689,'MECANOGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(690,'MEDICO'); 
INSERT INTO profissao(id,descricao) VALUES(691,'MEIO OFICIAL TORNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(692,'MENSAGEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(693,'MERGULHADOR'); 
INSERT INTO profissao(id,descricao) VALUES(694,'MESTRE DE OBRA'); 
INSERT INTO profissao(id,descricao) VALUES(695,'MESTRE DE PANIFICAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(696,'MESTRE HOTEL'); 
INSERT INTO profissao(id,descricao) VALUES(697,'MICROBIOLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(698,'MICROEMPRESÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(699,'MILITAR'); 
INSERT INTO profissao(id,descricao) VALUES(700,'MILITAR ATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(701,'MILITAR ESTRANGEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(702,'MILITAR INATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(703,'MINEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(704,'MINISTRO'); 
INSERT INTO profissao(id,descricao) VALUES(705,'MODELO'); 
INSERT INTO profissao(id,descricao) VALUES(706,'MODISTA'); 
INSERT INTO profissao(id,descricao) VALUES(707,'MOLDADOR'); 
INSERT INTO profissao(id,descricao) VALUES(708,'MONTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(709,'MORDOMO'); 
INSERT INTO profissao(id,descricao) VALUES(710,'MOTO BOY'); 
INSERT INTO profissao(id,descricao) VALUES(711,'MOTORNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(712,'MOTOTAXISTA'); 
INSERT INTO profissao(id,descricao) VALUES(713,'NATURALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(714,'NAVEGADOR'); 
INSERT INTO profissao(id,descricao) VALUES(715,'NEGOCIANTE'); 
INSERT INTO profissao(id,descricao) VALUES(716,'OCUPAÇÃO NÃO CLASSIFICADA'); 
INSERT INTO profissao(id,descricao) VALUES(717,'ODONTOLOGO'); 
INSERT INTO profissao(id,descricao) VALUES(718,'OFFICE BOY'); 
INSERT INTO profissao(id,descricao) VALUES(719,'OFICIAL'); 
INSERT INTO profissao(id,descricao) VALUES(720,'OFICIAL DE CARTÓRIO'); 
INSERT INTO profissao(id,descricao) VALUES(721,'OFICIAL DE JUSTIÇA'); 
INSERT INTO profissao(id,descricao) VALUES(722,'OFICIAL LEGISLATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(723,'OFTALMOLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(724,'OLEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(725,'OPERÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(726,'OPERADOR CINEMATOGRÁFICO'); 
INSERT INTO profissao(id,descricao) VALUES(727,'OPERADOR DE ÁUDIO'); 
INSERT INTO profissao(id,descricao) VALUES(728,'OPERADOR DE COMPUTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(729,'OPERADOR DE DRAGA'); 
INSERT INTO profissao(id,descricao) VALUES(730,'OPERADOR DE EMPILHADEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(731,'OPERADOR DE FORNO'); 
INSERT INTO profissao(id,descricao) VALUES(732,'OPERADOR DE GÁS'); 
INSERT INTO profissao(id,descricao) VALUES(733,'OPERADOR DE MAQUINA'); 
INSERT INTO profissao(id,descricao) VALUES(734,'OPERADOR DE MAQUINAS AGRÍCOLAS'); 
INSERT INTO profissao(id,descricao) VALUES(735,'OPERADOR DE MAQUINAS PESADAS'); 
INSERT INTO profissao(id,descricao) VALUES(736,'OPERADOR DE MOTO SERRA'); 
INSERT INTO profissao(id,descricao) VALUES(737,'OPERADOR DE RADIO'); 
INSERT INTO profissao(id,descricao) VALUES(738,'OPERADOR DE REATORES NUCLEARES'); 
INSERT INTO profissao(id,descricao) VALUES(739,'OPERADOR DE SUBESTAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(740,'OPERADOR DE TELEFONE'); 
INSERT INTO profissao(id,descricao) VALUES(741,'OPERADOR DE TRANSMISSÃO'); 
INSERT INTO profissao(id,descricao) VALUES(742,'OPERADOR DE TV'); 
INSERT INTO profissao(id,descricao) VALUES(743,'OPERADOR DE XEROX'); 
INSERT INTO profissao(id,descricao) VALUES(744,'OURIVES'); 
INSERT INTO profissao(id,descricao) VALUES(745,'PADEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(746,'PADRE'); 
INSERT INTO profissao(id,descricao) VALUES(747,'PAISAGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(748,'PAPILOSCOPISTA'); 
INSERT INTO profissao(id,descricao) VALUES(749,'PARASITOLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(750,'PARTEIRA'); 
INSERT INTO profissao(id,descricao) VALUES(751,'PASSADOR'); 
INSERT INTO profissao(id,descricao) VALUES(752,'PASTELEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(753,'PASTOR'); 
INSERT INTO profissao(id,descricao) VALUES(754,'PATINADOR'); 
INSERT INTO profissao(id,descricao) VALUES(755,'PATOLOGISTA'); 
INSERT INTO profissao(id,descricao) VALUES(756,'PEÃO'); 
INSERT INTO profissao(id,descricao) VALUES(757,'PEÃO DE CHÁCARA'); 
INSERT INTO profissao(id,descricao) VALUES(758,'PEÃO DE RODEIO'); 
INSERT INTO profissao(id,descricao) VALUES(759,'PECUARISTA'); 
INSERT INTO profissao(id,descricao) VALUES(760,'PEDREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(761,'PEIXEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(762,'PELETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(763,'PERFURADOR'); 
INSERT INTO profissao(id,descricao) VALUES(764,'PERFURADOR DE POÇOS PETRÓLEO'); 
INSERT INTO profissao(id,descricao) VALUES(765,'PERITO CRIMINAL'); 
INSERT INTO profissao(id,descricao) VALUES(766,'PERITO POLICIAL'); 
INSERT INTO profissao(id,descricao) VALUES(767,'PILOTO'); 
INSERT INTO profissao(id,descricao) VALUES(768,'PILOTO DE NAVIO'); 
INSERT INTO profissao(id,descricao) VALUES(769,'PINTOR'); 
INSERT INTO profissao(id,descricao) VALUES(770,'PINTOR DE AUTO'); 
INSERT INTO profissao(id,descricao) VALUES(771,'PINTOR DE CONSTRUÇÃO CIVIL'); 
INSERT INTO profissao(id,descricao) VALUES(772,'PINTOR DE QUADROS'); 
INSERT INTO profissao(id,descricao) VALUES(773,'PIZZAIOLLO'); 
INSERT INTO profissao(id,descricao) VALUES(774,'PLAINADOR'); 
INSERT INTO profissao(id,descricao) VALUES(775,'POLÍTICO'); 
INSERT INTO profissao(id,descricao) VALUES(776,'POLICIAL INATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(777,'POLICIAL MILITAR'); 
INSERT INTO profissao(id,descricao) VALUES(778,'POLIDOR'); 
INSERT INTO profissao(id,descricao) VALUES(779,'PORTEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(780,'PRACISTA'); 
INSERT INTO profissao(id,descricao) VALUES(781,'PRATICO DE FARMÁCIA'); 
INSERT INTO profissao(id,descricao) VALUES(782,'PRENSADOR'); 
INSERT INTO profissao(id,descricao) VALUES(783,'PROCURADOR DA REPUBLICA'); 
INSERT INTO profissao(id,descricao) VALUES(784,'PROCURADOR DE ESTADO'); 
INSERT INTO profissao(id,descricao) VALUES(785,'PROCURADOR DO INSS'); 
INSERT INTO profissao(id,descricao) VALUES(786,'PROCURADORA DA REPUBLICA'); 
INSERT INTO profissao(id,descricao) VALUES(787,'PROCURADORA DE ESTADO'); 
INSERT INTO profissao(id,descricao) VALUES(788,'PRODUTOR DE CINEMA'); 
INSERT INTO profissao(id,descricao) VALUES(789,'PRODUTOR DE TV'); 
INSERT INTO profissao(id,descricao) VALUES(790,'PRODUTOR RURAL'); 
INSERT INTO profissao(id,descricao) VALUES(791,'PROFESSOR'); 
INSERT INTO profissao(id,descricao) VALUES(792,'PROGRAMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(793,'PROJETISTA'); 
INSERT INTO profissao(id,descricao) VALUES(794,'PROMOTOR'); 
INSERT INTO profissao(id,descricao) VALUES(795,'PROMOTOR DE EVENTOS'); 
INSERT INTO profissao(id,descricao) VALUES(796,'PROMOTOR DE VENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(797,'PROMOTOR JURÍDICO'); 
INSERT INTO profissao(id,descricao) VALUES(798,'PROMOTOR PÚBLICO'); 
INSERT INTO profissao(id,descricao) VALUES(799,'PROPAGANDISTA'); 
INSERT INTO profissao(id,descricao) VALUES(800,'PROSTITUTA'); 
INSERT INTO profissao(id,descricao) VALUES(801,'PSIQUIATRA'); 
INSERT INTO profissao(id,descricao) VALUES(802,'PUGILISTA'); 
INSERT INTO profissao(id,descricao) VALUES(803,'QUITANDEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(804,'RADIALISTA'); 
INSERT INTO profissao(id,descricao) VALUES(805,'RADIOTECNICO'); 
INSERT INTO profissao(id,descricao) VALUES(806,'RADIOTELEGRAFISTA'); 
INSERT INTO profissao(id,descricao) VALUES(807,'RECEPCIONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(808,'REDATOR'); 
INSERT INTO profissao(id,descricao) VALUES(809,'RELIGIOSO'); 
INSERT INTO profissao(id,descricao) VALUES(810,'RELOJOEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(811,'REMADOR'); 
INSERT INTO profissao(id,descricao) VALUES(812,'RENDEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(813,'REPARADOR'); 
INSERT INTO profissao(id,descricao) VALUES(814,'REPOSITOR'); 
INSERT INTO profissao(id,descricao) VALUES(815,'REPRESENTANTE COMERCIAL'); 
INSERT INTO profissao(id,descricao) VALUES(816,'REPRESENTANTE DE VENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(817,'RETIFICADOR DE MOTOR'); 
INSERT INTO profissao(id,descricao) VALUES(818,'REVISOR GRÁFICO'); 
INSERT INTO profissao(id,descricao) VALUES(819,'SALGADEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(820,'SALVA VIDAS'); 
INSERT INTO profissao(id,descricao) VALUES(821,'SAPATEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(822,'SECRETARIO'); 
INSERT INTO profissao(id,descricao) VALUES(823,'SEGURADOR'); 
INSERT INTO profissao(id,descricao) VALUES(824,'SEGURANÇA'); 
INSERT INTO profissao(id,descricao) VALUES(825,'SEM OCUPAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(826,'SERICULTOR'); 
INSERT INTO profissao(id,descricao) VALUES(827,'SERIGRAFISTA'); 
INSERT INTO profissao(id,descricao) VALUES(828,'SERINGUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(829,'SERRADOR'); 
INSERT INTO profissao(id,descricao) VALUES(830,'SERRALHEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(831,'SERVENTE'); 
INSERT INTO profissao(id,descricao) VALUES(832,'SERVENTE DE PEDREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(833,'SERVIÇOS GERAIS'); 
INSERT INTO profissao(id,descricao) VALUES(834,'SERVIDOR PÚBLICO'); 
INSERT INTO profissao(id,descricao) VALUES(835,'SERVIDOR PÚBLICO MUNICIPAL'); 
INSERT INTO profissao(id,descricao) VALUES(836,'SOLDADOR'); 
INSERT INTO profissao(id,descricao) VALUES(837,'SONOPLASTA'); 
INSERT INTO profissao(id,descricao) VALUES(838,'SORVETEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(839,'SUB-GERENTE'); 
INSERT INTO profissao(id,descricao) VALUES(840,'SUPERINTENDENTE DE AEROPORTO'); 
INSERT INTO profissao(id,descricao) VALUES(841,'SUPERVISOR DE OFICINA'); 
INSERT INTO profissao(id,descricao) VALUES(842,'SUPERVISOR DE VENDAS'); 
INSERT INTO profissao(id,descricao) VALUES(843,'TÉCNICO'); 
INSERT INTO profissao(id,descricao) VALUES(844,'TÉCNICO AGRÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(845,'TÉCNICO AGROPECUÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(846,'TÉCNICO ARQUIVISTA'); 
INSERT INTO profissao(id,descricao) VALUES(847,'TÉCNICO COMPUTADOR'); 
INSERT INTO profissao(id,descricao) VALUES(848,'TÉCNICO DE ARTES GRÁFICAS'); 
INSERT INTO profissao(id,descricao) VALUES(849,'TÉCNICO DE CONTABILIDADE'); 
INSERT INTO profissao(id,descricao) VALUES(850,'TÉCNICO DE FROTA'); 
INSERT INTO profissao(id,descricao) VALUES(851,'TÉCNICO DE FUTEBOL'); 
INSERT INTO profissao(id,descricao) VALUES(852,'TÉCNICO DE IMPERMEABILIZAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(853,'TÉCNICO DE laboratório'); 
INSERT INTO profissao(id,descricao) VALUES(854,'TÉCNICO DE laticínios'); 
INSERT INTO profissao(id,descricao) VALUES(855,'TÉCNICO DE MINERAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(856,'TÉCNICO DE NUTRIÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(857,'TÉCNICO DE OBRAS'); 
INSERT INTO profissao(id,descricao) VALUES(858,'TÉCNICO DE PRODUÇÃO alimentícios'); 
INSERT INTO profissao(id,descricao) VALUES(859,'TÉCNICO DE RAIOS-X'); 
INSERT INTO profissao(id,descricao) VALUES(860,'TÉCNICO DE SERVIÇOS ADMINISTRATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(861,'TÉCNICO DE TV'); 
INSERT INTO profissao(id,descricao) VALUES(862,'TÉCNICO EM ADMINISTRAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(863,'TÉCNICO EM AGRONOMIA'); 
INSERT INTO profissao(id,descricao) VALUES(864,'TÉCNICO EM CONTABILIDADE'); 
INSERT INTO profissao(id,descricao) VALUES(865,'TÉCNICO EM ENFERMAGEM'); 
INSERT INTO profissao(id,descricao) VALUES(866,'TÉCNICO EM PAPILOSCOPIA'); 
INSERT INTO profissao(id,descricao) VALUES(867,'TÉCNICO EM PARAMEDICO'); 
INSERT INTO profissao(id,descricao) VALUES(868,'TÉCNICO EM PATOLOGIA'); 
INSERT INTO profissao(id,descricao) VALUES(869,'TÉCNICO EM PERFURAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(870,'TÉCNICO EM PESCA'); 
INSERT INTO profissao(id,descricao) VALUES(871,'TÉCNICO EM PETRÓLEO'); 
INSERT INTO profissao(id,descricao) VALUES(872,'TÉCNICO EM PROJETISTA'); 
INSERT INTO profissao(id,descricao) VALUES(873,'TÉCNICO EM PUBLICIDADE'); 
INSERT INTO profissao(id,descricao) VALUES(874,'TÉCNICO EM REFRIGERAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(875,'TÉCNICO EM SEG DO TRABALHO'); 
INSERT INTO profissao(id,descricao) VALUES(876,'TÉCNICO EM TELECOMUNICAÇÃO'); 
INSERT INTO profissao(id,descricao) VALUES(877,'TÉCNICO EM TELEFONIA'); 
INSERT INTO profissao(id,descricao) VALUES(878,'TÉCNICO EM TRANSPORTE'); 
INSERT INTO profissao(id,descricao) VALUES(879,'TÉCNICO EM VULCANIZAÇÕES'); 
INSERT INTO profissao(id,descricao) VALUES(880,'TÉCNICO HIDRÁULICO'); 
INSERT INTO profissao(id,descricao) VALUES(881,'TÉCNICO INSTRUMENTISTA'); 
INSERT INTO profissao(id,descricao) VALUES(882,'TÉCNICO LEGISLATIVO'); 
INSERT INTO profissao(id,descricao) VALUES(883,'TÉCNICO QUÍMICO'); 
INSERT INTO profissao(id,descricao) VALUES(884,'TÉCNICO TRIBUTÁRIO'); 
INSERT INTO profissao(id,descricao) VALUES(885,'TABELIÃO'); 
INSERT INTO profissao(id,descricao) VALUES(886,'TANOEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(887,'TAPECEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(888,'TAQUIGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(889,'TAXISTA'); 
INSERT INTO profissao(id,descricao) VALUES(890,'TECELÃO'); 
INSERT INTO profissao(id,descricao) VALUES(891,'TELEFONISTA'); 
INSERT INTO profissao(id,descricao) VALUES(892,'TELEGRAFISTA'); 
INSERT INTO profissao(id,descricao) VALUES(893,'TESOUREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(894,'TINTUREIRO'); 
INSERT INTO profissao(id,descricao) VALUES(895,'TIPÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(896,'TOPÓGRAFO'); 
INSERT INTO profissao(id,descricao) VALUES(897,'TORNEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(898,'TORNEIRO MECÂNICO'); 
INSERT INTO profissao(id,descricao) VALUES(899,'TRABALHADOR RURAL'); 
INSERT INTO profissao(id,descricao) VALUES(900,'TRADUTOR'); 
INSERT INTO profissao(id,descricao) VALUES(901,'TRATORISTA'); 
INSERT INTO profissao(id,descricao) VALUES(902,'TURISMO'); 
INSERT INTO profissao(id,descricao) VALUES(903,'VAQUEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(904,'VAREJISTA'); 
INSERT INTO profissao(id,descricao) VALUES(905,'VENDEDOR AMBULANTE'); 
INSERT INTO profissao(id,descricao) VALUES(906,'VIDRACEIRO'); 
INSERT INTO profissao(id,descricao) VALUES(907,'VIGIA'); 
INSERT INTO profissao(id,descricao) VALUES(908,'VIGILANTE'); 
INSERT INTO profissao(id,descricao) VALUES(909,'VULCANIZADO'); 
INSERT INTO profissao(id,descricao) VALUES(910,'ZELADOR'); 
INSERT INTO profissao(id,descricao) VALUES(911,'TECNÓLOGO EM SANEAMENTO BÁSICO E OBRAS HIDRÁULICAS'); 


INSERT INTO escolaridade (id, descricao, sequencia) VALUES (1, 'ENSINO FUNDAMENTAL INCOMPLETO', 6);
INSERT INTO escolaridade (id, descricao, sequencia) VALUES (2, 'ENSINO FUNDAMENTAL COMPLETO', 5);
INSERT INTO escolaridade (id, descricao, sequencia) VALUES (3, 'ENSINO MÉDIO INCOMPLETO', 4);
INSERT INTO escolaridade (id, descricao, sequencia) VALUES (4, 'ENSINO MÉDIO COMPLETO', 3);
INSERT INTO escolaridade (id, descricao, sequencia) VALUES (5, 'ENSINO SUPERIOR INCOMPLETO', 2);
INSERT INTO escolaridade (id, descricao, sequencia) VALUES (6, 'ENSINO SUPERIOR COMPLETO', 1);

INSERT INTO menu(id,pai_id,nome,descricao,action,is_restrito,ordem) VALUES(1249430,30450,'Orçamento de Seguros','Orçamento de Seguros','/orcamentoSeguro/displayList.action',TRUE,6);
INSERT INTO menu_role VALUES(1533545,1249430,50);
INSERT INTO menu_role VALUES(1533546,1249430,1);
INSERT INTO menu_role VALUES(1533547,1249430,8);
INSERT INTO menu_role VALUES(1533548,1249430,10);
INSERT INTO menu_role VALUES(1533549,1249430,14);
INSERT INTO menu_role VALUES(1533550,1249430,16);
INSERT INTO menu_role VALUES(1533551,1249430,20);
INSERT INTO menu_role VALUES(1533552,1249430,22);
INSERT INTO menu_role VALUES(1533553,1249430,26);
INSERT INTO menu_role VALUES(1533554,1249430,28);
INSERT INTO menu_role VALUES(1533555,1249430,32);
INSERT INTO menu_role VALUES(1533556,1249430,34);
INSERT INTO menu_role VALUES(1533557,1249430,38);
INSERT INTO menu_role VALUES(1533558,1249430,40);
INSERT INTO menu_role VALUES(1533559,1249430,44);
INSERT INTO menu_role VALUES(1533560,1249430,46);
INSERT INTO menu_role VALUES(1533561,1249430,52);
INSERT INTO menu_role VALUES(1533562,1249430,56);
INSERT INTO menu_role VALUES(1533563,1249430,58);
INSERT INTO menu_role VALUES(1533564,1249430,62);
INSERT INTO menu_role VALUES(1533565,1249430,64);
INSERT INTO menu_role VALUES(1533566,1249430,68);
INSERT INTO menu_role VALUES(1533567,1249430,70);
INSERT INTO menu_role VALUES(1533568,1249430,69140);
INSERT INTO menu_role VALUES(1533569,1249430,588910);
INSERT INTO menu_role VALUES(1533570,1249430,588911);
INSERT INTO menu_role VALUES(1533571,1249430,589830);
INSERT INTO menu_role VALUES(1533572,1249430,589831);
INSERT INTO menu_role VALUES(1533573,1249430,595901);
INSERT INTO menu_role VALUES(1533574,1249430,602650);
INSERT INTO menu_role VALUES(1533575,1249430,602654);
INSERT INTO menu_role VALUES(1533576,1249430,617422);
INSERT INTO menu_role VALUES(1533577,1249430,639390);
INSERT INTO menu_role VALUES(1533578,1249430,639392);
INSERT INTO menu_role VALUES(1533579,1249430,639395);
INSERT INTO menu_role VALUES(1533580,1249430,650450);
INSERT INTO menu_role VALUES(1533581,1249430,650454);
INSERT INTO menu_role VALUES(1533582,1249430,680710);
INSERT INTO menu_role VALUES(1533583,1249430,680716);
INSERT INTO menu_role VALUES(1533584,1249430,680717);
INSERT INTO menu_role VALUES(1533585,1249430,681020);
INSERT INTO menu_role VALUES(1533586,1249430,705402);
INSERT INTO menu_role VALUES(1533587,1249430,705405);
INSERT INTO menu_role VALUES(1533588,1249430,743231);
INSERT INTO menu_role VALUES(1533589,1249430,752980);
INSERT INTO menu_role VALUES(1533590,1249430,752984);
INSERT INTO menu_role VALUES(1533591,1249430,756050);
INSERT INTO menu_role VALUES(1533592,1249430,756054);
INSERT INTO menu_role VALUES(1533593,1249430,996300);
INSERT INTO menu_role VALUES(1533594,1249430,996301);
INSERT INTO menu_role VALUES(1533595,1249430,1157500);

INSERT INTO acao VALUES(1249440,'Criar Nova Cotação','F2-Criar nova',1249430,'Criar Nova Cotação',FALSE);

INSERT INTO acao_role VALUES (1533552,588910,1249440);
INSERT INTO acao_role VALUES (1533553,588911,1249440);
INSERT INTO acao_role VALUES (1533554,588912,1249440);
INSERT INTO acao_role VALUES (1533555,589830,1249440);
INSERT INTO acao_role VALUES (1533556,589831,1249440);
INSERT INTO acao_role VALUES (1533557,1,1249440);
INSERT INTO acao_role VALUES (1533558,680710,1249440);
INSERT INTO acao_role VALUES (1533559,69140,1249440);
INSERT INTO acao_role VALUES (1533560,70730,1249440);
INSERT INTO acao_role VALUES (1533561,426310,1249440);
INSERT INTO acao_role VALUES (1533562,426311,1249440);
INSERT INTO acao_role VALUES (1533563,8,1249440);
INSERT INTO acao_role VALUES (1533564,9,1249440);
INSERT INTO acao_role VALUES (1533565,10,1249440);
INSERT INTO acao_role VALUES (1533566,11,1249440);
INSERT INTO acao_role VALUES (1533567,12,1249440);
INSERT INTO acao_role VALUES (1533568,13,1249440);
INSERT INTO acao_role VALUES (1533569,14,1249440);
INSERT INTO acao_role VALUES (1533570,15,1249440);
INSERT INTO acao_role VALUES (1533571,16,1249440);
INSERT INTO acao_role VALUES (1533572,17,1249440);
INSERT INTO acao_role VALUES (1533573,18,1249440);
INSERT INTO acao_role VALUES (1533574,19,1249440);
INSERT INTO acao_role VALUES (1533575,20,1249440);
INSERT INTO acao_role VALUES (1533576,21,1249440);
INSERT INTO acao_role VALUES (1533577,22,1249440);
INSERT INTO acao_role VALUES (1533578,23,1249440);
INSERT INTO acao_role VALUES (1533579,24,1249440);
INSERT INTO acao_role VALUES (1533580,25,1249440);
INSERT INTO acao_role VALUES (1533581,26,1249440);
INSERT INTO acao_role VALUES (1533582,27,1249440);
INSERT INTO acao_role VALUES (1533583,28,1249440);
INSERT INTO acao_role VALUES (1533584,29,1249440);
INSERT INTO acao_role VALUES (1533585,30,1249440);
INSERT INTO acao_role VALUES (1533586,31,1249440);
INSERT INTO acao_role VALUES (1533587,32,1249440);
INSERT INTO acao_role VALUES (1533588,33,1249440);
INSERT INTO acao_role VALUES (1533589,34,1249440);
INSERT INTO acao_role VALUES (1533590,35,1249440);
INSERT INTO acao_role VALUES (1533591,36,1249440);
INSERT INTO acao_role VALUES (1533592,37,1249440);
INSERT INTO acao_role VALUES (1533593,38,1249440);
INSERT INTO acao_role VALUES (1533594,39,1249440);
INSERT INTO acao_role VALUES (1533595,40,1249440);
INSERT INTO acao_role VALUES (1533596,41,1249440);
INSERT INTO acao_role VALUES (1533597,42,1249440);
INSERT INTO acao_role VALUES (1533598,43,1249440);
INSERT INTO acao_role VALUES (1533599,44,1249440);
INSERT INTO acao_role VALUES (1533600,45,1249440);
INSERT INTO acao_role VALUES (1533601,46,1249440);
INSERT INTO acao_role VALUES (1533602,47,1249440);
INSERT INTO acao_role VALUES (1533603,48,1249440);
INSERT INTO acao_role VALUES (1533604,49,1249440);
INSERT INTO acao_role VALUES (1533605,50,1249440);
INSERT INTO acao_role VALUES (1533606,51,1249440);
INSERT INTO acao_role VALUES (1533607,52,1249440);
INSERT INTO acao_role VALUES (1533608,53,1249440);
INSERT INTO acao_role VALUES (1533609,54,1249440);
INSERT INTO acao_role VALUES (1533610,55,1249440);
INSERT INTO acao_role VALUES (1533611,56,1249440);
INSERT INTO acao_role VALUES (1533612,57,1249440);
INSERT INTO acao_role VALUES (1533613,58,1249440);
INSERT INTO acao_role VALUES (1533614,59,1249440);
INSERT INTO acao_role VALUES (1533615,60,1249440);
INSERT INTO acao_role VALUES (1533616,61,1249440);
INSERT INTO acao_role VALUES (1533617,62,1249440);
INSERT INTO acao_role VALUES (1533618,63,1249440);
INSERT INTO acao_role VALUES (1533619,64,1249440);
INSERT INTO acao_role VALUES (1533620,65,1249440);
INSERT INTO acao_role VALUES (1533621,66,1249440);
INSERT INTO acao_role VALUES (1533622,67,1249440);
INSERT INTO acao_role VALUES (1533623,68,1249440);
INSERT INTO acao_role VALUES (1533624,69,1249440);
INSERT INTO acao_role VALUES (1533625,70,1249440);
INSERT INTO acao_role VALUES (1533626,71,1249440);
INSERT INTO acao_role VALUES (1533627,72,1249440);
INSERT INTO acao_role VALUES (1533628,73,1249440);
INSERT INTO acao_role VALUES (1533629,595900,1249440);
INSERT INTO acao_role VALUES (1533630,595901,1249440);
INSERT INTO acao_role VALUES (1533631,602650,1249440);
INSERT INTO acao_role VALUES (1533632,602651,1249440);
INSERT INTO acao_role VALUES (1533633,602652,1249440);
INSERT INTO acao_role VALUES (1533634,610470,1249440);
INSERT INTO acao_role VALUES (1533635,602654,1249440);
INSERT INTO acao_role VALUES (1533636,602655,1249440);
INSERT INTO acao_role VALUES (1533637,602656,1249440);
INSERT INTO acao_role VALUES (1533638,617421,1249440);
INSERT INTO acao_role VALUES (1533639,617422,1249440);
INSERT INTO acao_role VALUES (1533640,617423,1249440);
INSERT INTO acao_role VALUES (1533641,617424,1249440);
INSERT INTO acao_role VALUES (1533642,617420,1249440);
INSERT INTO acao_role VALUES (1533643,639390,1249440);
INSERT INTO acao_role VALUES (1533644,639391,1249440);
INSERT INTO acao_role VALUES (1533645,639392,1249440);
INSERT INTO acao_role VALUES (1533646,639393,1249440);
INSERT INTO acao_role VALUES (1533647,639394,1249440);
INSERT INTO acao_role VALUES (1533648,639395,1249440);
INSERT INTO acao_role VALUES (1533649,650450,1249440);
INSERT INTO acao_role VALUES (1533650,42700,1249440);
INSERT INTO acao_role VALUES (1533651,650451,1249440);
INSERT INTO acao_role VALUES (1533652,650452,1249440);
INSERT INTO acao_role VALUES (1533653,650453,1249440);
INSERT INTO acao_role VALUES (1533654,650454,1249440);
INSERT INTO acao_role VALUES (1533655,680711,1249440);
INSERT INTO acao_role VALUES (1533656,680712,1249440);
INSERT INTO acao_role VALUES (1533657,680713,1249440);
INSERT INTO acao_role VALUES (1533658,680714,1249440);
INSERT INTO acao_role VALUES (1533659,680715,1249440);
INSERT INTO acao_role VALUES (1533660,680716,1249440);
INSERT INTO acao_role VALUES (1533661,680717,1249440);
INSERT INTO acao_role VALUES (1533662,680718,1249440);
INSERT INTO acao_role VALUES (1533663,680719,1249440);
INSERT INTO acao_role VALUES (1533664,681020,1249440);
INSERT INTO acao_role VALUES (1533665,681021,1249440);
INSERT INTO acao_role VALUES (1533666,705400,1249440);
INSERT INTO acao_role VALUES (1533667,705401,1249440);
INSERT INTO acao_role VALUES (1533668,705402,1249440);
INSERT INTO acao_role VALUES (1533669,705403,1249440);
INSERT INTO acao_role VALUES (1533670,705404,1249440);
INSERT INTO acao_role VALUES (1533671,705405,1249440);
INSERT INTO acao_role VALUES (1533672,705406,1249440);
INSERT INTO acao_role VALUES (1533673,743230,1249440);
INSERT INTO acao_role VALUES (1533674,743231,1249440);
INSERT INTO acao_role VALUES (1533675,752980,1249440);
INSERT INTO acao_role VALUES (1533676,752981,1249440);
INSERT INTO acao_role VALUES (1533677,752982,1249440);
INSERT INTO acao_role VALUES (1533678,752983,1249440);
INSERT INTO acao_role VALUES (1533679,752984,1249440);
INSERT INTO acao_role VALUES (1533680,756050,1249440);
INSERT INTO acao_role VALUES (1533681,756051,1249440);
INSERT INTO acao_role VALUES (1533682,756052,1249440);
INSERT INTO acao_role VALUES (1533683,756053,1249440);
INSERT INTO acao_role VALUES (1533684,756054,1249440);
INSERT INTO acao_role VALUES (1533685,874780,1249440);
INSERT INTO acao_role VALUES (1533686,874781,1249440);
INSERT INTO acao_role VALUES (1533687,996300,1249440);
INSERT INTO acao_role VALUES (1533688,996301,1249440);
INSERT INTO acao_role VALUES (1533689,1157500,1249440);

DELETE FROM dominio_esp WHERE id = 2907;
DELETE FROM dominio_esp WHERE id = 2906;

UPDATE proposta SET versao = 1 WHERE orcamento_seguro_id IS NULL;
UPDATE coberturas SET descricao = 'DANOS MATERIAIS' WHERE descricao = 'DANOS MATERIAS';

INSERT INTO tipo_mensagem (id, descricao, status) VALUES (1, 'Orcamento', true);
INSERT INTO template_mensagem (id, assunto, corpo_texto, status, tipo_mensagem_id) VALUES (1, 'Cotação de Seguro', '<div align="center"><b>Orçamento de Seguro</b><br><div align="left"><br>Prezado Cliente,<br>conforme solicitado, segue em anexo orçamento de seguro do seu veículo.<br><br>Na oportunidade, colocamo-nos à sua disposição para quaisquer escalecimentos adicionais.<br><br>Atenciosamente,<br><br>G8 Corretora de Seguros<br>(62) 3281-3399<br type="_moz"></div></div>', true, 1);
INSERT INTO servicos_email (id, host, porta, protocolo, email_servidor, senha_email_servidor, is_autenticacao, email_corretora, corretora_id) VALUES (1, 'smtp.gmail.com', 465, 'smtps', 'iseg.informa@gmail.com', 'iseg@2012', true, 'iseg.informa@gmail.com', 374250);

INSERT INTO rastreador_iseg values(1,'3Sil - Smart',true);
INSERT INTO rastreador_iseg values(2,'3T Systems - 3T Controle',true);
INSERT INTO rastreador_iseg values(3,'Actiontec',true);
INSERT INTO rastreador_iseg values(4,'Alarcom - MXT - 150 E',true);
INSERT INTO rastreador_iseg values(5,'Alltech - Continental VDO',true);
INSERT INTO rastreador_iseg values(6,'AutoTrac - Auto GSM/GPRS',true);
INSERT INTO rastreador_iseg values(7,'AutoTrac - Celular GSM/GPRS',true);
INSERT INTO rastreador_iseg values(8,'AutoTrac - Pronta resposta',true);
INSERT INTO rastreador_iseg values(9,'AutoTrac - Satelite',true);
INSERT INTO rastreador_iseg values(10,'BR Lock GPS/GPRS',true);
INSERT INTO rastreador_iseg values(11,'Bysat',true);
INSERT INTO rastreador_iseg values(12,'Car System - GSM/GPRS',true);
INSERT INTO rastreador_iseg values(13,'Celtec - Autocargo GPRS',true);
INSERT INTO rastreador_iseg values(14,'Celtec - Autocargo HIBRIDO',true);
INSERT INTO rastreador_iseg values(15,'Cielo - Cel Hibrido GS 10',true);
INSERT INTO rastreador_iseg values(16,'Cielo - GSM/GPRS GS9',true);
INSERT INTO rastreador_iseg values(17,'Cielo - Cel GSM/GPRS GS8',true);
INSERT INTO rastreador_iseg values(18,'Consillux - GSM',true);
INSERT INTO rastreador_iseg values(19,'Controle Monitoramento - MCT 020',true);
INSERT INTO rastreador_iseg values(20,'ControlSat - Controlcell 4000',true);
INSERT INTO rastreador_iseg values(21,'ENGESEG  - Engetrack',true);
INSERT INTO rastreador_iseg values(22,'GlobalTech - GT GPRS KA',true);
INSERT INTO rastreador_iseg values(23,'Golsat car/frota',true);
INSERT INTO rastreador_iseg values(24,'GPRSAT - Auto Full',true);
INSERT INTO rastreador_iseg values(25,'Graber Litgh',true);
INSERT INTO rastreador_iseg values(26,'Graber - MAXTRACK MTC-400 GSM/GPRS',true);
INSERT INTO rastreador_iseg values(27,'Guardone',true);
INSERT INTO rastreador_iseg values(28,'Ituran - KIT S-GPRS / sem bloqueio',true);
INSERT INTO rastreador_iseg values(29,'Ituran - GPS/GPRS (MHub/SGPRS) com Bloqueio',true);
INSERT INTO rastreador_iseg values(30,'Jabursat -  III Hibrido',true);
INSERT INTO rastreador_iseg values(31,'LC Sat - LC-500 STD',true);
INSERT INTO rastreador_iseg values(32,'Link Monitoramento Auto',true);
INSERT INTO rastreador_iseg values(33,'Lo Jack - Tracker Local',true);
INSERT INTO rastreador_iseg values(34,'Lo Jack - VLU (RF)',true);
INSERT INTO rastreador_iseg values(35,'LocSat - AVL GPS V',true);
INSERT INTO rastreador_iseg values(36,'Logikos - LR 800',true);
INSERT INTO rastreador_iseg values(37,'Logosnet',true);
INSERT INTO rastreador_iseg values(38,'Macorsat',true);
INSERT INTO rastreador_iseg values(39,'MF SeguranÃ§a - MTC400',true);
INSERT INTO rastreador_iseg values(40,'Omnilink',true);
INSERT INTO rastreador_iseg values(41,'Omniloc',true);
INSERT INTO rastreador_iseg values(42,'Onix Sat - Jabursat City GPS',true);
INSERT INTO rastreador_iseg values(43,'Onix Sat - Jabursat II',true);
INSERT INTO rastreador_iseg values(44,'Onix Sat - Sky GPS',true);
INSERT INTO rastreador_iseg values(45,'Onix Sat - GSM/GPRS',true);
INSERT INTO rastreador_iseg values(46,'Onix Sat - Hibrido',true);
INSERT INTO rastreador_iseg values(47,'Pointer - GSM/GPS Compact Fleet',true);
INSERT INTO rastreador_iseg values(48,'Pósitron - GPRS/GPS',true);
INSERT INTO rastreador_iseg values(49,'Pósitron - GPRS/GPS com Alarme',true);
INSERT INTO rastreador_iseg values(50,'Pósitron - GPRS/GPS Selado',true);
INSERT INTO rastreador_iseg values(51,'Prisma Sat - 400',true);
INSERT INTO rastreador_iseg values(52,'Protect Sat - 400 GPS',true);
INSERT INTO rastreador_iseg values(53,'Protect Sat - 400 H',true);
INSERT INTO rastreador_iseg values(54,'PS - DAF-V',true);
INSERT INTO rastreador_iseg values(55,'Sascar',true);
INSERT INTO rastreador_iseg values(56,'Sat Company - GP Sat',true);
INSERT INTO rastreador_iseg values(57,'Seg Sat - GPS PLUS',true);
INSERT INTO rastreador_iseg values(58,'Seg Sat - RF',true);
INSERT INTO rastreador_iseg values(59,'Serv Sat - MTC500',true);
INSERT INTO rastreador_iseg values(60,'Siemens - Rastreador Light',true);
INSERT INTO rastreador_iseg values(61,'SIM Rastreamento - SIMTRACK',true);
INSERT INTO rastreador_iseg values(62,'Simples GPS - RST-BGS3',true);
INSERT INTO rastreador_iseg values(63,'Sitrack - ITD-800',true);
INSERT INTO rastreador_iseg values(64,'Skytrack - NET 1.0',true);
INSERT INTO rastreador_iseg values(65,'SpySat GSM',true);
INSERT INTO rastreador_iseg values(66,'Telecom Track',true);
INSERT INTO rastreador_iseg values(67,'Teletrim - GSM',true);
INSERT INTO rastreador_iseg values(68,'Total Sat - TS Blocker 5000',true);
INSERT INTO rastreador_iseg values(69,'Vigauto',true);
INSERT INTO rastreador_iseg values(70,'Vigitrack',true);
INSERT INTO rastreador_iseg values(71,'Volpato Rastreamento - MXT 150/151',true);
INSERT INTO rastreador_iseg values(72,'W Solution - WS 150 (MXT 150)',true);
INSERT INTO rastreador_iseg values(73,'Wise Track - FMS/W',true);
INSERT INTO rastreador_iseg values(74,'X3 - Radio Frequencia',true);

INSERT INTO bloqueador_iseg VALUES (1,'Albany - Albany Link',true);
INSERT INTO bloqueador_iseg VALUES (2,'BipWherer - Bip Auto',true);
INSERT INTO bloqueador_iseg VALUES (3,'Car System - NS',true);
INSERT INTO bloqueador_iseg VALUES (4,'Conectel - Conect Car',true);
INSERT INTO bloqueador_iseg VALUES (5,'Graber Bloqueador',true);
INSERT INTO bloqueador_iseg VALUES (6,'Guardone',true);
INSERT INTO bloqueador_iseg VALUES (7,'Mobi System - MS30',true);
INSERT INTO bloqueador_iseg VALUES (8,'Orbsystem - Orbylock',true);
INSERT INTO bloqueador_iseg VALUES (9,'PKR - PKRSat-Blocklink',true);
INSERT INTO bloqueador_iseg VALUES (10,'Pósitron - c/ Alarme RDLink',true);
INSERT INTO bloqueador_iseg VALUES (11,'Pósitron - RDLink',true);
INSERT INTO bloqueador_iseg VALUES (12,'Sensocar - SensoBLock',true);
INSERT INTO bloqueador_iseg VALUES (13,'Teletrim - StopCar',true);
INSERT INTO bloqueador_iseg VALUES (14,'Ituran - Localizador (RF) TULIP',true);

UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 26421;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 29895;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 22732;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 2884;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 22733;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 20760;
UPDATE coberturas set coberturas_iseg_id = 212 WHERE id = 22131;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 21141;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 192732;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 172884;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 192733;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 190760;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 192131;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 191141;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 196271;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 197119;
UPDATE coberturas set coberturas_iseg_id = 191 WHERE id = 321520;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 3540;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 3578;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3524;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 3541;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 3510;
UPDATE coberturas set coberturas_iseg_id = 212 WHERE id = 3530;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 3512;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 3614;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371056;
UPDATE coberturas set coberturas_iseg_id = 191 WHERE id = 3654;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 371345;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 371411;
UPDATE coberturas set coberturas_iseg_id = 191 WHERE id = 371443;
UPDATE coberturas set coberturas_iseg_id = 212 WHERE id = 371423;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 371426;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374276;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 374631;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 374565;
UPDATE coberturas set coberturas_iseg_id = 212 WHERE id = 374643;
UPDATE coberturas set coberturas_iseg_id = 191 WHERE id = 374663;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 374646;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 1157320;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 432260;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582287;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 582487;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 582488;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 582491;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582596;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 582612;
UPDATE coberturas set coberturas_iseg_id = 190 WHERE id = 582711;
UPDATE coberturas set coberturas_iseg_id = 212 WHERE id = 582723;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 582725;
UPDATE coberturas set coberturas_iseg_id = 191 WHERE id = 582746;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 796972;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 796971;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 1137264;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 1153910;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 1212134;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 1153914;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 1157322;
UPDATE coberturas set coberturas_iseg_id = 208 WHERE id = 1210750;
UPDATE coberturas set coberturas_iseg_id = 211 WHERE id = 1157324;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 1210751;
UPDATE coberturas set coberturas_iseg_id = 213 WHERE id = 1157323;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 26423;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 29690;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 29890;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 24400;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 24407;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 25300;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 189;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 216;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 17450;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 17461;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 17482;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 21980;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 21981;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 2882;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 21986;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 22137;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 194400;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 194407;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 195300;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 170189;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 170216;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 187450;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 187461;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 187482;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 191980;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 191981;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 172882;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 191986;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 192137;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 196273;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 196568;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 197114;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3017;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3022;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3027;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3496;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3499;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3502;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3505;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3514;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3515;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3522;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3525;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3535;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3580;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3604;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3608;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371167;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371168;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371169;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371170;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371171;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371172;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371173;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371174;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371175;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371176;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371177;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371483;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371484;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371485;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371486;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 371487;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 378510;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374387;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374388;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374389;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374390;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374391;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374392;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374393;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374394;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374395;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374396;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374397;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374703;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374704;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374705;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374707;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 386420;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 389230;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582415;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582416;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582417;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582418;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582419;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582420;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582421;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582422;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582423;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582424;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582425;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582426;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582427;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582789;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582790;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582791;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 582792;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 3508;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 374706;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 876400;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 1137263;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 1157325;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 1137269;
UPDATE coberturas set coberturas_iseg_id = 180 WHERE id = 1212130;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 26425;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 29691;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 29891;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 24402;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 24408;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 25301;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 188;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 215;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 17455;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 17466;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 18440;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 21983;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 2883;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 21987;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 22133;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 22138;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 194402;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 194408;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 195301;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 170188;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 170215;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 187455;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 187466;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 188440;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 191983;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 172883;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 191987;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 192133;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 192138;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 196274;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 196569;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 197111;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3018;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3023;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3028;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3495;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3500;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3501;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3506;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3516;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3523;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3526;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3531;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3536;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3581;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3605;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3609;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371123;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371124;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371125;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371126;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371127;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371128;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371129;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371130;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371131;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371132;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371133;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371478;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371479;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371480;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371481;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 371482;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374343;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374344;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374345;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374346;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374347;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374348;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374349;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374350;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374351;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374352;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374353;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374699;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374700;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374701;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374702;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 374698;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 378511;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 386421;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 389231;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582362;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582363;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582364;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582365;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582366;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582367;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582368;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582369;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582370;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582371;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582372;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582373;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582374;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582784;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582785;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582786;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 582787;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 3509;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 876402;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 1157326;
UPDATE coberturas set coberturas_iseg_id = 181 WHERE id = 1212131;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 26427;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 29693;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 29893;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 191;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 218;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 17452;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 17463;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 17484;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 24404;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 24560;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 25303;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 21984;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 21989;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 22135;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 22730;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 170191;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 170218;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 187452;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 187463;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 187484;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 194404;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 194560;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 195303;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3030;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 191984;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 191989;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 192135;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 192730;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 196276;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 197021;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 197112;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3002;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3005;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3008;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3011;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3020;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3025;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3519;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3528;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3533;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3538;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3583;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3607;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3611;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371095;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371096;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371097;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371098;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371099;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371100;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371101;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371102;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371103;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371400;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371401;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371404;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371406;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371407;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 371408;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374315;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374316;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374317;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374318;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374319;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374320;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374321;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374323;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374620;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374621;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374624;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374626;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374627;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374628;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 378512;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 386423;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 389234;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582327;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582328;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582329;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582330;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582331;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582332;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582333;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582335;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582689;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582691;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582693;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582694;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582695;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582696;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582702;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582705;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 3014;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 374322;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 876403;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 1137266;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 1153912;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 1157327;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 1212133;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 26428;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 29694;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 29894;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 192;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 219;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 17453;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 17464;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 17485;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 24405;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 24561;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 25304;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 21982;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 22130;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 22136;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 22731;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 170192;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 170219;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 187453;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 187464;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 187485;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 194405;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 194561;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 195304;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 191982;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 192130;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 192136;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 192731;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 196277;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 197022;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 197113;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3003;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3006;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3009;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3012;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3021;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3026;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3031;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3015;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3517;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3529;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3534;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3539;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3584;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3603;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 3612;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371086;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371087;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371088;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371089;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371090;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371091;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371092;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371093;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371094;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371371;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371372;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371373;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371374;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371375;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 371376;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374306;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374307;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374308;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374309;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374311;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374312;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374313;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374314;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374591;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374592;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374593;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374594;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374595;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374596;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 378513;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 386424;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 389235;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582318;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582319;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582320;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582321;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582322;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582323;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582324;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582326;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582648;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582649;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582650;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582651;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582652;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582653;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582656;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 582657;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 374310;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 876405;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 1137267;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 1153913;
UPDATE coberturas set coberturas_iseg_id = 177 WHERE id = 1157328;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 193;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 220;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 17454;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 17465;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 17486;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 170193;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 170220;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 187454;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 187465;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 187486;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 3004;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 3007;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 3010;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 3013;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 3016;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 371081;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 371082;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 371083;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 371084;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 371085;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 374301;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 374302;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 374303;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 582313;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 582315;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 582316;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 582317;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 374305;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 876404;
UPDATE coberturas set coberturas_iseg_id = 178 WHERE id = 374304;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 190;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 26420;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 26426;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 29692;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 26422;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 29892;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 24403;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 24409;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 25302;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 217;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 17451;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 17462;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 17483;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 21985;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 21988;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 22134;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 22139;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 194403;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 194409;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 195302;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371178;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 170190;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 170217;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 187451;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 187462;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 187483;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 191985;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 191988;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 192134;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 192139;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 196270;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 196272;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 196275;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 197020;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 197116;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371179;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3019;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3024;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3029;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3497;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3498;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3503;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3504;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3518;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3527;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3532;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3537;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3507;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3577;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3579;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3582;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3606;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 3610;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371182;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371183;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371184;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371185;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371186;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371187;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371188;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371189;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371190;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371191;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371488;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371489;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371490;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371491;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 371492;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374398;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374399;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374402;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374403;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374404;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374405;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374406;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374407;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374408;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374409;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374410;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374411;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374708;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374710;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374711;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374712;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 374709;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 386422;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 389232;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 389233;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 475870;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582428;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582429;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582430;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582431;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582432;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582434;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582435;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582437;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582438;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582439;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582440;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582442;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582443;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582444;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582445;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582446;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582794;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582795;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582797;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 582798;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 876401;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 1137265;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 1153911;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 1157329;
UPDATE coberturas set coberturas_iseg_id = 179 WHERE id = 1212132;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 1137268;
UPDATE coberturas set coberturas_iseg_id = 192 WHERE id = 73462;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 20761;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 190761;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 3513;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 371545;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 374765;
UPDATE coberturas set coberturas_iseg_id = 185 WHERE id = 582853;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 21140;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 191140;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 3511;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 371659;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 374879;
UPDATE coberturas set coberturas_iseg_id = 210 WHERE id = 582978;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 371230;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 371231;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 371234;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 374450;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 374451;
UPDATE coberturas set coberturas_iseg_id = 188 WHERE id = 374454;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 796973;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 432262;
UPDATE coberturas set coberturas_iseg_id = 176 WHERE id = 582595;

UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 26505;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 26506;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 26507;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 28492;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 28493;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 28494;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 28495;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 36400;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 26501;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 40140;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 73520;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 73521;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 17493;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 198;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 24417;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 24418;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 40143;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 23400;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 23404;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 24410;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 73522;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 29700;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 24412;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 26504;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 23644;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 23770;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 36408;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 36409;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 40141;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 40146;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 24419;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 23643;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 26502;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 73523;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 36403;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 36402;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 36401;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 26503;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 28490;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 29703;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 225;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 2870;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 187493;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 170198;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 194417;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 194418;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 170225;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 25264;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 25267;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 193400;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 193404;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 194410;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 195264;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 195267;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 194412;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 70540;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 193644;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 193770;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 25263;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 195263;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25265;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 194419;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 71010;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 193643;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 24570;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 194570;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25352;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195352;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 172870;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196286;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196287;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196288;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196482;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196483;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196484;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196485;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 206760;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196280;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 215981;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 290670;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 290671;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3015;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 215980;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 234070;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3017;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3020;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 197031;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3025;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 196284;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 240540;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3022;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3021;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 206768;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 206769;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 215982;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 215983;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195265;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 241010;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3023;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 196281;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 206761;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 206763;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 206762;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 196282;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 196480;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 197034;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3029;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3030;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3065;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3057;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3071;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3009;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3066;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3067;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3072;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3073;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3074;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3107;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3094;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3098;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371712;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3038;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3097;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3103;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 906400;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3028;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3076;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1212162;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3059;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1212160;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3037;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3102;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3099;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3058;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3032;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3060;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3033;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3062;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3050;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 1212161;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 3063;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 3069;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3077;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371713;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371714;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371715;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371716;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371717;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371718;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371719;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371720;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371721;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371722;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371723;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371724;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371725;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371726;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371728;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371729;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371730;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3084;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371731;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371732;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371733;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371734;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371773;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371774;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371760;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371758;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371759;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371761;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371762;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371763;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371764;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371775;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374932;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374933;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374936;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374937;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374945;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374948;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374949;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374950;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371780;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371781;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371782;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3024;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374952;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374953;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374993;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371777;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 575700;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371786;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371787;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371788;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371790;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371791;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 371799;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374980;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374979;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374981;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374982;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374983;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374984;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371776;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 1134670;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 1156856;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371792;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371796;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371797;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371798;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 371778;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 371779;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 913523;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374995;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374943;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374941;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374940;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374939;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374938;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374934;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374935;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583042;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583043;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583044;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583045;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583046;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583047;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583048;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583049;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583050;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583051;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583052;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583053;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583054;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583055;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583056;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1156852;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374951;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375000;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375001;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375002;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 378520;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 389242;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374944;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374946;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1134671;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374994;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375010;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375011;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375019;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374996;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 534520;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 374998;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 374999;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 913524;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583058;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583059;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583060;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583061;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 386430;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583062;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583063;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583064;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583066;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583116;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583117;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583107;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583108;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374997;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583111;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583112;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375006;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375008;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 375007;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583094;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583092;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583093;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583095;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583096;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583097;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583098;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583110;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375012;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 583113;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 386432;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 583114;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 583115;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583109;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1570260;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3108;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 641592;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 766200;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583118;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 374954;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 641591;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1156855;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1156854;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3083;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 1156850;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 913520;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 913525;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 641590;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 3064;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 626740;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583122;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583123;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 646350;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583124;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583126;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583127;
UPDATE servicos SET servicos_iseg_id = 92 WHERE id = 583135;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 1156853;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583128;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583132;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 26509;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 28491;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 28497;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 29701;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 29702;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583133;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583134;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375026;
UPDATE servicos SET servicos_iseg_id = 95 WHERE id = 1156857;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 36404;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 36405;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 36406;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 36407;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 29900;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 194;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 199;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 234;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 17494;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 17495;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 17542;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 23401;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 23403;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 23402;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 24413;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 24414;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 24571;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 25260;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25261;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25262;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 226;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 221;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 237;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 25268;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 25269;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25350;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 25351;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 231;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 2874;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 2871;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 2872;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 170194;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 170199;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 170234;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 187494;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 187495;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 187542;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 193401;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 193403;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 193402;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 194413;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 194414;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 194571;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 195260;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195261;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195262;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 170226;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 170221;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 170237;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 195268;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 195269;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195350;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 195351;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 170231;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 172874;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 172871;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 172872;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 196289;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 196481;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 197033;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 197032;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 197120;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 206764;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 206765;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 206766;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 206767;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 248170;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3002;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3006;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3007;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3016;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3018;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3019;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3081;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3026;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3027;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3031;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3035;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3036;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3052;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3053;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3054;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3056;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3068;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3070;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3010;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3011;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3014;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3048;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3041;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3049;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3078;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3079;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3080;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 1288770;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3104;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371738;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371739;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371740;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371741;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371742;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3093;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 3085;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3087;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3088;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3089;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3090;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371743;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371744;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371745;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371746;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371747;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371748;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371749;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371750;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371751;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371752;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371753;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371754;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371755;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371756;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 371757;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371783;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371784;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371804;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371805;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371806;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371807;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371808;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371809;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371810;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371811;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371812;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371813;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371814;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371815;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371816;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 371817;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374965;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374966;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374970;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374976;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374969;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374973;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374971;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374958;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375016;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374963;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374962;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374961;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3046;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374977;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374967;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375003;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375004;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 448650;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374959;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 448651;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 1296420;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375025;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375027;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375029;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375030;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375031;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375032;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375035;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375037;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 448652;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374978;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375028;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375036;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375017;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375033;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 375034;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 386431;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583070;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583071;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583072;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583073;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583074;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583075;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583076;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583077;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583078;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583079;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583080;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583081;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583082;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583083;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583084;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583085;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583086;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583087;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583088;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583089;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583090;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 583091;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583119;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583120;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583140;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583141;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583142;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583143;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583144;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583145;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583146;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583147;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583148;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583149;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583150;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583151;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583152;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583153;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583154;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 583155;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 1134672;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 913526;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374960;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 3034;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 710280;
UPDATE servicos SET servicos_iseg_id = 93 WHERE id = 374972;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 374964;
UPDATE servicos SET servicos_iseg_id = 98 WHERE id = 657690;

UPDATE coberturas SET is_ativa = false WHERE id = 29896;
UPDATE coberturas SET is_ativa = false WHERE id = 73460;
UPDATE coberturas SET is_ativa = false WHERE id = 73461;
UPDATE coberturas SET is_ativa = false WHERE id = 2880;
UPDATE coberturas SET is_ativa = false WHERE id = 2886;
UPDATE coberturas SET is_ativa = false WHERE id = 71260;
UPDATE coberturas SET is_ativa = false WHERE id = 172880;
UPDATE coberturas SET is_ativa = false WHERE id = 172886;
UPDATE coberturas SET is_ativa = false WHERE id = 241260;
UPDATE coberturas SET is_ativa = false WHERE id = 197118;
UPDATE coberturas SET is_ativa = false WHERE id = 796970;
UPDATE coberturas SET is_ativa = false WHERE id = 3520;
UPDATE coberturas SET is_ativa = false WHERE id = 3521;
UPDATE coberturas SET is_ativa = false WHERE id = 371117;
UPDATE coberturas SET is_ativa = false WHERE id = 371229;
UPDATE coberturas SET is_ativa = false WHERE id = 371368;
UPDATE coberturas SET is_ativa = false WHERE id = 371437;
UPDATE coberturas SET is_ativa = false WHERE id = 374588;
UPDATE coberturas SET is_ativa = false WHERE id = 374657;
UPDATE coberturas SET is_ativa = false WHERE id = 455801;
UPDATE coberturas SET is_ativa = false WHERE id = 3575;
UPDATE coberturas SET is_ativa = false WHERE id = 1157321;
UPDATE coberturas SET is_ativa = false WHERE id = 582356;
UPDATE coberturas SET is_ativa = false WHERE id = 582484;
UPDATE coberturas SET is_ativa = false WHERE id = 582594;
UPDATE coberturas SET is_ativa = false WHERE id = 582644;
UPDATE coberturas SET is_ativa = false WHERE id = 582740;
UPDATE coberturas SET is_ativa = false WHERE id = 646360;
UPDATE coberturas SET is_ativa = false WHERE id = 787470;
UPDATE coberturas SET is_ativa = false WHERE id = 374449;
UPDATE coberturas SET is_ativa = false WHERE id = 422630;
UPDATE coberturas SET is_ativa = false WHERE id = 374337;
UPDATE coberturas SET is_ativa = false WHERE id = 3613;

UPDATE servicos SET is_ativa = false WHERE id = 28496;
UPDATE servicos SET is_ativa = false WHERE id = 28498;
UPDATE servicos SET is_ativa = false WHERE id = 28499;
UPDATE servicos SET is_ativa = false WHERE id = 40144;
UPDATE servicos SET is_ativa = false WHERE id = 40142;
UPDATE servicos SET is_ativa = false WHERE id = 2860;
UPDATE servicos SET is_ativa = false WHERE id = 195;
UPDATE servicos SET is_ativa = false WHERE id = 196;
UPDATE servicos SET is_ativa = false WHERE id = 197;
UPDATE servicos SET is_ativa = false WHERE id = 17492;
UPDATE servicos SET is_ativa = false WHERE id = 17496;
UPDATE servicos SET is_ativa = false WHERE id = 17497;
UPDATE servicos SET is_ativa = false WHERE id = 24415;
UPDATE servicos SET is_ativa = false WHERE id = 222;
UPDATE servicos SET is_ativa = false WHERE id = 223;
UPDATE servicos SET is_ativa = false WHERE id = 2873;
UPDATE servicos SET is_ativa = false WHERE id = 224;
UPDATE servicos SET is_ativa = false WHERE id = 172860;
UPDATE servicos SET is_ativa = false WHERE id = 170195;
UPDATE servicos SET is_ativa = false WHERE id = 170196;
UPDATE servicos SET is_ativa = false WHERE id = 170197;
UPDATE servicos SET is_ativa = false WHERE id = 187492;
UPDATE servicos SET is_ativa = false WHERE id = 187496;
UPDATE servicos SET is_ativa = false WHERE id = 187497;
UPDATE servicos SET is_ativa = false WHERE id = 194415;
UPDATE servicos SET is_ativa = false WHERE id = 170222;
UPDATE servicos SET is_ativa = false WHERE id = 170223;
UPDATE servicos SET is_ativa = false WHERE id = 172873;
UPDATE servicos SET is_ativa = false WHERE id = 170224;
UPDATE servicos SET is_ativa = false WHERE id = 196486;
UPDATE servicos SET is_ativa = false WHERE id = 196488;
UPDATE servicos SET is_ativa = false WHERE id = 196489;
UPDATE servicos SET is_ativa = false WHERE id = 200810;
UPDATE servicos SET is_ativa = false WHERE id = 215984;
UPDATE servicos SET is_ativa = false WHERE id = 215985;
UPDATE servicos SET is_ativa = false WHERE id = 248171;
UPDATE servicos SET is_ativa = false WHERE id = 321510;
UPDATE servicos SET is_ativa = false WHERE id = 3001;
UPDATE servicos SET is_ativa = false WHERE id = 3003;
UPDATE servicos SET is_ativa = false WHERE id = 3004;
UPDATE servicos SET is_ativa = false WHERE id = 3005;
UPDATE servicos SET is_ativa = false WHERE id = 3040;
UPDATE servicos SET is_ativa = false WHERE id = 3055;
UPDATE servicos SET is_ativa = false WHERE id = 3012;
UPDATE servicos SET is_ativa = false WHERE id = 3013;
UPDATE servicos SET is_ativa = false WHERE id = 3039;
UPDATE servicos SET is_ativa = false WHERE id = 3047;
UPDATE servicos SET is_ativa = false WHERE id = 1104181;
UPDATE servicos SET is_ativa = false WHERE id = 3044;
UPDATE servicos SET is_ativa = false WHERE id = 3045;
UPDATE servicos SET is_ativa = false WHERE id = 3061;
UPDATE servicos SET is_ativa = false WHERE id = 3075;
UPDATE servicos SET is_ativa = false WHERE id = 3082;
UPDATE servicos SET is_ativa = false WHERE id = 3100;
UPDATE servicos SET is_ativa = false WHERE id = 3101;
UPDATE servicos SET is_ativa = false WHERE id = 3105;
UPDATE servicos SET is_ativa = false WHERE id = 371710;
UPDATE servicos SET is_ativa = false WHERE id = 371711;
UPDATE servicos SET is_ativa = false WHERE id = 371737;
UPDATE servicos SET is_ativa = false WHERE id = 3086;
UPDATE servicos SET is_ativa = false WHERE id = 3091;
UPDATE servicos SET is_ativa = false WHERE id = 3092;
UPDATE servicos SET is_ativa = false WHERE id = 1104180;
UPDATE servicos SET is_ativa = false WHERE id = 3106;
UPDATE servicos SET is_ativa = false WHERE id = 371765;
UPDATE servicos SET is_ativa = false WHERE id = 371766;
UPDATE servicos SET is_ativa = false WHERE id = 371767;
UPDATE servicos SET is_ativa = false WHERE id = 371768;
UPDATE servicos SET is_ativa = false WHERE id = 371769;
UPDATE servicos SET is_ativa = false WHERE id = 371770;
UPDATE servicos SET is_ativa = false WHERE id = 371771;
UPDATE servicos SET is_ativa = false WHERE id = 371772;
UPDATE servicos SET is_ativa = false WHERE id = 371785;
UPDATE servicos SET is_ativa = false WHERE id = 371789;
UPDATE servicos SET is_ativa = false WHERE id = 371793;
UPDATE servicos SET is_ativa = false WHERE id = 371794;
UPDATE servicos SET is_ativa = false WHERE id = 371795;
UPDATE servicos SET is_ativa = false WHERE id = 371800;
UPDATE servicos SET is_ativa = false WHERE id = 371801;
UPDATE servicos SET is_ativa = false WHERE id = 371802;
UPDATE servicos SET is_ativa = false WHERE id = 371803;
UPDATE servicos SET is_ativa = false WHERE id = 374930;
UPDATE servicos SET is_ativa = false WHERE id = 374931;
UPDATE servicos SET is_ativa = false WHERE id = 374957;
UPDATE servicos SET is_ativa = false WHERE id = 374989;
UPDATE servicos SET is_ativa = false WHERE id = 374987;
UPDATE servicos SET is_ativa = false WHERE id = 374991;
UPDATE servicos SET is_ativa = false WHERE id = 374990;
UPDATE servicos SET is_ativa = false WHERE id = 374985;
UPDATE servicos SET is_ativa = false WHERE id = 374992;
UPDATE servicos SET is_ativa = false WHERE id = 1156851;
UPDATE servicos SET is_ativa = false WHERE id = 374975;
UPDATE servicos SET is_ativa = false WHERE id = 375005;
UPDATE servicos SET is_ativa = false WHERE id = 375015;
UPDATE servicos SET is_ativa = false WHERE id = 375023;
UPDATE servicos SET is_ativa = false WHERE id = 375018;
UPDATE servicos SET is_ativa = false WHERE id = 583040;
UPDATE servicos SET is_ativa = false WHERE id = 583041;
UPDATE servicos SET is_ativa = false WHERE id = 375013;
UPDATE servicos SET is_ativa = false WHERE id = 375009;
UPDATE servicos SET is_ativa = false WHERE id = 375021;
UPDATE servicos SET is_ativa = false WHERE id = 583069;
UPDATE servicos SET is_ativa = false WHERE id = 583099;
UPDATE servicos SET is_ativa = false WHERE id = 583100;
UPDATE servicos SET is_ativa = false WHERE id = 583101;
UPDATE servicos SET is_ativa = false WHERE id = 583102;
UPDATE servicos SET is_ativa = false WHERE id = 583103;
UPDATE servicos SET is_ativa = false WHERE id = 583104;
UPDATE servicos SET is_ativa = false WHERE id = 583105;
UPDATE servicos SET is_ativa = false WHERE id = 583106;
UPDATE servicos SET is_ativa = false WHERE id = 583121;
UPDATE servicos SET is_ativa = false WHERE id = 583125;
UPDATE servicos SET is_ativa = false WHERE id = 583129;
UPDATE servicos SET is_ativa = false WHERE id = 583130;
UPDATE servicos SET is_ativa = false WHERE id = 583131;
UPDATE servicos SET is_ativa = false WHERE id = 583136;
UPDATE servicos SET is_ativa = false WHERE id = 583137;
UPDATE servicos SET is_ativa = false WHERE id = 583138;
UPDATE servicos SET is_ativa = false WHERE id = 583139;
UPDATE servicos SET is_ativa = false WHERE id = 3008;
UPDATE servicos SET is_ativa = false WHERE id = 374988;
UPDATE servicos SET is_ativa = false WHERE id = 375022;
UPDATE servicos SET is_ativa = false WHERE id = 1101990;
UPDATE servicos SET is_ativa = false WHERE id = 1101991;
UPDATE servicos SET is_ativa = false WHERE id = 913522;
UPDATE servicos SET is_ativa = false WHERE id = 913521;
UPDATE servicos SET is_ativa = false WHERE id = 906401;

INSERT INTO carroceria_iseg VALUES (1,'ABERTA',true);
INSERT INTO carroceria_iseg VALUES (2,'BAU', true);
INSERT INTO carroceria_iseg VALUES (3,'BASCULANTE', true);
INSERT INTO carroceria_iseg VALUES (4,'BETONEIRA', true);
INSERT INTO carroceria_iseg VALUES (5,'CEGONHA', true);
INSERT INTO carroceria_iseg VALUES (6,'COLETOR DE LIXO', true);
INSERT INTO carroceria_iseg VALUES (7,'GRANELEIRA', true);
INSERT INTO carroceria_iseg VALUES (9,'TANQUE', true);
INSERT INTO carroceria_iseg VALUES (999,'OUTROS', true);
INSERT INTO carroceria_iseg VALUES (9999,'TODOS', true);

INSERT INTO semireboque_iseg VALUES (1,'BASCULANTE',true);
INSERT INTO semireboque_iseg VALUES (2,'CARGA SECA',true);
INSERT INTO semireboque_iseg VALUES (3,'BITREM CARGA SECA',true);
INSERT INTO semireboque_iseg VALUES (4,'CARREGA TUDO (PRANCHA)',true);
INSERT INTO semireboque_iseg VALUES (5,'CEGONHEIRA',true);
INSERT INTO semireboque_iseg VALUES (6,'FURGAO ALUMINIO',true);
INSERT INTO semireboque_iseg VALUES (7,'BITREM FURGAO ALUMINIO',true);
INSERT INTO semireboque_iseg VALUES (8,'FURGAO FRIGORIFICO',true);
INSERT INTO semireboque_iseg VALUES (9,'FURGAO ISOTERMICO',true);
INSERT INTO semireboque_iseg VALUES (10,'FURGAO LONADO/SIDE',true);
INSERT INTO semireboque_iseg VALUES (11,'GRANELEIRA',true);
INSERT INTO semireboque_iseg VALUES (12,'BITREM GRANELEIRA',true);
INSERT INTO semireboque_iseg VALUES (13,'PORTA CONTAINE',true);
INSERT INTO semireboque_iseg VALUES (14,'TANQUE CARGA MISTA',true);
INSERT INTO semireboque_iseg VALUES (15,'BITREM TANQUE CARGA MISTA',true);
INSERT INTO semireboque_iseg VALUES (16,'FLORESTAL',true);
INSERT INTO semireboque_iseg VALUES (17,'CANAVIEIRO',true);
INSERT INTO semireboque_iseg VALUES (18,'SILO',true);
INSERT INTO semireboque_iseg VALUES (19,'OUTROS',true);
INSERT INTO semireboque_iseg VALUES (9999,'TODOS',true);

INSERT INTO tipo_veiculo VALUES(1,'Carros e Utls Pequenos',true);
INSERT INTO tipo_veiculo VALUES(2,'Motos',true);
INSERT INTO tipo_veiculo VALUES(3,'Caminhões e Micro-Ônibus',true);








/*=====================================================*/
/*=======Configuração das tableas de importação========*/
/*=====================================================*/

create table lote_importacao (
    id int8 not null,
    log_dtCriacao date,
    log_dtEdicao date,
    log_dtExclusao date,
    versao numeric(19,0) default 0 not null,
    dt_final_processamento date,
    dt_inicio_processamento date,
    descricao varchar(255),
    situacao int4,
    log_autor int8 not null,
    log_editor int8 not null,
    log_excluidoPor int8,
    corretora_id int8,
    seguradora_id int8,
    primary key (id)
);
    
 create table lote_importacao_item (
     id int8 not null,
     log_dtCriacao date,
     log_dtEdicao date,
     log_dtExclusao date,
     versao numeric(19,0) default 0 not null,
     cpf_cnpj_segurado varchar(255),
     dt_conciliacao date,
     dt_final_vigencia date,
     dt_inicio_vigencia date,
     in_conciliacao_manual bool,
     nome_segurado varchar(255),
     numero_apolice varchar(255),
     numero_apolice_anterior varchar(255),
     numero_endosso varchar(255),
     numero_proposta varchar(255),
     premio_total numeric(19, 2),
     registro varchar(255),
     tipo_item_edi int4,
     log_autor int8 not null,
     log_editor int8 not null,
     log_excluidoPor int8,
     usuario_id int8,
     lote_importacao_id int8,
     proposta_id int8,
     ramo_id int8,
     primary key (id)
);

create table edi_importacao_arquivo (
    id int8 not null,
    log_dtCriacao date,
    log_dtEdicao date,
    log_dtExclusao date,
    versao numeric(19,0) default 0 not null,
    descricao varchar(255),
    formato varchar(255),
    patch varchar(255),
    xsd varchar(255),
    log_autor int8 not null,
    log_editor int8 not null,
    log_excluidoPor int8,
    importacao_edi_config_id int8,
    primary key (id)
);

create table edi_importacao_config (
    id int8 not null,
    log_dtCriacao date,
    log_dtEdicao date,
    log_dtExclusao date,
    versao numeric(19,0) default 0 not null,
    dt_vigencia_final date,
    dt_vigencia_inicial date,
    versao_layoute varchar(255),
    log_autor int8 not null,
    log_editor int8 not null,
    log_excluidoPor int8,
    seguradora_id int8,
    primary key (id)
);

create table edi_importacao_tipo (
    id int8 not null,
    log_dtCriacao date,
    log_dtEdicao date,
    log_dtExclusao date,
    versao numeric(19,0) default 0 not null,
    tipo_item_edi varchar(255),
    log_autor int8 not null,
    log_editor int8 not null,
    log_excluidoPor int8,
    importacao_edi_arquivo_id int8,
    primary key (id)
);

CREATE TABLE edi_importacao_anexo
(
  id bigint NOT NULL,
  nome_arquivo varchar(50),
  ext_arquivo varchar(4),
  tipo_arquivo int2,
  lote_importacao_id bigint,
  arquivo_byte_id bigint,
  primary key (id)
);

CREATE TABLE arquivo_byte
(
  id bigint NOT NULL,
  anexo bytea,
  CONSTRAINT pk_arquivo_byte_id PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE arquivo_byte OWNER TO postgres;
    
create table seguradora_ramo (
    id int8 not null,
    codigo_na_seguradora varchar(255),
    ramo_id int8,
    seguradora_id int8,
    primary key (id)
);
    
alter table lote_importacao 
    add constraint FKB3C176E0E8B3A8E2 
    foreign key (log_editor) 
    references Usuario;

alter table lote_importacao 
    add constraint FKB3C176E08F314EC6 
    foreign key (corretora_id) 
    references Corretora;

alter table lote_importacao 
    add constraint FKB3C176E0F8C3FE02 
    foreign key (log_autor) 
    references Usuario;

alter table lote_importacao 
    add constraint FKB3C176E0A80066AE 
    foreign key (seguradora_id) 
    references Seguradora;

alter table lote_importacao 
    add constraint FKB3C176E06A8E8997 
    foreign key (log_excluidoPor) 
    references Usuario;

alter table lote_importacao_item 
    add constraint FK5C620912FEEF29E6 
    foreign key (usuario_id) 
    references Usuario;

alter table lote_importacao_item 
    add constraint FK5C620912E8B3A8E2 
    foreign key (log_editor) 
    references Usuario;

alter table lote_importacao_item 
    add constraint FK5C620912B5CE1B7 
    foreign key (lote_importacao_id) 
    references lote_importacao;

alter table lote_importacao_item 
    add constraint FK5C620912F8C3FE02 
    foreign key (log_autor) 
    references Usuario;

alter table lote_importacao_item 
    add constraint FK5C620912CBBA23CE 
    foreign key (proposta_id) 
    references proposta;

alter table lote_importacao_item 
    add constraint FK5C62091224B044AE 
    foreign key (ramo_id) 
    references Ramo;

alter table lote_importacao_item 
    add constraint FK5C6209126A8E8997 
    foreign key (log_excluidoPor) 
    references Usuario;
        
        
 alter table edi_importacao_arquivo 
    add constraint FK516260183268261C 
    foreign key (importacao_edi_config_id) 
    references edi_importacao_config;

alter table edi_importacao_arquivo 
    add constraint FK51626018E8B3A8E2 
    foreign key (log_editor) 
    references Usuario;

alter table edi_importacao_arquivo 
    add constraint FK51626018F8C3FE02 
    foreign key (log_autor) 
    references Usuario;

alter table edi_importacao_arquivo 
    add constraint FK516260186A8E8997 
    foreign key (log_excluidoPor) 
    references Usuario;

alter table edi_importacao_config 
    add constraint FK3FAC5C77E8B3A8E2 
    foreign key (log_editor) 
    references Usuario;

alter table edi_importacao_config 
    add constraint FK3FAC5C77F8C3FE02 
    foreign key (log_autor) 
    references Usuario;

alter table edi_importacao_config 
    add constraint FK3FAC5C77A80066AE 
    foreign key (seguradora_id) 
    references Seguradora;

alter table edi_importacao_config 
    add constraint FK3FAC5C776A8E8997 
    foreign key (log_excluidoPor) 
    references Usuario;

alter table edi_importacao_tipo 
    add constraint FK9501F5A9E8B3A8E2 
    foreign key (log_editor) 
    references Usuario;

alter table edi_importacao_tipo 
    add constraint FK9501F5A9F8C3FE02 
    foreign key (log_autor) 
    references Usuario;

alter table edi_importacao_tipo 
    add constraint FK9501F5A9DC55B738 
    foreign key (importacao_edi_arquivo_id) 
    references edi_importacao_arquivo;

alter table edi_importacao_tipo 
    add constraint FK9501F5A96A8E8997 
    foreign key (log_excluidoPor) 
    references Usuario;

alter table seguradora_ramo 
    add constraint FK17F3D2724B044AE 
    foreign key (ramo_id) 
    references Ramo;

alter table seguradora_ramo 
    add constraint FK17F3D27A80066AE 
    foreign key (seguradora_id) 
    references Seguradora;
    
alter table edi_importacao_anexo 
    add constraint FKEDI12312SD 
    foreign key (lote_importacao_id) 
    references lote_importacao;
    
alter table edi_importacao_anexo 
    add constraint FKEDI12312ST 
    foreign key (arquivo_byte_id) 
    references arquivo_byte;


/*==============================================================*/
/* ALTER TABLE bordero_lancamento                               */
/*==============================================================*/    

ALTER TABLE bordero_lancamento ADD COLUMN nro_proposta character varying(13);
ALTER TABLE bordero_lancamento ADD COLUMN nro_endosso character varying(13);
ALTER TABLE bordero_lancamento ADD COLUMN segurado_id bigint;
ALTER TABLE bordero_lancamento ADD COLUMN cpf_ou_cnpj character varying(17);

ALTER TABLE bordero_lancamento
  ADD CONSTRAINT "FK_BORDERO_LANC_PESSOA" FOREIGN KEY (segurado_id)
      REFERENCES pessoa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
      
      
/*==============================================================*/
/* ALTER TABLE bordero_comissao                                 */
/*==============================================================*/    
ALTER TABLE bordero_comissao ADD COLUMN lote_importacao_id bigint;

ALTER TABLE bordero_comissao
  ADD CONSTRAINT fk_lote_importacao_borde_comiss FOREIGN KEY (lote_importacao_id)
      REFERENCES lote_importacao (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;