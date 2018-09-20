using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_24_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class form_detalle_reserva : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_detalle_reserva.cs
    //que es intancia? consiste en crear un apodo (detalle) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_detalle_reserva detalle = new tbl_detalle_reserva();//estoy creando una instancia ala tbl_detalle_reserva:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_25_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int cant_reserva, cod_reserva;
        string cod_producto;

        if(TextBox1.Text == "")
        {
            cant_reserva = 0;
        }
        else
        {
            cant_reserva = Convert.ToInt32(TextBox1.Text);
        }
        cod_producto = DropDownList1.SelectedValue.ToString();
        cod_reserva = Convert.ToInt32(DropDownList2.SelectedValue.ToString());

        //SE VALIAM LOS CAMPOS
        if (cant_reserva == 0)
        {
            Response.Write("<script>alert('Ingrese LA CANTIDAD DE LA RESERVA')</script>");
        }
        else if (cod_producto == "")
        {
            Response.Write("<script>alert('Ingrese CODIGO DEL PRODUCTO')</script>");
        }
        else if (cod_reserva == 0)
        {
            Response.Write("<script>alert('Ingrese EL CODIGO DE LA RESERVA')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_detalle_reserva)
            int resultado = detalle.Guardar_tbl_detalle_reserva(cant_reserva, cod_producto, cod_reserva);

            if (resultado == 1)
            {
                Response.Write("<script>alert('Se registrado correctamente el DETALLE DE LA RESERVA')</script>");
                Response.Redirect("form_detalle_reserva.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar EL DETALLE DE LA RESERVA')</script>");
            }
        }
    }
}