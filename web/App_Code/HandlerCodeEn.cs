using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Text;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;


/// <summary>
///HandlerCodeEn 的摘要说明
/// </summary>
public class HandlerCodeEn
{
    DataZscqDataContext dzdc = new DataZscqDataContext();
    DataMemberDataContext dmdc = new DataMemberDataContext();
    dal_IntegralProduct DALIP = new dal_IntegralProduct();
    dal_Member DALM = new dal_Member();
    dal_Coupon DALC = new dal_Coupon();
    bll_Member BLLM = new bll_Member();
    dal_Trademark DALT = new dal_Trademark();
    dal_IntegralMobile DALIM = new dal_IntegralMobile();
    CookiesShopCart shopcart = new CookiesShopCart();
    dal_Nationality DALN = new dal_Nationality();
    dal_PatentType DALPT = new dal_PatentType();
    dal_PatentFee DALPF = new dal_PatentFee();
    public HandlerCodeEn()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    public void selshouquanguo(HttpContext context)//专利授权国
    {
        var iquery = DALN.Nationality_SelectAll();
        int ck = Convert.ToInt32(context.Request["xuanze"]);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"0\">Please select</option>");
        foreach (var v in iquery)
        {
            if (ck == v.i_Id)
            {
                sb.Append("<option selected=\"selected\" value=\"" + v.i_Id + "\">" + v.nvc_EnName + "</option>");
            }
            else
            {
                sb.Append("<option value=\"" + v.i_Id + "\">" + v.nvc_EnName + "</option>");
            }
        }
        context.Response.Write(sb);
    }
    public void selpatenttype(HttpContext context)//专利类型
    {
        int count = 0;
        int guojiid = Convert.ToInt32(context.Request["selshouquanguoid"]);
        var iquery = DALPT.PatentType_SelectPage(1, 10, guojiid, ref count);
        int ck = Convert.ToInt32(context.Request["xuanze"]);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"0\">Please select</option>");
        if (guojiid != 0)
        {
            foreach (var v in iquery)
            {
                if (ck == v.i_Id)
                {
                    sb.Append("<option selected=\"selected\" value=\"" + v.i_Id + "\">" + v.nvc_EnglishName + "</option>");
                }
                else
                {
                    sb.Append("<option value=\"" + v.i_Id + "\">" + v.nvc_EnglishName + "</option>");
                }
            }
        }
        context.Response.Write(sb);
    }
    public void selniandu(HttpContext context)//年度
    {
        int gid = 0, tid = 0;
        try
        {
            gid = Convert.ToInt32(context.Request["selshouquanguoid"]);
            tid = Convert.ToInt32(context.Request["selpatenttypeid"]);
        }
        catch { }
        string ck = context.Request["xuanze"];
        int count = 0;
        var iquery = DALPF.PatentFee_SelectPage(1, 30, gid, tid, ref count);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"0\">Please select</option>");
        if (tid != 0)
        {
            foreach (var v in iquery)
            {
                if (ck == v.nvc_Year)
                {
                    sb.Append("<option selected=\"selected\" value=\"" + v.nvc_Year + "\">" + v.nvc_Year + "</option>");
                }
                else
                {
                    sb.Append("<option value=\"" + v.nvc_Year + "\">" + v.nvc_Year + "</option>");
                }
            }
        }
        context.Response.Write(sb);
    }
    public void checkCode(HttpContext context)//验证码
    {
        string l_code = context.Request["code"].ToString();
        string l_codes = context.Session["Validate"].ToString();
        if (l_code.Trim() == l_codes.Trim())
        {
            context.Response.Write("1");
        }
        else
        {
            context.Response.Write("0");
        }
    }
    public void login(HttpContext context)//登录
    {
        string l_pageFlag = context.Request["pageFlag"].ToString();
        string l_uName = context.Request["uName"].ToString();
        string l_uPwd = context.Request["uPwd"].ToString();

        string l_code = context.Request["code"].ToString();
        if (context.Session["Validate"] == null)
        {
            context.Response.Write("Verification code is invalid"); return;
        }
        string l_codes = context.Session["Validate"].ToString();
        int l_rememberPwd = Convert.ToInt32(context.Request["rememberPwd"]);
        int l_autoLogin = Convert.ToInt32(context.Request["autoLogin"]);
        int l_id = 0;
        string l_name = "", l_usernum = "", l_flag = "";
        int l_usertype = 0;

        string l_cookies_uid = "", l_cookies_uname = "", l_cookies_ukey = "";

        #region 用户类型
        if (l_pageFlag == "zl")
        {
            l_cookies_uid = "hqht_zl_uid";
            l_cookies_uname = "hqht_zl_uname";
            l_cookies_ukey = "hqht_zl_ukey";
            l_usertype = 1;
        }
        if (l_pageFlag == "sb")
        {
            l_cookies_uid = "hqht_sb_uid";
            l_cookies_uname = "hqht_sb_uname";
            l_cookies_ukey = "hqht_sb_ukey";
            l_usertype = 2;
        }
        #endregion

        if (l_code.Trim() == l_codes.Trim())
        {
            if (StringHelper.CheckJsAndHtmlKeyWord(l_uPwd) == false)
            {
                // var member = DALM.Member_Login(l_uName, l_uPwd, l_usertype); 
                if (DALM.Member_Login(l_uName, l_uPwd, ref l_id, l_usertype, ref l_name, ref l_usernum, ref l_flag))
                {
                    //l_id = member.i_Id;
                    //l_name = member.nvc_Name;
                    //l_usernum = member.nvc_UserNum;
                    //context.Response.Cookies["hqhtshop"]["email"] = member.nvc_Email;//
                    context.Response.Cookies["hqhtshop"][l_cookies_uid] = l_id.ToString();//记住状态
                    context.Response.Cookies["hqhtshop"]["hqht_user_type"] = l_pageFlag;
                    context.Response.Cookies["hqhtshop"]["hqht_user_flag"] = l_flag;
                    if (l_pageFlag == "zl")
                    {
                        UserLog.AddUserLog(l_id, "专利系统", "登录专利系统");
                    }
                    else
                    {
                        UserLog.AddUserLog(l_id, "商标系统", "登录商标系统");
                    }
                    if (l_rememberPwd == 1)//记住用户名
                    {
                        context.Response.Cookies["hqhtshop"][l_cookies_uname] = System.Web.HttpUtility.UrlEncode(l_uName);
                        context.Response.Cookies["hqhtshop"].Expires = DateTime.Now.AddDays(14);
                    }
                    else
                    {
                        context.Response.Cookies["hqhtshop"][l_cookies_uname] = "";
                    }
                    if (l_autoLogin == 1)//自动登录
                    {
                        context.Response.Cookies["hqhtshop"][l_cookies_uname] = System.Web.HttpUtility.UrlEncode(l_uName);
                        context.Response.Cookies["hqhtshop"][l_cookies_ukey] = System.Web.HttpUtility.UrlEncode(l_uPwd.Md5Encrypt());
                        context.Response.Cookies["hqhtshop"].Expires = DateTime.Now.AddDays(14);
                    }
                    else
                    {
                        context.Response.Cookies["hqhtshop"][l_cookies_ukey] = "";
                    }
                    t_Member model = DALM.Member_Select_Id(l_id);
                    if (model.i_UserTypeId == 3)
                    {
                        if (l_pageFlag == "sb")
                        {
                            if ((model.nvc_DaiLiName == "" || model.nvc_DaiLiName == null) || (model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null))
                            {
                                context.Response.Write("wanshanziliao");
                            }
                            else
                            {
                                context.Response.Write("登陆成功");
                            }
                        }
                        else
                        {
                            context.Response.Write("登陆成功");
                        }

                    }
                    else if (model.i_UserTypeId == 2)
                    {
                        if (l_pageFlag == "sb")
                        {
                            if (model.i_GuoJiId == 1)
                            {
                                if ((model.nvc_Company == "" || model.nvc_Company == null) || (model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null))
                                {
                                    context.Response.Write("wanshanziliao");
                                }
                                else
                                {
                                    context.Response.Write("登陆成功");
                                }
                            }
                            else
                            {
                                if ((model.nvc_EnCompany == "" || model.nvc_EnCompany == null) || (model.nvc_EnglishName == "" || model.nvc_EnglishName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null))
                                {
                                    context.Response.Write("wanshanziliao");
                                }
                                else
                                {
                                    context.Response.Write("登陆成功");
                                }
                            }
                        }
                        else
                        {
                            context.Response.Write("登陆成功");
                        }
                    }
                    else if (model.i_UserTypeId == 1)
                    {
                        if (l_pageFlag == "sb")
                        {
                            if (model.i_GuoJiId == 1)
                            {
                                if ((model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_IDCard == "" || model.nvc_IDCard == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null))
                                {
                                    context.Response.Write("wanshanziliao");
                                }
                                else
                                {
                                    context.Response.Write("登陆成功");
                                }
                            }
                            else
                            {
                                if ((model.nvc_EnglishName == "" || model.nvc_EnglishName == null) || (model.nvc_IDCard == "" || model.nvc_IDCard == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null))
                                {
                                    context.Response.Write("wanshanziliao");
                                }
                                else
                                {
                                    context.Response.Write("登陆成功");
                                }
                            }
                        }
                        else
                        {
                            context.Response.Write("登陆成功");
                        }
                    }

                }
                else
                {
                    context.Response.Write("Account or password error");
                }
            }
            else
            {
                context.Response.Write("Please do not enter illegal characters");
            }
        }
        else
        {
            context.Response.Write("Incorrect verification code");
        }
    }
    public void register(HttpContext context)//注册
    {
        string r_pageFlag = context.Request["pageFlag"].ToString();
        string r_uName = context.Request["uName"].ToString();
        string r_uPwd = context.Request["uPwd"].ToString();
        r_uPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(r_uPwd, "MD5");
        int r_uType = Convert.ToInt32(context.Request["uType"]);
        int r_uGuoJi = Convert.ToInt32(context.Request["uGuoJi"]);
        string r_uEmail = context.Request["uEmail"].ToString();
        string r_cookies_uid = "";
        if (StringHelper.CheckSqlKeyWord(r_uName) == false && StringHelper.CheckJsAndHtmlKeyWord(r_uName) == false)
        {
            #region 设置用户信息
            t_Member rModel = new t_Member();
            rModel.nvc_Email = r_uEmail;
            rModel.nvc_Name = r_uName;
            rModel.nvc_PassWord = r_uPwd;
            rModel.i_GuoJiId = r_uGuoJi;
            if (r_uGuoJi == 1)
            {
                rModel.i_CountryId = 1;
            }
            else
            {
                rModel.i_CountryId = 2;
            }
            rModel.i_UserTypeId = r_uType;
            rModel.i_Grade = 1;
            rModel.nvc_Power = "1,1,1,1";
            rModel.nvc_MobilePhone = "";
            rModel.i_ReceiveEmail = 1;
            switch (r_pageFlag)
            {
                case "zl":
                    r_cookies_uid = "hqht_zl_uid";
                    rModel.i_MemberType = 1;
                    break;
                case "sb":
                    r_cookies_uid = "hqht_sb_uid";
                    rModel.i_MemberType = 2;
                    break;
                default:
                    context.Response.Write("Missing type"); context.Response.End();
                    break;
            }
            rModel.nvc_UserNum = DALM.SetMemberNumber(rModel.i_MemberType, Convert.ToInt32(rModel.i_UserTypeId), Convert.ToInt32(rModel.i_GuoJiId));
            rModel.nvc_Flag = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile("yghdnet.com" + rModel.nvc_UserNum, "MD5") + "-" + Guid.NewGuid();
            #endregion

            int returnId = 0;
            string returnName = "";
            int count = 0;
            int ret = BLLM.Member_Add(rModel, ref returnId, ref returnName, ref count);
            switch (ret)
            {
                case 1:
                    context.Response.Cookies["hqhtshop"][r_cookies_uid] = returnId.ToString();
                    context.Response.Cookies["hqhtshop"]["hqht_user_type"] = r_pageFlag;
                    context.Response.Cookies["hqhtshop"]["hqht_user_flag"] = rModel.nvc_Flag;
                    #region 发送邮件
                    dal_SystemKey DALSK = new zscq.DAL.dal_SystemKey();
                    dal_TrademarkOrder DALTO = new zscq.DAL.dal_TrademarkOrder();
                    string language = "en";
                    t_SystemKey model = DALSK.SystemKey_Select_Key("smtp", language);
                    string send_fromserver = model.nt_Value;//邮件服务器
                    model = DALSK.SystemKey_Select_Key("smtp_username", language);
                    string send_fromloginname = model.nt_Value;//邮件登录名
                    model = DALSK.SystemKey_Select_Key("smtp_password", language);
                    string send_frompwd = model.nt_Value;//邮件密码
                    model = DALSK.SystemKey_Select_Key("smtp_email", language);
                    string send_from = model.nt_Value;//发送人邮件地址
                    model = DALSK.SystemKey_Select_Key("smtp_name", language);
                    string send_fromname = model.nt_Value;//发送人显示名称
                    string send_fromto = r_uEmail;//发送给谁（邮件地址）
                    string send_fromtitle = "";//标题
                    string send_fromcontent = "";//内容

                    if (rModel.i_MemberType == 1)//专利注册
                    {
                        t_SystemKey model_1 = DALSK.SystemKey_Select_Key("is_smtp", language);
                        if (model_1.i_Value == 1)
                        {
                            t_SystemKey model_11 = DALSK.SystemKey_Select_Key("register_title", language);
                            send_fromtitle = model_11.nt_Value;
                            model_11 = DALSK.SystemKey_Select_Key("register_body", language);
                            send_fromcontent = model_11.nt_Value;
                            send_fromcontent = send_fromcontent.Replace("UserName", rModel.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", rModel.nvc_UserNum);

                            #region 插入流水
                            dal_Email DALE = new dal_Email();
                            t_EmailNote ten = new t_EmailNote();
                            ten.nvc_Email = send_fromto;
                            ten.nvc_MemberName = rModel.nvc_Name;
                            ten.nvc_Title = send_fromtitle;
                            ten.nvc_EmailContent = send_fromcontent;
                            ten.nvc_EmailState = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");
                            ten.i_systemType = 1;
                            ten.i_MemberId = rModel.i_Id;
                            ten.nvc_Language = "en";
                            DALE.EmailNote_Add(ten);
                            #endregion
                        }
                    }
                    if (rModel.i_MemberType == 2)//商标注册
                    {
                        t_SystemKey model_1 = DALSK.SystemKey_Select_Key("sb_is_smtp", language);
                        if (model_1.i_Value == 1)
                        {
                            t_SystemKey model_11 = DALSK.SystemKey_Select_Key("sb_register_title", language);
                            send_fromtitle = model_11.nt_Value;
                            model_11 = DALSK.SystemKey_Select_Key("sb_register_body", language);
                            send_fromcontent = model_11.nt_Value;
                            send_fromcontent = send_fromcontent.Replace("UserName", rModel.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", rModel.nvc_UserNum);
                            #region 插入流水
                            dal_Email DALE = new dal_Email();
                            t_EmailNote ten = new t_EmailNote();
                            ten.nvc_Email = send_fromto;
                            ten.nvc_MemberName = rModel.nvc_Name;
                            ten.nvc_Title = send_fromtitle;
                            ten.nvc_EmailContent = send_fromcontent;
                            ten.nvc_EmailState = Email.Mail(send_from, send_fromname, send_fromto, send_fromtitle, send_fromcontent, send_fromloginname, send_frompwd, send_fromserver, "");
                            ten.i_systemType = 2;
                            ten.i_MemberId = rModel.i_Id;
                            ten.nvc_Language = "en";
                            DALE.EmailNote_Add(ten);
                            #endregion
                        }
                    }
                    #endregion
                    #region 发送短信
                    //bll_Message BLLMS = new bll_Message();
                    //dal_Message dalm = new dal_Message();
                    //if (rModel.i_MemberType == 1)//专利注册
                    //{
                    //    t_SystemKey model_1 = DALSK.SystemKey_Select_Key("i_Register", language);
                    //    if (model_1.i_Value == 1)
                    //    {
                    //        model_1 = DALSK.SystemKey_Select_Key("nvc_Register", language);
                    //        //bool TorF = false;
                    //        //BLLMS.Message_Add("手机号", model_1.nt_Value, "注册专利会员", rModel.i_Id, 1, ref TorF);
                    //        #region 插入流水
                    //        t_MessageNote tm = new t_MessageNote();
                    //        tm.i_MemberId = rModel.i_Id;
                    //        tm.i_systemType = 1;
                    //        tm.nvc_Content = model_1.nt_Value;
                    //        tm.nvc_Language = "en";
                    //        tm.nvc_PhoneNumber = "未知";
                    //        tm.nvc_NoteState = "发送失败";
                    //        tm.nvc_NoteType = "注册专利会员";
                    //        dalm.MessageNote_Add(tm);
                    //        #endregion
                    //    }
                    //}
                    //if (rModel.i_MemberType == 2)//商标注册
                    //{
                    //    t_SystemKey model_1 = DALSK.SystemKey_Select_Key("i_Register_sb", language);
                    //    if (model_1.i_Value == 1)
                    //    {
                    //        model_1 = DALSK.SystemKey_Select_Key("nvc_Register_sb", language);
                    //        //bool TorF = false;
                    //        //BLLMS.Message_Add("手机号", model_1.nt_Value, "注册商标会员", rModel.i_Id, 1, ref TorF);
                    //        #region 插入流水
                    //        t_MessageNote tm = new t_MessageNote();
                    //        tm.i_MemberId = rModel.i_Id;
                    //        tm.i_systemType = 2;
                    //        tm.nvc_Content = model_1.nt_Value;
                    //        tm.nvc_Language = "en";
                    //        tm.nvc_PhoneNumber = "未知";
                    //        tm.nvc_NoteState = "发送失败";
                    //        tm.nvc_NoteType = "注册商标会员";
                    //        dalm.MessageNote_Add(tm);
                    //        #endregion
                    //    }
                    //}
                    #endregion
                    UserLog.AddUserLog(rModel.i_Id, "用户注册", "注册新用户");
                    if (count > 0)
                    {
                        context.Response.Write("2;;;;;Register successfully! The system donates " + count + " coupons to you and please use it soon!");
                    }
                    else
                    {
                        context.Response.Write("1;;;;;Successful registration!");
                    }
                    break;
                case 2:
                    context.Response.Write("0;;;;;Username already exists!");
                    break;
                case 3:
                    context.Response.Write("0;;;;;Email is already registered!");
                    break;
                case 4:
                    context.Response.Write("0;;;;;Phone number already exists!");
                    break;
                case 5:
                    context.Response.Write("0;;;;;User No. already exists!");
                    break;
                default:
                    context.Response.Write("0;;;;;System is busy, please wait...");
                    break;
            }
        }
        else
        {
            context.Response.Write("0;;;;;Please do not enter illegal characters!");
        }
    }
    public void qlyqx(HttpContext context)
    {
        int pId = int.Parse(context.Request["patentTypeId"].ToString());
        int yaoqiuxiang = 0;
        var result1 = from r1 in dzdc.t_PatentType where r1.i_Id == pId select r1;
        foreach (var r1 in result1)
        {
            yaoqiuxiang = r1.i_QuanLiYaoQiu;
        }
        context.Response.Write(yaoqiuxiang);
    }
    public void jiaofei(HttpContext context)
    {
        string pid = context.Request["CheckValue"].ToString();
        StringBuilder SB_pids = new StringBuilder();
        if (context.Request["SelectType"].ToString() == "check")
        {
            if (context.Request.Cookies["hqht_patentidstr"] != null)
            {
                SB_pids.Append(context.Request.Cookies["hqht_patentidstr"].Value);
            }
            if (pid.IndexOf(',') == -1)
            {
                SB_pids.Append("|" + pid + ",1");
            }
            else
            {
                string[] pidlist = pid.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < pidlist.Length; i++)
                {
                    if (SB_pids.ToString().IndexOf("|" + pidlist[i] + ",") == -1)
                    {
                        SB_pids.Append("|" + pidlist[i] + ",1");
                    }
                }
            }
            context.Response.Cookies["hqht_patentidstr"].Value = SB_pids.ToString();
        }
        if (context.Request["SelectType"].ToString() == "nocheck")
        {
            string getpidstr = context.Request.Cookies["hqht_patentidstr"].Value;
            if (pid.IndexOf(',') == -1)
            {
                SB_pids.Append((getpidstr).Replace("|" + pid + ",1", ""));
            }
            else
            {
                string[] pidlist = pid.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < pidlist.Length; i++)
                {
                    getpidstr = getpidstr.Replace("|" + pidlist[i] + ",1", "");
                }
                SB_pids.Append(getpidstr);
            }
            context.Response.Cookies["hqht_patentidstr"].Value = SB_pids.ToString();
        }
        context.Response.Write(SB_pids.ToString());
    }
    public void sbjiaofei(HttpContext context)
    {
        string Tid = context.Request["CheckValue"].ToString();
        StringBuilder SB_Sids = new StringBuilder();
        if (context.Request["SelectType"].ToString() == "check")
        {
            if (context.Request.Cookies["hqht_Trademarktidstr"] != null)
            {
                SB_Sids.Append(context.Request.Cookies["hqht_Trademarktidstr"].Value);
            }
            if (Tid.IndexOf(',') == -1)
            {
                SB_Sids.Append("|" + Tid + ",1");
            }
            else
            {
                string[] Tidlist = Tid.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < Tidlist.Length; i++)
                {
                    if (SB_Sids.ToString().IndexOf("|" + Tidlist[i] + ",") == -1)
                    {
                        SB_Sids.Append("|" + Tidlist[i] + ",1");
                    }
                }
            }
            context.Response.Cookies["hqht_Trademarktidstr"].Value = SB_Sids.ToString();
        }
        if (context.Request["SelectType"].ToString() == "nocheck")
        {
            string getpidstr = context.Request.Cookies["hqht_Trademarktidstr"].Value.ToString();
            if (Tid.IndexOf(',') == -1)
            {
                SB_Sids.Append((getpidstr + "|").Replace("|" + Tid + ",1" + "|", "|").ToString().TrimEnd('|'));
            }
            else
            {
                string[] pidlist = Tid.Split(new[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < pidlist.Length; i++)
                {
                    getpidstr = getpidstr.Replace("|" + pidlist[i] + ",1", "");
                }
                SB_Sids.Append(getpidstr);
            }
            context.Response.Cookies["hqht_Trademarktidstr"].Value = SB_Sids.ToString();
        }
        context.Response.Write(SB_Sids.ToString());
    }


    public void sbMaxDays(HttpContext context)
    {
        if (context.Request["SelectType"].ToString() == "maxjiaofei")
        {
            string patentid = context.Request.Cookies["hqht_Trademarktidstr"].Value.ToString();
            string tidstr = ",", info = "";
            string[] arr_pid = patentid.Split('|');
            for (var i = 0; i < arr_pid.Length; i++)
            {
                if (arr_pid[i] != "")
                {
                    tidstr += arr_pid[i].Split(',')[0] + ",";
                }
            }
            var iquery = (from a in DALT.Trademark_SelectAll() where tidstr.IndexOf("," + a.i_Id.ToString() + ",") > -1 && a.i_IsPayState == 2 orderby a.i_ShengDays descending select a).Take(1);
            if (iquery.Count() > 0)
            {

                foreach (var item in iquery)
                {
                    if (item.nvc_SBRegNum != null)
                    {
                        info = "It is still long time to renew the Trademark No. " + item.nvc_SBRegNum + ", which is" + item.i_ShengDays + " days before the deadline";
                    }
                }
                context.Response.Write(info);
            }
            else
            {
                context.Response.Write("1");//没有缴费过的商标
            }
        }

    }
    public void guoji(HttpContext context)
    {
        if (context.Request.Cookies["hqhtshop"] != null && context.Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && context.Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            int uId = Convert.ToInt32(context.Request.Cookies["hqhtshop"]["hqht_zl_uid"]);
            if (DALM.Member_Select_Id(uId).i_GuoJiId == 1)
            {
                context.Response.Write("false");
            }
            else
            {
                context.Response.Write("true");
            }
        }
    }
    public void youhuiquan(HttpContext context)
    {
        if (context.Request.Cookies["hqhtshop"] != null && context.Request.Cookies["hqhtshop"]["hqht_zl_uid"] != null && context.Request.Cookies["hqhtshop"]["hqht_zl_uid"].ToString() != "")
        {
            int i_where = 0, i_money = 0;
            int cId = Convert.ToInt32(context.Request["selvalue"]);
            vw_Coupon vw_cp = DALC.VwCoupon_Select_Id(cId);
            if (vw_cp != null)
            {
                i_where = Convert.ToInt32(vw_cp.i_Where);
                i_money = Convert.ToInt32(vw_cp.i_Money);
            }
            string json = string.Format("{{ i_where:'{0}', i_money:'{1}'}}", i_where, i_money);
            context.Response.Write(json);
        }
    }
    public void findpwd(HttpContext context)//找回密码
    {
        string mode = context.Request["m"];//1 短信  2 邮箱
        string username = context.Request["u"];//用户名
        int utype = context.Request["p"] == "zl" ? 1 : context.Request["p"] == "sb" ? 2 : 0;// 用户类型  1.专利 2.商标
        if (string.IsNullOrWhiteSpace(context.Request["m"]) || string.IsNullOrWhiteSpace(context.Request["u"]) || string.IsNullOrWhiteSpace(context.Request["p"]))
        {
            context.Response.Write("0;;;;;Abnormal parameter request！");
            return;
        }
        if (context.Session["Validate"] != null)
        {
            string checkv = context.Session["Validate"].ToString().ToLower();
            bll_Message BLLMS = new bll_Message();
            bll_Email BLLE = new bll_Email();
            dal_Member DALM = new dal_Member();
            string scontent = "Dear Client of Global Patent, you are proceeding the operation of retrieving password, please check the verification code is " + checkv + ".We kindly advise you to enter the verification code soon for the modification of your password in case of unexpected expiry.";
            t_Member model = DALM.Member_Select_Name(username, utype);
            if (model == null)
            {
                context.Response.Write("0;;;;;No Username can be found！");
                return;
            }
            #region 手机找回
            if (mode == "1")
            {
                if (string.IsNullOrWhiteSpace(model.nvc_MobilePhone))
                {
                    context.Response.Write("0;;;;;Not bound mobile number！");
                    return;
                }
                bool TorF = false;
                BLLMS.Message_Add(model.nvc_MobilePhone, scontent, "Forgot your password sent verification code", model.i_Id, ref TorF);
                if (TorF)
                {
                    context.Response.Write("1;;;;;Verification code has been sent to your phone " + model.nvc_MobilePhone.MobilePhoneReplaceX() + "，please note that check messages, if not receive text messages, you can re-send after 60 seconds！");
                    return;
                }
                else
                {
                    context.Response.Write("0;;;;;Failed to send the verification code! Please contact customer service to change the password！");
                    return;
                }
            }
            #endregion
            #region 邮箱找回
            if (mode == "2")
            {
                if (string.IsNullOrWhiteSpace(model.nvc_Email))
                {
                    context.Response.Write("0;;;;;Not bound Email！");
                    return;
                }
                bool TorF = false;
                BLLE.Email_Add(model.nvc_Email, "Global Remittance Forget password verification code", scontent, model.i_Id, ref TorF, "en");
                if (TorF)
                {
                    context.Response.Write("1;;;;;Verification code has been sent to the mailbox" + model.nvc_Email.EmailReplaceX() + "，please note that, if you do not receive the mail, you can re-send after 60 seconds！");
                    return;
               } 
                else
                {
                    context.Response.Write("0;;;;;Failed to send e-mail! Please contact customer service to change the password！");
                    return;
                }
            }
            #endregion

            context.Response.Write("0;;;;;Abnormal parameter request！");
        }
        else
        {
            context.Response.Write("0;;;;;Verification code has expired！");
        }
    }
    public void cartaddproduct(HttpContext context)//为购物车添加商品
    {
        try
        {
            int pid = int.Parse(context.Request.Form["PId"]);
            int number = int.Parse(context.Request.Form["Number"]);
            int count = 0, price = 0, allcount = 0, allprice = 0;
            int ret = shopcart.Add_ShopCart(pid, number, ref count, ref price, ref allcount, ref allprice);
            context.Response.Write(count + "," + price + "," + allprice + ',' + ret);
        }
        catch
        { context.Response.Write(""); }
    }
    public void cartsubproduct(HttpContext context)//为购物车减少商品
    {
        try
        {
            int pid = int.Parse(context.Request.Form["PId"]);
            int number = int.Parse(context.Request.Form["Number"]);
            int count = 0, price = 0, allcount = 0, allprice = 0;
            int ret = shopcart.Sub_ShopCart(pid, number, ref count, ref price, ref allcount, ref allprice);
            context.Response.Write(count + "," + price + "," + allprice + ',' + ret);
        }
        catch
        { context.Response.Write(""); }
    }
    /// <summary>
    /// 验证用户名是否存在
    /// </summary>
    /// <param name="context"></param>
    public void validateName(HttpContext context)
    {
        string r_uName = context.Request["uName"].ToString();
        int mtype = Convert.ToInt32(context.Request["membertype"]);
        IQueryable<t_Member> result = from i in dmdc.t_Member where i.nvc_Name == r_uName && i.i_MemberType == mtype select i;
        if (result.Count() > 0)
        {
            context.Response.Write("1");
        }
    }
    /// <summary>
    /// 验证手机号是否存在
    /// </summary>
    /// <param name="context"></param>
    public void validateNamePhone(HttpContext context)
    {
        string r_uName = context.Request["uName"].ToString();
        int mtype = Convert.ToInt32(context.Request["membertype"]);
        if (context.Request["memberId"] != null && context.Request["memberId"].ToString() != "")
        {
            int id = Convert.ToInt32(context.Request["memberId"]);
            IQueryable<t_Member> result = from i in dmdc.t_Member where i.nvc_MobilePhone == r_uName && i.i_MemberType == mtype && i.i_Id != id select i;
            if (result.Count() > 0)
            {
                context.Response.Write("1");
            }
        }
        else
        {
            IQueryable<t_Member> result = from i in dmdc.t_Member where i.nvc_MobilePhone == r_uName && i.i_MemberType == mtype select i;
            if (result.Count() > 0)
            {
                context.Response.Write("1");
            }
        }
    }
    /// <summary>
    /// 验证邮箱是否存在
    /// </summary>
    /// <param name="context"></param>
    public void validateNameEmail(HttpContext context)
    {
        string r_uName = context.Request["uName"].ToString();
        int mtype = Convert.ToInt32(context.Request["membertype"]);
        if (context.Request["memberId"] != null && context.Request["memberId"].ToString() != "")
        {
            int id = Convert.ToInt32(context.Request["memberId"]);
            IQueryable<t_Member> result = from i in dmdc.t_Member where i.nvc_Email == r_uName && i.i_MemberType == mtype && i.i_Id != id select i;
            if (result.Count() > 0)
            {
                context.Response.Write("1");
            }
        }
        else
        {
            IQueryable<t_Member> result = from i in dmdc.t_Member where i.nvc_Email == r_uName && i.i_MemberType == mtype select i;
            if (result.Count() > 0)
            {
                context.Response.Write("1");
            }
        }
    }

    public void AddFaq(HttpContext context)
    {
        string subTitle = context.Request["ipt_subtitle"].ToString();
        string email = context.Request["ipt_email"].ToString();
        string conten = context.Request["txt_content"].ToString();
        if (!PageValidate.IsEmail(email))
        {
            context.Response.Write("Please enter a valid e-mail address");
            return;
        }
        if (StringHelper.CheckSqlKeyWord(subTitle) || StringHelper.CheckSqlKeyWord(conten))
        {
            context.Response.Write("The characters you entered does not meet specifications, please check and re-enter！");
            return;
        }
        if (StringHelper.CheckJsAndHtmlKeyWord(subTitle) || StringHelper.CheckJsAndHtmlKeyWord(conten))
        {
            context.Response.Write("The characters you entered does not meet specifications, please check and re-enter！");
            return;
        }
        if (conten.Length > 500)
        {
            context.Response.Write("Not exceed 500 characters！");
            return;
        }
        t_OnlineMessage model = new t_OnlineMessage();
        model.dt_AddTime = DateTime.Now;
        model.i_IsTop = 0;
        model.nvc_SubTitle = HttpUtility.HtmlEncode(subTitle);
        model.nvc_AdvisoryContent = HttpUtility.HtmlEncode(conten);
        model.nvc_Email = HttpUtility.HtmlEncode(email);
		model.i_weizhi = 1;
        model.i_IsRecommend = 1;
        model.i_Replay = 0;
        model.nvc_Language = "en";
        dal_OnlineMessage DALOM = new dal_OnlineMessage();
        if (DALOM.OnlineMessage_Add(model) > 0)
            context.Response.Write("ok");
        else
            context.Response.Write("Message sending failed");

    }

    //积分账户登录
    public void checkjfphone(HttpContext context)
    {
        string mobile = context.Request["mobile"].Trim();

        #region 是否存在手机号

        t_IntegralMobile m_im = DALIM.IntegralMobile_SelectByMobile(mobile);
        if (m_im != null)
        {
            context.Response.Write("1"); return;
        }
        else
        {
            context.Response.Write("0"); return;
        }

        #endregion

    }
    public void sbjflogin(HttpContext context)
    {

        if (context.Request.Cookies["hqhtshop"] == null || context.Request.Cookies["hqhtshop"]["hqht_sb_uid"] == null || context.Request.Cookies["hqhtshop"]["hqht_sb_uid"] == "")
        {
            context.Response.Write("Please login the trademark system");
        }
        else
        {
            int uId = context.Request.Cookies["hqhtshop"]["hqht_sb_uid"].GetInt();
            string flag = context.Request.Cookies["hqhtshop"]["hqht_user_flag"].ToString();

            string uPwd = context.Request["password"].Trim().Md5Encrypt();
            string mobile = context.Request["mobile"].Trim();
            string type = context.Request["type"].Trim();

            var member = DALM.Member_Select_Id(uId, flag);
            if (member != null)
            {
                if (type == "1")//直接登录
                {
                    #region 直接登录
                    if (member.i_IntegralMobileId != 0)
                    {
                        t_IntegralMobile m_im = DALIM.IntegralMobile_SelectById(member.i_IntegralMobileId);
                        if (m_im != null)
                        {
                            #region 积分账户直接登录
                            if (m_im.nvc_Password == uPwd && m_im.nvc_Mobile == mobile)
                            {
                                #region 登录
                                HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                                cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                                cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                                cookie.Values["hqht_user_type"] = "sb";
                                context.Response.Cookies.Set(cookie);
                                UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                                context.Response.Write("1");
                                #endregion
                            }
                            else
                            {
                                context.Response.Write("Your mobile phone number or password is incorrect!"); return;
                            }
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("No binding points account"); return;
                        }
                    }
                    else
                    {
                        context.Response.Write("No binding points account"); return;
                    }
                    #endregion
                }
                if (type == "2")
                {
                    #region 绑定登录
                    if (member.i_IntegralMobileId != 0)
                    {
                        t_IntegralMobile m_oldim = DALIM.IntegralMobile_SelectById(member.i_IntegralMobileId);
                        m_oldim.i_sbuid = 0;
                    }

                    t_IntegralMobile m_im = DALIM.IntegralMobile_SelectByMobile(mobile);
                    if (m_im != null)//绑定已有帐号
                    {
                        #region 绑定已有帐号
                        if (m_im.nvc_Mobile == mobile && m_im.nvc_Password == uPwd)
                        {
                            if (m_im.i_sbuid == 0)
                            {
                                m_im.i_sbuid = uId;
                                DALIM.IntegralMobile_Updata();
                            }
                            else //转移账户
                            {
                                var oldmember = DALM.Member_Select_Id(m_im.i_sbuid);
                                if (oldmember != null)
                                {
                                    oldmember.i_IntegralMobileId = 0;
                                } 
                                m_im.i_sbuid = member.i_Id;
                                DALIM.IntegralMobile_Updata();
                            }

                            member.i_IntegralMobileId = m_im.i_Id;
                            DALM.Member_Update();

                            #region 登录
                            HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                            cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                            cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                            cookie.Values["hqht_user_type"] = "sb";
                            context.Response.Cookies.Set(cookie);
                            UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                            context.Response.Write("1");
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("Your mobile phone number or password is incorrect!");
                        }
                        #endregion
                    }
                    else//开通新帐号
                    {
                        #region 开通新帐号
                        m_im = new t_IntegralMobile();
                        m_im.i_sbuid = member.i_Id;
                        m_im.nvc_Mobile = mobile;
                        m_im.nvc_Password = uPwd;
                        DALIM.IntegralMobile_Add(m_im);

                        member.i_IntegralMobileId = m_im.i_Id;
                        DALM.Member_Update(member);
                        #endregion

                        #region 登录
                        HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                        cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                        cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                        cookie.Values["hqht_user_type"] = "sb";
                        context.Response.Cookies.Set(cookie);
                        UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                        context.Response.Write("1");
                        #endregion
                    }


                    #endregion
                }
            }
        }



    }
    public void zljflogin(HttpContext context)
    {

        if (context.Request.Cookies["hqhtshop"] == null || context.Request.Cookies["hqhtshop"]["hqht_zl_uid"] == null || context.Request.Cookies["hqhtshop"]["hqht_zl_uid"] == "")
        {
            context.Response.Write("Please login the patent system");
        }
        else
        {
            int uId = context.Request.Cookies["hqhtshop"]["hqht_zl_uid"].GetInt();
            string flag = context.Request.Cookies["hqhtshop"]["hqht_user_flag"].ToString();

            string uPwd = context.Request["password"].Trim().Md5Encrypt();
            string mobile = context.Request["mobile"].Trim();
            string type = context.Request["type"].Trim();

            var member = DALM.Member_Select_Id(uId, flag);
            if (member != null)
            {
                if (type == "1")//直接登录
                {
                    #region 直接登录
                    if (member.i_IntegralMobileId != 0)
                    {
                        t_IntegralMobile m_im = DALIM.IntegralMobile_SelectById(member.i_IntegralMobileId);
                        if (m_im != null)
                        {
                            #region 积分账户直接登录
                            if (m_im.nvc_Password == uPwd && m_im.nvc_Mobile == mobile)
                            {
                                #region 登录
                                HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                                cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                                cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                                cookie.Values["hqht_user_type"] = "zl";
                                context.Response.Cookies.Set(cookie);
                                UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                                context.Response.Write("1");
                                #endregion
                            }
                            else
                            {
                                context.Response.Write("Your mobile phone number or password is incorrect!"); return;
                            }
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("No binding points account"); return;
                        }
                    }
                    else
                    {
                        context.Response.Write("No binding points account"); return;
                    }
                    #endregion
                }
                if (type == "2")
                {
                    #region 绑定登录
                    if (member.i_IntegralMobileId != 0)
                    {
                        t_IntegralMobile m_oldim = DALIM.IntegralMobile_SelectById(member.i_IntegralMobileId);
                        m_oldim.i_zluid = 0;
                    }
                    t_IntegralMobile m_im = DALIM.IntegralMobile_SelectByMobile(mobile);
                    if (m_im != null)//绑定已有帐号
                    {
                        #region 绑定已有帐号
                        if (m_im.nvc_Mobile == mobile && m_im.nvc_Password == uPwd)
                        {
                            if (m_im.i_zluid == 0)
                            {
                                m_im.i_zluid = uId;
                                DALIM.IntegralMobile_Updata();
                            }
                            else //转移账户
                            {
                                var oldmember = DALM.Member_Select_Id(m_im.i_zluid);
                                if (oldmember != null)
                                {
                                    oldmember.i_IntegralMobileId = 0;
                                } 
                                m_im.i_zluid = member.i_Id;
                                DALIM.IntegralMobile_Updata();
                            }
                            member.i_IntegralMobileId = m_im.i_Id;
                            DALM.Member_Update(); 

                            #region 登录
                            HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                            cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                            cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                            cookie.Values["hqht_user_type"] = "zl";
                            context.Response.Cookies.Set(cookie);
                            UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                            context.Response.Write("1");
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("Your mobile phone number or password is incorrect!");
                        }
                        #endregion
                    }
                    else//开通新帐号
                    {
                        #region 开通新帐号
                        m_im = new t_IntegralMobile();
                        m_im.i_zluid = member.i_Id;
                        m_im.nvc_Mobile = mobile;
                        m_im.nvc_Password = uPwd;
                        DALIM.IntegralMobile_Add(m_im);

                        member.i_IntegralMobileId = m_im.i_Id;
                        DALM.Member_Update(member);
                        #endregion

                        #region 登录
                        HttpCookie cookie = context.Request.Cookies["hqhtshop"];
                        cookie.Values["hqht_shop_mid"] = member.i_IntegralMobileId.ToString();
                        cookie.Values["hqht_shop_uid"] = member.i_Id.ToString();
                        cookie.Values["hqht_user_type"] = "zl";
                        context.Response.Cookies.Set(cookie);
                        UserLog.AddUserLog(member.i_Id, "商城系统", "登录商城");
                        context.Response.Write("1");
                        #endregion
                    }
                    #endregion
                }
            }
        }



    }


}