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

public partial class form_ingreso_productos : System.Web.UI.Page
{
    //EL_SOCIO_28_05_2018
    //ELSOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos.cs
    //que es instanciar? consiste en crear un apodo(productos) para la clase
    //OJO: LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_productos producto = new tbl_productos();
    string fecha_sistema, hora_sistema;
    protected void Page_Load(object sender, EventArgs e)
    {
        //SE EJECUTA AL CARGAR LA PAGINA
        TextBox2.Attributes["onkeypress"] = " return  blocknum(event);";
        TextBox2.Attributes.Add("autocomplete", "off");
        TextBox3.Attributes["onkeypress"] = " return blocklet(event);";
        TextBox3.Attributes.Add("autocomplete", "off");
        TextBox6.Attributes["onkeypress"] = " return blocklet(event);";
        TextBox7.Attributes.Add("autocomplete", "off");
        TextBox4.Attributes.Add("autocomplete", "off");


        //capturo la fecha del sistemas
        fecha_sistema = TextBox5.Text = DateTime.Now.ToString("yyyy-MM-dd");

        //se captura la hora del sistema
        hora_sistema = DateTime.Now.ToString("HH:mm:ss");


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_28_05_2018
        //Aquí se postea el código del Botón

        //PRIMERO: SE CAPTURAN LOS DATOS DEL FORMULARIO
        string nomProducto, descProducto, fechIngreso, fechCaducidad, ubicacion,hora;
        int cantProducto;

        //se convierte el "valor" en numerico
        nomProducto = TextBox2.Text;
        //se convierte el "valor" en numerico
        if(TextBox3.Text == "")
        {
            cantProducto = 0;
        }
        else
        {
            cantProducto = Convert.ToInt32(TextBox3.Text);
        }
        descProducto = TextBox4.Text;
        fechIngreso = fecha_sistema;
        fechCaducidad = TextBox6.Text;
        ubicacion = TextBox7.Text;
        hora = hora_sistema;

        //SE VALIDAN LOS CAMPOS
        if (nomProducto == "")
        {
            Label7.Text = "Ingrese Nombre del prodcuto";
            Label8.Text = "";
        }
        else if (cantProducto == 0)
        {
            Label7.Text = "";
            Label8.Text = "Ingrese la cantida del producto";
        }
        else if (ubicacion == "")
        {
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "Ingrese  el descuento del producto";
        }
        else if (fechIngreso == "")
        {
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "";
            Label10.Text = "Ingrese la fecha de ingreso";
        }
        else if (descProducto == "")
        {
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "";
            Label10.Text = "";
            Label11.Text = "Ingrese  la descripcion del producto del producto";
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO
            int rdo = producto.guardar_tbl_productos(nomProducto, cantProducto, descProducto, fechIngreso, fechCaducidad, ubicacion,hora);

            if (rdo == 1)
            {
                Label7.Text = "";
                Label8.Text = "";
                Label9.Text = "";
                Label10.Text = "";
                Label11.Text = "";
                TextBox2.Text= "";
                TextBox3.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox4.Text = "";
                Label12.Text = "producto guardo correctamente";
            }
            else
            {
                Label13.Text = "ERROR al Guardar el Insumo";
            }

        }
    }
}