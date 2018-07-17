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
    public string guardar_tbl_productos_terminados(string fecha, string doc_usuario, string nom_producto, byte [] imagenbyte)
    {
        string REsultado = "1";
        try
        {
            using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ToString()))
            using (SqlCommand cmd = new SqlCommand("ingreso_imagen", conexi))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("fecha",fecha);
                cmd.Parameters.AddWithValue("doc_usu", doc_usuario);
                cmd.Parameters.AddWithValue("nom_prod", nom_producto);
                cmd.Parameters.AddWithValue("imagen", imagenbyte);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
        }
        catch (Exception ex)
        {
            REsultado = ex.Message.ToString();
        }
        return REsultado;
    }//final del gurdar permiso
}