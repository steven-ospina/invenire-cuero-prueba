using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_27_05_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_ingreso_rol : System.Web.UI.Page
{
    //28_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_rol.cs
    //que es intancia? consiste en crear un apodo (roles) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_rol roles = new tbl_rol();//estoy creando una instancia ala tbl_rol:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        //TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
        TextBox2.Attributes["onkeypress"] = " return blocknum(event);";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_27_05_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        //int cod_rol;
        string nombre_rol;

        //se convierte el "valor" en numerico
        //cod_rol = Convert.ToInt32(TextBox1.Text);
        nombre_rol = TextBox2.Text;

        //se valina los campos
        //if (cod_rol == 0)
        //{
        //    Response.Write("<script>alert('Ingrese  el codigo del rol del  usuario')</script>");
        //}
        if (nombre_rol == "")
        {
            Response.Write("<script>alert('Ingrese rol del  usuario')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_rol)
            int resultado = roles.Guardar_tbl_rol(nombre_rol);

            if (resultado == 1)
            {
                Response.Write("<script>alert('el rol registrado correctamente')</script>");
                Response.Redirect("form_ingreso_rol.aspx");
            }
            else
            {
                Response.Write("<script>alert('Erro al registrar el rol')</script>");
            }
        }
    }
}