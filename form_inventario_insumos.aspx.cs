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
//libreria para trabajar con img
using System.IO;


public partial class form_inventario_insumos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //se define la cadena de conexion con la red
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);

        SqlDataAdapter sda = new SqlDataAdapter("SELECT tbl_img_productos.cod_prod, tbl_img_productos.imagen, tbl_productos.nom_prod, tbl_productos.cant_prod, tbl_productos.desc_prod, tbl_productos.fecha_ing, tbl_productos.fecha_caducidad, tbl_productos.ubicacion FROM tbl_img_productos INNER JOIN tbl_productos ON tbl_img_productos.cod_prod = tbl_productos.cod_prod",con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        ListView1.DataSource = dt;
        ListView1.DataBind();
        Session["Registro"] = dt;
    }
}