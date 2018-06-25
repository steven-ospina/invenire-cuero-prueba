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
/// Descripción breve de tbl_permisos
/// </summary>
public class tbl_permisos
{
    public tbl_permisos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //24_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int guardar_tbl_permisos(int cod_permiso, string nom_permiso)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_permisos values(" + cod_permiso + ",'" + nom_permiso + "')";
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