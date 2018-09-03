using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_28_05_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_ingreso_pedidos : System.Web.UI.Page
{
    //25_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_pedidos.cs
    //que es intancia? consiste en crear un apodo (pedido) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_pedidos pedido = new tbl_pedidos();//estoy creando una instancia ala tbl_pedidos:para leer datos de la clase
    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        //TextBox3.Attributes["onkeypress"] = " return blocklet(event);";

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        //EL_SOCIO_28_05_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string fecha, estado, codProducto, docUsuario;

        codProducto = DropDownList2.SelectedValue.ToString();//se convierte el "valor" en numerico

        fecha = TextBox2.Text;

        docUsuario = DropDownList3.SelectedValue.ToString();

        estado = DropDownList1.SelectedValue.ToString();


        //SE VALIAM LOS CAMPOS
        if (codProducto == "")
        {
            Response.Write("<script>alert('Ingrese el Código del producto')</script>");
        }
        else if (fecha == "")
        {
            Response.Write("<script>alert('Ingrese la fecha')</script>");
        }
        else if (docUsuario == "")
        {
            Response.Write("<script>alert('Ingrese el Documento del usuario')</script>");
        }
        else if (estado == "")
        {
            Response.Write("<script>alert('Ingrese el estado del producto')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_pedidos)
            int resultado = pedido.guardar_tbl_pedidos(codProducto, fecha, docUsuario, estado);

            if (resultado == 1)
            {
                Response.Write("<script>alert('pedido registrado correctamente')</script>");
                Response.Redirect("form_ingreso_pedidos.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar el pedido')</script>");
            }
        }
    }

}