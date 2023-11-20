alter table CARGO
   drop constraint FK_CARGO_CARGO_CAR_CARGO;

alter table CARGO
   drop constraint FK_CARGO_DEPENDENC_DEPENDEN;

alter table CATPRODUCTO
   drop constraint FK_CATPRODU_CATPRODUC_CATPRODU;

alter table CONTACTO
   drop constraint FK_CONTACTO_PERSONA_C_PERSONA;

alter table CONTACTO
   drop constraint FK_CONTACTO_TIPOCONTA_TIPOCONT;

alter table DETALLEFACTURA
   drop constraint FK_DETALLEF_FACTURA_D_FACTURA;

alter table DETALLEFACTURA
   drop constraint FK_DETALLEF_PRODUCTO__PRODUCTO;

alter table DIRECCION
   drop constraint FK_DIRECCIO_COMPONENT_COMPONEN;

alter table DIRECCION
   drop constraint FK_DIRECCIO_NOMENCLAT_NOMENCLA;

alter table DIRECCION
   drop constraint FK_DIRECCIO_PERSONA_D_PERSONA;

alter table EMPLEADO_CARGO
   drop constraint FK_EMPLEADO_EMPLEADO__CARGO;

alter table EMPLEADO_CARGO
   drop constraint FK_EMPLEADO_EMPLEADO__EMPLEADO;

alter table FACTURA
   drop constraint FK_FACTURA_EMPLEADO__EMPLEADO;

alter table FACTURA
   drop constraint FK_FACTURA_FACTURA_F_FACTURA;

alter table FACTURA
   drop constraint FK_FACTURA_PERSONA_F_PERSONA;

alter table FACTURA
   drop constraint FK_FACTURA_TIPOFACTU_TIPOFACT;

alter table HISTORICOPRECIO
   drop constraint FK_HISTORIC_PRODUCTO__PRODUCTO;

alter table INVENTARIO
   drop constraint FK_INVENTAR_DETALLEFA_DETALLEF;

alter table INVENTARIO
   drop constraint FK_INVENTAR_INVENTARI_INVENTAR;

alter table INVENTARIO
   drop constraint FK_INVENTAR_PRODUCTO__PRODUCTO;

alter table NOMENCLATURA
   drop constraint FK_NOMENCLA_COMPONENT_COMPONEN;

alter table PERSONA
   drop constraint FK_PERSONA_TIPODOC_P_TIPODOC;

alter table PERSONA
   drop constraint FK_PERSONA_TIPOPERSO_TIPOPERS;

alter table PRODUCTO
   drop constraint FK_PRODUCTO_CATPRODUC_CATPRODU;

drop index CARGO_CARGO_FK;

drop index DEPENDENCIA_CARGO_FK;

drop table CARGO cascade constraints;

drop index CATPRODUCTO_CATPRODUCTO_FK;

drop table CATPRODUCTO cascade constraints;

drop table COMPONENTEDIRECC cascade constraints;

drop index PERSONA_CONTACTO_FK;

drop index TIPOCONTACTO_CONTACTO_FK;

drop table CONTACTO cascade constraints;

drop table DEPENDENCIA cascade constraints;

drop index PRODUCTO_DETALLEFACTURA_FK;

drop table DETALLEFACTURA cascade constraints;

drop index PERSONA_DIRECCION_FK;

drop index NOMENCLATURA_DIRECCION_FK;

drop index COMPONENTEDIRECC_DIRECCION_FK;

drop table DIRECCION cascade constraints;

drop table EMPLEADO cascade constraints;

drop index EMPLEADO_CARGO_FK;

drop index EMPLEADO_CARGO2_FK;

drop table EMPLEADO_CARGO cascade constraints;

drop index EMPLEADO_FACTURA_FK;

drop index FACTURA_FACTURA_FK;

drop index TIPOFACTURA_FACTURA_FK;

drop index PERSONA_FACTURA_FK;

drop table FACTURA cascade constraints;

drop index PRODUCTO_HISTORICOPRECIO_FK;

drop table HISTORICOPRECIO cascade constraints;

drop index INVENTARIO_INVENTARIO_FK;

drop index PRODUCTO_INVENTARIO_FK;

drop index DETALLEFACTURA_INVENTARIO_FK;

