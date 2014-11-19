using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.Model;
using zscq.DAL;
using System.IO;
public partial class user_sbupdate : System.Web.UI.Page
{
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    public string daoqitime = "";
    public string shengtime = "", zhutiwenjian = "", Sbfile = "", shenqingfile = "", weituofile = "";
    public string JiaoFeiType = "0", Sb_num = "", shenhe = "Not checked", jiaofei = "Unpaid";
    public int TrademarkId = 0, MemberId = 0, zhitiOk = 0, sbfileok = 0, shenqingshu = 0, weituoshu = 0;
    public int guoji = 0, usertype = 0, isjiaofei = 0, iszhinajin = 0;
    public string Str_Moneysb = "0", Str_Monesbmei = "", Str_Zhinajin = "", bizhong = "", zongji = "", zongjimei = "";//Renew by oneself
    public string Str_Moneysbweituo = "", Str_Monesbmeiweituo = "", sbdailiweituo = "", sbmeidailiweituo = "", zongjiweituo = "", zongjimeiweituo = "";//Entrust to renew
    dal_SystemSetup DALSS = new dal_SystemSetup();
    public string url = "";
    public int dazhe = 0, dazhe1 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        url = Request.Url.ToString();
        if (!IsPostBack)
        {
            // Bind_Drp_PGuoJiaType();
            Bind_Page_Info();
        }
    }
    private void Bind_Page_Info()// 绑定商品详细数据
    {
        if (Request.Cookies["hqhtshop"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString() == "")
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            MemberId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
            if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
            {
                hi_sbid.Value = Request.QueryString["t_r_id"].ToString();
                TrademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
                vw_Trademark model = DALT.Trademark_vw_Select_Id(TrademarkId);
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
                    t_Member mm = DALM.Member_Select_Id(MemberId);
                    if (mm != null)
                    {
                        if (mm.i_GuoJiId == 1)//中国
                        {
                            guoji = 1;//是中国 
                            hi_guoji.Value = "1";
                        }
                        t_Nationality na = DALN.Nationality_Select_Id(mm.i_GuoJiId);
                        if (na != null)
                        {
                            bizhong = na.nvc_JFBizhong;
                            if (na.nvc_Name == "中国")
                            {
                                #region Entrust to renew
                                guoji = 1;
                                hi_guoji.Value = "1";
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

                        if (mm.i_UserTypeId != null)
                        {
                            if (mm.i_UserTypeId == 1)
                            {
                                usertype = 1;
                                hi_usertype.Value = "1";
                                if (mm.nvc_ZhuTiFile != null)
                                {
                                    zhutiwenjian = "<a href='../" + mm.nvc_ZhuTiFile + "' title='click to check'  target='_blank'>Certificate of Subject Qualification was uploaded already</a><br><span  style=\"color:Red;\">For any change on Certificate documents, please upload again.</span>";
                                    zhitiOk = 1;
                                }
                                else
                                {
                                    zhitiOk = 0;
                                }
                            }
                            if (mm.i_UserTypeId == 2)
                            {
                                usertype = 2;
                                hi_usertype.Value = "2";
                                if (mm.nvc_ZhuTiFile != null)
                                {
                                    zhutiwenjian = "<a href='../" + mm.nvc_ZhuTiFile + "' title='click to check'  target='_blank'>Certificate of Subject Qualification was uploaded already</a><br><span  style=\"color:Red;\">For any change on Certificate documents, please upload again.</span>";
                                    zhitiOk = 1;
                                }
                                else
                                {
                                    zhitiOk = 0;
                                }
                            }
                            if (mm.i_UserTypeId == 3)
                            {
                                usertype = 3;
                                hi_usertype.Value = "3";
                                if (model.nvc_ZhuTiFile != null)
                                {
                                    zhutiwenjian = "<a href='../" + model.nvc_ZhuTiFile + "' title='click to check'  target='_blank'>Certificate of Subject Qualification was uploaded already</a><br><span  style=\"color:Red;\">For any change on Certificate documents, please upload again.</span>";
                                    zhitiOk = 1;
                                }
                                #region Information of the third party
                                t_anjuanhao.Value = model.nvc_CFaxnumber;//Reference number
                                txt_linkman.Value = model.nvc_OtherName;
                                txt_phone.Value = model.nvc_CTel;
                                txt_address.Value = model.nvc_CAddress;
                                #endregion
                            }
                        }
                    }
                    if (model.nvc_SBFile != null && model.nvc_SBFile != "")
                    {
                        Sbfile = "<a href='../" + model.nvc_SBFile + "' title='click to check'  target='_blank'>Copy of Trademark Registration Certificate Existed</a><br><span  style=\"color:Red;\">For any change on Certificate documents, please upload again.</span>";
                        sbfileok = 1;
                    }
                    else
                    {
                        sbfileok = 0;
                    }
                    if (model.nvc_ShenQingShu != null)
                    {
                        //shangchuan = 2;//是否上传
                        shenqingfile = "<a href='../" + model.nvc_ShenQingShu + "' title='click to check' target='_blank'>Application was uploaded already</a><br><span  style=\"color:Red;\">Copy of Trademark Registration Certificate Existed</span>";
                        //sbshenqingshuok.Style["display"] = "";
                        shenqingshu = 1;
                        //Button1.Visible = false;
                    }
                    else
                    {
                        // Button1.Visible = true;
                    }
                    if (model.i_JiaoFeiType == 2 || mm.i_UserTypeId == 3)
                    {
                        if (model.nvc_WeituoFile != null)
                        {
                            weituofile = "<a href='../" + model.nvc_WeituoFile + "' title='click to check' target='_blank'>Power of Attorney was uploaded already</a><br><span  style=\"color:Red;\">Copy of Trademark Registration Certificate Existed</span>";
                            weituoshu = 1;
                            //Button1.Visible = false;
                        }
                        else
                        {
                            // Button1.Visible = true;
                        }
                    }
                    sb_num.Value = model.nvc_SBRegNum;
                    Sb_type.Value = model.nvc_SBType;

                    if (model.i_MiaoShuType == 1)
                    {
                        RadioButton1.Checked = true;
                    }
                    if (model.i_MiaoShuType == 2)
                    {
                        RadioButton2.Checked = true;
                    }
                    if (model.i_MiaoShuType == 3)
                    {
                        RadioButton3.Checked = true;
                    }


                    Sb_miaosu.Value = model.nvc_SBDescribe;
                    Sb_Regname.Value = model.nvc_SBRegName;
                    Sb_RegnameEn.Value = model.nvc_SBRegEnName;
                    t_daoqi.Value = model.nvc_SbDaoqiTime;
                    //if (model.i_GuoJiId.ToString() != null)
                    //{
                    //    Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
                    //   // Drp_GuoJi_SelectedIndexChanged(null, null);
                    //}
                    //if (model.i_ProvinceId.ToString() != null)
                    //{

                    //    DropDownList2.SelectedValue = model.i_ProvinceId.ToString();
                    //    DropDownList2_SelectedIndexChanged(null, null);
                    //}

                    //if (model.i_CityId.ToString() != null)
                    //{
                    //    DropDownList3.SelectedValue = model.i_CityId.ToString();
                    //    DropDownList3_SelectedIndexChanged(null, null);
                    //}
                    //   DropDownList4.SelectedValue = model.i_AreaId.ToString();
                    Sb_Reg_Address.Value = model.nvc_SBRegAddress;
                    Sb_Reg_AddressEn.Value = model.nvc_SBRegEnAddress;
                    Sb_Reg_youbian.Value = model.nvc_SBPostcode.ToString();
                    Sb_passTime.Value = model.nvc_SbRegTime;
                    //Drp_GuoJi.SelectedValue = model.i_GuoJiId.ToString();
                    //Drp_GuoJi_SelectedIndexChanged(null, null);
                    //DropDownList2.SelectedValue = model.i_ProvinceId.ToString();
                    //DropDownList2_SelectedIndexChanged(null, null);
                    //DropDownList3.SelectedValue = model.i_CityId.ToString();
                    //DropDownList3_SelectedIndexChanged(null, null);
                    //DropDownList4.SelectedValue = model.i_AreaId.ToString();
                    JiaoFeiType = model.i_JiaoFeiType.ToString();
                    if (model.i_IsPayState == 1)
                    {
                        jiaofei = "Submitted order";
                        Sb_passTime.Disabled = true;
                    }
                    if (model.i_IsPayState == 2)
                    {
                        Sb_passTime.Disabled = true;
                        t_daoqi.Disabled = true;
                        jiaofei = "Paid";
                        isjiaofei = 1;
                        Sb_passTime.Disabled = true;
                    }
                    daoqitime = model.nvc_SbDaoqiTime.ToString();
                    shengtime = model.i_ShengDays.ToString() + "天";
                    if (model.i_ShengDays < 0)
                    {
                        shengtime = "Expired";
                        // dd_jiaofeitype.Enabled = true;
                    }

                }
                else
                {
                    Response.Redirect("user_sblb.aspx");
                }
            }
        }
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
    public string GetAddressName(int id, int type)// 获得城市名称
    {

        string name = "";
        if (type == 1)
        {
            t_Province p = DALB.Province_Select_Id(id);
            if (p != null)
            {
                name = p.provinceName;
            }
        }
        if (type == 2)
        {
            t_City c = DALB.City_Select_Id(id);
            if (c != null)
            {
                name = c.cityName;
            }
        }
        if (type == 3)
        {
            t_Area a = DALB.Area_Select_Id(id);
            if (a != null)
            {
                name = a.areaName;
            }
        }
        return name;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["hqhtshop"] != null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] != null || Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString() != "")
        {

            int usermember = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString()); ;
            if (Request.QueryString["t_r_id"] != null && Request.QueryString["t_r_id"].ToString() != "")
            {
                MemberId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
                TrademarkId = int.Parse(Request.QueryString["t_r_id"].ToString());
                hi_sbid.Value = Request.QueryString["t_r_id"].ToString();
                t_Trademark model = DALT.Trademark_Select_Id(TrademarkId);
                t_SystemSetup ts = DALSS.SystemSetup_Select();
                if (ts != null)
                {
                    model.nvc_DLName = ts.nvc_DLName;
                    model.nvc_DLTel = ts.nvc_DLTel;
                    model.nvc_DLFaxnumber = ts.nvc_DLFaxNumber;
                    model.nvc_DLZuzhiName = ts.nvc_DLCNName;
                    model.nvc_DLZuzhiEnName = ts.nvc_DLENName;
                }
                model.nvc_SBRegNum = sb_num.Value;
                model.nvc_SBType = Sb_type.Value;//商标类型
                if (RadioButton1.Checked)
                {
                    model.i_MiaoShuType = 1;
                }
                if (RadioButton2.Checked)
                {
                    model.i_MiaoShuType = 2;
                }
                if (RadioButton3.Checked)
                {
                    model.i_MiaoShuType = 3;
                }

                model.nvc_SBDescribe = Sb_miaosu.Value;//
                model.nvc_SBRegName = Sb_Regname.Value;
                model.nvc_SBRegEnName = Sb_RegnameEn.Value;
                model.nvc_SBRegAddress = Sb_Reg_Address.Value;
                model.nvc_SBRegEnAddress = Sb_Reg_AddressEn.Value;
                model.nvc_SBPostcode = Sb_Reg_youbian.Value;
                JiaoFeiType = model.i_JiaoFeiType.ToString();
                //model.i_JiaoFeiType = int.Parse(dd_jiaofeitype.SelectedValue);
                // model.i_GuoJiId = int.Parse(Drp_GuoJi.SelectedValue);
                //model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);
                //model.i_CityId = int.Parse(DropDownList3.SelectedValue);
                //model.i_AreaId = int.Parse(DropDownList4.SelectedValue);
                //if (model.nvc_SBFile == "" || model.nvc_SBFile == null)
                //{
                    if (FileUpload4.HasFile)
                    {
                        string urlname = "";
                        int i = UpfileLoad(FileUpload4, "File_Zscq/File_ShangBiao/", "SBZCZSFYJ", ref urlname);
                        if (i == 1)
                        {
                            div_a.InnerHtml = "<script>alert('The size of document cannot be bigger than 500KB!');location.href='" + url + "';</script>";
                            return;
                        }
                        if (i == 2)
                        {
                            div_a.InnerHtml = "<script>alert('Document format is limited to (.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
                            return;
                        }
                        model.nvc_SBFile = urlname;
                        //if (hi_usertype.Value == "3")
                        //{
                        //    model.nvc_SBFile = urlname;
                        //}
                        //else
                        //{
                        //    t_Member mm = DALM.Member_Select_Id(MemberId);
                        //    mm.nvc_ZhuTiFile = urlname;
                        //    DALM.Member_Update(mm);
                        //}
                    }
                    //else
                    //{
                    //    div_a.InnerHtml = "<script>alert('Please upload copy of Trademark Registration Certificate');location.href='" + url + "';</script>";
                    //   // MessageBox.ShowAndRedirect(this.Page, "请上传Copy of Trademark Registration Certificate",url);
                    //    //div_a.InnerHtml = "<script>alert('Please select你要上传的文件');</script>";
                    //    return;
                    //}
                //}
                if (FileUpload1.HasFile)
                {
                    string urlname = "";
                    UpfileLoad(FileUpload1, "File_Zscq/File_World/", "SQS", ref urlname);
                    model.nvc_ShenQingShu = urlname;
                }

                if (FileUpload2.HasFile)
                {
                    string urlname = "";
                    UpfileLoad(FileUpload2, "File_Zscq/File_World/", "WTS", ref urlname);
                    model.nvc_WeituoFile = urlname;
                }

                if (hi_usertype.Value == "3")
                {
                    #region Information of the third party
                    model.nvc_CFaxnumber = t_anjuanhao.Value;//Reference number
                    model.nvc_OtherName = txt_linkman.Value;
                    model.nvc_CTel = txt_phone.Value;
                    model.nvc_CAddress = txt_address.Value;
                    #endregion
                    //t_Member mm = DALM.Member_Select_Id(MemberId);
                    //if (mm.nvc_ZhuTiFile == "" || mm.nvc_ZhuTiFile == null)
                    //{
                    //    if (FileUpload3.HasFile)
                    //    {
                    //        string urlname = "";
                    //        UpfileLoad(FileUpload3, "File_Zscq/File_ShangBiao/", "", ref urlname);
                    //        model.nvc_ZhuTiFile = urlname;
                    //    }
                    //    else
                    //    {
                    //        MessageBox.Show(this.Page, "Please upload the subject qualification certificate");
                    //        //  div_a.InnerHtml = "<script>alert('Please select the file you want to upload');</script>";
                    //        return;
                    //    }
                    //}
                    //else
                    //{
                    if (hi_zhitifiles.Value != "")
                    {
                        model.nvc_ZhuTiFile = hi_zhitifiles.Value;
                    }
                    else
                    {
                        if (FileUpload3.HasFile)
                        {
                            string urlname = "";
                            int j = UpfileLoad(FileUpload3, "File_Zscq/File_ShangBiao/", "ZTZGZMWJ", ref urlname);
                            if (j == 1)
                            {
                                div_a.InnerHtml = "<script>alert('The size of document cannot be bigger than 500KB!'); location.href='" + url + "';</script>";
                                return;
                            }
                            if (j == 2)
                            {
                                div_a.InnerHtml = "<script>alert('Document format is limited to (.jpg  .png  .gif .pdf)!');location.href='" + url + "';</script>";
                                return;
                            }
                            model.nvc_ZhuTiFile = urlname;
                        }
                    }
                }
                if (model.i_IsPayState != 1 && model.i_IsPayState != 2)
                {
                    model.nvc_SbRegTime = Sb_passTime.Value;
                    model.nvc_SbDaoqiTime = t_daoqi.Value;
                    //  Response.Write(t_daoqi.Value+"dd");
                    DateTime dt = DateTime.Parse(t_daoqi.Value + " 00:00:00");
                    model.i_ShengDays = int.Parse(HelpString.DateDiff(dt, DateTime.Now, "day"));
                    model.dt_AddTime = DateTime.Now;
                }
                // model.i_JiaoFeiType = int.Parse(dd_jiaofeitype.SelectedValue);
                if (DALT.Trademark_Update(model) == 1)
                {
                    string sbname = Sb_Regname.Value.Trim();
                    var iquery = DALT.Trademark_vw_Select_ByName(model.nvc_SBRegName, usermember);//这里返回iquery集合判断是否上传了主体资格文件
                    if (iquery != null)
                    {
                        foreach (var item in iquery)
                        {
                            t_Trademark td = DALT.Trademark_Select_Id(item.i_Id);
                            if (td != null)
                            {
                                if (td.nvc_ZhuTiFile == null || td.nvc_ZhuTiFile == "")
                                {
                                    td.nvc_ZhuTiFile = model.nvc_ZhuTiFile;
                                }
                                DALT.Trademark_Update(td);
                            }
                        }
                    }
                    UserLog.AddUserLog(TrademarkId, "商标系统", "更新商标");
                    Response.Redirect("user_sblb.aspx");
                }
                else
                {
                    div_a.InnerHtml = "<script>alert('Information update failed!');<script>";
                }
            }
        }
    }
    public int UpfileLoad(FileUpload fileup, string pathname, string filename, ref string urlname)
    {
        string exname = Path.GetExtension(fileup.FileName).ToLower();
        string fileNameExt = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
        if (fileNameExt == ".jpg" || fileNameExt == ".gif" || fileNameExt == ".png" || fileNameExt == ".pdf")
        {
            if (fileup.PostedFile.ContentLength > 1024 * 1024 * 0.5)
            {
                return 1;
            }
            string toFileName = DateTime.Now.ToString("HHmmssff") + new Random().Next(100) + fileNameExt;//fileup.FileName;
            string path = System.AppDomain.CurrentDomain.BaseDirectory + pathname + filename + toFileName;
            fileup.SaveAs(path);
            urlname = pathname + filename + toFileName;
        }
        else
        {

            return 2;
        }
        return 0;
    }

    //void Bind_Drp_PGuoJiaType()// 绑定国籍
    //{
    //    Drp_GuoJi.Items.Clear();
    //    ListItem item = new ListItem("Please select", "0");
    //    Drp_GuoJi.Items.Add(item);
    //    var iquery = DALN.Nationality_SelectAll();
    //    foreach (var q in iquery)
    //    {
    //        ListItem li = new ListItem(q.nvc_Name, q.i_Id.ToString());
    //        Drp_GuoJi.Items.Add(li);
    //    }      
    //}
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
    //protected void Drp_GuoJi_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DALN.Provice_Bind_DDL_NId(DropDownList2, Drp_GuoJi.SelectedValue);
    //    DALB.City_Bind_DDL_PId(DropDownList3, DropDownList2.SelectedValue);
    //    DALB.Area_Bind_DDL_CId(DropDownList4, DropDownList3.SelectedValue);
    //}
}