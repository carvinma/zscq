using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Script.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;
using System.IO;
using zscq.DAL;
using zscq.Model;
using zscq.BLL;
using System.Data;


/// <summary>
///HandlerCode 的摘要说明
/// </summary>
public class HandlerCode
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
    dal_Address Darea = new dal_Address();
    dal_Apply apply = new dal_Apply();
    dal_Goods goods = new dal_Goods();
    dal_NewTrademark mark = new dal_NewTrademark();
    public HandlerCode()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    #region 商标

    public void GetMainCategory(HttpContext context)
    {
        var lstGoods = goods.MainCategory_SelectAll().ToList();
        //JavaScriptSerializer jss = new JavaScriptSerializer();
        // string JsonStr = jss.Serialize(p);
        string JsonStr = string.Empty;
        DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(lstGoods.GetType());
        using (MemoryStream ms = new MemoryStream())
        {
            serializer.WriteObject(ms, lstGoods);
            JsonStr = Encoding.UTF8.GetString(ms.ToArray());
        }

        context.Response.Write(JsonStr);
    }
    public void GetDetailCategory(HttpContext context)
    {
        string JsonStr = string.Empty;
        if (context.Request["id"] != null && context.Request["id"].ToString() != "")
        {
            var lstGoods = goods.DetailCategory_Select_MainCategoryId(int.Parse(context.Request["id"])).ToList();

            DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(lstGoods.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                serializer.WriteObject(ms, lstGoods);
                JsonStr = Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        context.Response.Write(JsonStr);
    }

    public void GetGoodsByDetailCategoryID(HttpContext context)
    {
        string JsonStr = string.Empty;
        if (context.Request["id"] != null && context.Request["id"].ToString() != "")
        {
            var lstGoods = goods.Goods_Select_DetailCategoryId(int.Parse(context.Request["id"])).ToList();

            DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(lstGoods.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                serializer.WriteObject(ms, lstGoods);
                JsonStr = Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        context.Response.Write(JsonStr);
    }
    public void SearchGoodsDetail(HttpContext context)
    {
        string JsonStr = string.Empty;
        if (context.Request["key"] != null && context.Request["key"].ToString() != ""
            && context.Request["maincategoryid"] != null && context.Request["maincategoryid"].ToString() != "")
        {
            var lstGoods = goods.Goods_SearchDetail(context.Request["key"].ToString(), int.Parse(context.Request["maincategoryid"].ToString())).ToList();

            DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(lstGoods.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                serializer.WriteObject(ms, lstGoods);
                JsonStr = Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        context.Response.Write(JsonStr);
    }

    //拼音下拉选择常用申请人
    public void GetApplyByUserID(HttpContext context)
    {
        string JsonStr = string.Empty;
        if (context.Request["userid"] != null && context.Request["userid"].ToString() != ""
            && context.Request["applytype"] != null && context.Request["applytype"].ToString() != "")
        {
            int userid = int.Parse(context.Request["userid"].ToString());
            int applytype = int.Parse(context.Request["applytype"].ToString());
            var lstApplys = apply.Apply_SelectAll(userid).Where(p => p.ApplyType == applytype).ToList();
            DataContractJsonSerializer serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(lstApplys.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                serializer.WriteObject(ms, lstApplys);
                JsonStr = Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        context.Response.Write(JsonStr);
    }
    public void DelApplyByID(HttpContext context)
    {
        int iResult = 0;
        if (context.Request["id"] != null && context.Request["id"].ToString() != "")
        {
            iResult = apply.Apply_Del(int.Parse(context.Request["id"]));
        }
        context.Response.Write(iResult);
    }

    public void DelTradeMarkListByIds(HttpContext context)
    {
        int iResult = 0;
        try
        {
            if (context.Request["ids"] != null && context.Request["ids"].ToString() != "")
            {
                string[] ids = context.Request["ids"].Split(',');

                using (DataTradeMarkDataContext mark = new DataTradeMarkDataContext())
                {
                    var find = mark.t_NewTradeMarkInfo.Where(p => ids.Contains(p.i_Id.ToString()));
                    mark.t_NewTradeMarkInfo.DeleteAllOnSubmit(find);
                    mark.SubmitChanges();
                    iResult = 1;
                }
            }
        }
        catch
        {
            iResult = 0;
        }
        finally
        {
            context.Response.Write(iResult);
        }
    }

    public void SubmitTradeMarkListByIds(HttpContext context)
    {
        int iResult = 0;
        try
        {
            if (context.Request["ids"] != null && context.Request["ids"].ToString() != ""
                && context.Request["status"] != null && context.Request["status"].ToString() != "")
            {
                string[] ids = context.Request["ids"].Split(',');
                int status = int.Parse(context.Request["status"]);

                using (DataTradeMarkDataContext mark = new DataTradeMarkDataContext())
                {
                    var find = mark.t_NewTradeMarkInfo.Where(p => ids.Contains(p.i_Id.ToString()));

                    foreach (var item in find)
                    {
                        item.Status = status;
                    }
                    mark.SubmitChanges();
                    iResult = 1;
                }
            }
        }
        catch
        {
            iResult = 0;
        }
        finally
        {
            context.Response.Write(iResult);
        }
    }
    public void UploadImg(HttpContext context)
    {

        context.Response.ContentType = "text/plain";
        //接收上传后的文件
        HttpPostedFile file = context.Request.Files["Filedata"];
        //其他参数
        //string somekey = context.Request["someKey"];
        //string other = context.Request["someOtherKey"];
        //获取文件的保存路径
        string uploadPath = HttpContext.Current.Server.MapPath("UploadTemp\\");
        //判断上传的文件是否为空
        if (file != null)
        {
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            //保存文件
            string fileNameExt = System.IO.Path.GetExtension(file.FileName).ToLower();


            string toFileName = DateTime.Now.ToString("yyyyMMddHHmmssff") + new Random().Next(100) + fileNameExt;//fileup.FileName;
            file.SaveAs(uploadPath + toFileName);
            context.Response.Write(toFileName);
        }
        else
        {
            context.Response.Write("0");
        }
    }

    /// <summary>
    /// 商标申请-续展上传委托书、申请书
    /// </summary>
    /// <param name="context"></param>
    public void UploadBookFile(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //接收上传后的文件
        HttpPostedFile file = context.Request.Files["Filedata"];
        string caseType = context.Request.QueryString["caseType"];//0申请 1续展
        string bookType = context.Request.QueryString["bookType"];//0申请书 1-委托书
        string caseNo = context.Request.QueryString["caseNo"];//案件号
        //获取文件的保存路径
        string uploadPath = HttpContext.Current.Server.MapPath("UploadTemp\\");
        //判断上传的文件是否为空
        if (file != null && !string.IsNullOrEmpty(caseType) && !string.IsNullOrEmpty(bookType) && !string.IsNullOrEmpty(caseNo))
        {
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            //保存文件
            string fileNameExt = System.IO.Path.GetExtension(file.FileName).ToLower();

            caseType = caseType == "0" ? "" : "Renewal";
            bookType = bookType == "0" ? "Apply" : "Agent";
            string toFileName = string.Empty;
            toFileName = string.Format("Trademark{0}{1}{2}{3}", caseType, bookType, caseNo, fileNameExt);
            file.SaveAs(uploadPath + toFileName);
            context.Response.Write(toFileName);
        }
        else
        {
            context.Response.Write("0");
        }
    }

    public void MoveBookFile(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string fileName = context.Request["filename"];//
        string caseType = context.Request["caseType"];//0申请 1续展
        string bookType = context.Request["bookType"];//0申请书 1-委托书
        string caseNo = context.Request["caseNo"];//案件号
        // context.Request["flag"]
        if (!string.IsNullOrEmpty(fileName))
        {
            string filePath = "File_Zscq/AccountPDF/";
            FileInfo file = new FileInfo(HttpContext.Current.Server.MapPath("UploadTemp\\" + fileName));
            if (file.Exists)
            {
                string newPath = filePath + "Up" + fileName;
                file.CopyTo(HttpContext.Current.Server.MapPath(newPath), true);
                file.Delete();
                var model= mark.Trademark_Select_ByCaseNo(caseNo);
                if (caseType == "0")
                {
                    switch (bookType)
                    {
                        case "0": model.ApplyUpBook = newPath; break;
                        case "1": model.AgentUpBook = newPath; break;
                    }
                    mark.Trademark_Submit();
                }
                else if (caseType == "1")
                {
                    switch (bookType)
                    {
                        case "0": model.RenewalApplyUpBook = newPath; break;
                        case "1": model.RenewalAgentUpBook = newPath; break;
                    }
                    mark.Trademark_Submit();
                }
                context.Response.Write("1");
            }
            else
                context.Response.Write("0");
        }
        context.Response.Write("0");
    }

    #region 省市区
    public void SelProv(HttpContext context)
    {
        var iquery = Darea.Province_SelectAll();
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"\">请选择</option>");
        foreach (var v in iquery)
        {
            sb.Append("<option value=\"" + v.i_ID + "\">" + v.provinceName + "</option>");
        }
        context.Response.Write(sb);
    }
    public void SelCity(HttpContext context)
    {
        int provinceid = Convert.ToInt32(context.Request["provinceid"]);
        var iquery = Darea.City_Select_ProvinceId(provinceid);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"\">请选择</option>");
        foreach (var v in iquery)
        {
            sb.Append("<option value=\"" + v.i_ID + "\">" + v.cityName + "</option>");
        }
        context.Response.Write(sb);
    }
    public void SelArea(HttpContext context)
    {
        int cityid = Convert.ToInt32(context.Request["cityid"]);
        var iquery = Darea.Area_Select_CityId(cityid);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"\">请选择</option>");
        foreach (var v in iquery)
        {
            sb.Append("<option value=\"" + v.i_ID + "\">" + v.areaName + "</option>");
        }
        context.Response.Write(sb);
    }
    #endregion

    #endregion

    #region

    public void TrademarkStatusddl(HttpContext context)//商标最近状态
    {
        int type = Convert.ToInt32(context.Request["casetype"]);
        List<t_NewTradeMarkStatus> list;
        if (type == 0)
            list = BaseDataUtil.tradeMarkApplyStatuslist.ToList();
        else
            list = BaseDataUtil.tradeMarkRenewedStatuslist.ToList();

        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"-1\">请选择</option>");
        foreach (var v in list)
        {
            sb.Append("<option value=\"" + v.StatusValue + "\">" + v.StatusName + "</option>");
        }
        context.Response.Write(sb);
    }

    public void selshouquanguo(HttpContext context)//专利授权国
    {
        var iquery = DALN.Nationality_SelectAll();
        int ck = Convert.ToInt32(context.Request["xuanze"]);
        StringBuilder sb = new StringBuilder();
        sb.Append("<option value=\"0\">请选择</option>");
        foreach (var v in iquery)
        {
            if (ck == v.i_Id)
            {
                sb.Append("<option selected=\"selected\" value=\"" + v.i_Id + "\">" + v.nvc_Name + "</option>");
            }
            else
            {
                sb.Append("<option value=\"" + v.i_Id + "\">" + v.nvc_Name + "</option>");
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
        sb.Append("<option value=\"0\">请选择</option>");
        if (guojiid != 0)
        {
            foreach (var v in iquery)
            {
                if (ck == v.i_Id)
                {
                    sb.Append("<option selected=\"selected\" value=\"" + v.i_Id + "\">" + v.nvc_Name + "</option>");
                }
                else
                {
                    sb.Append("<option value=\"" + v.i_Id + "\">" + v.nvc_Name + "</option>");
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
        sb.Append("<option value=\"0\">请选择</option>");
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
            context.Response.Write("验证码已失效"); return;
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
                            if ((model.nvc_DaiLiName == "" || model.nvc_DaiLiName == null) || (model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null) || (model.nvc_Address == "" || model.nvc_Address == null) || (model.nvc_ZipCode == "" || model.nvc_ZipCode == null))
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
                                if ((model.nvc_Company == "" || model.nvc_Company == null) || (model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null) || (model.nvc_Address == "" || model.nvc_Address == null) || (model.nvc_ZipCode == "" || model.nvc_ZipCode == null))
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
                                if ((model.nvc_EnCompany == "" || model.nvc_EnCompany == null) || (model.nvc_EnglishName == "" || model.nvc_EnglishName == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null) || (model.nvc_EnAddress == "" || model.nvc_EnAddress == null) || (model.nvc_ZipCode == "" || model.nvc_ZipCode == null))
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
                                if ((model.nvc_RealName == "" || model.nvc_RealName == null) || (model.nvc_IDCard == "" || model.nvc_IDCard == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null) || (model.nvc_Address == "" || model.nvc_Address == null) || (model.nvc_ZipCode == "" || model.nvc_ZipCode == null))
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
                                if ((model.nvc_EnglishName == "" || model.nvc_EnglishName == null) || (model.nvc_IDCard == "" || model.nvc_IDCard == null) || (model.nvc_TelPhone == "" || model.nvc_TelPhone == null) || (model.nvc_EnAddress == "" || model.nvc_EnAddress == null) || (model.nvc_ZipCode == "" || model.nvc_ZipCode == null))
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
                    context.Response.Write("账号或密码错误");
                }
            }
            else
            {
                context.Response.Write("请不要输入非法字符");
            }
        }
        else
        {
            context.Response.Write("验证码不正确");
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
        string r_uPhone = context.Request["uPhone"].ToString();
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
            rModel.nvc_TelPhone = r_uPhone;
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
                    context.Response.Write("缺少类型"); context.Response.End();
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
                    string language = "cn";
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
                            ten.nvc_Language = "cn";
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
                            ten.nvc_Language = "cn";
                            DALE.EmailNote_Add(ten);
                            #endregion
                        }
                    }
                    #endregion
                    #region 发送短信
                    bll_Message BLLMS = new bll_Message();
                    dal_Message dalm = new dal_Message();
                    if (rModel.i_MemberType == 1)//专利注册
                    {
                        t_SystemKey model_1 = DALSK.SystemKey_Select_Key("i_Register", language);
                        if (model_1.i_Value == 1)
                        {
                            model_1 = DALSK.SystemKey_Select_Key("nvc_Register", language);
                            send_fromcontent = model_1.nt_Value;
                            send_fromcontent = send_fromcontent.Replace("UserName", rModel.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", rModel.nvc_UserNum);
                            bool TorF = false;
                            BLLMS.Message_Add("手机号", send_fromcontent, "注册专利会员", rModel.i_Id, 1, ref TorF);
                            #region 插入流水
                            t_MessageNote tm = new t_MessageNote();
                            tm.i_MemberId = rModel.i_Id;
                            tm.i_systemType = 1;
                            tm.nvc_Content = model_1.nt_Value;
                            tm.nvc_Language = "cn";
                            tm.nvc_PhoneNumber = "未知";
                            tm.nvc_NoteState = "发送失败";
                            tm.nvc_NoteType = "注册专利会员";
                            dalm.MessageNote_Add(tm);
                            #endregion
                        }
                    }
                    if (rModel.i_MemberType == 2)//商标注册
                    {
                        t_SystemKey model_1 = DALSK.SystemKey_Select_Key("i_Register_sb", language);
                        if (model_1.i_Value == 1)
                        {
                            model_1 = DALSK.SystemKey_Select_Key("nvc_Register_sb", language);
                            send_fromcontent = model_1.nt_Value;
                            send_fromcontent = send_fromcontent.Replace("UserName", rModel.nvc_Name);
                            send_fromcontent = send_fromcontent.Replace("UserNumber", rModel.nvc_UserNum);
                            bool TorF = false;
                            BLLMS.Message_Add("手机号", send_fromcontent, "注册商标会员", rModel.i_Id, 1, ref TorF);
                            #region 插入流水
                            t_MessageNote tm = new t_MessageNote();
                            tm.i_MemberId = rModel.i_Id;
                            tm.i_systemType = 2;
                            tm.nvc_Content = model_1.nt_Value;
                            tm.nvc_Language = "cn";
                            tm.nvc_PhoneNumber = "未知";
                            tm.nvc_NoteState = "发送失败";
                            tm.nvc_NoteType = "注册商标会员";
                            dalm.MessageNote_Add(tm);
                            #endregion
                        }
                    }
                    #endregion
                    UserLog.AddUserLog(rModel.i_Id, "用户注册", "注册新用户");
                    if (count > 0)
                    {
                        context.Response.Write("2;;;;;注册成功,您获赠" + count + "张优惠券，请尽快使用！");
                    }
                    else
                    {
                        context.Response.Write("1;;;;;注册成功");
                    }
                    break;
                case 2:
                    context.Response.Write("0;;;;;用户名已存在");
                    break;
                case 3:
                    context.Response.Write("0;;;;;Email已经被注册");
                    break;
                case 4:
                    context.Response.Write("0;;;;;手机号已存在");
                    break;
                case 5:
                    context.Response.Write("0;;;;;用户编号已存在");
                    break;
                default:
                    context.Response.Write("0;;;;;系统繁忙，请稍后...");
                    break;
            }
        }
        else
        {
            context.Response.Write("0;;;;;请不要输入非法字符");
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
        //string cc=context.Request.Cookies["hqht_patentidstr"].Value;
        if (context.Request["SelectType"].ToString() == "check")
        {
            if (context.Request.Cookies["hqht_patentidstr"] != null)
            {
                SB_pids.Append(context.Request.Cookies["hqht_patentidstr"].Value);
            }
            if (SB_pids.ToString().IndexOf("|" + pid + ",1") < 0)
            {
                SB_pids.Append("|" + pid + ",1");
            }
            //context.Response.Cookies["hqht_patentidstr"].Value = SB_pids.ToString();
        }
        else if (context.Request["SelectType"].ToString() == "nocheck")
        {
            string getpidstr = context.Request.Cookies["hqht_patentidstr"].Value;
            SB_pids.Append((getpidstr).Replace("|" + pid + ",1", "")).ToString();
            //context.Response.Cookies["hqht_patentidstr"].Value = SB_pids.Append((getpidstr).Replace("|" + pid + ",1", "")).ToString();
        }
        if (context.Request["SelectType"].ToString() == "check")
        {
            if (SB_pids.ToString().IndexOf("|" + pid + ",1") < 0)
            {
                context.Response.Write("no");
            }
            else
            {
                context.Response.Write(SB_pids.ToString());
            }
        }
        else if (context.Request["SelectType"].ToString() == "nocheck")
        {
            if (SB_pids.ToString().IndexOf("|" + pid + ",1") < 0)
            {
                context.Response.Write(SB_pids.ToString());
            }
            else
            {
                context.Response.Write("no");
            }
        }
        //context.Response.Write(SB_pids.ToString());

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
                        info = item.nvc_SBRegNum + "商标距到期时间还有" + item.i_ShengDays + "天，距缴费期限较长";
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
            context.Response.Write("0;;;;;异常的参数请求！");
            return;
        }
        if (context.Session["Validate"] != null)
        {
            string checkv = context.Session["Validate"].ToString().ToLower();
            bll_Message BLLMS = new bll_Message();
            bll_Email BLLE = new bll_Email();
            dal_Member DALM = new dal_Member();
            string scontent = "尊敬的环球汇通用户，您正在执行找回密码操作，验证码为:" + checkv + "，为避免验证码过期，请立即输入验证码继续修改密码!【环球惠通】";
            string scontent2 = "尊敬的环球汇通用户，您正在执行找回密码操作，验证码为:" + checkv + "，为避免验证码过期，请立即输入验证码继续修改密码!";
            t_Member model = DALM.Member_Select_Name(username, utype);
            if (model == null)
            {
                context.Response.Write("0;;;;;找不到该会员！");
                return;
            }
            #region 手机找回
            if (mode == "1")
            {
                if (string.IsNullOrWhiteSpace(model.nvc_MobilePhone))
                {
                    context.Response.Write("0;;;;;没有绑定手机号！");
                    return;
                }
                bool TorF = false;
                BLLMS.Message_Add(model.nvc_MobilePhone, scontent, "找回密码发送验证码", model.i_Id, ref TorF);
                if (TorF)
                {
                    t_MessageNote model_m = new t_MessageNote();
                    model_m.nvc_Content = scontent;
                    model_m.dt_AddTime = DateTime.Now;
                    model_m.nvc_PhoneNumber = model.nvc_MobilePhone;
                    model_m.i_systemType = utype;
                    model_m.nvc_NoteState = "发送成功";
                    //model_m.nvc_NoteState = "发送失败";
                    model_m.nvc_NoteType = "找回密码";
                    model_m.i_MemberId = model.i_Id;
                    model_m.nvc_Language = "cn";
                    dal_Message Ndal = new dal_Message();
                    Ndal.MessageNote_Add(model_m);
                    context.Response.Write("1;;;;;验证码已发至手机" + model.nvc_MobilePhone.MobilePhoneReplaceX() + "，请注意查收短信，如果没有收到短信，您可以在60秒后重新发送！");
                    return;
                }
                else
                {
                    t_MessageNote model_m = new t_MessageNote();
                    model_m.nvc_Content = scontent;
                    model_m.dt_AddTime = DateTime.Now;
                    model_m.nvc_PhoneNumber = model.nvc_MobilePhone;
                    model_m.i_systemType = utype;
                    //model_m.nvc_NoteState = "发送成功";
                    model_m.nvc_NoteState = "发送失败";
                    model_m.nvc_NoteType = "找回密码";
                    model_m.i_MemberId = model.i_Id;
                    model_m.nvc_Language = "cn";
                    dal_Message Ndal = new dal_Message();
                    Ndal.MessageNote_Add(model_m);
                    context.Response.Write("0;;;;;验证码发送失败！请联系客服修改密码！");
                    return;
                }
            }
            #endregion
            #region 邮箱找回
            if (mode == "2")
            {
                if (string.IsNullOrWhiteSpace(model.nvc_Email))
                {
                    context.Response.Write("0;;;;;没有绑定邮箱！");
                    return;
                }
                bool TorF = false;
                BLLE.Email_Add(model.nvc_Email, "环球汇通找回密码验证码", scontent2, model.i_Id, ref TorF, "cn");
                if (TorF)
                {
                    context.Response.Write("1;;;;;验证码已发至邮箱" + model.nvc_Email.EmailReplaceX() + "，请注意查收，如果没有收到邮件，您可以在60秒后重新发送！");
                    return;
                }
                else
                {
                    context.Response.Write("0;;;;;邮件发送失败！请联系客服修改密码！");
                    return;
                }
            }
            #endregion

            context.Response.Write("0;;;;;异常的参数请求！");
        }
        else
        {
            context.Response.Write("0;;;;;验证码已过期！");
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
            context.Response.Write("请输入正确的邮箱");
            return;
        }
        if (StringHelper.CheckSqlKeyWord(subTitle) || StringHelper.CheckSqlKeyWord(conten))
        {
            context.Response.Write("您输入的字符不符合规范,请核对后重新输入！");
            return;
        }
        if (StringHelper.CheckJsAndHtmlKeyWord(subTitle) || StringHelper.CheckJsAndHtmlKeyWord(conten))
        {
            context.Response.Write("您输入的字符不符合规范,请核对后重新输入！");
            return;
        }
        if (conten.Length > 500)
        {
            context.Response.Write("不能超过500字符！");
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
        model.nvc_Language = "cn";
        dal_OnlineMessage DALOM = new dal_OnlineMessage();
        if (DALOM.OnlineMessage_Add(model) > 0)
            context.Response.Write("ok");
        else
            context.Response.Write("留言发送失败");

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
            context.Response.Write("请先登录商标系统");
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
                                context.Response.Write("手机号或密码错误"); return;
                            }
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("没有绑定积分账户"); return;
                        }
                    }
                    else
                    {
                        context.Response.Write("没有绑定积分账户"); return;
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
                            context.Response.Write("手机号或密码错误");
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
            context.Response.Write("请先登录专利系统");
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
                                context.Response.Write("手机号或密码错误"); return;
                            }
                            #endregion
                        }
                        else
                        {
                            context.Response.Write("没有绑定积分账户"); return;
                        }
                    }
                    else
                    {
                        context.Response.Write("没有绑定积分账户"); return;
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
                            context.Response.Write("手机号或密码错误");
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
    #endregion
}
