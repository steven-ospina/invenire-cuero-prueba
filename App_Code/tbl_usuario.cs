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
/// Descripción breve de tbl_usuario
/// </summary>
public class tbl_usuario
{
    public tbl_usuario()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //28_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public int guardar_tbl_usuario(string docUsuario, string NombreUsuario, string apeUsuario, int codRol, string estado,string contrasena, string email, string genero,string telefono)
    {
        int REsultado = 1;
        try
        {
            string result = string.Empty;
            byte[] encryted = System.Text.Encoding.Unicode.GetBytes(contrasena);
            result = Convert.ToBase64String(encryted);

            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_usuario values('" + docUsuario + "','" + NombreUsuario + "','" + apeUsuario + "'," + codRol + ",'" + estado + "','" + result + "','" + email + "','" + genero + "','" + telefono + "')";
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
    }//final del gurdar usuario

    string mensaje, clave_encriptada;

    public string validar_login_inyeccion_Sp(String documento, String clave)
    {
        string estado = "Activo";

        //se define la cadena de conexion con la red
        SqlConnection conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
        //se mapea(lee) el procedimieto alamcenado
        SqlCommand testCMD = new SqlCommand("validar_login", conex);
        //
        testCMD.CommandType = CommandType.StoredProcedure;

        //envio del parametro usuario al sp
        SqlParameter IdIn = testCMD.Parameters.Add("@documento", SqlDbType.VarChar, 20);
        IdIn.Direction = ParameterDirection.Input;
        IdIn.Value = documento;

        //envio del parametro clave al sp

        //se consulta la clave encriptada
        // var consulta = "select contrasena  from tbl_usuario where contrasena = '" + clave + "'";
        // var cmd = new SqlCommand(consulta, conex);
        // conex.Open();
        // SqlDataReader leerbd = cmd.ExecuteReader();

        //if (leerbd.Read() == true)
        // {
        //     //captura la clave encriptada del usuario
        //     clave_encriptada = leerbd.GetString(0);
        // }
        //conex.Close();
        ////se desencripta la clave
        //string result = string.Empty;
        // byte[] decryted = System.Text.Encoding.Unicode.GetBytes(clave_encriptada);
        // result = Convert.ToBase64String(decryted);

        string result = string.Empty;
        byte[] encryted = System.Text.Encoding.Unicode.GetBytes(clave);
        result = Convert.ToBase64String(encryted);



        SqlParameter IdIn1 = testCMD.Parameters.Add("@clave", SqlDbType.VarChar, 20);
        IdIn1.Direction = ParameterDirection.Input;
        IdIn1.Value = result;



        //envio del parametro estado al sp
        SqlParameter IdIn2 = testCMD.Parameters.Add("@estado", SqlDbType.VarChar, 20);
        IdIn2.Direction = ParameterDirection.Input;
        IdIn2.Value = estado;

        //se abre la conexion
        conex.Open();

        //se ejecuta el sp
        SqlDataReader myReader = testCMD.ExecuteReader();
        if (myReader.Read() == true)
        {
            mensaje = "Exito";
        }
        else
        {
            mensaje = "Error";
        }

        //se cierra la conexion
        conex.Close();

        return (mensaje);

    }//FIN METODO VALIDAR ACCESO

    public string consultar_documento(string documento)
    {
        string mensaje;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select doc_usu from tbl_usuario where doc_usu = '" + documento + "'";
            var cmd = new SqlCommand(consulta, conex);
            conex.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true)
            {
                //captura un dato tipo int
                //mensaje = Convert.ToString(leerbd.GetValue(posicion en la tabla de la bd));

                //se deseas concatenar datos lo haces asi:
                //mensaje = leerbd.GetString(posicion en la tabla de la bd)+" _"+leerbd.GetString(posicion en la tabla de la bd)

                //captura el mail del usuario
                mensaje = leerbd.GetString(0);
            }
            else
            {
                mensaje = "";
            }
            conex.Close();
        }//fin del try
        catch (Exception e)
        {
            mensaje = e.Message;
        }
        return mensaje;
    }//fin del metodo consultar_mail()


    public string consultar_usuario(string usuario)
    {
        string mensaje;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select doc_usu from tbl_usuario where doc_usu = '" + usuario + "'";
            var cmd = new SqlCommand(consulta, conex);
            conex.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true)
            {
                //captura un dato tipo int
                //mensaje = Convert.ToString(leerbd.GetValue(posicion en la tabla de la bd));

                //se deseas concatenar datos lo haces asi:
                //mensaje = leerbd.GetString(posicion en la tabla de la bd)+" _"+leerbd.GetString(posicion en la tabla de la bd)

                //captura el clave del usuario
                mensaje = leerbd.GetString(0);
            }
            else
            {
                mensaje = "";
            }
            conex.Close();
        }//fin del try
        catch (Exception e)
        {
            mensaje = e.Message;
        }
        return mensaje;
    }//fin del metodo consultar_clave()

}