create table notificaciones_puntos (
   id_notificacion number
      generated by default on null as identity,
   fecha           timestamp,
   destinatario    number not null, -- Referencia al ID del cliente (ID_Miembro)
   mensaje         varchar2(400),
   primary key ( id_notificacion ),
   foreign key ( destinatario )
      references miembro ( id_miembro ) on delete set null
);