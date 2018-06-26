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
/// Descripción breve de tbl_per_rol
/// </summary>
public class tbl_per_rol
{
    public tbl_per_rol()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //25_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int Guardar_tbl_per_rol(int cod_permiso, int cod_rol, string estado)
    {
        int REsultado = 1;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ConnectionString);
            var insertar = "insert into tbl_per_rol values(" + cod_permiso + "," + cod_rol + ",'" + estado + "')";
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