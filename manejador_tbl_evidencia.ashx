<%@ WebHandler Language="C#" Class="manejador_tbl_evidencia" %>

using System;
using System.Web;
using System.Data;

public class manejador_tbl_evidencia : IHttpHandler,System.Web.SessionState.IRequiresSessionState{
    
    public void ProcessRequest (HttpContext context) {

        if (context.Session["Registro"] != null)
            {
                DataTable tbRegistro = (DataTable)context.Session["Registro"];
                DataRow drRegistro = tbRegistro.Select(string.Format("cod_evidencia={0}", context.Request.QueryString["cod_evidencia"]))[0];
                byte[] imagen = (byte[])drRegistro["img_pasisalvo"];
                context.Response.ContentType = "img_pasisalvo/jpg";
                context.Response.ContentType = "img_pasisalvo/jpeg";
                context.Response.ContentType = "img_pasisalvo/png";
                context.Response.ContentType = "img_pasisalvo/gif";
                context.Response.ContentType = "img_pasisalvo/bmp";
                context.Response.OutputStream.Write(imagen, 0, imagen.Length);
            }   
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}