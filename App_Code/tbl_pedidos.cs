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
    int cant,nro;

    public tbl_pedidos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }
    //28_05_2018
    //EL_SOCIO: AQUI VA EL CODIGO PARA INSERTAR EL REGSITRO EN LA BD
    //este metodo se usa para insertar registros de equipos en la BD
    public string Grabar_detalle_pedidos_en_tbl_detalle_pedido(int consecutivo, string insumo,int cantidad, string medidas,string colorOreferencia,int consumoXproducto,int valorUnidadConsumo,int valorProductoFinal,int valorProduccion)
    {
        try
        {   //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "insert into tbl_detalle_pedido values(" + consecutivo + ",'" + insumo + "'," + cantidad + ",'" + medidas + "','" + colorOreferencia + "'," + consumoXproducto + "," + valorUnidadConsumo +"," + valorProductoFinal + "," + valorProduccion + ")";
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


    public int validarexistencias(string insumos)
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

    public string Grabar_encabezado_tbl_pedidos(int consecutivo, string doc_usuario,string  nom_producto,string fecha_elaboracion_producto,string fecha_entrega_producto,string cusrso,string num_ficha,int costo_x_par_prod,int canti_a_producir,string observaciones,string hora)
    {
        try
        {
            //Para conectarse a la BD
            var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            //se prepara la sentencia sql para insertar
            var insertar = "insert into tbl_pedidos values(" + consecutivo + ",'" + doc_usuario + "','" + nom_producto + "','" + fecha_elaboracion_producto + "','" + fecha_entrega_producto + "','" + cusrso + "','" + num_ficha + "'," + costo_x_par_prod + "," + canti_a_producir + ",'" + observaciones + "','" + hora + "')";
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
    }//fin del metodo: Grabar_encabezado_tbl_pedidos()

    public int buscar_consecutivo() //inicio del metodo: buscar_consecutivo
    {
        SqlCommand cmd = null;

        try
        {
            var Sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
            var consulta = "select count(cod_ped) from tbl_pedidos";
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
}