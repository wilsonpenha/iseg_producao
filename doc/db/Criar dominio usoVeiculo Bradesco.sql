select 'update dominio_esp set cod_bradesco='||cod_bradesco||' where id='||id from dominio_esp where cod_bradesco is not null
select 'update tipo_conta_relacionamento set cod_bradesco='||cod_bradesco||' where id='||id from tipo_conta_relacionamento where cod_bradesco is not null
select 'update tipo_cobertura set cod_bradesco='||cod_bradesco||' where id='||id from tipo_cobertura where cod_bradesco is not null

ALTER TABLE dominio_esp ADD COLUMN cod_bradesco character varying(60);
ALTER TABLE dominio_esp ADD COLUMN cod_maritima character varying(60);

ALTER TABLE automovel_orcamento ADD COLUMN data_saida date;

ALTER TABLE tipo_cobertura ADD COLUMN cod_bradesco integer;
ALTER TABLE tipo_conta_relacionamento ADD COLUMN cod_bradesco integer;

update dominio_esp set cod_bradesco=1 where id=2902;
update dominio_esp set cod_bradesco=2 where id=2900;
update dominio_esp set cod_bradesco=4 where id=11870;
update dominio_esp set cod_bradesco=2 where id=11961;
update dominio_esp set cod_bradesco=3 where id=11962;
update dominio_esp set cod_bradesco=5 where id=11964;
update dominio_esp set cod_bradesco=6 where id=11965;
update dominio_esp set cod_bradesco=7 where id=11966;
update dominio_esp set cod_bradesco=9 where id=11968;
update dominio_esp set cod_bradesco=10 where id=11969;
update dominio_esp set cod_bradesco=11 where id=11970;
update dominio_esp set cod_bradesco=12 where id=11971;
update dominio_esp set cod_bradesco=14 where id=11973;
update dominio_esp set cod_bradesco=15 where id=11974;
update dominio_esp set cod_bradesco=16 where id=11975;
update dominio_esp set cod_bradesco=2 where id=11923;
update dominio_esp set cod_bradesco=4 where id=11924;
update dominio_esp set cod_bradesco=3 where id=11925;
update dominio_esp set cod_bradesco=5 where id=11926;
update dominio_esp set cod_bradesco=7 where id=20;
update dominio_esp set cod_bradesco=36 where id=11948;
update dominio_esp set cod_bradesco=37 where id=11949;
update dominio_esp set cod_bradesco=41 where id=11951;
update dominio_esp set cod_bradesco=41 where id=11952;
update dominio_esp set cod_bradesco=41 where id=11953;
update dominio_esp set cod_bradesco=45 where id=11921;
update dominio_esp set cod_bradesco=44 where id=11922;
update dominio_esp set cod_bradesco=1 where id=11960;
update dominio_esp set cod_bradesco=4 where id=11963;
update dominio_esp set cod_bradesco=8 where id=11967;
update dominio_esp set cod_bradesco=13 where id=11972;
update dominio_esp set cod_bradesco=17 where id=11976;
update dominio_esp set cod_bradesco=18 where id=11977;
update dominio_esp set cod_bradesco=19 where id=11978;
update dominio_esp set cod_bradesco=20 where id=11979;
update dominio_esp set cod_bradesco=21 where id=11980;
update dominio_esp set cod_bradesco=22 where id=11981;
update dominio_esp set cod_bradesco=23 where id=11982;
update dominio_esp set cod_bradesco=24 where id=11983;
update dominio_esp set cod_bradesco=25 where id=11984;
update dominio_esp set cod_bradesco=26 where id=11985;
update dominio_esp set cod_bradesco=27 where id=11986;
update dominio_esp set cod_bradesco=28 where id=11987;
update dominio_esp set cod_bradesco=29 where id=11988;
update dominio_esp set cod_bradesco=30 where id=11989;
update dominio_esp set cod_bradesco=31 where id=11990;
update dominio_esp set cod_bradesco=32 where id=12006;
update dominio_esp set cod_bradesco=33 where id=11991;
update dominio_esp set cod_bradesco=34 where id=11992;
update dominio_esp set cod_bradesco=35 where id=11993;
update dominio_esp set cod_bradesco=36 where id=11994;
update dominio_esp set cod_bradesco=37 where id=11995;
update dominio_esp set cod_bradesco=38 where id=11996;
update dominio_esp set cod_bradesco=39 where id=11997;
update dominio_esp set cod_bradesco=40 where id=11998;
update dominio_esp set cod_bradesco=41 where id=11999;
update dominio_esp set cod_bradesco=42 where id=12000;
update dominio_esp set cod_bradesco=43 where id=12001;
update dominio_esp set cod_bradesco=47 where id=12005;
update dominio_esp set cod_bradesco=46 where id=12004;
update dominio_esp set cod_bradesco=3 where id=11927;
update dominio_esp set cod_bradesco=5 where id=12008;
update dominio_esp set cod_bradesco=3 where id=2903;
update dominio_esp set cod_bradesco=41 where id=11950;

