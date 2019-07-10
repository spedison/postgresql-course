-- Conectando em um database com psql.

-- psql -d database -U  user -W
-- ou
-- psql --port=5432 --host=localhost --dbnane=northwind --username=spedison
-- ou
-- psql -p 5432 -h localhost -d northwind -U spedison
-- Em outro host
-- psql -h host -d database -U user -W

-- Eliminando os parâmetros de entrada do psql
-- 1) Usando Variáveis de ambiente
--   * PGDATABASE, PGUSER, PGPASSWORD, PGHOST, PGPORT
-- 2) Usando arquivo .pgpass no dir do usuário (Home)
--   * Formato host:port:dbname:user:pass
-- 3) Usando serviços no arquivo .pg_service.conf
-- Formato
-- [myservice]
-- host=localhost
-- port=5432
-- dbname=
-- user=
-- password=
-- E ao chamar pode-se usar mais de um serviço
-- psql --service=myservice
-- ou ainda exportar o servico usado PGSERVICE=myservice

-- Mais comandos do psql

-- Executa um comando externo
-- \! comando

-- 
-- 

select companyname, region, country from public.customers

select categoryname, description from categories

select distinct country, city from customers

select distinct region from customers

select distinct region from suppliers

select count(*) from products

select count(*) from orders

select count(distinct city) from suppliers

select count(distinct productid) from order_details


--
-- No terminal --
-- abrindo o terminal --

-- Listando todos os databases
-- \l
-- Equivalente a ::
SELECT
   datname
FROM
   pg_database;

-- Conectando / Alternando a um banco
-- \c <nome do banco> 
-- ou
-- \c dbname username

-- ------------------------
-- Listando os Schemas disponíveis no database

--  \dn
-- northwind-# \dn
--   List of schemas
--   Name  |  Owner   
-- --------+----------
--  public | postgres
-- (1 row)
  
  
-- listando as tabelas de um banco 
-- \dt
-- Equivalente a ::
SELECT
   *
FROM
   pg_catalog.pg_tables
WHERE
   schemaname != 'pg_catalog'
AND schemaname != 'information_schema';

-- ou ainda somente objetos do Schema public

SELECT
   *
FROM
   pg_catalog.pg_tables
WHERE
   schemaname = 'public';
  
-- Mostrando descrição da tabela e as respectivas colunas no terminal usando \d <table name> e \d+ <table name>
-- northwind=# \d+ suppliers                                                                                                                                                                                                                                                                                                                                                               Table "public.suppliers"
--     Column    |         Type          | Collation | Nullable | Default | Storage  | Stats target | Description 
-- --------------+-----------------------+-----------+----------+---------+----------+--------------+-------------
--  supplierid   | smallint              |           | not null |         | plain    |              | 
--  companyname  | character varying(40) |           | not null |         | extended |              | 
--  contactname  | character varying(30) |           |          |         | extended |              | 
--  contacttitle | character varying(30) |           |          |         | extended |              | 
--  address      | character varying(60) |           |          |         | extended |              | 
--  city         | character varying(15) |           |          |         | extended |              | 
--  region       | character varying(15) |           |          |         | extended |              | 
--  postalcode   | character varying(10) |           |          |         | extended |              | 
--  country      | character varying(15) |           |          |         | extended |              | 
--  phone        | character varying(24) |           |          |         | extended |              | 
--  fax          | character varying(24) |           |          |         | extended |              | 
--  homepage     | text                  |           |          |         | extended |              | 
-- Indexes:
--     "pk_suppliers" PRIMARY KEY, btree (supplierid)
-- Referenced by:
--     TABLE "products" CONSTRAINT "fk_products_suppliers" FOREIGN KEY (supplierid) REFERENCES suppliers(supplierid)

-- northwind=# \d suppliers
--                        Table "public.suppliers"
--     Column    |         Type          | Collation | Nullable | Default 
-- --------------+-----------------------+-----------+----------+---------
--  supplierid   | smallint              |           | not null | 
--  companyname  | character varying(40) |           | not null | 
--  contactname  | character varying(30) |           |          | 
--  contacttitle | character varying(30) |           |          | 
--  address      | character varying(60) |           |          | 
--  city         | character varying(15) |           |          | 
--  region       | character varying(15) |           |          | 
--  postalcode   | character varying(10) |           |          | 
--  country      | character varying(15) |           |          | 
--  phone        | character varying(24) |           |          | 
--  fax          | character varying(24) |           |          | 
--  homepage     | text                  |           |          | 
-- Indexes:
--     "pk_suppliers" PRIMARY KEY, btree (supplierid)
-- Referenced by:
--     TABLE "products" CONSTRAINT "fk_products_suppliers" FOREIGN KEY (supplierid) REFERENCES suppliers(supplierid)

  
-- List functions
-- \df
-- northwind-# \df
--                       List of functions
--  Schema | Name | Result data type | Argument data types | Type 
-- --------+------+------------------+---------------------+------
-- (0 rows)

