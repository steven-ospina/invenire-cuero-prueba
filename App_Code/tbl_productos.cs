using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//EL_SOCIO_28_05_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_productos
/// </summary>
public class tbl_productos
{
    public tbl_productos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //25_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de productos en la BD
    public int guardar_tbl_productos(string codProducto, string nomProducto, int cantProducto, string descProducto, string fechIngreso, string fechCaducidad, string ubicacion)
    {
        int REsultado = 1; //por defecto
        try//intentar
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_productos values('" + codProducto + "','" + nomProducto + "'," + cantProducto + ",'" + descProducto + "','" + fechIngreso + "','" + fechCaducidad + "','" + ubicacion + "')";
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
    }
}

