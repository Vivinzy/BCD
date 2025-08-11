create database Pizzaria;

use Pizzaria;

-- Varchar (palavras) Int (numero)
create table Atendente (
Id_Atendente int,
Finalizar_Atendimento int,
Receber_Pedido varchar(255),
Pagamento_Pedido int
);

create table Administrador (
Id_Administrador int,
Realizar_Pedido varchar(255),
Cadastrar_Pizza varchar(255),
Administrar_Estoque varchar(255),
Gerenciar_Funcionarios varchar(255)
);

create table Cliente (
Id_Cliente int,
Telefone int,
Pagamento int,
Endereco varchar(255),
Nome_Cliente varchar (255)
);

create table Pizza (
Id_Pizza int,
Nome_Pizza varchar(255),
Ingredientes varchar(255),
Sabores varchar(255)
);

select * from Atendente; -- consultar valores