-- Lista as Views 
-- \dv
-- northwind-# \dv
-- Did not find any relations.  
  
-- List of Users \du
--   northwind-# \du
--                                    List of roles
--  Role name |                         Attributes                         | Member of 
-- -----------+------------------------------------------------------------+-----------
--  postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
--  spedison  | Superuser, Create role, Create DB                          | {}

  
-- Qual é a versão do banco utilizado ?
-- northwind=# select version();
--                                                    version                                                   
-- -------------------------------------------------------------------------------------------------------------
--  PostgreSQL 11.4 on x86_64-apple-darwin16.7.0, compiled by Apple LLVM version 8.1.0 (clang-802.0.42), 64-bit
-- (1 row)

--  
-- 

-- Mostrando o History de comandos
-- \s
-- salva o history em um arquivo externo
-- \s <filename>

  
-- Executando comandos a partir de um arquivo externo .sql
-- \i <filename>

  
-- Ajuda
-- \?
-- \h <comando>
-- \h alter table 
-- Command:     ALTER TABLE
-- Description: change the definition of a table
-- Syntax:
-- ALTER TABLE [ IF EXISTS ] [ ONLY ] name [ * ]
--     action [, ... ]
-- ALTER TABLE [ IF EXISTS ] [ ONLY ] name [ * ]
--     RENAME [ COLUMN ] column_name TO new_column_name
-- ALTER TABLE [ IF EXISTS ] [ ONLY ] name [ * ]
--     RENAME CONSTRAINT constraint_name TO new_constraint_name
-- ...  
  
  
-- Mostrar e ocultar o tempo de execução das queries
-- \timing  
-- Timing is on.
-- dvdrental=# select count(*) from film;
-- count
-- -------
--   1000
-- (1 row) 
-- Time: 1.495 ms

-- Se executou o \timing novamente ele remove a exibição do tempo de execução


-- Executo um comando (Select * from regions)
-- Edito um comando
-- \e
-- O editor padrão é chamado. Faço a alteração na query e retono com a execução realizada.


-- Editando as funções
-- Listo as funções
-- \df
-- Seleciono a que será editada e rodo
-- \ef <function name>

-- Sair ...
-- \q

-- Seleciona o tempo médio, min e max entre a compra e a entrega de um produto (em dias)  
select 	shipcity, 
		to_char(avg(shippeddate - orderdate),'999D999') as avg_time , 
		max(shippeddate-orderdate), 
		min(shippeddate-orderdate) 
from 
	public.orders 
group by 1;  


-- Qual o valor por compra (order)
   select O.orderid, to_char(sum(P.unitprice * OD.quantity),'99999999999D9999') as sum_sale
   from orders as O
   left join order_details as OD on (O.orderid = OD.orderid)
   left join products as P on (P.productid = OD.productid)
   group by O.orderid;

-- Usando Strings com comparação
select * from public.suppliers where city = 'Sao Paulo'

select * from public.suppliers where city = 'Berlin'

-- Quantos tem por cidade ?
select city, count(*) from public.suppliers group by city
  
-- Quantos tem diferente de 1 ?
select city, count(*) from public.suppliers  group by city having count(*) != 1

-- OBS -- -- No postgreSQL o diferente pode ser <> ou !=

-- Quantos fornecedores moram na cidade do méxico ?
select * from public.customers where trim(country) ilike  '%mexico%';

-- Quantas foram as vendas do funcionário 3
select * from orders where employeeid = 3
-- foram 127 vendas

-- frete maior que 250
select * from orders
where freight > 250

-- Trabalhando com data
select '2016-10-1'::date - '2016-10-15'::date
-- Resultado -14 dias.


-- Questão com recursividade no banco de dados
WITH RECURSIVE cte(n) AS (
select 1 
union all
SELECT n+1 FROM cte WHERE n<5
)
select * from cte;

-- 
-- Criando tabelas já estabelecendo referências.

CREATE TABLE teste.departamento ( codDep varchar(10) primary key, local point );

CREATE TABLE teste.funcionario ( codDep varchar(10) references teste.departamento(codDep) , salario real, dataAdm date ); 

-- 

-- Lê as Configurações do servidor ...
select * from pg_catalog.pg_settings


-- seleciona os consumidores do Brazil and que usam o Shipped via pela United Package (id =2 )
select count(distinct(customerid)) from public.orders
where shipvia = 2 and shipcountry = 'Brazil'

-- Quantos fornecedores são do Germany e da Spain
select * from suppliers
-- where country in ('Germany','Spain')
where country = 'Germany' or country = 'Spain'

-- Quantas ordens foram enviadas para Brazil, Argentina e USA
select * from orders
where shipcountry in ('Brazil', 'Argentina', 'USA')

-- Quantos clientes não são da França
select * from customers
where not country = 'France'

-- Usando o between!
select * from order_details
where unitprice between 10 and 100

-- Quantos produtos estão na gategoria 
select * from products
where categoryid in (1, 4, 6, 7)

