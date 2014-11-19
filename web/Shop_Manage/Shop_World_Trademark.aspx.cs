using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.BLL;
using zscq.Model;
using zscq.DAL;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Reflection;
using System.IO;
using System.Text;
using System.Data;

public partial class Shop_Manage_shop_addhw : System.Web.UI.Page
{
    public bool pageview = Manager.GetManagerQX(21, 0);
    public bool pageadd = Manager.GetManagerQX(21, 1);
    public bool pageupdate = Manager.GetManagerQX(21, 2);
    dal_Trademark DALT = new dal_Trademark();
    
   
    public string returnurl = "";
   public int trademarkId =0;
    public string worletitle = "";
    public int jiaofeitype = 0;
    public int fileurl = 0;
    public int fileword = 0;
    public int miaoshutype=0;
    dal_Trademark DAL = new dal_Trademark();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
        }
        if (!pageview)
        {
            Response.Write("无权限访问！");
            Response.End();
        }
        if (!IsPostBack)
        {
           Bind_Page_Type();
        
        }
       
    }
    public void Bind_Page_Type()// 绑定页面信息
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
        trademarkId = int.Parse(Request.QueryString["id"].ToString());
            var iquery = DALT.Trademark_vw_Select_ById(trademarkId);        
          DataList1.DataSource = iquery;
            DataList1.DataBind();
            if (iquery.Count() > 0)
            {
                foreach (var item in iquery)
                {
                    if (item.i_JiaoFeiType != 0)
                    {
                        jiaofeitype = int.Parse(item.i_JiaoFeiType.ToString());
                    }
                }
            }
        }
    }
 
    public string GetTypeGuo(string i_CountryId, string i_UserTypeId)
    {
        string typename = "";

        if (i_CountryId == "1")
        {
            if (i_UserTypeId == "1")
            {
                typename = "中国个人";
               
            }
            if (i_UserTypeId == "2")
            {
                typename = "中国企业";
            }
            if (i_UserTypeId == "3")
            {
                typename = "中国代理机构";
            }
        }
        if (i_CountryId == "2")
        {
            if (i_UserTypeId == "1")
            {
                typename = "外国个人";
            }
            if (i_UserTypeId == "2")
            {
                typename = "外国企业";
            }
            if (i_UserTypeId == "3")
            {
                typename = "外国代理机构";
            }
        }
        return typename;
    }
    public int i = 0;
    private void OutPut(string fileType, string strType)
    {
        i += 1;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "gb2312"; 
        Response.AppendHeader("Content-Disposition", fileType);     
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = strType;
        this.EnableViewState = true;
        System.IO.StringWriter swOut = new System.IO.StringWriter();
        HtmlTextWriter hTw = new HtmlTextWriter(swOut);
       // GridView1.RenderControl(hTw);
       DataList1.RenderControl(hTw);
      // Response.Output.Write(hTw.ToString());
        Response.Write(swOut.ToString());
        Response.Flush();
        Response.End();
    }
    protected void Button_Click(object sender, CommandEventArgs e)
    { 
        DateTime dt = DateTime.Now;
        if (e.CommandName == "1")
        {
            worletitle = "商标续展注册申请书";
          
            OutPut("attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + worletitle + ".doc", "application/ms-word");
        }
        if (e.CommandName=="2")
        {
            worletitle ="生成商标代理委托书";
            OutPut("attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + worletitle + ".doc", "application/ms-word");
         
        }
       
    }
}