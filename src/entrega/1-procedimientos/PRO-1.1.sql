--Procedimiento auxiliar para PRO-1
create or replace PROCEDURE registrar_producto_compra (
    p_id_compra IN NUMBER,
    p_nombre_producto IN VARCHAR2,
    p_cantidad IN NUMBER
) IS
BEGIN
    -- Insertar el producto en la tabla CompraxProducto
    INSERT INTO CompraxProducto (ID_Compra, Nombre_Producto, Cantidad)
    VALUES (p_id_compra, p_nombre_producto, p_cantidad);

    COMMIT;
END registrar_producto_compra;
