using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using dskl.DAL;
using dskl.Model;

public partial class Brand_Adv : System.Web.UI.Page
{
    dal_BrandAdv DALA = new dal_BrandAdv();
    public StringBuilder a_Adv1 = new StringBuilder();
    public StringBuilder li_Adv1 = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        Bind_Page_Adv1();
    }
    public void Bind_Page_Adv1()//绑定切换大图
    {
        if (Request.QueryString["bsid"] != null && Request.QueryString["bsid"].ToString() != "")
        {
            int shu = 0;
            IQueryable<t_BrandAdv> Adv = DALA.BrandAdv_Select_BrandId(int.Parse(Request.QueryString["bsid"].ToString()));
            foreach (var q in Adv.Take(5))
            {
                shu = shu + 1;
                a_Adv1.Append("<div class=panel><a onclick=\"addTrackPositionToCookie('1','img_0');\" " + (q.nvc_LinkAddress != null && q.nvc_LinkAddress != "" ? "href=\"" + q.nvc_LinkAddress + "\"" : "") + " target=\"_top\">");
                a_Adv1.Append("<img src=\"../" + q.nvc_ImgAddress + "\" width=\"758\" height=\"335\"></a></div>");

                string style = "";
                if (shu == 1)
                {
                    style = "  class=select";
                }
                li_Adv1.Append("<li" + style + "><a href=\"javascript:void(0);\">" + shu + "</a></li>");
            }
        }
    }
}
