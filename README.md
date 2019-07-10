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
        ```
        [myservice]
        host=localhost
        port=5432
        dbname=northwind
        user=edson
        password=wwwwww
        ´´´
        
        Forma de se chamar
        _psql_


