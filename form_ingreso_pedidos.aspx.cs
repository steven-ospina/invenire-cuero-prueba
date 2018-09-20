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

public partial class form_ingreso_pedidos : System.Web.UI.Page
{
    //25_05_2018
    //EL_SOCIO:AQUI SE INSTANCIA LA CLASE: tbl_pedidos.cs
    //que es intancia? consiste en crear un apodo (pedido) para la clase
    //OJO:LAS CLASES NO SE PUEDEN USAR DIRECTAMENTE
    tbl_pedidos pedido = new tbl_pedidos();//estoy creando una instancia ala tbl_pedidos:para leer datos de la clase

    string fecha_sistema, hora_sistema;
    protected void Page_Load(object sender, EventArgs e)
    {
        //VALIDACIONES JS
        //TextBox3.Attributes["onkeypress"] = " return blocklet(event);";
        fecha_sistema = DateTime.Now.ToString("yyyy-MM-dd");
        hora_sistema = DateTime.Now.ToString("HH:mm:ss");

        Label2.Text = "4";

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
        //EL_SOCIO_18_09_2018
        //Aqui se postea el codigo del boton
        FilaVacia("A");
    }

    private DataTable EsctructuraMedidas()
    {
        DataTable medidatabla = new DataTable();
        medidatabla.Columns.Add("cod_ped", typeof(Int32));
        medidatabla.Columns.Add("fecha", typeof(string));
        medidatabla.Columns.Add("doc_usu", typeof(string));
        medidatabla.Columns.Add("estado", typeof(string));
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
            dr[2] = 123;
            dr[3] = "Cancelado";
            dr[4] = 1;
            dr[5] = 0;
            dt.Rows.Add(dr);
            ViewState["DateTemp"] = dt;
        }
        else
        {
            int n = 1;

            foreach (GridViewRow row in this.GridView1.Rows)
            {
                //se mapea el dato la fecha
                TextBox fech = (TextBox)row.FindControl("tbFecha");
                //extraer el dato de la fecha
                string fecha = fech.Text;
                //se usa para mapear la lista desplegable que esta en la grilla en el campos usuario
                DropDownList usu = (DropDownList)row.FindControl("ddlUsuario");
                //extraer el dato de la lista desplegable del usuario
                string usuario = usu.SelectedValue;
                //se usa para mapear la lista desplegable que esta en la grilla en el campo estado
                DropDownList esta = (DropDownList)row.FindControl("ddlEstado");
                //extraer el dato de la lista desplegable del estado
                string estado = esta.SelectedValue;
                //se usa para mapear la lista desplegable que esta en la grilla en el campo insumo
                DropDownList insum = (DropDownList)row.FindControl("ddlIsumos");
                //extraer el dato de la lista desplegable del insumo
                string insumos = insum.SelectedValue;
                //se mapea el dato la cantidad
                TextBox cant = (TextBox)row.FindControl("tbCantidad");
                //extraer el dato de la cantidad
                string cantidad = cant.Text;

                //
                dr = dt.NewRow();
                dr[0] = n;
                dr[1] = fecha;
                dr[2] = usuario;
                dr[3] = estado;
                dr[4] = insumos;
                dr[5] = cantidad;
                dt.Rows.Add(dr);
                n += 1;
            }
            if (tipo == "A")
            {
                ViewState["DataTemp"] = dt;
                dr = dt.NewRow();
                dr[0] = 1;
                dr[1] = fecha_sistema;
                dr[2] = 123;
                dr[3] = "Cancelado";
                dr[4] = 1;
                dr[5] = 0;
                dt.Rows.Add(dr);
            }
            ViewState["DateTemp"] = dt;
        }
        this.GridView1.DataSource = ViewState["DataTemp"];
        this.GridView1.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //se envian los datos a la tabla tbl_productos_terminados en la bd
        //Se recorre la grilla del detalle  se inserta fila por fila en la tabla: tbl_detalle_productos
        DataSet dataset = new DataSet();//localizar la bd  

        //SE RECORREN LAS FILAS DE LA GRILLA
        foreach (GridViewRow GVRow in this.GridView1.Rows)
        {
            //se captura la fecha del sistema
            string fecha = fecha_sistema;
            //se captura el usuario
            DropDownList usu = (DropDownList)GVRow.FindControl("ddlUsuario");
            string usua = usu.SelectedValue;
            int usuario = Convert.ToInt32(usua);
            //se capura el estado
            DropDownList est = (DropDownList)GVRow.FindControl("ddlEstado");
            string estado = est.SelectedValue;
            //se captura el insumo
            DropDownList ins = (DropDownList)GVRow.FindControl("ddlIsumos");
            string insu = ins.SelectedValue;
            int insumos = Convert.ToInt32(insu);
            //se captura la cantida
            TextBox cant = (TextBox)GVRow.FindControl("tbCantidad");
            string can = cant.Text;
            int cantidad = Convert.ToInt32(can);
            //se caputura la hora dels sistema
            string hora = hora_sistema;
            if (cantidad > 0)
            {
                //se prepara para mandar los datos a la clase
                Label1.Text = pedido.Grabar_pedidos(fecha, usuario, estado, insumos, cantidad,hora);
                Label1.Text = "pedidos Gudados Correctamente";
            }
            else
            {
                Label3.Text = "Pofavor ingrese la cantidad";
            }


        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button2.Visible = true;
    }
}