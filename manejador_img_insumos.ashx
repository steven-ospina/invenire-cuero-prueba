<%@ WebHandler Language="C#" Class="manejador_img_insumos" %>

using System;
using System.Web;
using System.Data;

public class manejador_img_insumos : IHttpHandler,System.Web.SessionState.IRequiresSessionState {

    tbl_productos prod = new tbl_productos();

    public void ProcessRequest (HttpContext context) {
        if (context.Session["Registro"] != null)
        {
            DataTable tbRegistro = (DataTable)context.Session["Registro"];
            DataRow drRegistro = tbRegistro.Select(string.Format("cod_prod={0}", context.Request.QueryString["cod_prod"]))[0];
            int rd = prod.Consultar_img((int)drRegistro["cod_prod"]);
            if(rd == 1)
            {
                byte[] imagen = (byte[])drRegistro["imagen"];
                context.Response.ContentType = "image/jpg";
                context.Response.ContentType = "image/jpeg";
                context.Response.ContentType = "image/png";
                context.Response.ContentType = "image/gif";
                context.Response.ContentType = "image/bmp";
                context.Response.OutputStream.Write(imagen, 0, imagen.Length);
            }
            
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}