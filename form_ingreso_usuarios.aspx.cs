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
//
//using System;
//using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.IO;


public partial class form_ingreso_usuarios : System.Web.UI.Page
{
    //25_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_usuarios.cs
    //que es intancia? consiste en crear un apodo (usuarios) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_usuario usuarios = new tbl_usuario();//estoy creando una instancia ala tbl_usuariod:para leer datos de la clase

    //VARIABLES LOCALES
    string doc_usu;

    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
        TextBox2.Attributes["onkeypress"] = " return blocknum(event);";
        TextBox3.Attributes["onkeypress"] = " return blocknum(event);";
        TextBox7.Attributes["onkeypress"] = " return blocklet(event);";
        //SE REDIRECIONA AL LOGIN SI NO TIENE CREDENCIALES VALIDAS
        //if(Session["usuario"] == null)
        //{
        //    Response.Redirect("validar_login.aspx");
        //}
        //else
        //{
        //    //se lee la variable de sesion que contiene el codigo del usuario
        //     doc_usu = (string)Session["usuario"];
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_28_05_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int codRol;
        string docUsuario, NombreUsuario, apeUsuario, estado, contrasena, repecontrasena, email, genero, telefono;


        docUsuario = TextBox1.Text;
        NombreUsuario = TextBox2.Text;
        apeUsuario = TextBox3.Text;
        codRol = Convert.ToInt32(DropDownList4.SelectedValue.ToString());
        estado = DropDownList1.SelectedValue.ToString();
        contrasena = TextBox5.Text;
        repecontrasena = TextBox4.Text;
        email = TextBox6.Text;
        genero = DropDownList2.SelectedValue.ToString();
        telefono = TextBox7.Text;

        //SE VALIAM LOS CAMPOS
        if (docUsuario == "")
        {
            //Response.Write("<script>alert('Ingrese el documento del Usuario')</script>");
            Label5.Text = "Ingrese el documento del Usuario";
        }
        else if (NombreUsuario == "")
        {
            //Response.Write("<script>alert('Ingrese el Nombre del Usuario')</script>");
 	        Label5.Text = "";
            Label7.Text = "Ingrese el Nombre del Usuario";
        }
        else if (apeUsuario == "")
        {
            //Response.Write("<script>alert('Ingrese Los Apellidos del Usuario')</script>");
	        Label7.Text = "";
            Label8.Text = "Ingrese Los Apellidos del Usuario";
        }
        else if (codRol == 0)
        {
            Response.Write("<script>alert('Ingrese el Codigo del Usuario')</script>");
        }
        else if (estado == "")
        {
            Response.Write("<script>alert('Ingrese el Estado del usuario')</script>");
        }
        else if (contrasena == "")
        {
            //Response.Write("<script>alert('Ingrese la Contraseña del usuario')</script>");
            //Label6.Visible = true;
            Label6.Text = "Ingrese la Contraseña del usuario";
        }
        else if (repecontrasena != contrasena)
        {
            //Response.Write("<script>alert('Ingrese la Contraseña del usuario')</script>");
            Label10.Text = "la contrase no concide";
        }
        else if (email == "")
        {
            //Response.Write("<script>alert('Ingrese el correo del usuario')</script>");
            Label9.Text = "Ingrese el correo del usuario";
        }
        else if (genero == "")
        {
            Response.Write("<script>alert('Ingrese el genero del usuario')</script>");
        }
        else if (telefono == "")
        {
            //Response.Write("<script>alert('Ingrese el Telefono del usuario')</script>");
            Label11.Text = "Ingrese el Telefono del usuario";
        }
        else
        {
            if (TextBox5.Text.Length<8)
            {

                //Response.Write("<script>alert('la contraseña debe tener minimo 8 caracteres')</script>");
                //Label6.Visible = true;
                Label6.Text = "la contraseña debe tener minimo 8 caracteres";

            }
            else
            {
                //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_usuario)
                int resultado = usuarios.guardar_tbl_usuario(docUsuario, NombreUsuario, apeUsuario, codRol, estado, contrasena, email, genero, telefono);

                if (resultado == 1)
                {
                    Response.Write("<script>alert('Usuario registrado correctamente')</script>");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox5.Text = "";
                    TextBox4.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    Label5.Text = "";
                    Label6.Text = "";
                    Label7.Text = "";
                    Label8.Text = "";
                    Label9.Text = "";
                    Label10.Text = "";
                    Label11.Text = "";
                    Label4.Text = "Usuario registrado correctamente";
                    //Label4.Text = "Usuario registrado correctamente";
                    //Response.Redirect("form_ingreso_usuarios.aspx");
                    //Label4.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Error al registrar el Usuario')</script>");
                    Label4.Visible = true;
                    Label4.Text = "Error al registrar el Usuario";
                }
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Remove("usuario");//remueve vbles de sesion
        Session.Abandon();//elimino la vbles de sesion
        Response.Redirect("form_validar_login.aspx");
    }
}