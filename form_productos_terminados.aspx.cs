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
    string fecha_sistema;

    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox2.Attributes["onkeypress"] = " return blocklet(event);";

        //capturo la fecha del sistemas
        fecha_sistema = TextBox1.Text = DateTime.Now.ToString("yyyy-MM-dd");

        try
        {
            if (!Page.IsPostBack)
            {
                FilaVacia("A");
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("Error.aspx"); 
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_05_09_2018
        //Aqui se postea el codigo del boton
        FilaVacia("A");

    }

    private DataTable EsctructuraMedidas()
    {
        DataTable medidatabla = new DataTable();
        medidatabla.Columns.Add("id_det_pro", typeof(Int32));
        medidatabla.Columns.Add("id_prod", typeof(Int32));
        medidatabla.Columns.Add("descripcion", typeof(string));
        medidatabla.Columns.Add("ubicacion", typeof(string));
        return medidatabla;
    }

    void FilaVacia(string tipo)
    {
        DataTable dt = null;

        dt = EsctructuraMedidas();//EsctructuraMedidas()= es el objeto que va a conectar los registros
        DataRow dr;//objeto que controla la insercion de cada registro

        if (ViewState["DateTemp"] == null)
        {
            dr = dt.NewRow();
            dr[0] = 1;
            dr[1] = 1;
            dr[2] = 0;
            dr[3] = 0;
            dt.Rows.Add(dr);
            ViewState["DateTemp"] = dt;
        }
        else
        {
            int n = 1;

            foreach (GridViewRow row in this.GridView1.Rows)
            {
                //se usa para mapear la lista desplegable que esta en la grilla
                DropDownList combo = (DropDownList)row.FindControl("ddlproducto");
                //extraer el dato de la lista desplegable
                string codprod = combo.SelectedValue;
                //se mapea el dato la descripcion
                TextBox cant = (TextBox)row.FindControl("descripcion");
                //extraer el dato de la descripcion
                string cantdescr = cant.Text;
                //se mape el dato la ublicacion
                TextBox canti = (TextBox)row.FindControl("ubicacion");
                //extraer el dato de la ubicacion
                string cantubica = canti.Text;
                //
                //int valor = productos.recoger_id_producto_terminados();
                dr = dt.NewRow();
                dr[0] = n;
                dr[1] = codprod;
                dr[2] = cantdescr;
                dr[3] = cantubica;
                dt.Rows.Add(dr);
                n += 1;
            }
            if (tipo == "A")
            {
                ViewState["DataTemp"] = dt;
                dr = dt.NewRow();
                dr[0] = 1;
                dr[1] = 1;
                dr[2] = 0;
                dr[3] = 0;
                dt.Rows.Add(dr);
            }
            ViewState["DateTemp"] = dt;
        }
        this.GridView1.DataSource = ViewState["DataTemp"];
        this.GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //se definen las variables a utilizar
        string fec_actual,instructor, nom_articulo, estado;
        //int consecutivo;

        //se captura el consecutivo de ventas
        //consecutivo = productos.buscar_consecutivo();

        //se captura la fecha del sistema
        fec_actual = fecha_sistema;

        //se captura el cliente
        instructor = DropDownList1.SelectedValue.ToString();

        //se captura el nombre del articulo
        nom_articulo = TextBox2.Text;

        //estado de la articulo
        estado = "Activa";

        //se envian los datos a la tabla tbl_venta en la bd
        string rdo = productos.grabar_encabezado_productos_terminados(fec_actual, instructor, nom_articulo, estado);
        if (rdo == "OK")
        {
            Label5.Text = "Articulo Nuevo Gurdado Correcta Mente";
        }
        else
        {
            Label5.Text = "ERROR Al Guardar el Articulo Nuevo";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        int codproducto;
        //se envian los datos a la tabla tbl_productos_terminados en la bd
        //Se recorre la grilla del detalle  se inserta fila por fila en la tabla: tbl_detalle_productos
        DataSet dataset = new DataSet();//localizar la bd  

        //SE RECORREN LAS FILAS DE LA GRILLA
        foreach (GridViewRow GVRow in this.GridView1.Rows)
        {

            //int valor = productos.recoger_id_producto_terminados();

            DropDownList combo = (DropDownList)GVRow.FindControl("ddlproducto");
            string codpro = combo.SelectedValue;
            codproducto = Convert.ToInt32(codpro);

            TextBox descrip = (TextBox)GVRow.FindControl("descripcion");
            string cantdescrip = descrip.Text;

            TextBox ubica = (TextBox)GVRow.FindControl("ubicacion");
            string cantubica = ubica.Text;

            //se van grabando los registros en la tabla: tbl_detalle_productos
            Label4.Text = productos.grabar_detalle_productos_terminados(codproducto, cantdescrip, cantubica);
        }
        Label4.Text = "Detalle Del Articulo Guadar Correctamente";
    }
}