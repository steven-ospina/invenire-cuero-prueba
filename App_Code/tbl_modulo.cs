using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//EL_SOCIO_04_09_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Descripción breve de tbl_modulo
/// </summary>
public class tbl_modulo
{
    string mensaje;

    public tbl_modulo()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public string Grabar_modulos_x_rol(int rol_id, int modulo_id,string seleccion)
    {
        string mensaje = "Los Modulos X Rol han sido Registrados";
        try
        {
            //para conectarse al bd
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se consulta si existe el modulo x rol
            var consulta = "select * from tbl_per_rol where cod_rol = " + rol_id + " and modulo_id = " + modulo_id;
            var cmd = new SqlCommand(consulta, conex);
            conex.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true )
            {
                mensaje = "Hay Modulos_x_Rol que ya existen, por favor Verifique!";
            }
            else
            {
                conex.Close();
                //se prepara la sentecia sql para insertar
                var insertar = "insert into tbl_per_rol values(" + rol_id + "," + modulo_id + ",'" + seleccion + "')";
                //se empaqueta la sentencia sql y la conexion ala bd
                var comando = new SqlCommand(insertar, conex);
                //abrir la conexion
                conex.Open();
                //se ejecuta la sentencia sql
                int resultado = comando.ExecuteNonQuery();
                if(resultado == 0)
                {
                    mensaje = "Error al inserta";
                }
            }
            conex.Close();

        }//fin try
        catch(Exception ex)
        {
            mensaje = ex.Message;//presenta el erro que genera la bd
        }
        return mensaje;
    }//fin del metodo guardar modulos


    public string Eliminar_modulos_x_rol(int cod_rol,int  modulo_id)
    {
        string mensaje = "Los Modulos X Rol han sido Eliminados";
        try
        {
            //para conectarse al bd
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentecia sql para Eliminar
            var eliminar = "delete from tbl_per_rol where cod_rol = " + cod_rol + " and modulo_id = " + modulo_id;
            //se empaqueta la sentencia sql y la conexion ala bd
            var comando = new SqlCommand(eliminar, conex);
            //abrir la conexion
            conex.Open();
            //se ejecuta la sentencia sql
            int resultado = comando.ExecuteNonQuery();
            if (resultado == 0)
            {
                mensaje = "Error al Eiminar";
            }
            conex.Close();
        }//fin try
        catch (Exception ex)
        {
            mensaje = ex.Message;//presenta el erro que genera la bd
        }
        return mensaje;
    }//fin del metodo Eliminar modulos

    public string Guardar_tbl_modulo(string modulos)
    {
        try
        {
            //para conectarse al bd
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentecia sql para Eliminar
            var insertar = "insert into tbl_modulo values('"+ modulos +"')";
            //se empaqueta la sentencia sql y la conexion ala bd
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
        }//fin try
        catch (Exception ex)
        {
            mensaje = ex.Message;//presenta el erro que genera la bd
        }
        return mensaje;
    }
}