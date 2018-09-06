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

public partial class form_eliminar_permiso_rol : System.Web.UI.Page
{
    int modulo_id, cod_rol;
    string seleccion;
    //se instancia la clase
    tbl_modulo objeto = new tbl_modulo();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //se recorren las filas de la grilla
        foreach (GridViewRow GVRow in GridView1.Rows)
        {
            //capturo el codigo_rol
            cod_rol = Convert.ToInt32(GVRow.Cells[0].Text);
            //capturo el modulo_id
            modulo_id = Convert.ToInt32(GVRow.Cells[1].Text);

            //capturo el Checbox
            CheckBox cb = GVRow.FindControl("CheckBox1") as CheckBox;
            if (cb != null && cb.Checked)
            {
                //se va eliminado los registros en la tabla: modulos_rol_rol
                Label2.Text = objeto.Eliminar_modulos_x_rol(cod_rol, modulo_id);
            }
        }
        Label2.Visible = true;
        Response.Redirect("form_eliminar_permiso_rol.aspx");
    }
}