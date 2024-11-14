import runSql from "./src/runSql";

const stringQueries = [
  `DELETE IMPUESTOXCOMPRA WHERE ID_COMPRA = 51`,
  `DELETE COMPRAXPRODUCTO WHERE ID_COMPRA = 51`,
  `DELETE COMPRA WHERE ID_COMPRA = 51`,
  `UPDATE INVENTARIOCAFETERIA
SET existencias = 100
WHERE nombre_producto = 'Pizza' AND nombre_cafeteria = 'Cafetería A'`,
  `INSERT INTO COMPRA(id_compra, id_miembro, id_colaborador, fecha) VALUES(51, 1, 1, TO_DATE('12-11-2023', 'DD-MM-YYYY'))`,
  `INSERT INTO IMPUESTOXCOMPRA(ID_Compra, Tipo_Impuesto, Porcentaje) VALUES(51, 'IVA', 19)`,
  `INSERT INTO COMPRAXPRODUCTO(ID_Compra, Nombre_producto, cantidad) VALUES(51, 'Pizza', 1)`,
  `SELECT calcular_impuestos(51, calcular_sub_total(51)) from DUAL`,
]

for (let i in stringQueries) {
  console.log('Ejecutando ' + stringQueries[i] + "\n")
  const query = await runSql([stringQueries[i]]);
  console.log(
    query,
    // JSON.stringify(query?.metaData, null, 2),
  )
}
