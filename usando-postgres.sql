-- Criando novo usuário:

CREATE ROLE sis_controle_demanda
NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT
LOGIN PASSWORD '123456';

-- Listando todos os bancos quando conectado no terminal
-- postgres=# \list
--                                  List of databases
--   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-- -----------+----------+----------+-------------+-------------+-----------------------
-- postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
-- spedison  | spedison | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
-- template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
--           |          |          |             |             | postgres=CTc/postgres
-- template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
--           |          |          |             |             | postgres=CTc/postgres
--(4 rows)

-- Instalando o banco
-- apt-get install postgresql-10 (other versions, ver a versão do site com Bionic.)

-- Iniciando o banco (Ubuntu linux)
-- sudo  systemctl start postgresql
-- sudo  systemctl enable postgresql (Para que se possa colocar como auto init)
-- Iniciará o banco de dados

-- Para baixar demais demais ferramentas como o pgadmim deve-se mudar o repositório

-- sudo vi /etc/apt/sources.list.d/pgdg.list
-- Colocar no arquivo vazio
-- deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
-- Salva e fecha o arquivo esc esc :x

-- Baixando as chaves para usar no wget
-- wget --quiet -0 http://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

-- Agora podemos atualizar o banco
-- sudo apt-get update
-- instalando o pg-admin4
-- apt-get install pgadmin4


-- Entrando no banco....
-- sudo -u postgres psql (iniciando o psql como postgres)
-- Aparecerá :::   postgres=#

-- Alterando a senha no terminal:
alter user postgres with password '123456'

-- O que eu fiz.
-- postgres=# alter user postgres with password 'postgres'

-- Para sair do terminal
/q

-- Pode-se restaurar um backup do tipo tar na interface escolhendo o tipo tar.









