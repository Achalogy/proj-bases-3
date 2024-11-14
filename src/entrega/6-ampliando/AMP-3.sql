CREATE OR REPLACE TRIGGER verificar_existencias_trigger
BEFORE INSERT ON CompraxProducto
FOR EACH ROW
DECLARE
    v_existen BOOLEAN;
BEGIN
    -- Llamamos a la función verificar_existencias para comprobar las existencias
    v_existen := verificar_existencias(:NEW.Nombre_Producto, :NEW.ID_Compra, :NEW.Cantidad);

    -- Si no hay suficientes existencias, lanzamos un error
    IF NOT v_existen THEN
        RAISE_APPLICATION_ERROR(-20001, 'No hay suficientes existencias para el producto ' || :NEW.Nombre_Producto);
    END IF;
END;
