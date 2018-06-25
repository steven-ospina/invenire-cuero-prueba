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

public partial class form_registro_reserva : System.Web.UI.Page
{
    //EL_SOCIO_28_05_2018
    //ELSOCIO:AQUI SE INSTANCIA LA CLASE: tbl_productos.cs
    //que es instanciar? consiste en crear un apodo(productos) para la clase
    //OJO: LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_registro_reserva registros = new tbl_registro_reserva();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}