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

public partial class form_permisos_rol : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos_terminados.cs
    //que es intancia? consiste en crear un apodo (productos) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_per_rol permiso = new tbl_per_rol();//estoy creando una instancia ala tbl_per_rol:para leer datos de la clase

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_25_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        int cod_permiso, cod_rol;
        string estado;

        cod_permiso = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        cod_rol = Convert.ToInt32(DropDownList2.SelectedValue.ToString());
        estado = DropDownList3.SelectedValue.ToString();

        //SE VALIAM LOS CAMPOS
        if (cod_permiso == 0)
        {
            Response.Write("<script>alert('Ingrese PERMISO DEL USUARIO')</script>");
        }
        else if (cod_rol == 0)
        {
            Response.Write("<script>alert('Ingrese EL ROL DEL USUARIO')</script>");
        }
        else if (estado == "")
        {
            Response.Write("<script>alert('Ingrese EL ESTADO DEL USUARIO')</script>");
        }
        else
        {
            //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_per_rol)
            int resultado = permiso.Guardar_tbl_per_rol(cod_permiso, cod_rol, estado);

            if (resultado == 1)
            {
                Response.Write("<script>alert('Se registrado correctamente permiso del ROL')</script>");
                Response.Redirect("form_permisos_rol.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar EL PERMISO')</script>");
            }
        }
    }
}