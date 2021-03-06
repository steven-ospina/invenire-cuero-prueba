﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaginaMaestra : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"] == null)
        {
            Response.Redirect("form_validar_login.aspx");
        }


        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddYears(-1));

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Remove("usuario");//remueve vbles de sesion
        Session.Remove("cod_rol");//remueve vbles de sesion
        Session.Abandon();//elimino la vbles de sesion
        Response.Redirect("form_validar_login.aspx");
    }
}
