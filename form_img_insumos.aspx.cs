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

public partial class form_img_insumos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private Boolean ValidarExtension(string sExtension)
    {
        Boolean verif = false;
        switch (sExtension)
        {
            case ".jpg":
            case ".jpeg":
            case ".png":
            case ".gif":
            case ".bmp":
                verif = true;
                break;
            default:
                verif = false;
                break;
        }
        return verif;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_07_09_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO
        string nom_producto;
        byte[] imagenbyte;

        nom_producto = DropDownList1.SelectedValue.ToString();
        imagenbyte = FileUpload1.FileBytes;

        //SE VALIAM LOS CAMPOS
        if (nom_producto == "")
        {
            Response.Write("<script>alert('Ingrese el NOMBRE del PRODUCTO')</script>");
        }
        else if (imagenbyte == null)
        {
            Response.Write("<script>alert('Ingrese una Imagen')</script>");
        }
        else
        {
            try
            {
                string Extension = string.Empty;
                string Nombre = string.Empty;

                if (FileUpload1.HasFile)
                {
                    Nombre = FileUpload1.FileName;
                    Extension = Path.GetExtension(Nombre);

                    if (ValidarExtension(Extension))
                    {
                        int intDocFileLength = FileUpload1.PostedFile.ContentLength;
                        if (intDocFileLength > 4096000)
                        {
                            Response.Write("<script>alert('verifica, la imagen excede los 4MB')</script>");
                        }
                        else
                        {
                            using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ToString()))
                            using (SqlCommand cmd = new SqlCommand("ingreso_img_productos", conexi))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("cod_prod", nom_producto);
                                cmd.Parameters.AddWithValue("imagen", FileUpload1.FileBytes);
                                cmd.Connection.Open();
                                cmd.ExecuteNonQuery();
                                cmd.Connection.Close();
                            }
                            //Mostrar el panel de Registros

                            ListarRegistro();
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Por favor verifique la extencion de la imagen')</script>");
                    }
                }

            }
            catch (Exception ex)
            {
                string mesnaje = ex.Message;
            }

        }
    }//fin button_link1

    private void ListarRegistro()
    {
        try
        {
            using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ToString()))
            using (SqlDataAdapter da = new SqlDataAdapter("sp_Listar_Registro_tbl_img_productos", conexi))
            {
                DataTable tbRegistro = new DataTable();
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(tbRegistro);
                GridView1.DataSource = tbRegistro;
                GridView1.DataBind();
                Session["Registro"] = tbRegistro;
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
}