drop table INVENTARIO cascade constraints;

drop index COMPDIRECC_NOMEN_FK;

drop table NOMENCLATURA cascade constraints;

drop index TIPODOC_PERSONA_FK;

drop index TIPOPERSONA_PERSONA_FK;

drop table PERSONA cascade constraints;

drop index CATPRODUCTO_PRODUCTO_FK;

drop table PRODUCTO cascade constraints;

drop table TIPOCONTACTO cascade constraints;

drop table TIPODOC cascade constraints;

drop table TIPOFACTURA cascade constraints;

drop table TIPOPERSONA cascade constraints;

drop sequence CONTACTO_SEQ;

drop sequence DIRECCION_SEQ;

drop sequence HISTORICOPRECIO_SEQ;

drop sequence INVENTARIO_SEQ;

drop trigger CONTACTO_TRIGGER;

drop trigger DIRECCION_TRIGGER;

drop trigger HISTORICOPRECIO_TRIGGER;

drop trigger INVENTARIO_TRIGGER;

/*==============================================================*/
/* Sequence: CONTACTO                                           */
/*==============================================================*/
create sequence CONTACTO_SEQ
   start with 1
   increment by 1
   nomaxvalue;

/*==============================================================*/
/* Sequence: DIRECCION                                          */
/*==============================================================*/
create sequence DIRECCION_SEQ
   start with 1
   increment by 1
   nomaxvalue;

/*==============================================================*/
/* Sequence: HISTORICOPRECIO                                    */
/*==============================================================*/
create sequence HISTORICOPRECIO_SEQ
   start with 1
   increment by 1
   nomaxvalue;

/*==============================================================*/
/* Sequence: INVENTARIO                                         */
/*==============================================================*/
create sequence INVENTARIO_SEQ
   start with 1
   increment by 1
   nomaxvalue;

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   CODCARGO             VARCHAR2(5)          not null,
   CODDEPENDENCIA       VARCHAR2(5)          not null,
   CAR_CODCARGO         VARCHAR2(5),
   NOMCARGO             VARCHAR2(40)         not null,
   ESTADOCARGO          SMALLINT             not null,
   constraint PK_CARGO primary key (CODCARGO)
);

/*==============================================================*/
/* Index: DEPENDENCIA_CARGO_FK                                  */
/*==============================================================*/
create index DEPENDENCIA_CARGO_FK on CARGO (
   CODDEPENDENCIA ASC
);

/*==============================================================*/
/* Index: CARGO_CARGO_FK                                        */
/*==============================================================*/
create index CARGO_CARGO_FK on CARGO (
   CAR_CODCARGO ASC
);

/*==============================================================*/
/* Table: CATPRODUCTO                                           */
/*==============================================================*/
create table CATPRODUCTO 
(
   IDCATPRODUCTO        VARCHAR2(3)          not null,
   CAT_IDCATPRODUCTO    VARCHAR2(3),
   DESCATPRODUCTO       VARCHAR2(30)         not null,
   constraint PK_CATPRODUCTO primary key (IDCATPRODUCTO)
);

/*==============================================================*/
/* Index: CATPRODUCTO_CATPRODUCTO_FK                            */
/*==============================================================*/
create index CATPRODUCTO_CATPRODUCTO_FK on CATPRODUCTO (
   CAT_IDCATPRODUCTO ASC
);

/*==============================================================*/
/* Table: COMPONENTEDIRECC                                      */
/*==============================================================*/
create table COMPONENTEDIRECC 
(
   POSICION             NUMBER(2)            not null,
   DESCPOSICION         VARCHAR2(30)         not null,
   OBLIGATORIEDAD       SMALLINT             not null,
   constraint PK_COMPONENTEDIRECC primary key (POSICION)
);

/*==============================================================*/
/* Table: CONTACTO                                              */
/*==============================================================*/
create table CONTACTO 
(
   CONSECCONTACTO       NUMBER(4,0)          not null,
   IDTIPOCONTACTO       VARCHAR2(2)          not null,
   IDTIPODOC            VARCHAR2(2)          not null,
   IDTIPOPERSONA        VARCHAR2(2)          not null,
   NDOCUMENTO           VARCHAR2(12)         not null,
   DESCCONTACTO         VARCHAR2(30)         not null,
   constraint PK_CONTACTO primary key (CONSECCONTACTO)
);

