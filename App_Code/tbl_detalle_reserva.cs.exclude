using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//EL_SOCIO_24_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_detalle_reserva
/// </summary>
public class tbl_detalle_reserva
{
    public tbl_detalle_reserva()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //26_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int Guardar_tbl_detalle_reserva(int cant_reserva, string cod_producto, int cod_reserva)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_detalle_reserva values(" + cant_reserva + ",'" + cod_producto + "'," + cod_reserva + ")";
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
    }//final del gurdar detalle_reserva
}