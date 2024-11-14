create table log_miembro (
   id_log     number
      generated by default on null as identity
   not null,
   id_miembro number not null,
   operacion  varchar2(10) not null, -- Puede ser 'INSERT', 'UPDATE' o 'DELETE'
   fecha      timestamp default current_timestamp not null,
   usuario    varchar2(50), -- Usuario que realizó el cambio
   detalles   varchar2(4000), -- Información adicional del cambio

   primary key ( id_log ),
   foreign key ( id_miembro )
      references miembro ( id_miembro )
         on delete set null
);

create table auditoria_compra (
   id_log    number
      generated by default on null as identity
   not null,
   id_compra number not null,
   operacion varchar2(10) not null,
   fecha     timestamp default current_timestamp not null,
   usuario   varchar2(50),
   detalles  varchar2(4000),
   primary key ( id_log ),
   foreign key ( id_compra )
      references compra ( id_compra )
         on delete set null
);

create table log_inventario (
   id_log           number
      generated by default on null as identity
   not null,
   nombre_cafeteria varchar2(50) not null,
   nombre_producto  varchar2(50) not null,
   operacion        varchar2(10) not null,
   fecha            timestamp default current_timestamp not null,
   usuario          varchar2(50),
   detalles         varchar2(4000),
   primary key ( id_log ),
   foreign key ( nombre_cafeteria )
      references cafeteria ( nombre )
         on delete set null,
   foreign key ( nombre_producto )
      references producto ( nombre_producto )
         on delete set null
);