using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_25_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_detalle_pedidos : System.Web.UI.Page
{
    //25_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_detalle_pedidos.cs
    //que es intancia? consiste en crear un apodo (pedido) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_detalle_pedidos pedido = new tbl_detalle_pedidos();//estoy creando una instancia ala tbl_detalle_pedidos:para leer datos de la clase
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_25_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int cod_pedido, cant_pedido;
        string cod_producto;

        cod_pedido = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        cod_producto = DropDownList2.SelectedValue.ToString();
        cant_pedido = Convert.ToInt32(TextBox1.Text);


        //SE VALIAM LOS CAMPOS
        if (cod_pedido == 0)
        {
            Response.Write("<script>alert('Ingrese CODIGO DEL PEDIDO')</script>");
        }
        else if (cod_producto == "")
        {
            Response.Write("<script>alert('Ingrese CODIGO DEL PRODUCTO')</script>");
        }
        else if (cant_pedido == 0)
        {
            Response.Write("<script>alert('Ingrese CANTIDAD DEL PEDIDO')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_detalle_pedidos)
            int resultado = pedido.Guardar_tbl_detalle_pedidos(cod_pedido,cod_producto,cant_pedido);

            if (resultado == 1)
            {
                Response.Write("<script>alert('Se registrado correctamente el deatalle del pedido')</script>");
                Response.Redirect("form_detalle_pedidos.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar DETALLE DEL PEDIDO')</script>");
            }
        }
    }
}