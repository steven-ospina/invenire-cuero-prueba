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
    string mensaje;
    int cant;

    public tbl_pedidos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //28_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public string Grabar_pedidos(string fecha,int usuario,string estado,int  insumos,int cantidad,string hora)
    {
        try
        {   //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "insert into tbl_pedidos values('" + fecha + "'," + usuario + ",'" + estado + "'," + insumos + "," + cantidad + ",'" + hora +"')";
            //se empaqueta la sentencia sql y la conexion a la bd
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
        }//fin del try    
        catch (Exception e)
        {
            mensaje = e.Message;//presenta el error que genera la bd
        }
        return mensaje;
    }//fin del metodo: grabar_encabezado_productos_terminados()


    public int validarexistencias(int insumos)
    {
        try
        {   //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "select cant_prod from tbl_productos where cod_prod ="+ insumos ;
            //se empaqueta la sentencia sql y la conexion a la bd
            var comando = new SqlCommand(insertar, conex);
            //abrir la conexion
            conex.Open();
            //se ejecuta la sentencia sql
            SqlDataReader leerbd = comando.ExecuteReader();
            if (leerbd.Read() == true)
            {
                cant = leerbd.GetInt32(0);
            }
            conex.Close();
        }//fin del try    
        catch (Exception e)
        {
            mensaje = e.Message;//presenta el error que genera la bd
        }
        return cant;
    }//fin del metodo: grabar_encabezado_productos_terminados()


}