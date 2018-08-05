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

public partial class ingreso_productos : System.Web.UI.Page
{
    //EL_SOCIO_28_05_2018
    //ELSOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos.cs
    //que es instanciar? consiste en crear un apodo(productos) para la clase
    //OJO: LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_productos producto = new tbl_productos();
    protected void Page_Load(object sender, EventArgs e)
    {

        //SE EJECUTA AL CARGAR LA PAGINA

        //Calendar1.Visible = false;
        //Calendar2.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_28_05_2018
        //Aquí se postea el código del Botón

        //PRIMERO: SE CAPTURAN LOS DATOS DEL FORMULARIO
        string nomProducto, descProducto, fechIngreso, fechCaducidad,ubicacion, codProducto;
        int  cantProducto;

        //se convierte el "valor" en numerico
        codProducto = TextBox1.Text;
        nomProducto = TextBox2.Text;
        //se convierte el "valor" en numerico
        cantProducto = Convert.ToInt32(TextBox3.Text);
        descProducto = TextBox4.Text;
        fechIngreso = TextBox5.Text;
        fechCaducidad = TextBox6.Text;
        ubicacion = TextBox7.Text;

        //SE VALIDAN LOS CAMPOS
        if (codProducto == "")
        {
            Response.Write("<script>alert('Ingrese Código del producto')</script>");
        }
        else if (nomProducto == "")
        {
            Response.Write("<script>alert('Ingrese Nombre del prodcuto')</script>");
        }
        else if (cantProducto == 0)
        {
            Response.Write("<script>alert('Ingrese la cantida del producto')</script>");
        }
        else if (descProducto == "")
        {
            Response.Write("<script>alert('Ingrese  la descripcion del producto del producto')</script>");
        }
        else if (fechIngreso == "")
        {
            Response.Write("<script>alert('Ingrese la fecha de ingreso')</script>");
        }
        //else if (fechCaducidad == "")
        //{
        //    Response.Write("<script>alert('Ingrese la fecha de caducidad')</script>");
        //}
        else if (ubicacion == "")
        {
            Response.Write("<script>alert('Ingrese  el descuento del producto')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO
            int rdo = producto.guardar_tbl_productos(codProducto, nomProducto, cantProducto, descProducto, fechIngreso, fechCaducidad, ubicacion);

            if (rdo == 1)
            {
                Response.Write("<script>alert(' producto guardo correctamente')</script>");
                Response.Redirect("ingreso_productos.aspx");
            }
            else if (rdo == 0)
            {
                Response.Write("<script>alert('Error al guardar el producto')</script>");
            }
            else
            {
                Response.Write("<script>alert('Verificar, Código del producto repetido')</script>");
            }

        }
    }

    //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    //{
    //    Calendar1.Visible = true;
    //}

    //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    //{
    //    Calendar2.Visible = true;
    //}

    //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    //{
    //    TextBox5.Text = Calendar1.SelectedDate.ToShortDateString();
    //    Calendar1.Visible = false;
    //}

    //protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    //{
    //    TextBox6.Text = Calendar1.SelectedDate.ToShortDateString();
    //    Calendar2.Visible = false;
    //}
}