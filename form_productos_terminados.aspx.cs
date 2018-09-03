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
//EL_SOCIO_17_07_2018
//librerias para trabajar con bases de datos
using System.IO;

public partial class form_productos_terminados : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos_terminados.cs
    //que es intancia? consiste en crear un apodo (productos) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_productos_terminados productos = new tbl_productos_terminados();

    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox2.Attributes["onkeypress"] = " return blocklet(event);";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_24_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string fecha, doc_usuario;

        fecha = TextBox1.Text;
        doc_usuario = DropDownList1.SelectedValue.ToString();

        if(fecha == "")
        {
            Response.Write("<script>alert('Ingrese la fecha Señor Usuario')</script>");

        }else if(doc_usuario == "")
        {
            Response.Write("<script>alert('Ingrese el usuario')</script>");
        }
        else
        {
            int resultado = productos.Guardar_tbl_productos_terminados(fecha, doc_usuario);
            
            if(resultado == 1)
            {
                Response.Write("<script>alert('producto regsitrado correctamente')</script>");
            }
            else
            {
                Response.Write("<script>alert('error al regsitrar')</script>");
            }
        }


    }

}