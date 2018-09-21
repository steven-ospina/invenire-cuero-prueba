using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_07_09_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_ingreso_modulos : System.Web.UI.Page
{
    tbl_modulo moduloss = new tbl_modulo();

    protected void Page_Load(object sender, EventArgs e)
    {
        //validaciones
        //TextBox1.Attributes["onkeypress"] = " return blocknum(event);";

        //if (!IsPostBack)
        //{

        //    CargarGrid();

        //}
    }

    //private void CargarGrid()
    //{

    //    aqui eejcutas al query

    //    GridView1.DataBind();

    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_20_09_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string modulos;

        modulos = TextBox1.Text;

        if(modulos == "")
        {
            Label2.Text = "Por Favor Ingrese el modulo";
        }
        else
        {
            string resultado = moduloss.Guardar_tbl_modulo(modulos);
            if(resultado == "OK")
            {
                TextBox1.Text = "";
                Label2.Text = "";
                Label3.Text = "Exito. Modulos gurdado Correctamente";
                GridView1.DataBind();
            }
            else
            {
                Label3.Text = "";
                Label2.Text = "ERROR , no se pudo guardar el modulo";
            }
        }
    }
}