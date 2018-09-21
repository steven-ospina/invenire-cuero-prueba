using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_20_09_2018
//librerias para trabajar con bases de datos
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//libreria para trabajar con img
using System.IO;


public partial class form_ingreso_evidencia : System.Web.UI.Page
{
    string fecha_sistema, hora_sistema;
    protected void Page_Load(object sender, EventArgs e)
    {
        //se captura la fecha del sistema
        TextBox1.Text = (fecha_sistema) = DateTime.Now.ToString("yyyy-MM-dd");
        //se captura la hora del sistema
        hora_sistema = DateTime.Now.ToString("HH:mm:ss");
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
        string doc_usuario,fecha;
        int id_detalle_prodcuto;
        byte[] imagenbyte;

        //se captura el usuario
        doc_usuario = DropDownList1.SelectedValue.ToString();
        //se captura la fecha del sistema
        fecha = fecha_sistema;
        //se captura el id_Det_prod de la tabla tbl_detalle_productos
        id_detalle_prodcuto = Convert.ToInt32(DropDownList2.SelectedValue.ToString());
        //se captura la imagen
        imagenbyte = FileUpload1.FileBytes;

        //se valian los campos vacios
        if(doc_usuario == "")
        {
            Label5.Text = "Ingrese por favor el Documento del usuario";

        }else if (id_detalle_prodcuto == 0)
        {
            Label6.Text = "";
            Label7.Text = "Ingrese por favor el id del detalle_del_producto";
        }else if (imagenbyte == null)
        {
            Label7.Text = "";
            Label8.Text = "Ingrese por favor una imagen";
        }
        else
        {
            try
            {
                string Extension = string.Empty;
                string Nombre = string.Empty;


                if (FileUpload1.HasFile)
                {
                    int intDocFileLength = FileUpload1.PostedFile.ContentLength;
                    if (intDocFileLength > 4096000)
                    {
                        Response.Write("<script>alert('verifica, la imagen excede los 4MB')</script>");
                    }
                    else
                    {
                        using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ToString()))
                        using (SqlCommand cmd = new SqlCommand("ingreso_img_evidencia_pasisalvo", conexi))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("documeto_usu", doc_usuario);
                            cmd.Parameters.AddWithValue("fecha_sistema ", fecha);
                            cmd.Parameters.AddWithValue("id_det_producto", id_detalle_prodcuto);
                            cmd.Parameters.AddWithValue("imagen", FileUpload1.FileBytes);
                            cmd.Parameters.AddWithValue("hora", hora_sistema);
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
            using (SqlDataAdapter da = new SqlDataAdapter("sp_Listar_Registro_tbl_evidencia", conexi))
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