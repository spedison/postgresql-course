# postgresql-course

## Principal commands in PostgreSQL.

O PostgreSQL é um banco de dados objeto-relaciona sobre a licença **postgresql licence**.

Ele suporta tipos de dados especializado como **JSon** e o **JSonb**.


### Conectando em um banco usando o psql

* O _psql_ é uma ferramenta para conexão com o postgreSQL em linha de comando
 
* Conectando ao banco

  * Conectando usando parâmetros comprimidos:
    ** _psql_ -d <nome do banco> -U <Nome do usuário> -h <hostname> -p <port> -W
        Ou usando a expressão completa:
    ** _psql_ --database=<nome do banco> -username=<usuario> --host=<nome da máquina> --port=<5432 ou outra usada>
      _Exemplo_: psql --port=5432 --host=localhost --dbnane=northwind --username=edson
       
  * Usando variáveis de ambiente
    
      Exemplos:
        
        export PGDATABASE=northwind
        export PGUSER=edson
        export PGPASSWORD=*****
        export PGPORT=5432
        export PGHOST=localhost
        
        
      Exemplo de uma forma de chamar o psql:
        _psql_
        
  * Usando arquivo de configuração
     
   * Arquivo .pg_service.conf no diretório do usuário
      
        Formato:
        
         [myservice]
         host=localhost
         port=5432
         dbname=northwind
         user=edson
         password=wwwwww
                
        Forma de se chamar
        
         _psql_ --service=myservice ou exportar a variável de ambiente _PGSERVICE_
        
   * Arquivo .pgpass no diretório do usuário
        
        Formato:
        
         host:port:dbname:user:pass
         
        Forma de chamar:
         
         _psql_

* Visualizando todos os databases

 * comando simples :
 
     \l
 
                                     List of databases
      Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
----------------+----------+----------+-------------+-------------+-----------------------
 adventureworks | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 northwind      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 pagila         | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres       | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 spedison       | spedison | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |          |          |             |             | postgres=CTc/postgres
 template1      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |          |          |             |             | postgres=CTc/postgres
 usda           | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 

 \l+
 
                                                                       List of databases
      Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   |  Size   | Tablespace |                Description                 
----------------+----------+----------+-------------+-------------+-----------------------+---------+------------+--------------------------------------------
 adventureworks | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 112 MB  | pg_default | 
 northwind      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 8765 kB | pg_default | 
 pagila         | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 15 MB   | pg_default | 
 postgres       | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 7797 kB | pg_default | default administrative connection database
 spedison       | spedison | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 7797 kB | pg_default | 
 template0      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +| 7657 kB | pg_default | unmodifiable empty database
                |          |          |             |             | postgres=CTc/postgres |         |            | 
 template1      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +| 7797 kB | pg_default | default template for new databases
                |          |          |             |             | postgres=CTc/postgres |         |            | 
 usda           | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |                       | 68 MB   | pg_default | 


 * ou a query :
 
    SELECT
     datname
   FROM
     pg_database;
   

