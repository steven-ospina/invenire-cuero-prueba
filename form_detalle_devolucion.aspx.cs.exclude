using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_26_06_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_detalle_devolucion : System.Web.UI.Page
{
    //26_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_detalle_reserva.cs
    //que es intancia? consiste en crear un apodo (devolucion) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_detalle_devolucion devolucion = new tbl_detalle_devolucion();//estoy creando una instancia ala tbl_devolucion:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_26_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int id_devolucion, id_det_pedido, cant_producto;
        string cod_producto;

        id_devolucion = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        id_det_pedido = Convert.ToInt32(DropDownList2.SelectedValue.ToString());
        cod_producto = DropDownList3.SelectedValue.ToString();
        cant_producto = Convert.ToInt32(TextBox1.Text);

        //SE VALIAM LOS CAMPOS
        if (id_devolucion == 0)
        {
            Response.Write("<script>alert('Ingrese ID de la DEVOLUCION')</script>");
        }
        else if (id_det_pedido == 0)
        {
            Response.Write("<script>alert('Ingrese ID DETALLE PEDIDO')</script>");
        }
        else if (cod_producto == "")
        {
            Response.Write("<script>alert('Ingrese  EL CODIGO DEL PRODUCTO')</script>");
        }
        else if (cant_producto == 0)
        {
            Response.Write("<script>alert('Ingrese LA CASTIDAD DE PRODUCTO SOBRANTE')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_detalle_devolucion)
            int resultado = devolucion.Guardar_tbl_detalle_devolucion(id_devolucion, id_det_pedido, cod_producto, cant_producto);

            if (resultado == 1)
            {
                Response.Write("<script>alert('Se registrado correctamente EL DETALLE DE LA DEVOLUCION')</script>");
                Response.Redirect("form_detalle_devolucion.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar EL DETALLE DE LA DEVOLUCION')</script>");
            }
        }
    }
}