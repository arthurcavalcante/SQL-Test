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
    CODIGO_CLI      NUMBER,  
    MATRICULA_VEN   NUMBER
  
);

    ALTER TABLE Pedido
    ADD CONSTRAINT FK_PED_CLIENTE FOREIGN KEY(CODIGO_CLI) REFERENCES Cliente (CODIGO);

    ALTER TABLE Pedido
    ADD CONSTRAINT PK_PEDIDO PRIMARY KEY(NUMERO);
    
    ALTER TABLE Pedido
    ADD CONSTRAINT FK_VENDEDOR FOREIGN KEY(MATRICULA_VEN) REFERENCES Vendedor (MATRICULA);
--------------------------------------------------------

DROP TABLE Estoque CASCADE CONSTRAINTS;

CREATE TABLE Estoque (
    DATA_ENTRADA  DATE,
    CODIGO_PRO    NUMBER,
    CODIGO_PRA    NUMBER(3),
    QUANTIDADE    NUMBER(5) NOT NULL,
    DATA_VALIDADE DATE      NOT NULL
);

	ALTER TABLE Estoque
    ADD CONSTRAINT PK_DATA PRIMARY KEY(DATA_ENTREGA);
    
    ALTER TABLE Estoque
    ADD CONSTRAINT FK_PRODUTO FOREIGN KEY(CODIGO_PRO) REFERENCES Produto (CODIGO);
    
    ALTER TABLE Estoque
    ADD CONSTRAINT FK_PRATELEIRA FOREIGN KEY(CODIGO_PRA) REFERENCES Prateleira (CODIGO);
--------------------------------------------------------

CREATE TABLE Prateleira (
    CODIGO          NUMBER(3),
    DESCRICAO       VARCHAR2(50)    NOT NULL,
    NUMERO_SECOES   NUMBER(2)       NOT NULL 
);

	ALTER TABLE Prateleira
    ADD CONSTRAINT PK_PRATELEIRA PRIMARY KEY(CODIGO);

--------------------------------------------------------

CREATE TABLE Capacidade_Estoque ( 
    CODIGO_PRO  NUMBER,
    CODIGO_PRA  NUMBER(3),
    QUANTIDADE  NUMBER(5)   NOT NULL
);

	ALTER TABLE Estoque
    ADD CONSTRAINT FK_PRODUTO FOREIGN KEY(CODIGO_PRO) REFERENCES Produto (CODIGO);
    
    ALTER TABLE Estoque
    ADD CONSTRAINT FK_PRATELEIRA FOREIGN KEY(CODIGO_PRA) REFERENCES Prateleira (CODIGO);

--------------------------------------------------------

CREATE TABLE Item_Produto (
    CODIGO_PRO      NUMBER,
    NUMERO_PED      NUMBER(6),  
    QUANTIDADE      NUMBER(5)   NOT NULL,
    PRECO_UNITARIO  NUMBER(5,2) NOT NULL,
    VALOR_ITEM      NUMBER(7,2) NOT NULL
);
	ALTER TABLE Estoque
    ADD CONSTRAINT FK_PRODUTO FOREIGN KEY(CODIGO_PRO) REFERENCES Produto (CODIGO);
    
    ALTER TABLE Estoque
    ADD CONSTRAINT FK_NUMERO_PEDIDO FOREIGN KEY(NUMERO_PED) REFERENCES Pedido (NUMERO);
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
    
    ALTER TABLE Pf
    ADD CONSTRAINT FK_PF_CLIENTE FOREING KEY(CODIGO_CLI) REFERENCES Cliente (CODIGO);
    
---------------------------------------------------------

CREATE TABLE Pj (
    CODIGO_CLI          NUMBER,
    CNPJ                VARCHAR2(19)    NOT NULL,
    IE                  VARCHAR2(10)    NOT NULL,
    NOME_FANTASIA       VARCHAR2(60)    NOT NULL
);

    ALTER TABLE Pj
    ADD CONSTRAINT PK_CLIENTE_Pj PRIMARY KEY(CODIGO_CLI);
    
    ALTER TABLE Pj
    ADD CONSTRAINT FK_PJ_CLIENTE FOREING KEY(CODIGO_CLI) REFERENCES Cliente (CODIGO);
    
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
    NUMERO			varchar2(14),	NOT NULL,
	CODIGO_CLI		number			NOT NULL
);

	ALTER TABLE Fone_Cliente
    ADD CONSTRAINT PK_FONE_CLIENTE PRIMARY KEY(NUMERO);
    
    ALTER TABLE Fone_Cliente
    ADD CONSTRAINT PK_CLIENTE FOREING KEY(CODIGO_CLI) REFERENCES Cliente (CODIGO);
    
-----------------------------------------------------------

CREATE TABLE Fone_Vendedor (
	NUMERO			varchar2(14),
	MATRICULA_VEN	number
);

	ALTER TABLE Fone_Vendedor
    ADD CONSTRAINT PK_FONE_VENDEDOR PRIMARY KEY(NUMERO);
    
    ALTER TABLE Fone_Vendedor
    ADD CONSTRAINT PK_VENDEDOR FOREING KEY(MATRICULA_VEN) REFERENCES Vendedor (MATRICULA);