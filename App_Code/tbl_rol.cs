using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//EL_SOCIO_27_05_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Descripción breve de tbl_rol
/// </summary>
public class tbl_rol
{
    public tbl_rol()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //27_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int Guardar_tbl_rol(string nombre_rol)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_rol values('" + nombre_rol + "')";
            var comando = new SqlCommand(insertar, conex);
            conex.Open();
            int resultado = comando.ExecuteNonQuery();
            if (REsultado == 0)
            {
                REsultado = 0;
                conex.Close();
            }
        }
        catch (Exception e)
        {
	  //REsultado = e.Message;
        }
        return REsultado;
    }
}