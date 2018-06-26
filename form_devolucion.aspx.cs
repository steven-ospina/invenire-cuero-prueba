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

public partial class form_devolucion : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_detalle_reserva.cs
    //que es intancia? consiste en crear un apodo (devolucion) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_devolucion devolucion = new tbl_devolucion();//estoy creando una instancia ala tbl_devolucion:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_26_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string fec_devolucion;
        int doc_usuario;

        fec_devolucion = TextBox1.Text;
        doc_usuario = Convert.ToInt32(TextBox2.Text);

        //SE VALIAM LOS CAMPOS
        if (fec_devolucion == "")
        {
            Response.Write("<script>alert('Ingrese LA FECHA DE LA DEVOLUCION')</script>");
        }
        else if (doc_usuario == 0)
        {
            Response.Write("<script>alert('Ingrese EL DOCUMENTO DEL USUARIO')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_devolucion)
            int resultado = devolucion.Guardar_tbl_devolucion(fec_devolucion,doc_usuario);

            if (resultado == 1)
            {
                Response.Write("<script>alert('Se registrado correctamente LA DEVOLUCION')</script>");
                Response.Redirect("form_detalle_reserva.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar LA DEVOLUCION')</script>");
            }

        }
    }
}