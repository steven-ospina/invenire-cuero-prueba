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
    public int guardar_tbl_productos( string nomProducto, int cantProducto, string descProducto, string fechIngreso, string fechCaducidad, string ubicacion,string hora)
    {
        int REsultado = 1; //por defecto
        try//intentar
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var insertar = "insert into tbl_productos values('" + nomProducto + "'," + cantProducto + ",'" + descProducto + "','" + fechIngreso + "','" + fechCaducidad + "','" + ubicacion + "','" + hora +"')";
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
    }//finalisa el gurdado en tbl_productos

    public string consultar_caducidad(string fechaactual)
    {
        string mensaje;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select fecha_caducidad from tbl_productos where fecha_caducidad = '" + fechaactual + "'";
            var cmd = new SqlCommand(consulta, conex);
            conex.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true)
            {
                //captura un dato tipo int
                //mensaje = Convert.ToString(leerbd.GetValue(posicion en la tabla de la bd));

                //se deseas concatenar datos lo haces asi:
                //mensaje = leerbd.GetString(posicion en la tabla de la bd)+" _"+leerbd.GetString(posicion en la tabla de la bd)

                //captura la fecha de caducidad
                mensaje = "Exito";
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
    }//fin del metodo consultar_caduicidad()

    public int Consultar_img(int cod_prod)
    {
        int resultado = 0;
        try
        {
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select imagen from tbl_img_productos where cod_prod = " + cod_prod + "";
            var cmd = new SqlCommand(consulta, conex);
            conex.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true)
            {
                resultado = 1;
            }
            conex.Close();
        }//fin del try
        catch (Exception e)
        {
            string mensaje = e.Message;
        }
        return resultado;
    }
}

