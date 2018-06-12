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
/// Descripción breve de tbl_pedidos
/// </summary>
public class tbl_pedidos
{
    public tbl_pedidos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //28_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int guardar_tbl_pedidos(string codProduto,string fecha,int docUsuario,string estado)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_pedidos values('" + codProduto + "','" + fecha + "'," + docUsuario + ",'" + estado +"')";
            var comando = new SqlCommand(insertar, conex);
            conex.Open();
            int resultado = comando.ExecuteNonQuery();//Significado:ejecutarconsulta
            if (resultado == 0)
            {
                REsultado = 0;
                conex.Close();
            }
        }
        catch(Exception e)
        {
        }
        return REsultado;
    }
}