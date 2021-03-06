﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.IO;
public partial class user_sbck : System.Web.UI.Page
{
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Address DALA = new dal_Address();
    public int trademarkId = 0;
    public string zhutifileok = "Not uploaded", sbfileok = "Not uploaded", shenqingfile = "Not uploaded", weituofile = "Not uploaded", Uname = "";
    public string Str_Moneysb = "", Str_Monesbmei = "", Str_Zhinajin = "", bizhong = "", zongji = "", zongjimei = "";//Renew by oneself
    public string Str_Moneysbweituo = "", Str_Monesbmeiweituo = "", sbdailiweituo = "", sbmeidailiweituo = "", zongjiweituo = "", zongjimeiweituo = "";//Entrust to renew
    public int shenqingshu = 0, weituoshu = 0, shangchuan = 0, iszhinajin = 0;
    public string anjuanhao = "",linkman="",linkaddress="",linktel="";
    public string BendailiName = "";
    public string BendailiTel = "";
    public string BendailiChuanZhen = "";
    public string BendailiCnName = "";
    public string BendailiEnName = "";
    public string SBRegNum = "";
    public string SBRegaType = "";
    public string SBRegMiaoshu = "", SBmiaoshutype = "";
    public string SBRegName = "", Sb_RegnameEn = "";
    public string SBRegAddress = "", SBRegEnAddress = "";
    public string SBRegYouBian = "";
    public string SBPssTime = "";
    public string isjiaofei = "";
    public string JiaoFeiType = "0";
    public string daoqitime = "", shenhe = "Not checked";
    public string shengtime = "0";
    public string dailimoney = "0";
    public string shangbiaomoney = "0";
    public int state = 0;
    public int fileurl = 0;
    public int fileword = 0;
    public int guoji = 0, usertype = 0;
    public int dazhe = 0, dazhe1 = 0;
    public bool booldaoru = false, booldaochu = false,booledit=false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null && Request.Cookies["hqhtshop"]["hqht_sb_uid"] != "")
        {
            int uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            t_Member model = DALM.Member_Select_Id(uid);
            if (model != null)
            {
                if (model.nvc_Power != null && model.nvc_Power != "")
                {
                    booldaoru = model.nvc_Power.Split(',')[0] == "1" ? true : false;//导入
                    booldaochu = model.nvc_Power.Split(',')[1] == "1" ? true : false;//导出   
                    booledit = model.nvc_Power.Split(',')[2] == "1" ? true : false;//修改   
                    if(booledit==false)
                    {
                        ImgShow.Visible = false;
                    }
                }
            }
        }
        else
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        div_a.InnerHtml = "";
        Bind_Page_Type();

        

    }
    public void Bind_Page_Type()// 绑定page面信息
    {

        if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
        {
            trademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
            Bind_Page_Info(trademarkId);
        }
        else
        {
            Response.Redirect("user_sblb.aspx");
        }

    }
    private void Bind_Page_Info(int trademarkId)// 绑定商标详细数据
    {
        vw_Trademark model = DALT.Trademark_vw_Select_Id(trademarkId);
        t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//Service fee用

        int uid = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
        t_Member muser = DALM.Member_Select_Id(uid);
        #region 会员折扣 by chy
        dazhe = muser.i_PowerDaZhe;
        dal_UserGrade DALUG = new dal_UserGrade();
        t_MemberGrade tmg = DALUG.UserGrade_Select_Id(muser.i_Grade);
        if (tmg != null)
        {
            dazhe1 = Convert.ToInt32(tmg.i_Discount);
        }
        #endregion

        #region 会员折扣 by chy
        decimal dalifee = model1.dm_TMDaiLi;
        if (dazhe != 0)
        {
            dalifee = dalifee * dazhe / 100;
        }
        if (dazhe1 != 0)
        {
            dalifee = dalifee * dazhe1 / 100;
        }
        #endregion

        if (model != null)
        {
            if (model.i_XujiaoStates==1 || model.i_IsPayState == 1)//1提交订单 代缴费，2 已交费  4，取消
            {
                ImgShow.Visible = false;
            }
            Uname = model.nvc_Name;
            if (model1 != null)
            {
                t_Nationality na = DALN.Nationality_Select_Id(model.i_GuoJiId);

                if (na != null)
                {
                    bizhong = na.nvc_Currency;
                    if (na.nvc_Name == "中国")
                    {
                        #region Entrust to renew
                        guoji = 1;
                        string totalmoney = "";
                        if (model.i_ShengDays < 0)
                        {
                            iszhinajin = 1;
                            Str_Zhinajin = model1.dm_TMZhiNaJin.ToString("0.00");
                            totalmoney = (dalifee + model1.dm_TrademarkMoney + model1.dm_TMZhiNaJin).ToString("0.00");

                        }
                        else
                        {
                            totalmoney = (dalifee + model1.dm_TrademarkMoney).ToString("0.00");
                        }

                        Str_Moneysb = model1.dm_TrademarkMoney.ToString("0.00");
                        sbdailiweituo = (dalifee).ToString("0.00");
                        zongjiweituo = totalmoney;
                        #endregion
                        //#region Renew by oneself
                        //string totalmoney1 = (model1.dm_TrademarkMoney).ToString("0.00");
                        //Str_Moneysb = model1.dm_TrademarkMoney.ToString("0.00");
                        //zongji = model1.dm_TrademarkMoney.ToString("0.00");
                        //#endregion
                    }
                    else
                    {
                        t_Nationality nafee = DALN.Nationality_Select_BiZhong(na.nvc_JFBizhong);
                        decimal huilv = 1;
                        if (nafee != null)
                        {
                            bizhong = nafee.nvc_Currency;
                            if (nafee.dm_Exchange != null || nafee.dm_Exchange != 0)
                            {
                                huilv = nafee.dm_Exchange;
                            }
                        }
                        #region  Entrust to renew
                        Str_Moneysb = model1.dm_TrademarkMoney.ToString("0.00");
                        sbdailiweituo = (dalifee).ToString("0.00");
                        string totalmoney = "";
                        string totalmoneyGY = "";
                        if (model.i_ShengDays < 0)
                        {
                            iszhinajin = 1;
                            Str_Zhinajin = model1.dm_TMZhiNaJin.ToString("0.00");
                            totalmoney = (dalifee + model1.dm_TrademarkMoney + model1.dm_TMZhiNaJin).ToString("0.00");
                            totalmoneyGY = ((dalifee + model1.dm_TrademarkMoney + model1.dm_TMZhiNaJin) * huilv).ToString("0.00");
                        }
                        else
                        {
                            totalmoney = (dalifee + model1.dm_TrademarkMoney).ToString("0.00");
                            totalmoneyGY = ((dalifee + model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                        }
                        
                        //string shangbiao = (model1.dm_TrademarkMoney).ToString("0.00");
                        //string shangbiaoGY = ((model1.dm_TrademarkMoney) * huilv).ToString("0.00") + "美元";
                        //string dailimoneyGy = ((model1.dm_TMDaiLi) * huilv).ToString();
                        //Str_Monesbmeiweituo = shangbiaoGY;
                        //sbmeidailiweituo = dailimoneyGy;
                        zongjimeiweituo = totalmoneyGY;
                        zongjiweituo = totalmoney;
                        #endregion

                        //#region  Renew by oneself
                        //string totalmoney1 = (model1.dm_TrademarkMoney).ToString("0.00");
                        //string totalmoneyGY1 = ((model1.dm_TrademarkMoney) * huilv).ToString("0.00");
                        //Str_Monesbmei = na.nvc_JFBizhong;
                        //zongjimei = totalmoneyGY1;
                        //zongji = totalmoney1;
                        //#endregion
                    }
                }
            }
            t_Member mm = DALM.Member_Select_Id(int.Parse(model.i_MemberId.ToString()));
            if (mm != null)
            {
                if (mm.nvc_ZhuTiFile != null)
                {
                    zhutifileok = "<a href='../" + mm.nvc_ZhuTiFile + "' title='click to check' target='_blank'>Certificate of Subject Qualification was uploaded already</a>";
                }
                if (mm.i_GuoJiId == 1) //中国Individual
                {
                    guoji = 1;
                }
                if (mm.i_UserTypeId == 1)//Individual
                {
                    usertype = 1;
                }
                if (mm.i_UserTypeId == 2)//公司
                {
                    usertype = 2;

                }
                if (mm.i_UserTypeId == 3)//代理
                {
                    usertype = 3;
                    if (model.nvc_ZhuTiFile != null)
                    {
                        zhutifileok = "<a href='../" + model.nvc_ZhuTiFile + "' title='click to check' target='_blank'>Certificate of Subject Qualification was uploaded already</a>";
                    }
                    else
                    {
                        zhutifileok = "<a href='user_sbupdate.aspx?t_r_id=" + trademarkId + "' target='_blank'>Not uploaded</a>";
                    }
                    anjuanhao = model.nvc_CFaxnumber;
                    linkman = model.nvc_OtherName;
                    linktel = model.nvc_CTel;
                    linkaddress = model.nvc_CAddress;
                }
               
            }
           
            BendailiName = model.nvc_DLName;
            BendailiTel = model.nvc_DLTel;
            BendailiChuanZhen = model.nvc_DLFaxnumber;
            BendailiCnName = model.nvc_DLZuzhiName;
            BendailiEnName = model.nvc_DLZuzhiEnName;
            SBRegNum = model.nvc_SBRegNum;
            SBRegaType = model.nvc_SBType;
            if (model.i_IsPayState == 0)
            {
                isjiaofei = "Unpaid";
            }
            if (model.i_IsPayState == 1)
            {
                isjiaofei = "Submitted order";
            }
            if (model.i_IsPayState == 2)
            {
                isjiaofei = "Paid";
            }
            if (model.i_IsPayState == 4)
            {
                isjiaofei = "Invalid";
            }

            if (model.i_MiaoShuType == 1)
            {
                SBmiaoshutype = "Word mark";
            }
            if (model.i_MiaoShuType == 2)
            {
                SBmiaoshutype = "Device mark";
            }
            if (model.i_MiaoShuType == 3)
            {
                SBmiaoshutype = "Composed mark with word and device";
            }

            SBRegMiaoshu = model.nvc_SBDescribe;
            SBRegName = model.nvc_SBRegName;
            Sb_RegnameEn = model.nvc_SBRegEnName;
            //SBRegAddress = DALA.Set_AddressName_Gid_PId_CId_AId(model.i_GuoJiId, model.i_ProvinceId, model.i_CityId, mm.i_AreaId) + model.nvc_SBRegAddress;
            SBRegAddress = model.nvc_SBRegAddress;
            SBRegEnAddress = model.nvc_SBRegEnAddress;
            SBRegYouBian = model.nvc_SBPostcode.ToString();
            SBPssTime = model.nvc_SbRegTime;
                daoqitime = model.nvc_SbDaoqiTime;
                shengtime = model.i_ShengDays.ToString();
                JiaoFeiType = model.i_JiaoFeiType.ToString();// ? "Renew by oneself" : "代理缴费";
            //if (model.nvc_ZhuTiFile != null)
            //{
            //    zhutifileok = "<a href='" + model.nvc_ZhuTiFile + "' title='click to check' target='_blank'>Certificate of Subject Qualification was uploaded already</a>";
            //}
           
            if (model.nvc_SBFile != null)
            {
                shangchuan = 1;//是否上传
                sbfileok = "<a href='../" + model.nvc_SBFile + "' title='click to check' target='_blank'>Copy of Trademark Registration Certificate was uploaded already</a>";
            }
            if (model.nvc_ShenQingShu != null)
            {
                //shangchuan = 2;//是否上传
                shenqingfile = "<a href='../" + model.nvc_ShenQingShu + "' title='click to check' target='_blank'>Application was uploaded already</a>";
                //sbshenqingshuok.Style["display"] = "";
                shenqingshu = 1;
                //Button1.Visible = false;
            }
            else
            {
               // Button1.Visible = true;
            }
            if (model.i_JiaoFeiType == 2)
            {
                if (model.nvc_WeituoFile != null)
                {
                    weituofile = "<a href='" + model.nvc_WeituoFile + "' title='click to check' target='_blank'>Power of Attorney was uploaded already</a>";
                    weituoshu = 1;
                    //Button1.Visible = false;
                }
                else
                {
                   // Button1.Visible = true;
                }
            }
        }
        else
        {
            Response.Redirect("user_sblb.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (booldaochu)
        {
            Response.Redirect("user_World_sb.aspx?id=" + trademarkId + "&type=3");
        }
        else
        {
            Response.Redirect("user_pageinfo.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        if (booldaochu)
        {
            Response.Redirect("user_World_sb.aspx?id=" + trademarkId + "&type=3");
        }
        else
        {
            Response.Redirect("user_pageinfo.aspx");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (booldaochu)
        {
            Response.Redirect("user_World_sbweituo.aspx?id=" + trademarkId + "&type=2");
        }
        else
        {
            Response.Redirect("user_pageinfo.aspx");
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        t_Trademark model = DALT.Trademark_Select_Id(trademarkId);

        //if (JiaoFeiType == "2")
        //{
        //    if (FileUpload2.HasFile == false && FileUpload1.HasFile == false)
        //    {
        //        MessageBox.Show(this.Page, "Please upload a copy of power of attorney and application!");
        //        //div_a.InnerHtml = "<script>alert('Please select你要上传的文件');</script>";
        //        return;
        //    }
        //    if (FileUpload1.HasFile)
        //    {
        //        string urlname = "";
        //        UpfileLoad(FileUpload1, "File_Zscq/File_World/", "", ref urlname);
        //        model.nvc_ShenQingShu = urlname;
        //    }
        //    if (FileUpload2.HasFile)
        //    {
        //        string urlname = "";
        //        UpfileLoad(FileUpload2, "File_Zscq/File_World/", "", ref urlname);
        //        model.nvc_WeituoFile = urlname;
        //    }

        //}
        //else
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        string urlname = "";
        //        UpfileLoad(FileUpload1, "File_Zscq/File_World/", "", ref urlname);
        //        model.nvc_ShenQingShu = urlname;
        //    }
        //    else
        //    {
        //        MessageBox.Show(this.Page, "Please upload a trademark application!");
        //        // div_a.InnerHtml = "<script>alert('Please select你要上传的文件');</script>";
        //        return;
        //    }
        //}
        DALT.Trademark_Update(model);
       // Response.Write(HttpUtility.UrlEncode(Request.Url.ToString()));
      //  Response.Redirect(HttpUtility.UrlEncode(Request.Url.ToString()));
    }
    public void UpfileLoad(FileUpload fileup, string pathname, string filename, ref string urlname)
    {
        string exname = Path.GetExtension(fileup.FileName).ToLower();
        string fileNameExt = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
        if (fileNameExt == ".jpg" || fileNameExt == ".gif" ||fileNameExt == ".png"  || fileNameExt == ".pdf")
        {
            if (fileup.PostedFile.ContentLength > 1024 * 1024 * 0.5)
            {
                div_a.InnerHtml = "<script>alert('The size of document cannot be bigger than 500KB!');</script>";
                return;
            }
            string toFileName = fileup.FileName;
            string path = System.AppDomain.CurrentDomain.BaseDirectory + pathname + filename + toFileName;
            fileup.SaveAs(path);
            urlname = pathname + filename + toFileName;
            MessageBox.Show(this.Page, "Upload successful！");
        }
        else
        {
            MessageBox.Show(this.Page, "File Format Only( .jpg .gif .pdf)!");
            //div_a.InnerHtml = "<script>alert('文件格式仅限( .jpg .gif .pdf)!')</script>";
            return;
        }
       
       
    }

}