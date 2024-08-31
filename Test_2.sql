CREATE TABLE Pedido (
    NUMERO          NUMBER(6),  
    DATA            DATE            NOT NULL,
    PRAZO_ENTREGA   DATE            NULL,
    RUA             VARCHAR2(80)    NULL,
    NR              NUMBER(4)       NULL,
    BAIRRO          VARCHAR2(50)    NULL,
    COMPLEMENTO     VARCHAR2(100)   NULL,
    CIDADE          VARCHAR2(50)    NULL,
    UF              VARCHAR2(2)     NULL,
    CEP             VARCHAR2(10)    NULL,
    TOTAL_FATURA    NUMBER(8,2)     NULL,
    CODIGO_CLI      NUMBER          NOT NULL,  
    MATRICULA_VEN   NUMBER          NOT NULL
    
    
);

    ALTER TABLE Pedido
    ADD CONSTRAINT FK_PED_CLIENTE FOREIGN KEY(CODIGO_CLI) REFERENCES Cliente (CODIGO);

    ALTER TABLE Pedido
    ADD CONSTRAINT PK_PEDIDO PRIMARY KEY(NUMERO);
--------------------------------------------------------

DROP TABLE Estoque CASCADE CONSTRAINTS;

CREATE TABLE Estoque (
    DATA_ENTRADA  DATE      NOT NULL,
    CODIGO_PRO    NUMBER    NOT NULL,
    CODIGO_PRA    NUMBER(3) NOT NULL,
    QUANTIDADE    NUMBER(5) NOT NULL,
    DATA_VALIDADE DATE      NOT NULL
);

--------------------------------------------------------

CREATE TABLE Prateleira (
    CODIGO          NUMBER(3)       NOT NULL,
    DESCRICAO       VARCHAR2(50)    NOT NULL,
    NUMERO_SECOES   NUMBER(2)       NOT NULL 
);

--------------------------------------------------------

CREATE TABLE Capacidade_Estoque ( 
    CODIGO_PRO  NUMBER      NOT NULL,
    CODIGO_PRA  NUMBER(3)   NOT NULL,
    QUANTIDADE  NUMBER(5)   NOT NULL
);


--------------------------------------------------------

CREATE TABLE Item_Produto (
    CODIGO_PRO      NUMBER      NOT NULL,
    NUMERO_PED      NUMBER(6)   NOT NULL,  
    QUANTIDADE      NUMBER(5)   NOT NULL,
    PRECO_UNITARIO  NUMBER(5,2) NOT NULL,
    VALOR_ITEM      NUMBER(7,2) NOT NULL
);

--------------------------------------------------------

CREATE TABLE Cliente (
    CODIGO          NUMBER,
    NOME            VARCHAR2(60)    NOT NULL,
    RUA             VARCHAR2(80)    NOT NULL,
    NR              NUMBER(4)       NOT NULL,
    BAIRRO          VARCHAR2(50)    NOT NULL,
    COMPLEMENTO     VARCHAR2(100)   NULL, 
    CIDADE          VARCHAR2(50)    NOT NULL,
    UF              VARCHAR2(2)     NOT NULL,
    CEP             VARCHAR2(10)    NOT NULL
);

    ALTER TABLE Cliente
    ADD CONSTRAINT PK_CLIENTE PRIMARY KEY(CODIGO);
--------------------------------------------------------

CREATE TABLE Pf (
    CODIGO_CLI          NUMBER,      
    CNPF                VARCHAR2(14)    NOT NULL,
    RG                  VARCHAR2(10)    NOT NULL,
    DATA_NASCIMENTO     DATE            NOT NULL
);

    ALTER TABLE Pf
    ADD CONSTRAINT PK_CLIENTE_PF PRIMARY KEY(CODIGO_CLI);
    
---------------------------------------------------------

CREATE TABLE Pj (
    CODIGO_CLI          NUMBER,
    CNPJ                VARCHAR2(19)    NOT NULL,
    IE                  VARCHAR2(10)    NOT NULL,
    NOME_FANTASIA       VARCHAR2(60)    NOT NULL
);

    ALTER TABLE Pj
    ADD CONSTRAINT PK_CLIENTE_Pj PRIMARY KEY(CODIGO_CLI);
    
---------------------------------------------------------- 

CREATE TABLE Produto (
    CODIGO          NUMBER,
    DESCRICAO       VARCHAR2(80)    NOT NULL,
    UNID_MEDIDA     VARCHAR2(10)    NOT NULL
);

    ALTER TABLE Produto
    ADD CONSTRAINT PK_PRODUTO PRIMARY KEY(CODIGO);
    
----------------------------------------------------------    

CREATE TABLE Vendedor (
   MATRICULA    NUMBER,
   NOME         VARCHAR2(60)    NOT NULL,
   CNPF         VARCHAR2(14)    NOT NULL
);

    ALTER TABLE Vendedor
    ADD CONSTRAINT PK_VENDEDOR PRIMARY KEY(MATRICULA);
    
-----------------------------------------------------------

CREATE TABLE Fone_Cliente (
    
);