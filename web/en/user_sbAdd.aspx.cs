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
    dal_SystemSetup DALSS = new dal_SystemSetup();
    dal_Trademark DALT = new dal_Trademark();
    dal_TrademarkSetup DALTS = new dal_TrademarkSetup();
    dal_Nationality DALN = new dal_Nationality();
    dal_Member DALM = new dal_Member();
    dal_Address DALB = new dal_Address();
    dal_TrademarkOrder DALTO = new dal_TrademarkOrder();
    dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
    public string daoqitime = "";
    public string shengtime = "";
    public string JiaoFeiType = "0", Sb_num = "", zhutiwenjian="",sbguoji="0";
    public int TrademarkId = 0, MemberId = 0;
    public int guoji = 0, usertype = 0, sbzlok = 0;
    public string Str_Moneysb = "", Str_Monesbmei = "", bizhong = "",zongji="",zongjimei="";//Renew by oneself
    public string Str_Moneysbweituo = "", Str_Monesbmeiweituo = "",sbdailiweituo="",sbmeidailiweituo="",zongjiweituo="",zongjimeiweituo="";//Entrust to renew
    public int zhutifileIsOk = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
       // Bind_Drp_PGuoJiaType(); 
        Bind_Page_Info();
    }
    private void Bind_Page_Info()// 绑定商品详细数据
    {
        if (Request.Cookies["hqhtshop"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString() == "")
        {
            Response.Redirect("Login.aspx?flag=sb&pageurl=" + HttpUtility.UrlEncode(Request.Url.ToString()));
        }
        else
        {
            //if (int.Parse(sbguoji) != 0)
            //{
            //    Drp_GuoJi.SelectedValue = sbguoji;
            //}
            Hi_MemberId.Value = Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString();
            MemberId = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            t_Member muser = DALM.Member_Select_Id(MemberId);
            if (muser != null)
            {
                if (muser.i_UserTypeId == 3)
                {
                    if ((muser.nvc_DaiLiName == "" || muser.nvc_DaiLiName == null) || (muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null))
                    {
                        hi_sbzlok.Value = "0";
                        sbzlok = 0;
                    }
                    else
                    {
                        hi_sbzlok.Value = "1";
                        sbzlok = 1;
                    }
                }
                else if (muser.i_UserTypeId == 2)
                {
                    if (muser.i_GuoJiId == 1)
                    {
                        if ((muser.nvc_Company == "" || muser.nvc_Company == null) || (muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null))
                        {
                            hi_sbzlok.Value = "0";
                            sbzlok = 0;
                        }
                        else
                        {
                            hi_sbzlok.Value = "1";
                            sbzlok = 1;
                        }
                    }
                    else
                    {
                        if ((muser.nvc_EnCompany == "" || muser.nvc_EnCompany == null) || (muser.nvc_EnglishName == "" || muser.nvc_EnglishName == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null))
                        {
                            hi_sbzlok.Value = "0";
                            sbzlok = 0;
                        }
                        else
                        {
                            hi_sbzlok.Value = "1";
                            sbzlok = 1;
                        }
                    }
                }
                else
                {
                    if (muser.i_GuoJiId == 1)
                    {
                        if ((muser.nvc_RealName == "" || muser.nvc_RealName == null) || (muser.nvc_IDCard == "" || muser.nvc_IDCard == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null))
                        {
                            hi_sbzlok.Value = "0";
                            sbzlok = 0;
                        }
                        else
                        {
                            hi_sbzlok.Value = "1";
                            sbzlok = 1;
                        }
                    }
                    else
                    {
                        if ((muser.nvc_EnglishName == "" || muser.nvc_EnglishName == null) || (muser.nvc_IDCard == "" || muser.nvc_IDCard == null) || (muser.nvc_TelPhone == "" || muser.nvc_TelPhone == null))
                        {
                            hi_sbzlok.Value = "0";
                            sbzlok = 0;
                        }
                        else
                        {
                            hi_sbzlok.Value = "1";
                            sbzlok = 1;
                        }
                    }
                }
            }
            t_TradeMarkSetup model1 = DALTS.TrademarkSetup_Select();//Service fee用
            t_Member mm = DALM.Member_Select_Id(MemberId);
            if (mm != null)
            {
                if (mm.i_GuoJiId != null)
                {
                    t_Nationality na = DALN.Nationality_Select_Id(mm.i_GuoJiId);
                    if (na != null)
                    {
                        bizhong = na.nvc_Currency;
                        if (na.nvc_Name == "中国")
                        {
                            #region Entrust to renew                           
                            guoji = 1;
                            hi_guoji.Value = "1";
                            string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                            Str_Moneysb = model1.dm_TrademarkMoney.ToString("0.00");
                            sbdailiweituo = (model1.dm_TMDaiLi).ToString("0.00"); 
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
                            sbdailiweituo = (model1.dm_TMDaiLi).ToString("0.00");
                            string totalmoney = (model1.dm_TMDaiLi + model1.dm_TrademarkMoney).ToString("0.00");
                            string totalmoneyGY = ((model1.dm_TMDaiLi + model1.dm_TrademarkMoney) * huilv).ToString("0.00");
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
                    if (mm.i_UserTypeId != null)
                    {
                        if (mm.nvc_ZhuTiFile != null)
                        {
                            zhutiwenjian = "<a href='../" + mm.nvc_ZhuTiFile + "'  title='click to check'  target='_blank'>Certificate of Subject Qualification was uploaded already</a>";
                            zhutifileIsOk = 1;
                        }
                        if (mm.i_UserTypeId == 1)
                        {
                            usertype = 1;
                            hi_usertype.Value = "1";
                        }
                        if (mm.i_UserTypeId == 2)
                        {
                            usertype = 2;
                            hi_usertype.Value = "2";
                        }
                        if (mm.i_UserTypeId == 3)
                        {
                            usertype = 3;
                            hi_usertype.Value = "3";
                          
                        }
                    }
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
            int usermember = int.Parse(Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            if (sbzlok==0)
            {
                MessageBox.ShowAndRedirect(this.Page, "Your personal information is incomplete, so please complete the related materials!", "user_sbzl.aspx");
                return;
            }
            t_Trademark model = new t_Trademark();          
           // sbguoji = Drp_GuoJi.SelectedValue;
                t_SystemSetup ts = DALSS.SystemSetup_Select();
                if (ts != null)
                {
                    model.nvc_DLName = ts.nvc_DLName;
                    model.nvc_DLTel = ts.nvc_DLTel;
                    model.nvc_DLFaxnumber = ts.nvc_DLFaxNumber;
                    model.nvc_DLZuzhiName = ts.nvc_DLCNName;
                    model.nvc_DLZuzhiEnName = ts.nvc_DLENName;
                }

                model.i_MemberId = usermember;
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
                model.i_JiaoFeiType = 2;// int.Parse(dd_jiaofeitype.SelectedValue);
                t_Member mm = DALM.Member_Select_Id(usermember);
                model.i_GuoJiId = mm.i_GuoJiId;
               // model.i_GuoJiId = int.Parse(Drp_GuoJi.SelectedValue);
                //model.i_ProvinceId = int.Parse(DropDownList2.SelectedValue);
                //model.i_CityId = int.Parse(DropDownList3.SelectedValue);
                //model.i_AreaId = int.Parse(DropDownList4.SelectedValue);
                model.i_IsPayState = 0;
                model.nvc_SbRegTime = Sb_passTime.Value;
                model.nvc_SbDaoqiTime = t_daoqi.Value;
                DateTime dt = DateTime.Parse(t_daoqi.Value+" 00:00:00");
                model.i_ShengDays =int.Parse(HelpString.DateDiff(dt, DateTime.Now, "day"));
                model.dt_AddTime = DateTime.Now;

                if (FileUpload4.HasFile)
                {
                    string urlname = "";
                    int flag= UpfileLoad(FileUpload4, 4, "File_Zscq/File_ShangBiao/", "Copy of Trademark Registration Certificate",ref urlname);
                    if(flag==1)
                    {
                        MessageBox.Show(Page, "The size of document cannot be bigger than 500KB!"); 
                        return;
                    }
                    if(flag==2)
                    {
                        MessageBox.Show(Page, "Document format is limited to (.jpg  .png  .gif .pdf)!"); 
                        return;
                    }
                    if(flag==3)
                    {
                        MessageBox.Show(Page, "Fail to upload");
                        return;
                    }
                    model.nvc_SBFile = urlname; 
                }
                //else
                //{
                //    MessageBox.Show(Page, "Please select你要上传的文件");
                //    //div_a.InnerHtml = "<script>alert('Please select你要上传的文件');</script>";                   
                //    return;
                //}
                if (hi_usertype.Value == "3")
                {
                    #region Information of the third party
                    model.nvc_CFaxnumber = t_anjuanhao.Value;//Reference number
                    model.nvc_OtherName = txt_linkman.Value;
                    model.nvc_CTel = txt_phone.Value;
                    model.nvc_CAddress = txt_address.Value;
                    #endregion


                    if (hi_zhitifiles.Value!="")
                    {
                        model.nvc_ZhuTiFile = hi_zhitifiles.Value;
                    }

                    else
                    {
                    if (FileUpload3.HasFile)
                    {
                        string urlname = "";
                        int flag = UpfileLoad(FileUpload3, 3, "File_Zscq/File_ShangBiao/", "Certificate of qualification", ref urlname);
                        if (flag == 1)
                        {
                            MessageBox.Show(Page, "The size of document cannot be bigger than 500KB!");
                            return;
                        }
                        if (flag == 2)
                        {
                            MessageBox.Show(Page, "Document format is limited to (.jpg  .png  .gif .pdf)!");
                            return;
                        }
                        if (flag == 3)
                        {
                            MessageBox.Show(Page, "Fail to upload");
                            return;
                        }
                        model.nvc_ZhuTiFile = urlname;
                        //t_Member mm = DALM.Member_Select_Id(MemberId);
                        //if (mm != null)
                        //{
                        //    if (mm.nvc_ZhuTiFile == null || mm.nvc_ZhuTiFile == "")
                        //    {
                        //        mm.nvc_ZhuTiFile = urlname;
                        //        DALM.Member_Update(mm);
                                
                        //    }                          
                        //}
                    }
                    }
                }
                if (DALT.Trademark_Add(model) > 0)
                {
                    UserLog.AddUserLog(usermember, "商标系统", "添加商标");
                    // string md5num= FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5");
                    Response.Redirect("user_sbAddOk.aspx?ok=success");
                }
                else
                {
                    MessageBox.Show(this.Page, "Fail to add Trademark");
                    //div_a.InnerHtml = "<script>alert('Fail to add Trademark!');<script>";
                }                   
    }
    public int UpfileLoad(FileUpload fileup, int uploadtype, string pathname, string filename,ref string  urlname)
    {
        try
        {
            string exname = Path.GetExtension(fileup.FileName).ToLower();
            string fileNameExt = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
            if (fileNameExt == ".jpg" || fileNameExt == ".png" || fileNameExt == ".gif" || fileNameExt == ".pdf")
            {
                if (fileup.PostedFile.ContentLength > 1024 * 1024 * 0.5)
                {
                    return 1;
                }
                string toFileName = DateTime.Now.ToString("HHmmssff") + new Random().Next(100);
                string path = System.AppDomain.CurrentDomain.BaseDirectory + pathname + filename + toFileName + fileNameExt;
                fileup.SaveAs(path);
                urlname = pathname + filename + toFileName + fileNameExt;
                return 0;
            }
            else
            {
                MessageBox.Show(this.Page, "Document format is limited to (.jpg  .png  .gif .pdf)!");
                return 2;
            }
        }
        catch
        {
            return 3;
        }
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