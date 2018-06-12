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

public partial class validar_login : System.Web.UI.Page
{
     tbl_usuario usu = new tbl_usuario();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string documento, clave;

        documento = TextBox1.Text;
        clave = TextBox2.Text;

        if (documento == "")
        {
            Response.Write("<script>alert('Ingrese el Documento')</script>");
        }
        else if (clave == "")
        {
            Response.Write("<script>alert('Ingrese la clave')</script>");

        }
        else
        {
            string mensaje = usu.validar_login_inyeccion_Sp(documento, clave);
            if (mensaje != "Exito")
            {

                //SE CAPTURA LA VARIABLE DE SECCION CODIGO DEL USUARIO
                string usuario = usu.consultar_usuario(documento);
                Session["usuario"] = usuario;

                Response.Write("<script>alert('Error al ingresar')</script>");
            }
            if (mensaje == "Exito")
            {
                //Response.Write("<script>alert('Urra...! login exitoso')</script>");
                Response.Redirect("form_usuarios.aspx");
            }//PALABRAS PROHIBIDAS
            //CLOK$, COM1 a COM8, CON, CONFIG$, LPT1 a LPT8 , NUL y PRN
            //AND 1=1, OR 1=1
        }
    }
}