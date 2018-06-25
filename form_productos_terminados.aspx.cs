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

public partial class form_productos_terminados : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos_terminados.cs
    //que es intancia? consiste en crear un apodo (usuarios) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_productos_terminados productos = new tbl_productos_terminados();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_24_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO

        string fecha,doc_usuario;

        fecha = TextBox1.Text;
        doc_usuario = TextBox2.Text;

        //SE VALIAM LOS CAMPOS
        if (fecha == "")
        {
            Response.Write("<script>alert('Ingrese la FECHA')</script>");
        }
        else if (doc_usuario == "")
        {
            Response.Write("<script>alert('Ingrese el DOCUMENTO del USUARIO')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_productos_terminados.cs)
            int resultado = productos.guardar_tbl_productos_terminados(fecha, doc_usuario);

            if (resultado == 1)
            {
                Response.Write("<script>alert('PRODUCTO TERMINADO se registrado correctamente')</script>");
                Response.Redirect("form_productos_terminados.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar el  PRODUCTO TERMINADO')</script>");
            }
        }

    }
}