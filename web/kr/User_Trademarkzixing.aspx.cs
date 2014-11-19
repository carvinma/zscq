using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class User_PatentCount : System.Web.UI.Page
{
    int uId = 0;
    string href = "";
    bll_Email BLLE = new bll_Email();
    public StringBuilder sb_trademrk = new StringBuilder();
    public StringBuilder sb_xianxia = new StringBuilder();
    dal_Trademark DALT = new dal_Trademark();
    dal_Nationality DALN = new dal_Nationality();
    dal_PayWay DALPY = new dal_PayWay();
    dal_PSWay DALPS = new dal_PSWay();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_PSWay DALPSW = new dal_PSWay();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_SystemSetup DALSS = new dal_SystemSetup();
    public StringBuilder tr_PayWay = new StringBuilder();
    dal_ReceiveAddress DALRA = new dal_ReceiveAddress();
    dal_Coupon DALC = new dal_Coupon();
    public string strtotalmoney = "0", strtotalmoneymei = "0",guowaiyouji="0";
    public string  bizhong = "", guowaiinfo = "";
    public int guoji = 0;
    public decimal meihuilv=1;
    public StringBuilder PSWay = new StringBuilder(); 
    public StringBuilder Str_Money  = new StringBuilder();
    public StringBuilder Str_AllMoney = new StringBuilder();
  
    protected void Page_Load(object sender, EventArgs e)
    {
        href = Request.Url.ToString();
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_Sb_uid"].ToString() != "")
        {
            uId = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_Sb_uid"]);
          
            Bind_PatentList();
            if (!IsPostBack)
            {             
                Delete_Patent();
            }          
        }
    }
  
 
    public int sbnum = 0, sbdailinum = 0,zhinajinnum=0;
    void Bind_PatentList()
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            // hi_dfaid.Value = zscqaddress.AddressId.ToString();
            string patentid = Request.Cookies["hqht_Trademarktidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            // int trademarkcount = arr_pid.Length;
            //decimal dailifee = 0;
            t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//대리 비용
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int tid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    int number = Convert.ToInt32(arr_pid[i].Split(',')[1]);
                    t_Trademark model = DALT.Trademark_Select_Id(tid); ;
                    if (model != null)
                    {
                        sbnum += 1;
                        if (model.i_JiaoFeiType == 2)
                        {
                            sbdailinum += 1;
                            if (model.i_ShengDays < 0)
                            {
                                zhinajinnum += 1;
                            }
                        }
                        sb_trademrk.Append("<tr>");
                        sb_trademrk.Append("<td  height='32' align='center' bgcolor='#FFFFFF' >" + model.nvc_SBRegNum + "</td>");
                        sb_trademrk.Append("<td  align='center' bgcolor='#FFFFFF'>" +model.nvc_SBType + "</td>");
                        sb_trademrk.Append("<td  align='center' bgcolor='#FFFFFF'>" + (model.i_JiaoFeiType.ToString() == "1" ? "스스로 비용을 납부하다" : "위탁 납부") + "</td>");
                        sb_trademrk.Append("<td  align='center' bgcolor='#FFFFFF'>" + model.nvc_SBRegName + "<br/>" + (GetGuojiName(model.i_GuoJiId).ToString() != "中国" ? model.nvc_SBRegEnName : "") + "</td>");
                        //sb_trademrk.Append("<td width='77' align='center' bgcolor='#FFFFFF'>" + (model.i_State.ToString() == "1" ? "已审核" : (model.i_State.ToString() == "2" ? "未通过" : "미심사")) + "</td>");
                        sb_trademrk.Append("<td align='center' bgcolor='#FFFFFF'>" + (model.i_IsPayState.ToString() == "2" ? "기부금은 다음 지불 기다리고있다" : (model.i_IsPayState.ToString() == "3" ? "무효" : "미 납부")) + "</td>");
                        sb_trademrk.Append("<td  align='center' bgcolor='#FFFFFF'>" + model.nvc_SbRegTime + "</td>");
                        sb_trademrk.Append("<td  align='center' bgcolor='#FFFFFF' style='line-height:20px;'>");
                        t_Member tm = DALM.Member_Select_Id(uId);
                        if (tm != null)
                        {
                            if (tm.i_UserTypeId == 3)
                            {
                                sb_trademrk.Append(" <a href=\"user_World_sbweituo.aspx?id=" + tid + "&type=2&zixing=ok\" target=\"_blank\" class=\"ac5t\">변호사 다운로드의 힘</a><br>");

                            }
                        }
                        sb_trademrk.Append("<a href=' user_World_sb.aspx?id=" + tid + "&zixing=ok' class='ac5t'>신청서 다운로드</a></td>");

                        sb_trademrk.Append("</tr>");

                    }
                }
            }
        }
        else
        {
            Response.Redirect("user_sblb.aspx");
        }
    }
    private string getquhuoid(string name)
    {
        return name == "快递配送" ? "quhuo" : "";
    }

    public string GetGuojiName(int id)// 获得国籍
    {
        string guojiname = "";
        t_Nationality nn = DALN.Nationality_Select_Id(id);
        if (nn != null)
        {
            guojiname = nn.nvc_Name;
        }
        return guojiname;
    }
    void Delete_Patent()
    {
        if (Request["pagetype"] != null && Request["pagetype"].ToString() != "")
        {
            if (Request["pagetype"].ToString() == "del")
            {
                if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
                {
                    string sid = Request["cs"].ToString();
                    string pids = Request.Cookies["hqht_Trademarktidstr"].Value;
                    pids = (pids + "|").Replace("|" + sid + "|", "|");
                    pids = pids.TrimEnd('|');
                    Response.Cookies["hqht_Trademarktidstr"].Value = pids;
                    Response.Redirect("User_TrademarkOrderAdd.aspx");
                }
            }
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Cookies["hqht_Trademarktidstr"].Value = null;
        Response.Redirect("user_sblb.aspx");
    }
}