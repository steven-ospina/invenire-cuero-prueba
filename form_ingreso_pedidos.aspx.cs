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
        Button3.Visible = true;
    }

    private DataTable EsctructuraMedidas()
    {
        DataTable medidatabla = new DataTable();
        medidatabla.Columns.Add("cod_ped", typeof(Int32));
        medidatabla.Columns.Add("cod_prod", typeof(Int32));
        medidatabla.Columns.Add("color_referencia", typeof(string));
        medidatabla.Columns.Add("consumo_x_producto", typeof(Int32));
        medidatabla.Columns.Add("valor_uni_consumo", typeof(Int32));
        medidatabla.Columns.Add("valor_prod_final", typeof(Int32));
        medidatabla.Columns.Add("valor_producion", typeof(Int32));
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
            dr[2] = "cafe";
            dr[3] = 4000;
            dr[4] = 0.7;
            dr[5] = 47.355;
            dr[6] = 1.657417;
            dt.Rows.Add(dr);
            ViewState["DateTemp"] = dt;
        }
        else
        {
            int n = 1;

            foreach (GridViewRow row in this.GridView1.Rows)
            {
                //se mapea el dato del consecutivo
                TextBox con = (TextBox)row.FindControl("tbConsecutivo");
                //extraer el dato del consecutivo
                string conse = con.Text;
                //se convierte a int por que se manda un numero
                int consecutivo = Convert.ToInt32(conse);
                //se usa para mapear la lista desplegable que esta en la grilla en el campos insumos
                DropDownList ins = (DropDownList)row.FindControl("ddlInsumo");
                //extraer el dato de la lista desplegable del insumo
                string insu = ins.SelectedValue;
                //se convierte a int por que se manda un numero
                int insumos = Convert.ToInt32(insu);
                //se usa para mapear el TEXTBOX que esta en la grilla en el campo color o referencia
                TextBox col = (TextBox)row.FindControl("tbColorOreferencia");
                //extraer el dato del textbox del campo color o referencia
                string color = col.Text;
                //se usa para mapear el TEXTBOX que esta en la grilla en el campo Consumo x Producto
                TextBox consu = (TextBox)row.FindControl("tbConsumoXproducto");
                //extraer el dato del textbox del campo Consumo x Producto
                string consum = consu.Text;
                //se convierte a int por que se manda un numero
                int consumoXproducto = Convert.ToInt32(consum);
                //se mapea el dato del TEXTBOX que esta en ka grilla en el campo Valor Unidad de Consumo
                TextBox val = (TextBox)row.FindControl("tbValorUnidadConsumo");
                //extraer el dato de la cantidad
                string valo = val.Text;
                //se convierte a int por que se manda un numero
                int valorUnidadConsumo = Convert.ToInt32(valo);
                //se mapea el dato del TEXTBOX que esta en ka grilla en el campo Valor Unidad de Consumo
                TextBox valor = (TextBox)row.FindControl("tbValorProductoFinal");
                //extraer el dato de la cantidad
                string valorPr = valor.Text;
                //se convierte a int por que se manda un numero
                int valorProductoFinal = Convert.ToInt32(valorPr);
                //se mapea el dato del TEXTBOX que esta en ka grilla en el campo Valor Unidad de Consumo
                TextBox valorP = (TextBox)row.FindControl("tbValorProduccion");
                //extraer el dato de la cantidad
                string valorProd = valorP.Text;
                //se convierte a int por que se manda un numero
                int valorProduccion = Convert.ToInt32(valorProd);

                //
                dr = dt.NewRow();
                dr[0] = consecutivo;
                dr[1] = insumos;
                dr[2] = color;
                dr[3] = consumoXproducto;
                dr[4] = valorUnidadConsumo;
                dr[5] = valorProductoFinal;
                dr[6] = valorProduccion;
                dt.Rows.Add(dr);
                n += 1;
            }
            if (tipo == "A")
            {
                ViewState["DataTemp"] = dt;
                dr = dt.NewRow();
                dr[0] = 1;
                dr[1] = 1;
                dr[2] = "cafe";
                dr[3] = 4000;
                dr[4] = 0.7;
                dr[5] = 47.355;
                dr[6] = 1.657417;
                dt.Rows.Add(dr);
            }
            ViewState["DateTemp"] = dt;
        }
        this.GridView1.DataSource = ViewState["DataTemp"];
        this.GridView1.DataBind();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //se define la variables a Utilizar
        int costo_x_par_prod, canti_a_producir;


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
            string insuText = ins.SelectedItem.ToString();
            //se captura la cantida
            TextBox cant = (TextBox)GVRow.FindControl("tbCantidad");
            string can = cant.Text;
            int cantidad = Convert.ToInt32(can);
            //se caputura la hora dels sistema
            string hora = hora_sistema;
            if (cantidad > 0)
            {
                int existencias = pedido.validarexistencias(insumos);

                if (existencias >= cantidad)
                {
                    //se prepara para mandar los datos a la clase
                    Label1.Text = pedido.Grabar_pedidos(fecha, usuario, estado, insumos, cantidad, hora);
                    Label1.Text = "pedidos Gudados Correctamente";
                    GridView1.DataBind();
                    Button3.Visible = false;
                    Button2.Visible = false;
                }
                else
                {
                    Label1.Text = "la cantidad en excede las existencias en bodega del producto: "+ insuText;
                }

            }
            else
            {
                Label3.Text = "Pofavor ingrese la cantidad";
            }

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

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button2.Visible = true;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox10.Visible = true;
    }
}