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
        TextBox1.Attributes["onkeypress"] = " return blocknum(event);";
        TextBox1.Attributes.Add("autocomplete", "off");
        //TextBox2.Attributes["onkeypress"] = " return blocknum(event);";
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
        nombre_rol = TextBox1.Text;

        //se valina los campos
        //if (cod_rol == 0)
        //{
        //    Response.Write("<script>alert('Ingrese  el codigo del rol del  usuario')</script>");
        //}
        if (nombre_rol == "")
        {
            Label3.Text = "Ingrese rol del  usuario";
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_rol)
            int resultado = roles.Guardar_tbl_rol(nombre_rol);

            if (resultado == 1)
            {
                Label3.Text = "";
                Label4.Text = "El Rol Registrado Correctamente";
                GridView1.DataBind();
            }
            else
            {
                Label4.Text = "";
                Label5.Text = "ERROR al Registrar el Rol";
            }
        }
    }



    //protected void GridView1_DataBound(object sender, EventArgs e)
    //{
    //    TextBox TextBox2 = GridView1.Rows[e.NewEditIndex].FindControl("TextBox2") as TextBox;
    //    TextBox2.Attributes.Add("onblur", " return blocknum(event);");
    //}
}