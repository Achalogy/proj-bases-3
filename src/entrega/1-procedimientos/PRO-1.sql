
create or replace PROCEDURE registrar_compra (
    p_id_miembro IN NUMBER,
    p_id_colaborador IN NUMBER,
    p_fecha IN DATE
) IS
BEGIN
    -- Insertar la compra en la tabla Compra
    INSERT INTO Compra (ID_Miembro, ID_Colaborador, Fecha, Total_Compra)
    VALUES (p_id_miembro, p_id_colaborador, p_fecha, 0);

    COMMIT;
END registrar_compra;
