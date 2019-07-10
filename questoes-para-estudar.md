Uma TRIGGER pode ser criada para executar antes (BEFORE) ou após (AFTER) as consultas INSERT, UPDATE ou DELETE. Quanto aos conceitos de TRIGGERs no PostgreSQL (versão 9.2), é correto afirmar que:
A - A função de gatilho deve ser declarada como uma FUNCTION que não recebe argumentos e que retorna o tipo TRIGGER.
B - A função de gatilho é armazenada no banco de dados e pode ser composta de instruções em SQL simples ou PL/pgSQL.
C - A função de gatilho pode ser invocada diretamente com o comando EXECUTE TRIGGER por usuários com os privilégios necessários.
D - A função de gatilho pode referenciar variáveis especiais, tais como: NEW, OLD, TG_NAME, TG_OP, TG_TBNAME e TG_RLNAME.
E- Não é possível declarar funções de gatilhos sobre visões.

GABAS(A)

-- Backup e restore --

psql dbname < infile

Onde infile é um arquivo gerado através da saída do comando pg_dump e dbname é o nome de um banco de dados previamente criado. Por padrão, o programa psql continuará a executar o script contido no arquivo infile, mesmo depois que erros SQL forem encontrados. Se for desejado, é possível forçar a parada do comando psql caso encontre errros SQL, utilizando o seguinte comando:

A psql --set ON_ERROR_STOP=on dbname < infile
B psql –error-stop=on dbname < infile
C psql –error-abort set on dbname < infile
D psql ON_ERROR_STOP dbname < infile
E psql ERROR_STOP=on dbname < infile

-- -- -- -- --

Considere a seguinte instrução SQL: 

WITH RECURSIVE cte(n) AS (
SELECT 1
UNION ALL
SELECT n+1 FROM cte WHERE n<5
)
SELECT * FROM cte; 

Ao ser executada no PostgreSQL, ela produz como resultado:
1 a 5

-- -- -- --

Sob qual tipo de licença o banco de dados PostgreSQL é lançado atualmente?
GABAS -> A pergunta responde a pergunta postgresql licence.

-- -- -- -- --
-- Estudar --
No banco de dados PostgresSQL, o comando SQL CREATE INDEX constrói um índice na(s) coluna(s) especificada(s) da relação especificada, que pode ser uma tabela ou uma visão. Qual das opções abaixo contém apenas métodos válidos para serem utilizados nos índices a partir da versão 10?
btree, hash, gist, spgist, gin, brin.

No sistema gerenciador de bancos de dados PostgreSQL, versão 9.1, uma das formas de 
indexação empregadas é conhecida como GiST, que utiliza como método de 
acesso as (os) :: árvores balanceadas.

-- 

CREATE TABLE departamento ( codDep varchar(10) primary key, local point ); 
CREATE TABLE funcionario ( codDep varchar(10) references departamento(codDep) , salario real, dataAdm date ); 


-- Usando templates.
CREATE DATABASE teste TEMPLATE template0

-- Removendo as views
No PostgreSQL 9.0, o comando para remover uma view chamada vendas de forma a 
recusar a remoção da mesma se existirem objetos que dependem dela é

DROP VIEW vendas RESTRICT; -- Verifica se existe objetos que dependam da view vendas, antes de apagá-la.

DROP VIEW vendas CASCADE; -- Apaga de qualquer jeito a view.

DROP VIEW IF EXISTS vendas [RESTRIC | CASCADE]

No PostgreSQL, para exibir os registros cujos valores contidos no campo No_Regiao estejam entre 1 e 3, excluindo-se da exibição aqueles cujo conteúdo do campo ID_Tribunal contenha os valores TRF2 ou TRF3, utiliza-se a instrução:
SELECT * FROM "TRF".tribunais WHERE ("No_Regiao" BETWEEN 1 AND 3) AND NOT "ID_Tribunal" IN ('TRF2','TRF3');

No sistema gerenciador de bancos de dados PostgreSQL (9.1), o parâmetro de configuração do servidor de banco de dados que especifica o número máximo de buffers 
temporários permitido em cada sessão do banco de dados é:
temp_buffers.

No sistema gerenciador de bancos de dados PostgreSQL (9.1), o comando para obter os 
nomes dos papéis existentes no banco de dados é:
SELECT rolname FROM pg_roles;
CUIDADO: pg_rOles e não pg_rUle



Localização refere - se ao fato de uma aplicação respeitar as preferências culturais sobre alfabetos, 
classificação, formatação de números etc. PostgreSQL usa o padrão ISO C e POSIX fornecidos pelo sistema 
operacional do servidor para aplicar as regras de localização. O suporte à localização é automaticamente 
inicializado quando um cluster de banco de dados é criado usando o comando:
initdb.


No sistema gerenciador de bancos de dados PostgreSQL (v. 9.1), uma forma de melhorar o desempenho (tuning), quando da inserção de grande quantidade de registros em uma tabela, é
desabilitar o autocommit e executar apenas um commit ao final das inserções de registros.


No sistema gerenciador de bancos de dados PostgreSQL, versão 9.1, há uma forma de replicação na qual todas as alterações em um arquivo são refletidas para um sistema de arquivos 
localizado em outro computador. Essa forma de replicação é conhecida como: File System Replication.

Na linguagem PL/pgSQL do sistema gerenciador de bancos de dados PostgreSQL, 
versão 9.1, uma das formas para se obter o efeito de um comando é verificar o 
conteúdo da variável especial denominada :: FOUND

Sobre as conexões do servidor do sistema gerenciador de bancos de dados PostgreSQL, versão 9.1, 
a seus clientes, é correto afirmar que:: o servidor inicia um novo processo para cada conexão com um cliente.

Considerando o sistema gerenciador de bancos de dados PostgreSQL, versão 9.1, suas tabelas 
são armazenadas seguindo a divisão por páginas. Sobre essa forma de armazenamento, é correto afirmar que :
o tamanho das páginas é fixo.

Na linguagem PL/pgSQL do sistema gerenciador de bancos de dados PostgreSQL, versão 9.1, a forma para declarar uma variável 
denominada “first”, como sendo do tipo inteiro e com valor padrão igual a 10, é:
irst integer DEFAULT 10;

