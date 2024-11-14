drop SEQUENCE log_inventario_seq;
drop SEQUENCE log_miembro_seq;

create sequence log_inventario_seq start with 1 increment by 1 nocache nocycle;
create sequence log_miembro_seq start with 1 increment by 1 nocache nocycle;

create or replace trigger log_miembro_trigger after
   insert or update or delete on miembro
   for each row
declare
   operacion varchar2(10);
begin
   if inserting then
      operacion := 'INSERT';
   elsif updating then
      operacion := 'UPDATE';
   elsif deleting then
      operacion := 'DELETE';
   end if;

   insert into log_miembro (
      id_log,
      id_miembro,
      operacion,
      usuario,
      detalles
   ) values ( log_miembro_seq.nextval,
              :old.id_miembro,
              operacion,
              user,
              'Cambio en la tabla Miembro' );
end;

create or replace trigger log_inventario_trigger after
   insert or update or delete on inventariocafeteria
   for each row
declare
   operacion        varchar2(10);
   nombre_cafeteria varchar2(50);
   nombre_producto  varchar2(50);
begin
   if inserting then
      operacion := 'INSERT';
      nombre_cafeteria := :new.nombre_cafeteria;
      nombre_producto := :new.nombre_producto;
   elsif updating then
      operacion := 'UPDATE';
      nombre_cafeteria := :old.nombre_cafeteria;
      nombre_producto := :old.nombre_producto;
   elsif deleting then
      operacion := 'DELETE';
      nombre_cafeteria := :old.nombre_cafeteria;
      nombre_producto := :old.nombre_producto;
   end if;

   insert into log_inventario (
      id_log,
      nombre_cafeteria,
      nombre_producto,
      operacion,
      usuario,
      detalles
   ) values ( log_inventario_seq.nextval,
              nombre_cafeteria,
              nombre_producto,
              operacion,
              user,
              'Cambio en la tabla Inventario_Cafeteria' );
end;