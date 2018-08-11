using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_11_08_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_detalle_productos : System.Web.UI.Page
{
    //alias
    tbl_detalle_productos productos = new tbl_detalle_productos();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_producto;
        string descripcion, nom_producto;

        id_producto = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
        descripcion = TextBox1.Text;
        nom_producto = DropDownList2.SelectedValue.ToString();

        if (id_producto == 0){

            Response.Write("<script>alert('ingrese el ID del producto')</script>");

        }else if (descripcion == ""){

            Response.Write("<script>alert('ingrese la DESCRIPCION del producto')</script>");
        }
        else if (nom_producto == ""){

            Response.Write("<script>alert('ingrese el NOMBRE del producto')</script>");
        }
        else
        {
            string resultado = productos.Guardar_tbl_detalle_productos(id_producto, descripcion, nom_producto);

            if(resultado == "1")
            {
                Response.Write("<script>alert('El detalle del producto se registro correctamente')</script>");
                Response.Redirect("form_detalle_productos.aspx");
            }
            else
            {
                Response.Write("<script>alert('ERROR al registrar el detalle del producto')</script>");
            }
        }

    }
}