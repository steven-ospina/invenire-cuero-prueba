using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//EL_SOCIO_25_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_detalle_pedidos
/// </summary>
public class tbl_detalle_pedidos
{
    public tbl_detalle_pedidos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //25_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int Guardar_tbl_detalle_pedidos(int cod_pedido,string cod_producto, int cant_pedido)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_detalle_pedidos values(" + cod_pedido + ",'" + cod_producto + "'," + cant_pedido + ")";
            var comando = new SqlCommand(insertar, conex);
            conex.Open();
            int resultado = comando.ExecuteNonQuery();//Significado:ejecutarconsulta
            if (resultado == 0)
            {
                REsultado = 0;
                conex.Close();
            }
        }
        catch (Exception e)
        {
        }
        return REsultado;
    }//final del gurdar detalle_pedidos
}