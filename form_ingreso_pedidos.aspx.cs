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

        //se captura la fecha del sistema
        fecha_sistema = TextBox5.Text = DateTime.Now.ToString("yyyy-MM-dd");
        //se captura la hora del sistema
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
        Label1.Text = "";
    }

    private DataTable EsctructuraMedidas()
    {
        DataTable medidatabla = new DataTable();
        medidatabla.Columns.Add("cod_ped", typeof(Int32));
        medidatabla.Columns.Add("cod_prod", typeof(Int32)); 
        medidatabla.Columns.Add("cant_prod", typeof(Int32)); 
        medidatabla.Columns.Add("medida", typeof(string));
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
            dr[2] = 0;
            dr[3] = "Unidad";
            dr[4] = "cafe";
            dr[5] = 4000;
            dr[6] = 0.7;
            dr[7] = 47.355;
            dr[8] = 1.657417;
            dt.Rows.Add(dr);
            ViewState["DateTemp"] = dt;
        }
        else
        {
            int n = 1;

            foreach (GridViewRow row in this.GridView1.Rows)
            {
                //se mapea el dato del consecutivo
                //TextBox cod = (TextBox)row.FindControl("tbCod_pedido");
                //extraer el dato del consecutivo
                //string codP = cod.Text;
                //se convierte a int por que se manda un numero
                //int CodigoPedido = Convert.ToInt32(codP);
                //se usa para mapear la lista desplegable que esta en la grilla en el campos insumos
                DropDownList ins = (DropDownList)row.FindControl("ddlInsumo");
                //extraer el dato de la lista desplegable del insumo
                string insu = ins.SelectedValue;
                //se convierte a int por que se manda un numero
                int insumos = Convert.ToInt32(insu);
                //se usa para mapear el TEXTBOX que esta en la grilla en el campo Cantidad
                TextBox can = (TextBox)row.FindControl("tbCantidad");
                //extraer el dato del textbox del campo color o referencia
                string cant = can.Text;
                //se convierte a int por que en la BD en int
                int cantidad = Convert.ToInt32(cant);
                //se usa para mapear la lista desplegable que esta en la grilla en el campos insumos
                DropDownList med = (DropDownList)row.FindControl("ddlMedidas");
                //extraer el dato de la lista desplegable del insumo 
                string medidas = med.SelectedValue;
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
                dr[0] = n;
                dr[1] = insumos;
                dr[2] = cantidad;
                dr[3] = medidas;
                dr[4] = color;
                dr[5] = consumoXproducto;
                dr[6] = valorUnidadConsumo;
                dr[7] = valorProductoFinal;
                dr[8] = valorProduccion;
                dt.Rows.Add(dr);
                n += 1;
            }
            if (tipo == "A")
            {

                ViewState["DataTemp"] = dt;
                dr = dt.NewRow();
                dr[0] = n;
                dr[1] = 1;
                dr[2] = 0;
                dr[3] = "Unidad";
                dr[4] = "";
                dr[5] = 0;
                dr[6] = 0;
                dr[7] = 0;
                dr[8] = 0;
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
        string doc_usuario, nom_producto, fecha_elaboracion_producto,fecha_entrega_producto,cusrso,num_ficha,observaciones,hora;

        int consecutivo = pedido.buscar_consecutivo();

        //se captura el usuario que selecionen
        doc_usuario = DropDownList1.SelectedValue.ToString();
        //se captura el nombre del producto a crear
        nom_producto = TextBox2.Text;
        //se captura la fecha del sistema
        fecha_elaboracion_producto = fecha_sistema;
        //se captura la fecha cuando se va entregar el producto
        fecha_entrega_producto = TextBox6.Text;
        //se captura el curso
        cusrso = TextBox3.Text;
        //se captura la ficha
        num_ficha = TextBox8.Text;

        //se captura el costo por Par/Producto
        if(TextBox4.Text == "")
        {
            costo_x_par_prod = 0;
        }
        else
        {
            costo_x_par_prod = Convert.ToInt32(TextBox4.Text);
        }

        //se captura la cantidad a producir
        if (TextBox9.Text == "")
        {
            canti_a_producir = 0;
        }
        else
        {
            canti_a_producir = Convert.ToInt32(TextBox9.Text);
        }

        //se captura la hora
        hora = hora_sistema;

        //se captura las Obsevaciones
        observaciones = TextBox10.Text;

        if(doc_usuario == "")
        {
            Label13.Text = "Ingrese Por Favor el Usuario";

        }else if(nom_producto == "")
        {
            Label13.Text = "";
            Label14.Text = "Ingrese Por Favor el Nombre del Producto";

        }else if (fecha_elaboracion_producto == "")
        {
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "Ingrese la fecha del Pedido de Elaboracion del Producto";

        }else if (fecha_entrega_producto == "")
        {
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "";
            Label16.Text = "Ingrese la fecha de Elaboracion del producto";
        }
        else if (cusrso == "")
        {
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "";
            Label16.Text = "";
            Label20.Text = "Ingrese Por Favor el Curso o Tecnica ";

        }else if(num_ficha == "")
        {
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "";
            Label16.Text = "";
            Label20.Text = "";
            Label18.Text = "Ingrese Por Favor el Numero de la Ficha";

        }else if(canti_a_producir == 0)
        {
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "";
            Label16.Text = "";
            Label20.Text = "";
            Label18.Text = "";
            Label19.Text = "Ingrese Por Favor la Cantidad a Producir ";
        }
        else
        {
            //se envian los datos a la tabla tbl_pedidos en la bd
            string rdo = pedido.Grabar_encabezado_tbl_pedidos(consecutivo,doc_usuario, nom_producto, fecha_elaboracion_producto, fecha_entrega_producto, cusrso, num_ficha, costo_x_par_prod, canti_a_producir, observaciones, hora);

            if(rdo == "OK")
            {
                //se envian los datos a la tabla tbl_productos_terminados en la bd
                //Se recorre la grilla del detalle  se inserta fila por fila en la tabla: tbl_detalle_productos
                DataSet dataset = new DataSet();//localizar la bd  

                //SE RECORREN LAS FILAS DE LA GRILLA
                foreach (GridViewRow GVRow in this.GridView1.Rows)
                {
                    //se captura el consecutivo del encabezado
                    //TextBox cod = (TextBox)GVRow.FindControl("tbCod_pedido");
                    //string codP = cod.Text;
                    //se convierte a int por que en la BD es int
                    //int CodigoPedido = Convert.ToInt32(codP);
                    //se captura el Insumo
                    DropDownList ins = (DropDownList)GVRow.FindControl("ddlInsumo");
                    string insumo = ins.SelectedValue;
                    //se convierte a int
                    //int insumos = Convert.ToInt32(insumo);
                    //para poder capturar el nombre del insumo
                    string insuText = ins.SelectedItem.ToString();
                    //se usa para mapear el TEXTBOX que esta en la grilla en el campo Cantidad
                    TextBox can = (TextBox)GVRow.FindControl("tbCantidad");
                    //extraer el dato del textbox del campo color o referencia
                    string cant = can.Text;
                    //se convierte a int por que en la BD en int
                    int cantidad = Convert.ToInt32(cant);
                    //se capura las medidas
                    DropDownList med = (DropDownList)GVRow.FindControl("ddlMedidas");
                    string medidas = med.SelectedValue;
                    //se captura el color o referencia
                    TextBox colorO = (TextBox)GVRow.FindControl("tbColorOreferencia");
                    string colorOreferencia = colorO.Text;
                    //se captura el consumo por producto
                    TextBox con = (TextBox)GVRow.FindControl("tbConsumoXproducto");
                    string cons = con.Text;
                    //se convierte a int por que en la BD es int
                    int consumoXproducto = Convert.ToInt32(cons);
                    //se captura el Valor Unidad de Consumo
                    TextBox val = (TextBox)GVRow.FindControl("tbValorUnidadConsumo");
                    string valr = val.Text;
                    //se convierte a int por que en la BD es int
                    int valorUnidadConsumo = Convert.ToInt32(valr);
                    //se captura valor Producto final
                    TextBox valo = (TextBox)GVRow.FindControl("tbValorProductoFinal");
                    string valor = valo.Text;
                    //se convierte a int por que en la BD es int
                    int valorProductoFinal = Convert.ToInt32(valor);
                    //se captura el Valor Produccion
                    TextBox valorr = (TextBox)GVRow.FindControl("tbValorProduccion");
                    string valorPr = valorr.Text;
                    //se convierte a int por que en la BD es int
                    int valorProduccion = Convert.ToInt32(valorPr);

                    if (cantidad > 0)
                    {
                        int existencias = pedido.validarexistencias(insumo);

                        if (existencias >= cantidad)
                        {
                            //se van grabando los registros en la tabla: tbl_detalle_pedido
                            Label1.Text = pedido.Grabar_detalle_pedidos_en_tbl_detalle_pedido(consecutivo, insumo,cantidad, medidas, colorOreferencia, consumoXproducto, valorUnidadConsumo, valorProductoFinal, valorProduccion);

                            Label1.Text = "pedidos guarado correctamente";
                            GridView1.DataBind();
                            TextBox10.Visible = false;
                            Button2.Visible = false;
                        }
                        else
                        {
                            Label3.Text = "la cantidad en excede las existencias en bodega del producto: " + insuText;
                        }
                    }
                    else
                    {
                        Label3.Text = "Pofavor ingrese la cantidad";
                    }
                }
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

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        var conex = new SqlConnection(ConfigurationManager.ConnectionStrings["invenire_cuero_ConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();

        int doc_usuarioo = Convert.ToInt32(DropDownList1.SelectedValue.ToString());

        using (SqlDataAdapter adapter = new SqlDataAdapter(

            "SELECT * FROM tbl_usuario WHERE doc_usu =" + doc_usuarioo, conex))
        {
            adapter.Fill(ds, "usuario");
            ds.Tables[0].TableName = "usuario";
        }

        if(ds.Tables[0].Rows.Count > 0)
        {
            TextBox7.Text = ds.Tables[0].Rows[0][0].ToString();
        }
    }
}