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

public partial class form_permisos : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_permisos.cs
    //que es intancia? consiste en crear un apodo (usuarios) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_permisos permiso = new tbl_permisos();//estoy creando una instancia ala tbl_permisos:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES
        //TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_24_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        //int cod_permiso;
        string nom_permiso;

        //cod_permiso = Convert.ToInt32(TextBox1.Text);
        nom_permiso = TextBox2.Text;

        //SE VALIAM LOS CAMPOS
        //if (cod_permiso == 0)
        //{
        //    Response.Write("<script>alert('Ingrese el CODIGO del permiso')</script>");
        //}
        if (nom_permiso == "")
        {
            //Response.Write("<script>alert('Ingrese el NOMBRE del PERMISO')</script>");
            Label3.Visible = true;
            Label3.Text = "Ingrese el usuario";
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_usuario)
            int resultado = permiso.guardar_tbl_permisos(nom_permiso);

            if (resultado == 1)
            {
                Response.Write("<script>alert('PERMISO registrado correctamente')</script>");
                TextBox2.Text = "";
                Label3.Text = "PERMISO registrado correctamente'";
                Label3.Visible = false;
                //Response.Redirect("form_permisos.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar el PERMISO')</script>");
                Label3.Visible = true;
                Label3.Text = "ERROR al Guardar el permiso";
            }
        }
    }
}