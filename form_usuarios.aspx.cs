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

public partial class ingreso_usuarios : System.Web.UI.Page
{
    //25_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_usuarios.cs
    //que es intancia? consiste en crear un apodo (usuarios) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_usuario usuarios = new tbl_usuario();//estoy creando una instancia ala tbl_usuariod:para leer datos de la clase

    string doc_usu;

    protected void Page_Load(object sender, EventArgs e)
    {
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
        string  docUsuario, NombreUsuario, apeUsuario,estado,contrasena,email,genero,telefono;


        docUsuario = TextBox1.Text;
        NombreUsuario = TextBox2.Text;
        apeUsuario = TextBox3.Text;
        codRol = Convert.ToInt32( DropDownList4.SelectedValue.ToString());
        estado = DropDownList1.SelectedValue.ToString();
        contrasena = TextBox5.Text;
        email = TextBox6.Text;
        genero = DropDownList2.SelectedValue.ToString();
        telefono = TextBox7.Text;

        //SE VALIAM LOS CAMPOS
        if (docUsuario == "")
        {
            Response.Write("<script>alert('Ingrese el documento del Usuario')</script>");
        }
        else if (NombreUsuario == "")
        {
            Response.Write("<script>alert('Ingrese el Nombre del Usuario')</script>");
        }
        else if (apeUsuario == "")
        {
            Response.Write("<script>alert('Ingrese Los Apellidos del Usuario')</script>");
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
            Response.Write("<script>alert('Ingrese la Contraseña del usuario')</script>");
        }
        else if (email == "")
        {
            Response.Write("<script>alert('Ingrese el Estado del usuario')</script>");
        }
        else if (genero == "")
        {
            Response.Write("<script>alert('Ingrese el genero del usuario')</script>");
        }
        else if (telefono == "")
        {
            Response.Write("<script>alert('Ingrese el Telefono del usuario')</script>");
        }

        //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_usuario)
        int resultado = usuarios.guardar_tbl_usuario(docUsuario,NombreUsuario,apeUsuario,codRol,estado,contrasena,email,genero,telefono);

        if (resultado == 1)
        {
            Response.Write("<script>alert('Usuario registrado correctamente')</script>");
            Response.Redirect("form_usuarios.aspx");
        }
        else
        {
            Response.Write("<script>alert('Error al registrar el Usuario')</script>");
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Remove("contrasena");//remueve vbles de sesion
        Session.Abandon();//elimino la vbles de sesion
        Response.Redirect("validar_login.aspx");
    
    }
}