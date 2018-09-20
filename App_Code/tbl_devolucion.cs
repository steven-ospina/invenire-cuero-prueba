using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//EL_SOCIO_26_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_devolucion
/// </summary>
public class tbl_devolucion
{

    string mensaje;

    public tbl_devolucion()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //26_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public string Guardar_tbl_devolucion(string fecha,int usuario,int codigoPedido,int insumos,int cantidad,string hora)
    {
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_devolucion values('" + fecha + "','" + usuario + "',"+ codigoPedido +"," + insumos + "," + cantidad+ ",'" + hora +"')";
            var comando = new SqlCommand(insertar, conex);
            //abrir la conexion
            conex.Open();
            //se ejecuta la sentencia sql
            int resultado = comando.ExecuteNonQuery();
            if (resultado == 0)
            {
                mensaje = "Error al insertar";
            }
            else
            {
                mensaje = "OK";
            }
            conex.Close();
        }//fin del try    
        catch (Exception e)
        {
            mensaje = e.Message;//presenta el error que genera la bd
        }
        return mensaje;
    }//final del gurdar devolucion
}