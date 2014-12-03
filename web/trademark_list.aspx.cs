using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
public partial class trademark_list : System.Web.UI.Page
{
    dal_NewTrademark mark = new dal_NewTrademark();
    dal_Trademark DALT = new dal_Trademark();
    dal_Member DALM = new dal_Member();
    dal_Nationality DALN = new dal_Nationality();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    public string Sbtype = "", Sbjiaofeitype = "", SbregName = "", Sbnum = "", Sbjiaofei = "", Sbtime = "", Stime = "";
    public int UserId = 0, usertype = 0;
    public string returnurl = "";
    public int isjiaofei = -1, jiaofeistate = 0;
    public string sb_type = "", days = "", uname = "", uaddress = "", sb_guoji = "0", sb_num = "", sb_regname = "", sb_passtime = "", utel = "", c_anjuanhao = "";
    public int? applyType;
    public string ByCaseNo, ByName, Bytype, ByStatus;
    public string qCaseNo, qName;
    public int? qStatus;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            UserId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            var m = DALM.Member_Select_Id(UserId);
            if (m != null)
            {
                if (m.i_UserTypeId == 3)
                {
                    usertype = 3;
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        if (!IsPostBack)
        {
           // this.ddlApplyType.DataSource = EnumManager.GetDescription(ApplyUserTypeEnum, 0);
            
            this.ddlTradeMarkStatus.DataSource = BaseDataUtil.tradeMarkStatuslist;
            this.ddlTradeMarkStatus.DataTextField = "StatusName";
            this.ddlTradeMarkStatus.DataValueField = "StatusValue";
            this.ddlTradeMarkStatus.DataBind();
        }
        Bind_Page_value();
        Bind_Rpt_Trademark();
    }
    public void Bind_Page_value()
    {
        //if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        //{
        //    hi_trademark.Value = Request.Cookies["hqht_Trademarktidstr"].Value.ToString();
        //}

        if (Request.QueryString["sbcaseno"] != null && Request.QueryString["sbcaseno"] != "")
        {
            this.ByCaseNo = Request.QueryString["sbcaseno"].ToString().Split('_')[0];
            Hi_orderby1.Value = Request.QueryString["sbcaseno"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbcaseno"].ToString();//BY CHY
        }
        if (Request.QueryString["sbname"] != null && Request.QueryString["sbname"] != "")
        {
            this.ByName = Request.QueryString["sbname"].ToString().Split('_')[0];
            Hi_orderby2.Value = Request.QueryString["sbname"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbname"].ToString();//BY CHY
        }
        if (Request.QueryString["sbtype"] != null && Request.QueryString["sbtype"] != "")
        {
            this.SbregName = Request.QueryString["sbtype"].ToString().Split('_')[0];
            Hi_orderby3.Value = Request.QueryString["sbtype"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbtype"].ToString();//BY CHY
        }
        if (Request.QueryString["sbstatus"] != null && Request.QueryString["sbstatus"] != "")
        {
            this.Sbnum = Request.QueryString["sbstatus"].ToString().Split('_')[0];
            Hi_orderby4.Value = Request.QueryString["sbstatus"].ToString();
            HF_ORDERBY.Value = Request.QueryString["sbstatus"].ToString();//BY CHY
        }
         
        //if (Request.QueryString["jiaofeistate"] != null && Request.QueryString["jiaofeistate"] != "")
        //{
        //    jiaofeistate = int.Parse(Request.QueryString["jiaofeistate"].ToString()); //ͳ��ҳ�洫�ݹ����Ă� �ɷ�״̬    
        //}
        //if (Request.QueryString["isjiaofei"] != null && Request.QueryString["isjiaofei"] != "")
        //{
        //    isjiaofei = int.Parse(Request.QueryString["isjiaofei"].ToString()); //ͳ��ҳ�洫�ݹ����Ă� �Ƿ�ɷ�     
        //}
        //if (Request.QueryString["sb_num"] != null && Request.QueryString["sb_num"] != "")
        //{
        //    sb_num = Request.QueryString["sb_num"].ToString(); //����ҳ�洫�ݹ����Ă�
        //}
        //if (Request.QueryString["sb_type"] != null && Request.QueryString["sb_type"] != "")
        //{
        //    sb_type = Request.QueryString["sb_type"].ToString(); //����ҳ�洫�ݹ����Ă� 
        //}
        
         
    }
    public string Geturl(string url)
    {
        if (Request.Url.ToString().IndexOf('?') > -1)
        {
            returnurl = Request.Url.ToString().Split('?')[1];
            if (url == "stime")
            {
                if (returnurl.IndexOf(url) > -1)
                {
                    returnurl = returnurl.Replace("stime=90_1&", "").Replace("stime=61-90_2&", "").Replace("stime=31-60_3&", "").Replace("stime=16-30_4&", "").Replace("stime=0-15_5&", "").Replace("stime=chao_6&", "");
                }
            }
            else
            {
                if (returnurl.IndexOf(url) > -1)
                {
                    for (int i = 1; i <= 6; i++)
                    {
                        returnurl = returnurl.Replace(url + "=asc_" + i + "&", "").Replace(url + "=desc_" + i + "&", "");
                    }
                }
            }
        }
        return returnurl;
    }
    public string Getxiaoji(string sbid)
    {
        string xiaoji = "0.00";
        string bizhong = "";
        t_Trademark model = DALT.Trademark_Select_Id(int.Parse(sbid));
        t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//�������
        if (model != null)
        {
            if (model1 != null)
            {
                t_Member m = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
                if (m != null)
                {
                    t_Nationality na = DALN.Nationality_Select_Id(m.i_GuoJiId);
                    if (na != null)
                    {
                        if (na.nvc_Name == "�й�")
                        {
                            bizhong = na.nvc_JFBizhong;
                            #region ί�нɷ�
                            if (model.i_JiaoFeiType == 2)
                            {
                                string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                                xiaoji = bizhong + ":" + totalmoney;
                            #endregion
                            }
                            if (model.i_JiaoFeiType == 1)
                            {
                                //#region ���нɷ�
                                //xiaoji = bizhong + ":" + (model1.dm_TrademarkMoney).ToString("0.00");
                                //#endregion
                            }
                        }
                        else
                        {
                            t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                            decimal huilv = 1;
                            bizhong = na.nvc_JFBizhong;
                            if (nafee != null)
                            {
                                if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                                {
                                    huilv = nafee.dm_Exchange;
                                }
                            }
                            #region  ί�нɷ�
                            string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                            string totalmoneyGY = ((model1.dm_TMDaiLi + model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                            string shangbiao = (model1.dm_TrademarkMoney).ToString("0.00");
                            string shangbiaoGY = ((model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                            string dailimoneyGy = ((model1.dm_TMDaiLi) * huilv).ToString();
                            xiaoji = bizhong + ":" + totalmoneyGY;
                            // xiaoji = totalmoney;
                            #endregion

                            //#region  ���нɷ�
                            //string totalmoney1 = (model1.dm_TrademarkMoney).ToString("0.00");
                            //string totalmoneyGY1 = ((model1.dm_TrademarkMoney) / huilv).ToString("0.00");

                            //xiaoji = bizhong + ":" + totalmoneyGY1;
                            ////  xiaoji =bizhong+":"+totalmoney1;
                            //#endregion
                        }
                    }
                }
            }
        }
        return xiaoji;
    }
    /// <summary>
    /// ״̬�ж�
    /// </summary>
    public string SetChecked(string state, string isjiaofei, string XujiaoStates)
    {
        string str = "";
        //if (state == "1")
        //{
        if (isjiaofei == "1" || XujiaoStates == "1")//1�ύ���� ���ɷѣ�2 �ѽ���  4��ȡ��
        {
            str = "disabled='disabled'";
        }

        return str;
    }

    private void Bind_Rpt_Trademark()//���б�
    {
        if (UserId != 0)
        {
            int Ccount = 0;
            int PageSize = AspNetPager1.PageSize;
            int pageCurrent = AspNetPager1.CurrentPageIndex;
            this.Rp_sb_list.DataSource =mark.Trademark_web_SelectPage(pageCurrent, PageSize, UserId, applyType, ByCaseNo, ByName, Bytype, ByStatus, qCaseNo, qName, qStatus, ref Ccount);
            this.Rp_sb_list.DataBind();
            AspNetPager1.RecordCount = Ccount;
            AspNetPager1.PageSize = PageSize;
            AspNetPager1.CurrentPageIndex = pageCurrent;
        }
    }
    public bool BoolFileImg(object fileurl)
    {
        if (fileurl != null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        if (HF_ORDERBY.Value != "")
        {
            switch (HF_ORDERBY.Value.Split('_')[1])
            {
                case "1": Sbtype = HF_ORDERBY.Value.Split('_')[0]; break;
                case "2": Sbjiaofeitype = HF_ORDERBY.Value.Split('_')[0]; break;
                case "3": SbregName = HF_ORDERBY.Value.Split('_')[0]; break;
                case "4": Sbnum = HF_ORDERBY.Value.Split('_')[0]; break;
                case "5": Sbjiaofei = HF_ORDERBY.Value.Split('_')[0]; break;
                case "6": Sbtime = HF_ORDERBY.Value.Split('_')[0]; break;
                case "7": Stime = HF_ORDERBY.Value.Split('_')[0]; break;
            }
        }
        Bind_Rpt_Trademark();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            Response.Redirect("User_TrademarkOrderAdd.aspx");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('��ѡ��ɷ��̱꣡');</script>";

        }
    }
    public string ZTFileImg(object zhuti, object sbid)
    {
        string aa = "<a href='user_sbzl.aspx'>δ�ϴ�</a>";
        var m = DALM.Member_Select_Id(UserId);
        if (m != null)
        {
            if (m.i_UserTypeId == 3)
            {
                if (zhuti != null && zhuti != "")
                {
                    return "<a href='" + zhuti + "' target='_blank'><img src='" + zhuti + "'  width='20' title='�����ʸ�֤���ļ�' border='0'/></a>";
                }
                else
                {
                    return "<a href='user_sbupdate.aspx?t_r_id=" + sbid + "' target='_blank'>δ�ϴ�</a>";
                }
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                {
                    return "<a href='" + m.nvc_ZhuTiFile + "'  target='_blank'><img src='" + m.nvc_ZhuTiFile + "'  width='20' title='�����ʸ�֤���ļ�' border='0'/></a>";
                }
                else
                {
                    return "<a href='user_sbzl.aspx'>δ�ϴ�</a>";
                }
            }
        }
        return aa;
    }

    public string SBZTFile(object tid)
    {
        string namestr = "";
        if (tid != null)
        {
            t_Trademark model = DALT.Trademark_Select_Id(int.Parse(tid.ToString()));
            if (model != null)
            {
                if (model.nvc_ZhuTiFile == null)
                {
                    var m = DALM.Member_Select_Id(UserId);
                    if (m != null && !string.IsNullOrWhiteSpace(m.nvc_ZhuTiFile))
                    {
                        namestr = "���ϴ�";
                    }
                    else
                    {
                        namestr = "δ�ϴ�";
                    }
                }
                else
                {
                    namestr = "���ϴ�";
                }
            }
        }
        else
        {
            namestr = "δ�ϴ�";
        }
        return namestr;
    }

    
    public string GetSBtypeAndName(string country, string typeid)//����̱�����
    {
        string typename = "";
        if (country == "1")
        {
            if (typeid == "1")
            {
                typename = "�й�����";
            }
            if (typeid == "2")
            {
                typename = "�й���ҵ";
            }
            if (typeid == "3")
            {
                typename = "�й��������";
            }
        }
        if (country == "2")
        {
            if (typeid == "1")
            {
                typename = "�������";
            }
            if (typeid == "2")
            {
                typename = "�����ҵ";
            }
            if (typeid == "3")
            {
                typename = "����������";
            }
        }
        return typename;

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
    private void toExecl(GridView GVId)
    {
        DateTime dt = DateTime.Now;
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "GB2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + dt.ToString("yyyyMMddHHmmss") + ".xls"); //�����FileName.xls�����ñ�����̬�滻
        // �������Ϊ GetEncoding("GB2312");�������ļ�����������룡����
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.ContentType = "application/ms-excel";//��������ļ�����Ϊexcel�ļ���
        Response.Write("<meta http-equiv=Content-Type content=text/html;charset=UTF-8>");
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        GVId.RenderControl(oHtmlTextWriter);
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            Response.Redirect("User_Trademarkzixing.aspx");
        }
        else
        {
            div_a.InnerHtml = "<script>alert('��ѡ��ɷ��̱꣡');</script>";

        }
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.Cookies["hqht_Trademarktidstr"] != null && Request.Cookies["hqht_Trademarktidstr"].Value != "")
        {
            bool booldelete = true;
            t_Member model = DALM.Member_Select_Id(UserId);
            if (model != null)
            {
                if (model.nvc_Power != null && model.nvc_Power != "")
                {
                    booldelete = model.nvc_Power.Split(',')[3] == "1" ? true : false;//ɾ��  

                }
            }
            if (booldelete == false)
            {
                Response.Redirect("user_pageinfo.aspx");
            }

            int uId_sb = Convert.ToInt32(Request.Cookies["hqhtshop"]["hqht_sb_uid"]);

            string patentid = Request.Cookies["hqht_Trademarktidstr"].Value;
            string[] arr_pid = patentid.Split('|');
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    int pid = Convert.ToInt32(arr_pid[i].Split(',')[0]);
                    DALT.Trademark_Del(pid);
                }
            }
            Bind_Rpt_Trademark();
            div_html.InnerHtml = "<script>alert('ɾ���ɹ�')</script>";
        }
        else
        {
            div_html.InnerHtml = "<script>alert('��ѡ��Ҫɾ�����̱�')</script>";
        }
    }

    public string GetCurrentClassName(int days)
    {
        string cname = "time0";
        if (days > 90)
        {
            cname = "time1";
        }
        if (days >= 61 && days <= 90)
        {
            cname = "time2";
        }
        if (days >= 31 && days <= 60)
        {
            cname = "time3";
        }
        if (days >= 16 && days <= 30)
        {
            cname = "time4";
        }
        if (days >= 0 && days <= 15)
        {
            cname = "time5";
        }
        if (days < 0)
        {
            cname = "time6";
        }
        return cname;
    }
}