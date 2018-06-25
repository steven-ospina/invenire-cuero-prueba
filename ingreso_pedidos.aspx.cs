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

public partial class ingreso_pedidos : System.Web.UI.Page
{
    //25_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_pedidos.cs
    //que es intancia? consiste en crear un apodo (pedido) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_pedidos pedido = new tbl_pedidos();//estoy creando una instancia ala tbl_pedidos:para leer datos de la clase
    protected void Page_Load(object sender, EventArgs e)
    {
        //SE EJECUTA AL CARGAR LA PAGINA
        //Calendar1.Visible = false;
 

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        //EL_SOCIO_28_05_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int  docUsuario;
        string fecha, estado,codProducto;

        codProducto = TextBox1.Text;//se convierte el "valor" en numerico
        fecha = TextBox2.Text;
        docUsuario = Convert.ToInt32(TextBox3.Text);//se debe convertir en numero entero
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
        else if (docUsuario == 0)
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
                Response.Redirect("ingreso_pedidos.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar el pedido')</script>");
            }
        }
    }

    //protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    //{
    //    Calendar1.Visible = true;
    //}

    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();
    //    Calendar1.Visible = false;
    //}
}