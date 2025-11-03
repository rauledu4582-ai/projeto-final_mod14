# projeto-final_mod14
Projeto final mod14

Em primeiro lugar, foi criado a base de dados 'ginasio'. Depois criamos as tabelas que são:
Sócio
Professor
Espaço
Aulas
Inscrições
Presenças
Check_in_out
Produtos
Vendas
Vendas_produtos
Pagamento

Depois são criados os quatro utilizadores, cada um com uma palavra-passe e acesso apenas a partir do servidor local. De seguida, são criados os papéis correspondentes: socio, professor, funcionario e administrador.
O administrador possui todos os privilégios sobre a base de dados, podendo gerir e modificar qualquer tabela. O sócio tem apenas permissões de leitura (SELECT) em tabelas específicas, como socio e pagamento. O professor pode inserir, actualizar e consultar registos de presenças, além de consultar as tabelas aulas e sócios. O funcionário tem permissões para inserir, actualizar e consultar dados nas tabelas vendas, pagamentos e check_in_out, e pode também consultar informações dos sócios.
 
Por fim, o código revoga (REVOKE) o acesso dos papéis sócio e professor às tabelas financeiras, para garantir o a segurança e a confidencialidade das informações.
 

