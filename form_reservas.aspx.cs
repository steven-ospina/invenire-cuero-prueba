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

public partial class form_reservas : System.Web.UI.Page
{
    //24_06_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_permisos.cs
    //que es intancia? consiste en crear un apodo (reservas) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_reserva reservas = new tbl_reserva();//estoy creando una instancia ala tbl_reserva:para leer datos de la clase

    string fecha_sistema, hora_sistema,cod_usu;


    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox2.Attributes["onkeypress"] = " return blocklet(event);";

        //se captura la fecha del sistema
        //fecha_sistema = DateTime.Now.ToString("yyyy-MM-dd");
        //se captura la hora del sistema
        hora_sistema = DateTime.Now.ToString("HH:mm:ss");
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

        Label1.Text = "4";

        cod_usu = (string)Session["usuario"];
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //EL_SOCIO_19_09_2018
        //Aqui se postea el codigo del boton
        FilaVacia("A");
        Button2.Visible = true;
    }

    private DataTable EsctructuraMedidas()
    {
        DataTable medidatabla = new DataTable();
        medidatabla.Columns.Add("cod_res", typeof(Int32));
        medidatabla.Columns.Add("fecha_res", typeof(string));
        medidatabla.Columns.Add("doc_usu", typeof(string));
        medidatabla.Columns.Add("cod_prod", typeof(Int32));
        medidatabla.Columns.Add("cant_prod", typeof(Int32));
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
            dr[1] = 0;
            dr[2] = cod_usu;
            dr[3] = 1;
            dr[4] = 1;
            dt.Rows.Add(dr);
            ViewState["DateTemp"] = dt;
        }
        else
        {
            int n = 1;

            foreach (GridViewRow row in this.GridView1.Rows)
            {
                //se mapea el dato la fecha
                TextBox fech = (TextBox)row.FindControl("tbFechaReserva");
                //extraer el dato de la fecha
                string fecha = fech.Text;
                //se usa para mapear la lista desplegable que esta en la grilla en el campos usuario
                TextBox usu = (TextBox)row.FindControl("tbUsuario");
                //extraer el dato de la lista desplegable del usuario
                string usuario = usu.Text;
                //se usa para mapear la lista desplegable que esta en la grilla en el campo insumo
                DropDownList insum = (DropDownList)row.FindControl("ddlInsumo");
                //extraer el dato de la lista desplegable del insumo
                string insumos = insum.SelectedValue;
                //se mapea el dato la cantidad
                TextBox cant = (TextBox)row.FindControl("tbCantidadReserva");
                //extraer el dato de la cantidad
                string cantidad = cant.Text;

                //
                dr = dt.NewRow();
                dr[0] = n;
                dr[1] = fecha;
                dr[2] = cod_usu;
                dr[3] = insumos;
                dr[4] = cantidad;
                dt.Rows.Add(dr);
                n += 1;
            }
            if (tipo == "A")
            {
                ViewState["DataTemp"] = dt;
                dr = dt.NewRow();
                dr[0] = 1;
                dr[1] = 0;
                dr[2] = cod_usu;
                dr[3] = 1;
                dr[4] = 0;
                dt.Rows.Add(dr);
            }
            ViewState["DateTemp"] = dt;
        }
        this.GridView1.DataSource = ViewState["DataTemp"];
        this.GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button3.Visible = true;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        //se envian los datos a la tabla tbl_productos_terminados en la bd
        //Se recorre la grilla del detalle  se inserta fila por fila en la tabla: tbl_detalle_productos
        DataSet dataset = new DataSet();//localizar la bd  

        foreach (GridViewRow GVRow in this.GridView1.Rows)
        {
            //se captura la fecha del sistema
            string fecha = fecha_sistema;
            //se captura el usuario
            TextBox usu = (TextBox)GVRow.FindControl("tbUsuario");
            string usua = usu.Text;
            int usuario = Convert.ToInt32(usua);
            //se captura el insumo
            DropDownList ins = (DropDownList)GVRow.FindControl("ddlInsumo");
            string insu = ins.SelectedValue;
            int insumos = Convert.ToInt32(insu);
            //se captura la cantida
            TextBox cant = (TextBox)GVRow.FindControl("tbCantidadReserva");
            string can = cant.Text;
            int cantidad = Convert.ToInt32(can);
            //se captura la hora del sistema
            string hora = hora_sistema;

            //se valida si el campo cantida esta vacio
            if (cantidad > 0)
            {
                //se prepara para mandar los datos a la clase
                //Label2.Text = reservas.Guardar_tbl_devolucion(fecha, usuario, insumos, cantidad, hora);
                //Label2.Text = "pedidos Gudados Correctamente";
            }
            else
            {
                Label3.Text = "Pofavor ingrese la cantidad";
            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {

            FilaVaciaa("B");

    }

    void FilaVaciaa(string tipo)
    {
        DataTable dt = null;

        dt = EsctructuraMedidas();//EsctructuraMedidas()= es el objeto que va a conectar los registros
        DataRow dr;//objeto que controla la insercion de cada registro

        if (tipo == "B")
        {
            dr = dt.NewRow();
            dr[0] = 1;
            dr[1] = 0;
            dr[2] = 123;
            dr[3] = 1;
            dr[4] = 1;
            dt.Rows.Remove(dr);
            ViewState["DateTemp"] = dt;
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);
        DataTable dt = ViewState["DateTemp"] as DataTable;
        dt.Rows[index].Delete();
        ViewState["DateTemp"] = dt;
        GridView1.DataSource = ViewState["DateTemp"] as DataTable;
        GridView1.DataBind();
    }
}