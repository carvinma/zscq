<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Linq;
using System.Text;

public class Handler : HandlerCode, IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            if (context.Request["flag"] != null && context.Request["flag"].ToString() != "")
            {
                string flag = context.Request["flag"].ToString();
                switch (flag.ToLower())
                {
                    case "faq":
                        AddFaq(context);
                        break;
                    case "name":
                        validateName(context);
                        break;
                    case "phone":
                        validateNamePhone(context);
                        break;
                    case "email":
                        validateNameEmail(context);
                        break;
                    case "checkcode":
                        checkCode(context);
                        break;
                    case "login":
                        login(context);
                        break;
                    case "register":
                        register(context);
                        break;
                    case "qlyqx":
                        qlyqx(context);
                        break;
                    case "jiaofei":
                        jiaofei(context);
                        break;
                    case "sbjiaofei":
                        sbjiaofei(context);
                        break;
                    case "sbmaxdays":
                        sbMaxDays(context);
                        break;
                    case "guoji":
                        guoji(context);
                        ; break;
                    case "youhuiquan":
                        youhuiquan(context);
                        ; break;
                    case "findpwd":
                        findpwd(context);
                        break;
                    case "cartsubproduct":
                        cartsubproduct(context);
                        break;
                    case "cartaddproduct":
                        cartaddproduct(context);
                        break;
                    case "checkjfphone":
                        checkjfphone(context);
                        break;
                    case "sbjflogin":
                        sbjflogin(context);
                        break;
                    case "zljflogin":
                        zljflogin(context);
                        break;
                    case "selshouquanguo":
                        selshouquanguo(context);
                        break;
                    case "selpatenttype":
                        selpatenttype(context);
                        break;
                    case "selniandu":
                        selniandu(context);
                        break;
                    case "selprov":
                        SelProv(context);
                        break;
                    case "selcity":
                        SelCity(context);
                        break;
                    case "selarea":
                        SelArea(context);
                        break;
                    case "delete":
                        DelApplyByID(context);
                        break;
                    case "maincategory":
                        GetMainCategory(context);
                        break;
                    case "detailcategory":
                        GetDetailCategory(context);
                        break;
                    default:
                        context.Response.Write("未知的类型");
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            //发布前注释掉
            //context.Response.Write(ex.Message);
            context.Response.Write("系统发生错误,正在处理中....");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}