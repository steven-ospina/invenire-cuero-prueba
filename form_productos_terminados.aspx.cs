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
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Attributes["onkeypress"] = " blocklet(e);";
    }
    private void ListarRegistro()
    {
        try
        {
            using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ToString()))
            using (SqlDataAdapter da = new SqlDataAdapter("usp_Listar_Registro", conexi))
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_24_06_2018
        //Aqui se postea el codigo del boton

        //PRIMERO: SE CAPTURA LOS DATOS DEL FORMULARIO

        string fecha, doc_usuario, nom_producto;
        byte[] imagenbyte;
        

        fecha = TextBox1.Text;
        doc_usuario = TextBox2.Text;
        nom_producto = TextBox3.Text;
        imagenbyte = FileUpload1.FileBytes;

        //SE VALIAM LOS CAMPOS
        if (fecha == "")
        {
            Response.Write("<script>alert('Ingrese la FECHA')</script>");
        }
        else if (doc_usuario == "")
        {
            Response.Write("<script>alert('Ingrese el DOCUMENTO del USUARIO')</script>");
        }
        else if (nom_producto == "")
        {
            Response.Write("<script>alert('Ingrese el NOMBRE del PRODUCTO')</script>");
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
                        using (SqlConnection conexi = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_pruebaConnectionString"].ToString()))
                        using (SqlCommand cmd = new SqlCommand("ingreso_imagen", conexi))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("fecha", fecha);
                            cmd.Parameters.AddWithValue("documento", doc_usuario);
                            cmd.Parameters.AddWithValue("nom_producto", nom_producto);
                            cmd.Parameters.AddWithValue("imagen", FileUpload1.FileBytes);
                            cmd.Connection.Open();
                            cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        //Mostrar el panel de Registros
                 
                        ListarRegistro();
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

            //string resultado = productos.guardar_tbl_productos_terminados(fecha, doc_usuario, nom_producto, imagenbyte);
            //if (resultado == "1")
            //{
            //    Response.Write("<script>alert('PRODUCTO TERMINADO se registrado correctamente')</script>");
            //    Response.Redirect("form_productos_terminados.aspx");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Error al registrar el  PRODUCTO TERMINADO')</script>");
            //}
        }
        //else
        //{
        //    //SEGUNDO:SE ENVIAN LOS DATOS AL MODELO (tbl_productos_terminados.cs)
        //    int resultado = productos.guardar_tbl_productos_terminados(fecha, doc_usuario,nom_producto);

        //    if (resultado == 1)
        //    {
        //        Response.Write("<script>alert('PRODUCTO TERMINADO se registrado correctamente')</script>");
        //        Response.Redirect("form_productos_terminados.aspx");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Error al registrar el  PRODUCTO TERMINADO')</script>");
        //    }
        //}

    }
}