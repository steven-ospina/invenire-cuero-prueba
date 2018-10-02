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

public partial class form_validar_login : System.Web.UI.Page
{
    //se intacia la clase tbl_usuario y se le pone un apodo
    tbl_usuario usu = new tbl_usuario();
    //se intacia la clase tbl_produtos y se le pone un apodo
    tbl_productos prod = new tbl_productos();

    //Se captura la fecha del sistema
    string fecha_actual = DateTime.Now.ToString("yyyy-MM-dd");

    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Attributes["onkeypress"] = " return blocklet(event);";
        //validacion autocompletar el Texbox
        TextBox1.Attributes.Add("autocomplete", "off");

        //DateTime fec_act;

        //////Se captura la fecha del sistema
        ////string fecha_actual = Convert.ToString(DateTime.Now);

        ////se suman unos dias a la fechaactual, para compararcon la fecha de la tabla
        //fec_act = Convert.ToDateTime(fecha_actual);

        //// se le suman los dias
        //fec_act = DateTime.Now.AddDays(20);

        //string day = fec_act.Day.ToString();
        //string month = fec_act.Month.ToString();
        //int mes = Convert.ToInt32(month);
        //if (mes < 10)
        //{
        //    month = "0" + month;
        //}
        //string year = fec_act.Year.ToString();
        //string fecha_final = year + "-" + month + "-" + day;

        //string fechaactual = Convert.ToString(fecha_final);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //se crea una variable tipo booleano para no permirtir el = en los Textbox
        bool re, rel;
        string documento, clave;

        documento = TextBox1.Text;
        clave = TextBox2.Text;
        re = documento.Contains("=");
        rel = clave.Contains("=");

        if (re == true)
        {
            Response.Write("<script>alert('SEÑOR USUARIO EL CARACTER < = > NO ESTA PERMITIDO ')</script>");
        }
        else if (rel == true)
        {
            Response.Write("<script>alert('SEÑOR USUARIO EL CARACTER < = > NO ESTA PERMITIDO ')</script>");

        }
        else if (documento == "")
        {
            Response.Write("<script>alert('Ingrese el Documento')</script>");
        }
        else if (clave == "")
        {
            Response.Write("<script>alert('Ingrese la clave')</script>");

        }
        else
        {
            string mensaje = usu.validar_login_inyeccion_Sp(documento, clave);
            if (mensaje != "Exito")
            {

                Response.Write("<script>alert('Error al ingresar')</script>");
            }
            if (mensaje == "Exito")
            {

                //SE CAPTURA LA VARIABLE DE SECCION CODIGO DEL USUARIO
                string usuario = usu.consultar_usuario(documento);
                Session["usuario"] = usuario;

                //Se compara la fecha de caducidad en la bd
                string rdo = prod.consultar_caducidad(fecha_actual);

                //

                //se reconece la fechas actua
                //se comparan las fechas
                if (rdo == "Exito")
                {
                    Session["fecha_actual"] = fecha_actual;
                    Response.Redirect("form_prod_caducar.aspx");
                }
                else
                {
                    Response.Redirect("form_inicio.aspx");
                }
                //Response.Write("<script>alert('Urra...! login exitoso')</script>");
            }//PALABRAS PROHIBIDAS
            //CLOK$, COM1 a COM8, CON, CONFIG$, LPT1 a LPT8 , NUL y PRN
            //AND 1=1, OR 1=1
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("form_cambiar_clave.aspx");
    }
}