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

public partial class form_reserva : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_permisos.cs
    //que es intancia? consiste en crear un apodo (usuarios) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_reserva reservas = new tbl_reserva();//estoy creando una instancia ala tbl_permisos:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_24_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string fecha_reserva,doc_usuario;

        fecha_reserva = TextBox2.Text;
        doc_usuario = TextBox3.Text;

        //SE VALIAM LOS CAMPOS
        if (fecha_reserva == "")
        {
            Response.Write("<script>alert('Ingrese la FECHA del PERMISO')</script>");
        }
        else if (doc_usuario == "")
        {
            Response.Write("<script>alert('Ingrese el DOCUMENTO DEL USUARIO')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_usuario)
            int resultado = reservas.guardar_tbl_reserva(fecha_reserva ,doc_usuario);

            if (resultado == 1)
            {
                Response.Write("<script>alert('la RESERVA registrada correctamente')</script>");
                Response.Redirect("form_reserva.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar el RESERVA')</script>");
            }
        }

    }
}