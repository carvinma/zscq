<%@ WebHandler Language="C#" Class="Shop_A_Patent" %>

using System;
using System.Web;
using System.Linq;
using zscq.Model;
using zscq.DAL;

public class Shop_A_Patent : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        // 会员编号
        if (context.Request["member"] != null && context.Request["member"].ToString() != "")
        {
            string usermember = context.Request["member"].ToString();
            DataMemberDataContext dmdc = new DataMemberDataContext();
            var result = from r in dmdc.t_Member where r.nvc_UserNum == usermember select r;
            if (result.Count() <= 0)
            {
                context.Response.Write("no");
            }
            else
            {
                foreach (var item in result.Take(1))
                {
                    context.Response.Write(item.nvc_RealName+"_"+item.nvc_Address+"_"+item.nvc_ZipCode);
                }
              
            }
        }
        if (context.Request["getmemberid"] != null && context.Request["getmemberid"].ToString() != "")
        {
            string usermember = context.Request["getmemberid"].ToString().Trim();
            DataMemberDataContext dmdc = new DataMemberDataContext();
            var result = from r in dmdc.t_Member where r.nvc_UserNum == usermember select r;
            if (result.Count() <= 0)
            {
                context.Response.Write("no");
            }
            else
            {
                foreach (var item in result.Take(1))
                {
                    context.Response.Write(item.i_Id);//当会员编号存在时，返回会员Id
                }

            }
        }
       // 会员Id
        if (context.Request["memberId"] != null && context.Request["memberId"].ToString() != "")
        {
            int memberId =int.Parse(context.Request["memberId"].ToString());
            DataMemberDataContext dmdc = new DataMemberDataContext();
            var result = from r in dmdc.t_Member where r.i_Id == memberId select r;
            if (result.Count() <= 0)
            {
                context.Response.Write("no");
            }
            else
            {
                foreach (var item in result.Take(1))
                {

                    if (item.i_UserTypeId == 1)
                    {
                        context.Response.Write(item.nvc_RealName + "_" + item.nvc_Address + "_" + item.nvc_ZipCode);
                    }
                    else if (item.i_UserTypeId == 2)
                    {
                        context.Response.Write(item.nvc_Company + "_" + item.nvc_Address + "_" + item.nvc_ZipCode);
                    }
                    else if (item.i_UserTypeId == 3)
                    {
                        context.Response.Write(item.nvc_DaiLiName + "_" + item.nvc_Address + "_" + item.nvc_ZipCode);
                    }
                        
                }

            }
        }
        //商标注册号重复、、、
        if (context.Request["sbregnum"] != null && context.Request["sbregnum"].ToString() != "")
        {
            int uid = int.Parse(context.Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            string usermember = context.Request["sbregnum"].ToString();
            if (context.Request["sbid"] != null)
            {
                int id = int.Parse(context.Request["sbid"].ToString());
                DataZscqDataContext dzdc = new DataZscqDataContext();
                var result = from r in dzdc.t_Trademark where r.nvc_SBRegNum == usermember && r.i_MemberId == uid && r.i_Id != id select r;
                if (result.Count() > 0)
                {
                    context.Response.Write("ok");
                }
            }
            else
            {              
                DataZscqDataContext dzdc = new DataZscqDataContext();
                var result = from r in dzdc.t_Trademark where r.nvc_SBRegNum == usermember && r.i_MemberId == uid select r;
                if (result.Count() > 0)
                {
                    context.Response.Write("ok");
                }
            }
        }

        //代理机构添加商标注册人名称是否存在，从而判断主体资格证书是否上传、、、
        if (context.Request["sbregnamenum"] != null && context.Request["sbregnamenum"].ToString() != "")
        {
            int uid = int.Parse(context.Request.Cookies["hqhtshop"]["hqht_sb_uid"].ToString());
            string usermember = context.Request["sbregnamenum"].ToString();
            if (context.Request["sbnameid"] != null)
            {
                int id = int.Parse(context.Request["sbnameid"].ToString());
                DataZscqDataContext dzdc = new DataZscqDataContext();
                var result = (from r in dzdc.t_Trademark where r.nvc_SBRegName == usermember && r.i_MemberId == uid && r.i_Id != id select r).Take(1);
                foreach(var v in result)
                {
                    context.Response.Write(v.nvc_ZhuTiFile);
                }
            }
            else
            {
                DataZscqDataContext dzdc = new DataZscqDataContext();
                var result = (from r in dzdc.t_Trademark where r.nvc_SBRegName == usermember && r.i_MemberId == uid select r).Take(1);
                foreach (var v in result)
                {
                    context.Response.Write(v.nvc_ZhuTiFile);
                }
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}