update tipo_conta_relacionamento set cod_bradesco=1 where id=1;
update tipo_conta_relacionamento set cod_bradesco=2 where id=2;
update tipo_conta_relacionamento set cod_bradesco=3 where id=3;
update tipo_conta_relacionamento set cod_bradesco=4 where id=4;
update tipo_conta_relacionamento set cod_bradesco=9 where id=5;

update tipo_cobertura set cod_bradesco=2 where id=2;
update tipo_cobertura set cod_bradesco=0 where id=3;
update tipo_cobertura set cod_bradesco=1 where id=1;

ALTER TABLE automovel_orcamento ADD COLUMN is_blindado boolean;
ALTER TABLE automovel ADD COLUMN is_blindado boolean;

CREATE TABLE acesso_seguradora
(
  id bigint NOT NULL,
  codigo_corretor character varying(20),
  senha character varying(20),
  seguradora_id bigint,
  corretora_id bigint,
  codigo_aux1 character varying(20),
  codigo_aux2 character varying(20),
  codigo_aux3 character varying(20),
  CONSTRAINT pk_acesso_seguradora PRIMARY KEY (id),
  CONSTRAINT fk_acesso_corretor FOREIGN KEY (corretora_id)
      REFERENCES corretora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_acesso_seguradora FOREIGN KEY (seguradora_id)
      REFERENCES seguradora (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

ALTER TABLE orcamento_franquias ADD COLUMN nro_calculo_seguradora character varying(30);
ALTER TABLE orcamento_franquias ADD COLUMN xml_envio_calculo character varying(32000);
ALTER TABLE orcamento_franquias ADD COLUMN xml_retorno_calculo character varying(32000);

insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (500,17,'318','ISAR-ITAU AUTO E RESID');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (501,17,'501','CHUBB DO BRASIL - CIA D');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (502,17,'505','CONFIANCA CIA DE SEGURO');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (503,17,'511','SUL AMERICA CIA NACIONA');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (504,17,'515','TOKIO MARINE BRASIL SEG');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (505,17,'517','ALLIANZ SEGUROS (AGF)');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (506,17,'518','LIBERTY SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (507,17,'527','BANESTES SEGUROS S/A');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (508,17,'531','CIA UNIAO DE SEGUROS GE');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (509,17,'535','AZUL SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (510,17,'544','BRADESCO SEGUROS S/A');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (511,17,'549','ZURICH MINAS BRASIL');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (512,17,'563','CAIXA SEGURADORA');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (513,17,'572','MARITIMA SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (514,17,'584','INDIANA SEGUROS S/A');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (515,17,'588','PORTO SEGURO CIA DE SEG');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (516,17,'590','GENERALI DO BRASIL CIA');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (517,17,'598','UNIBANCO AIG S/A -SEGUR');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (518,17,'613','COMPANHIA MUTUAL DE SEG');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (519,17,'619','TOKIO MARINE SEGURADORA');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (520,17,'623','MAPFRE SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (521,17,'641','YASUDA SEGUROS S/A');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (522,17,'646','ALFA SEGUROS E PREVID-N');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (523,17,'651','ACE SEGURADORA ');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (524,17,'657','HDI SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (525,17,'660','MITSUI SUMITOMO SEGUROS');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (526,17,'675','RSA - ROYAL & SUNALLIAN');
insert into dominio_esp (id, dominio_id, cod_bradesco, valor) values (527,17,'873','Chartis Seguros Brasil AS');

ALTER TABLE automovel_orcamento ADD COLUMN seguradora_anterior_id bigint;