/*==============================================================*/
/* Index: TIPOCONTACTO_CONTACTO_FK                              */
/*==============================================================*/
create index TIPOCONTACTO_CONTACTO_FK on CONTACTO (
   IDTIPOCONTACTO ASC
);

/*==============================================================*/
/* Index: PERSONA_CONTACTO_FK                                   */
/*==============================================================*/
create index PERSONA_CONTACTO_FK on CONTACTO (
   IDTIPODOC ASC,
   IDTIPOPERSONA ASC,
   NDOCUMENTO ASC
);

/*==============================================================*/
/* Table: DEPENDENCIA                                           */
/*==============================================================*/
create table DEPENDENCIA 
(
   CODDEPENDENCIA       VARCHAR2(5)          not null,
   NOMDEPENDENCIA       VARCHAR2(30)         not null,
   ESTADODEPEN          SMALLINT             not null,
   constraint PK_DEPENDENCIA primary key (CODDEPENDENCIA)
);

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA 
(
   NFACTURA             VARCHAR2(5)          not null,
   IDCATPRODUCTO        VARCHAR2(3)          not null,
   REFPRODUCTO          VARCHAR2(5)          not null,
   ITEM                 NUMBER(3,0)          not null,
   CANTIDAD             NUMBER(3,0)          not null,
   PRECIO               NUMBER(4,2)          not null,
   constraint PK_DETALLEFACTURA primary key (NFACTURA)
);

/*==============================================================*/
/* Index: PRODUCTO_DETALLEFACTURA_FK                            */
/*==============================================================*/
create index PRODUCTO_DETALLEFACTURA_FK on DETALLEFACTURA (
   IDCATPRODUCTO ASC,
   REFPRODUCTO ASC
);

/*==============================================================*/
/* Table: DIRECCION                                             */
/*==============================================================*/
create table DIRECCION 
(
   POSICION             NUMBER(2)            not null,
   IDDIRECCION          NUMBER(3,0)          not null,
   IDNOMEN              VARCHAR2(5),
   IDTIPODOC            VARCHAR2(2)          not null,
   IDTIPOPERSONA        VARCHAR2(2)          not null,
   NDOCUMENTO           VARCHAR2(12)         not null,
   VALORDIREC           VARCHAR2(15),
   constraint PK_DIRECCION primary key (POSICION, IDDIRECCION)
);

/*==============================================================*/
/* Index: COMPONENTEDIRECC_DIRECCION_FK                         */
/*==============================================================*/
create index COMPONENTEDIRECC_DIRECCION_FK on DIRECCION (
   POSICION ASC
);

/*==============================================================*/
/* Index: NOMENCLATURA_DIRECCION_FK                             */
/*==============================================================*/
create index NOMENCLATURA_DIRECCION_FK on DIRECCION (
   IDNOMEN ASC
);

/*==============================================================*/
/* Index: PERSONA_DIRECCION_FK                                  */
/*==============================================================*/
create index PERSONA_DIRECCION_FK on DIRECCION (
   IDTIPODOC ASC,
   IDTIPOPERSONA ASC,
   NDOCUMENTO ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   CODEMPLEADO          VARCHAR2(5)          not null,
   NOMEMPLEADO          VARCHAR2(30)         not null,
   APELLEMPLEADO        VARCHAR2(30)         not null,
   CORREO               VARCHAR2(50)         not null,
   constraint PK_EMPLEADO primary key (CODEMPLEADO)
);

