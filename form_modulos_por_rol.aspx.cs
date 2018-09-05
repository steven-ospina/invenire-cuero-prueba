using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_04_09_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class form_modulos_por_rol : System.Web.UI.Page
{
    int modulo_id;
    tbl_modulo objeto = new tbl_modulo();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string seleccion;
        //se captura el dato que esta en la lista desplegable
        int rol_id;
        rol_id = Convert.ToInt32(DropDownList1.SelectedValue.ToString());

        DataSet dataSet = new DataSet();//localizar la BD

        //se recorren las filas de la grilla
        foreach(GridViewRow GVRow in GridView1.Rows)
        {
            //capturo el codigo del modulo
             modulo_id = Convert.ToInt32(GVRow.Cells[0].Text);


            //capturo el Checbox
            CheckBox cb = GVRow.FindControl("CheckBox1") as CheckBox;
            if (cb != null && cb.Checked) {

                seleccion = "Si";
            }
            else
            {
                seleccion = "No";
            }
            Label2.Text = objeto.Grabar_modulos_x_rol(rol_id, modulo_id, seleccion);
            Label2.Visible = true;
        }
        Response.Redirect("form_modulos_por_rol.aspx");


    }
}