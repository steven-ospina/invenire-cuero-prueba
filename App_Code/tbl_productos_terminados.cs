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
    string mensaje;
    int n, valor_prod, nro;
    public tbl_productos_terminados()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //24_06_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    //public int Guardar_tbl_productos_terminados(string fecha,string doc_usuario)
    //{
    //    int REsultado = 1;
    //    try
    //    {
    //        var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
    //        var insertar = "insert into tbl_productos_terminados values('" + fecha + "','" + doc_usuario + "')";
    //        var comando = new SqlCommand(insertar, conex);
    //        conex.Open();
    //        int resultado = comando.ExecuteNonQuery();//Significado:ejecutarconsulta
    //        if (resultado == 0)
    //        {
    //            REsultado = 0;
    //            conex.Close();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        mensaje = ex.Message;
    //    }
    //    return REsultado;
    //}//final del gurdar permiso

    public int recoger_id_producto_terminados(string codprod)
    {

        try
        {
            var Sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select nom_producto from tbl_productos_terminados where id_prod = '" + codprod + "'";
            var cmd = new SqlCommand(consulta, Sqlconn);
            Sqlconn.Open();
            SqlDataReader leerbd = cmd.ExecuteReader();
            if (leerbd.Read() == true)
            {
                //mensaje = Convert.ToString(leerbd.GetValue(5));//captura el rol del cliente
                //se puede concatenar mas datos asi:
                //mensaje = leerbd.GetString(5)+"-"+leerbd.GetString(2)
                valor_prod = leerbd.GetInt32(0);//captura la clave del cliente
            }
            else
            {
                valor_prod = 0;
            }
            Sqlconn.Close();
        }//fin del try
        catch (Exception e)
        {
            string mensaje = e.Message;
        }

        return valor_prod;
    }//fin del metodo recoger_id_producto_terminados

    public int buscar_consecutivo() //inicio del metodo: buscar_consecutivo
    {
        SqlCommand cmd = null;

        try
        {
            var Sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select count(id_prod) from tbl_productos_terminados";
            cmd = new SqlCommand(consulta, Sqlconn);
            Sqlconn.Open();
            //ExecuteScalar():se usa para consultas con clausulas de agregación(sum, min, max, avg, count)
            nro = Convert.ToInt32(cmd.ExecuteScalar());
            string num = Convert.ToString(nro);
            if (num == null)
            {
                nro = 1; //si es la primera factura de venta
            }
            else
            {
                nro = nro + 1;// si ya existen facturas de venta
            }
            Sqlconn.Close();
        }//fin del try
        catch (Exception e)
        {
            string mensaje = e.Message;
        }
        return nro;

    }//fin del metodo: buscar_consecutivo


    public string grabar_encabezado_productos_terminados(string fec_actual, string instructor, string nom_articulo, string estado)
    {
        try
        {   //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "insert into tbl_productos_terminados values('" + fec_actual + "','" + instructor + "','" + nom_articulo + "','"+ estado +"')";
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

    public string grabar_detalle_productos_terminados(int codproducto, string cantdescrip,string cantubica)
    {
        try
        {   //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "insert into tbl_detalle_productos values('" + codproducto + "','" + cantdescrip + "','" + cantubica + "')";
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
}