/*==============================================================*/
/* Table: EMPLEADO_CARGO                                        */
/*==============================================================*/
create table EMPLEADO_CARGO 
(
   CODCARGO             VARCHAR2(5)          not null,
   CODEMPLEADO          VARCHAR2(5)          not null,
   constraint PK_EMPLEADO_CARGO primary key (CODCARGO, CODEMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_CARGO2_FK                                    */
/*==============================================================*/
create index EMPLEADO_CARGO2_FK on EMPLEADO_CARGO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Index: EMPLEADO_CARGO_FK                                     */
/*==============================================================*/
create index EMPLEADO_CARGO_FK on EMPLEADO_CARGO (
   CODCARGO ASC
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA 
(
   NFACTURA             VARCHAR2(5)          not null,
   IDTIPODOC            VARCHAR2(2)          not null,
   IDTIPOPERSONA        VARCHAR2(2)          not null,
   NDOCUMENTO           VARCHAR2(12)         not null,
   IDTIPOFAC            VARCHAR2(3)          not null,
   FAC_NFACTURA         VARCHAR2(5),
   CODEMPLEADO          VARCHAR2(5)          not null,
   FECHAFACTURA         DATE                 not null,
   TOTALFACTURA         NUMBER(7,2),
   constraint PK_FACTURA primary key (NFACTURA)
);

/*==============================================================*/
/* Index: PERSONA_FACTURA_FK                                    */
/*==============================================================*/
create index PERSONA_FACTURA_FK on FACTURA (
   IDTIPODOC ASC,
   IDTIPOPERSONA ASC,
   NDOCUMENTO ASC
);

/*==============================================================*/
/* Index: TIPOFACTURA_FACTURA_FK                                */
/*==============================================================*/
create index TIPOFACTURA_FACTURA_FK on FACTURA (
   IDTIPOFAC ASC
);

/*==============================================================*/
/* Index: FACTURA_FACTURA_FK                                    */
/*==============================================================*/
create index FACTURA_FACTURA_FK on FACTURA (
   FAC_NFACTURA ASC
);

/*==============================================================*/
/* Index: EMPLEADO_FACTURA_FK                                   */
/*==============================================================*/
create index EMPLEADO_FACTURA_FK on FACTURA (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: HISTORICOPRECIO                                       */
/*==============================================================*/
create table HISTORICOPRECIO 
(
   IDCATPRODUCTO        VARCHAR2(3)          not null,
   REFPRODUCTO          VARCHAR2(5)          not null,
   CONSECPRECIO         NUMBER(4,0)          not null,
   FECHAINICIO          DATE                 not null,
   FECHAFIN             DATE,
   constraint PK_HISTORICOPRECIO primary key (IDCATPRODUCTO, REFPRODUCTO, CONSECPRECIO)
);

/*==============================================================*/
/* Index: PRODUCTO_HISTORICOPRECIO_FK                           */
/*==============================================================*/
create index PRODUCTO_HISTORICOPRECIO_FK on HISTORICOPRECIO (
   IDCATPRODUCTO ASC,
   REFPRODUCTO ASC
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO 
(
   CONSECINVEN          NUMBER(5)            not null,
   NFACTURA             VARCHAR2(5)          not null,
   IDCATPRODUCTO        VARCHAR2(3)          not null,
   REFPRODUCTO          VARCHAR2(5)          not null,
   INV_CONSECINVEN      NUMBER(5),
   FECHAINVE            DATE                 not null,
   SALEN                NUMBER(5,0),
   ENTRAN               NUMBER(5,0),
   EXISTENCIA           NUMBER(5)            not null,
   constraint PK_INVENTARIO primary key (CONSECINVEN)
);

/*==============================================================*/
/* Index: DETALLEFACTURA_INVENTARIO_FK                          */
/*==============================================================*/
create index DETALLEFACTURA_INVENTARIO_FK on INVENTARIO (
   NFACTURA ASC
);

/*==============================================================*/
/* Index: PRODUCTO_INVENTARIO_FK                                */
/*==============================================================*/
create index PRODUCTO_INVENTARIO_FK on INVENTARIO (
   IDCATPRODUCTO ASC,
   REFPRODUCTO ASC
);

/*==============================================================*/
/* Index: INVENTARIO_INVENTARIO_FK                              */
/*==============================================================*/
create index INVENTARIO_INVENTARIO_FK on INVENTARIO (
   INV_CONSECINVEN ASC
);

/*==============================================================*/
/* Table: NOMENCLATURA                                          */
/*==============================================================*/
create table NOMENCLATURA 
(
   IDNOMEN              VARCHAR2(5)          not null,
   POSICION             NUMBER(2)            not null,
   DESCNOMEN            VARCHAR2(50)         not null,
   constraint PK_NOMENCLATURA primary key (IDNOMEN)
);

/*==============================================================*/
/* Index: COMPDIRECC_NOMEN_FK                                   */
/*==============================================================*/
create index COMPDIRECC_NOMEN_FK on NOMENCLATURA (
   POSICION ASC
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA 
(
   IDTIPODOC            VARCHAR2(2)          not null,
   IDTIPOPERSONA        VARCHAR2(2)          not null,
   NDOCUMENTO           VARCHAR2(12)         not null,
   NOMBRE               VARCHAR2(30)         not null,
   APELLIDO             VARCHAR2(30)         not null,
   constraint PK_PERSONA primary key (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO)
);

/*==============================================================*/
/* Index: TIPOPERSONA_PERSONA_FK                                */
/*==============================================================*/
create index TIPOPERSONA_PERSONA_FK on PERSONA (
   IDTIPOPERSONA ASC
);

/*==============================================================*/
/* Index: TIPODOC_PERSONA_FK                                    */
/*==============================================================*/
create index TIPODOC_PERSONA_FK on PERSONA (
   IDTIPODOC ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   IDCATPRODUCTO        VARCHAR2(3)          not null,
   REFPRODUCTO          VARCHAR2(5)          not null,
   NOMPRODUCTO          VARCHAR2(30)         not null,
   constraint PK_PRODUCTO primary key (IDCATPRODUCTO, REFPRODUCTO)
);

/*==============================================================*/
/* Index: CATPRODUCTO_PRODUCTO_FK                               */
/*==============================================================*/
create index CATPRODUCTO_PRODUCTO_FK on PRODUCTO (
   IDCATPRODUCTO ASC
);

/*==============================================================*/
/* Table: TIPOCONTACTO                                          */
/*==============================================================*/
create table TIPOCONTACTO 
(
   IDTIPOCONTACTO       VARCHAR2(2)          not null,
   DESCTIPOCONTACTO     VARCHAR2(15)         not null,
   constraint PK_TIPOCONTACTO primary key (IDTIPOCONTACTO)
);

/*==============================================================*/
/* Table: TIPODOC                                               */
/*==============================================================*/
create table TIPODOC 
(
   IDTIPODOC            VARCHAR2(2)          not null,
   DESCTIPODOC          VARCHAR2(20)         not null,
   constraint PK_TIPODOC primary key (IDTIPODOC)
);

/*==============================================================*/
/* Table: TIPOFACTURA                                           */
/*==============================================================*/
create table TIPOFACTURA 
(
   IDTIPOFAC            VARCHAR2(3)          not null,
   DESCTIPOFAC          VARCHAR2(30)         not null,
   constraint PK_TIPOFACTURA primary key (IDTIPOFAC)
);

/*==============================================================*/
/* Table: TIPOPERSONA                                           */
/*==============================================================*/
create table TIPOPERSONA 
(
   IDTIPOPERSONA        VARCHAR2(2)          not null,
   DESCTIPOPERSONA      VARCHAR2(20)         not null,
   constraint PK_TIPOPERSONA primary key (IDTIPOPERSONA)
);

/*==============================================================*/
/* Trigger: CONTACTO                                            */
/*==============================================================*/
create or replace trigger CONTACTO_TRIGGER
before insert on CONTACTO
for each row
begin
   select CONTACTO_SEQ.NEXTVAL into :new.CONSECCONTACTO from DUAL;
end;
/

/*==============================================================*/
/* Trigger: DIRECCION                                           */
/*==============================================================*/
create or replace trigger DIRECCION_TRIGGER
before insert on DIRECCION
for each row
begin
   select DIRECCION_SEQ.NEXTVAL into :new.IDDIRECCION from DUAL;
end;
/

/*==============================================================*/
/* Trigger: HISTORICOPRECIO                                     */
/*==============================================================*/
create or replace trigger HISTORICOPRECIO_TRIGGER
before insert on HISTORICOPRECIO
for each row
begin
   select HISTORICOPRECIO_SEQ.NEXTVAL into :new.CONSECPRECIO from DUAL;
end;
/

/*==============================================================*/
/* Trigger: INVENTARIO                                          */
/*==============================================================*/
create or replace trigger INVENTARIO_TRIGGER
before insert on INVENTARIO
for each row
begin
   select INVENTARIO_SEQ.NEXTVAL into :new.CONSECINVEN from DUAL;
end;
/

alter table CARGO
   add constraint FK_CARGO_CARGO_CAR_CARGO foreign key (CAR_CODCARGO)
      references CARGO (CODCARGO);

alter table CARGO
   add constraint FK_CARGO_DEPENDENC_DEPENDEN foreign key (CODDEPENDENCIA)
      references DEPENDENCIA (CODDEPENDENCIA);

alter table CATPRODUCTO
   add constraint FK_CATPRODU_CATPRODUC_CATPRODU foreign key (CAT_IDCATPRODUCTO)
      references CATPRODUCTO (IDCATPRODUCTO);

alter table CONTACTO
   add constraint FK_CONTACTO_PERSONA_C_PERSONA foreign key (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO)
      references PERSONA (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO);

alter table CONTACTO
   add constraint FK_CONTACTO_TIPOCONTA_TIPOCONT foreign key (IDTIPOCONTACTO)
      references TIPOCONTACTO (IDTIPOCONTACTO);

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_FACTURA_D_FACTURA foreign key (NFACTURA)
      references FACTURA (NFACTURA);

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_PRODUCTO__PRODUCTO foreign key (IDCATPRODUCTO, REFPRODUCTO)
      references PRODUCTO (IDCATPRODUCTO, REFPRODUCTO);

alter table DIRECCION
   add constraint FK_DIRECCIO_COMPONENT_COMPONEN foreign key (POSICION)
      references COMPONENTEDIRECC (POSICION);

alter table DIRECCION
   add constraint FK_DIRECCIO_NOMENCLAT_NOMENCLA foreign key (IDNOMEN)
      references NOMENCLATURA (IDNOMEN);

alter table DIRECCION
   add constraint FK_DIRECCIO_PERSONA_D_PERSONA foreign key (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO)
      references PERSONA (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO);

alter table EMPLEADO_CARGO
   add constraint FK_EMPLEADO_EMPLEADO__CARGO foreign key (CODCARGO)
      references CARGO (CODCARGO);

alter table EMPLEADO_CARGO
   add constraint FK_EMPLEADO_EMPLEADO__EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table FACTURA
   add constraint FK_FACTURA_EMPLEADO__EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table FACTURA
   add constraint FK_FACTURA_FACTURA_F_FACTURA foreign key (FAC_NFACTURA)
      references FACTURA (NFACTURA);

alter table FACTURA
   add constraint FK_FACTURA_PERSONA_F_PERSONA foreign key (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO)
      references PERSONA (IDTIPODOC, IDTIPOPERSONA, NDOCUMENTO);

alter table FACTURA
   add constraint FK_FACTURA_TIPOFACTU_TIPOFACT foreign key (IDTIPOFAC)
      references TIPOFACTURA (IDTIPOFAC);

alter table HISTORICOPRECIO
   add constraint FK_HISTORIC_PRODUCTO__PRODUCTO foreign key (IDCATPRODUCTO, REFPRODUCTO)
      references PRODUCTO (IDCATPRODUCTO, REFPRODUCTO);

alter table INVENTARIO
   add constraint FK_INVENTAR_DETALLEFA_DETALLEF foreign key (NFACTURA)
      references DETALLEFACTURA (NFACTURA);

alter table INVENTARIO
   add constraint FK_INVENTAR_INVENTARI_INVENTAR foreign key (INV_CONSECINVEN)
      references INVENTARIO (CONSECINVEN);

alter table INVENTARIO
   add constraint FK_INVENTAR_PRODUCTO__PRODUCTO foreign key (IDCATPRODUCTO, REFPRODUCTO)
      references PRODUCTO (IDCATPRODUCTO, REFPRODUCTO);

alter table NOMENCLATURA
   add constraint FK_NOMENCLA_COMPONENT_COMPONEN foreign key (POSICION)
      references COMPONENTEDIRECC (POSICION);

alter table PERSONA
   add constraint FK_PERSONA_TIPODOC_P_TIPODOC foreign key (IDTIPODOC)
      references TIPODOC (IDTIPODOC);

alter table PERSONA
   add constraint FK_PERSONA_TIPOPERSO_TIPOPERS foreign key (IDTIPOPERSONA)
      references TIPOPERSONA (IDTIPOPERSONA);

alter table PRODUCTO
   add constraint FK_PRODUCTO_CATPRODUC_CATPRODU foreign key (IDCATPRODUCTO)
      references CATPRODUCTO (IDCATPRODUCTO);
