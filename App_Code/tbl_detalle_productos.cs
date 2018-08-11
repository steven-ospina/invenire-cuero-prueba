using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//EL_SOCIO_11_08_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_detalle_productos
/// </summary>
public class tbl_detalle_productos
{
    public tbl_detalle_productos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public string Guardar_tbl_detalle_productos(int id_producto,string descripcion,string nom_producto)
    {
        string REsultado = "1";
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_detalle_productos values(" + id_producto +",'" + descripcion + "','" + nom_producto + "')";
            var comando = new SqlCommand(insertar, conex);
            conex.Open();
            int resultado = comando.ExecuteNonQuery();//Significado:ejecutarconsulta
            if (resultado == 0)
            {
                REsultado = "0";
                conex.Close();
            }
        }
        catch(Exception e)
        {
            REsultado = e.Message.ToString();
        }
        return REsultado;
    }//final guardado tbl_detalle_productos
}