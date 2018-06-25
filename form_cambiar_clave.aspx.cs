using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//EL_SOCIO_18_06_2018
//librerias para trabajar con email
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class form_cambiar_clave : System.Web.UI.Page
{
    tbl_usuario usu = new tbl_usuario();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        //string documento = usu.consultar_documento(TextBox1.Text);


        //var toAddress = new MailAddress("aquí va el correo del destinatario" "documento", "Usuario");
        ////CLAVE DEL MAIL DE QUIEN ENVIA
        //const string fromPassword = "aqui va la clave del que envía";

        //const string subject = "Asunto";

        ////AQUI SE CONSULTA LA CLAVE DEL USUARIO
        //string documento = usu.consultar_clave(TextBox1.text);

        //string body = "Su clave es: " + clave;

        ////PARA GARANTIZAR LA CONEXION CON EL SERVIDOR DE CORREOS DE GMAIL
        //var smtp = new SmtpClient
        //{
        //    Host = "smtp.gmail.com",
        //    Port = 587,
        //    EnableSsl = true,
        //    DeliveryMethod = SmtpDeliveryMethod.Network,
        //    UseDefaultCredentials = false,
        //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
        //};
        //using (var message = new MailMessage(fromAddress, toAddress)
        //{
        //    Subject = subject,
        //    Body = body
        //})
        //{
        //    smtp.Send(message);//send:envia
        //    Label1.Text = "Se le ha enviado un mail, por favor verifique....!";
        //}

    }
}