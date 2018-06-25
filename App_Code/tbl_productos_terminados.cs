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
/// Descripción breve de tbl_productos_terminados
/// </summary>
public class tbl_productos_terminados
{
    public tbl_productos_terminados()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //24_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int guardar_tbl_productos_terminados(string fecha, string doc_usuario)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_productos_terminados values('" + fecha+ "','" + doc_usuario + "')";
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
    }//final del gurdar permiso
}