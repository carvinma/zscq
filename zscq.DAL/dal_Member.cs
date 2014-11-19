using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Data.Linq;
using System.Data.Linq.SqlClient;
using System.Linq.Expressions;
using System.Web.Security;
using System.Text.RegularExpressions;

namespace zscq.DAL
{
    /// <summary>
    /// 会员信息操作类
    /// </summary>
    public class dal_Member
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        dal_IntegralMobile DALIM = new dal_IntegralMobile();

        /// <summary>
        /// 添加会员信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Member_Add(t_Member model)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                model.i_Grade = 1;
                model.i_ReceiveEmail = 1;
                dmdc.t_Member.InsertOnSubmit(model);
                dmdc.SubmitChanges(ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Member_Add(t_Member model, ref int id, ref string name)
        {
            try
            {
                model.dt_AddTime = DateTime.Now;
                model.i_Grade = 1;
                model.i_ReceiveEmail = 1;
                dmdc.t_Member.InsertOnSubmit(model);
                dmdc.SubmitChanges(ConflictMode.ContinueOnConflict);
                id = model.i_Id;
                name = model.nvc_Name;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除会员
        /// </summary>
        /// <param name="id"></param>
        public int Member_Del(int id)
        {
            try
            {
                t_Member model = dmdc.t_Member.Single(u => u.i_Id == id);
                if (model != null)
                {
                    if (model.i_IntegralMobileId != 0)
                    {
                        var im = DALIM.IntegralMobile_SelectById(model.i_Id);
                        if (model.i_MemberType == 1)
                        { im.i_zluid = 0; }
                        if (model.i_MemberType == 2)
                        { im.i_sbuid = 0; }
                        DALIM.IntegralMobile_Updata();
                    }
                    dmdc.t_Member.DeleteOnSubmit(model);
                    dmdc.SubmitChanges();
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改会员信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Member_Update(t_Member model)
        {
            try
            {
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.KeepCurrentValues);  //保持当前的值
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);//保存原来的值 有冲突的话保存当前版本
                dmdc.SubmitChanges();//注意：解决完冲突后还得 SubmitChanges() 一次，不然一样是没有更新到数据库的
                return 0;
            }
        }
        public int Member_Update()
        {
            try
            {
                dmdc.SubmitChanges();
                return 1;
            }
            catch
            {
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.KeepCurrentValues);  //保持当前的值
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值
                dmdc.ChangeConflicts.ResolveAll(RefreshMode.KeepChanges);//保存原来的值 有冲突的话保存当前版本
                dmdc.SubmitChanges();//注意：解决完冲突后还得 SubmitChanges() 一次，不然一样是没有更新到数据库的
                return 0;
            }
        }
        /// <summary>
        /// 根据会员ID获取某个会员信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Member Member_Select_Id(int id)
        {
            try
            {
                t_Member guest = dmdc.t_Member.SingleOrDefault(u => u.i_Id == id);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        public t_Member Member_Select_Id(int id, string flag)
        {
            try
            {
                t_Member guest = dmdc.t_Member.SingleOrDefault(u => u.i_Id == id && u.nvc_Flag == flag);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 通过用户编号
        /// </summary>
        /// <param name="userNum"></param>
        /// <returns></returns>
        public t_Member Member_Select_ByUserNum(string userNum)
        {
            try
            {
                t_Member guest = dmdc.t_Member.SingleOrDefault(u => u.nvc_UserNum == userNum);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        public t_Member Member_Select_ByUserNum(string userNum, int mtype)
        {
            try
            {
                t_Member guest = dmdc.t_Member.SingleOrDefault(u => u.nvc_UserNum == userNum && u.i_MemberType == mtype);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据会员国家ID获取某个会员统计信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<t_Member> Member_Select_ByCid(int cid)
        {
            try
            {
                var guest = from i in dmdc.t_Member where i.i_CountryId == cid select i;
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据会员ID获取某个会员信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public vw_Member Member_vw_Select_Id(int id)
        {
            try
            {
                vw_Member guest = dvdc.vw_Member.SingleOrDefault(u => u.i_Id == id);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据全部会员信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<vw_Member> Member_vw_Select_All()
        {
            return from i in dvdc.vw_Member select i;
        }

        /// <summary>
        /// 得到需要发邮件或短信的所有用户
        /// </summary>
        /// <param name="memberType">1专利2商标</param>
        /// <param name="nationality"></param>
        /// <param name="flag">1邮件2短信</param>
        /// <returns></returns>
        public IQueryable<t_Member> Member_Select_All(int memberType, string nationality, int flag)
        {
            var iquery = from i in dmdc.t_Member select i;
            if (memberType != 0)
            {
                iquery = from i in iquery where i.i_MemberType == memberType select i;
            }
            switch (flag)
            {
                case 1: iquery = from i in iquery where i.i_ReceiveEmail == 1 select i; break;
                case 2: iquery = from i in iquery where i.i_IsSend == 1 select i; break;
            }
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        ///// <summary>
        ///// 根据会员ID获取某个会员等级信息
        ///// </summary>
        ///// <param name="id"></param>
        ///// <returns></returns>
        //public vw_UserLevel UserLevel_vw_Select_Id(int id)
        //{
        //    try
        //    {
        //        vw_UserLevel guest = dwvdc.vw_UserLevel.SingleOrDefault(u => u.i_Id == id);
        //        return guest;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        /// <summary>
        /// 根据会员用户名获取某个会员信息
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public t_Member Member_Select_Name(string username)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_Name == username);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        public t_Member Member_Select_Name(string username, int mtype)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_Name == username && u.i_MemberType == mtype);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据会员手机号获取会员信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Member Member_Select_Phone(string tel)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_MobilePhone == tel);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        public t_Member Member_Select_Phone(string tel, int mtype)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_MobilePhone == tel && u.i_MemberType == mtype);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据会员邮箱获取会员信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Member Member_Select_Email(string Email)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_Email == Email);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        public t_Member Member_Select_Email(string Email, int mtype)
        {
            try
            {
                t_Member guest = dmdc.t_Member.FirstOrDefault(u => u.nvc_Email == Email && u.i_MemberType == mtype);
                return guest;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 分页获取 会员列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="keyword"></param>
        /// <param name="wherstr"></param>
        /// <param name="types"></param>
        /// <param name="bigtime"></param>
        /// <param name="endtime"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_Member> Member_SelectPage(int pageindex, int pagesize, int type, string keyword, int PId, int types, string bigtime, string endtime, int CId, int AId, ref int count)
        {
            var iquery = from i in dvdc.vw_Member select i;
            if (type != 0)
            {
                iquery = from i in iquery where i.i_MemberType == type select i;
            }
            if (keyword != "" && keyword != null)
            {
                switch (types)
                {
                    case 1://用户编号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_UserNum, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 2://会员账号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Name, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 3://客户姓名
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_RealName, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 4://手机号码
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_MobilePhone, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 5://电话号码
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_TelPhone, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 6://电子邮箱
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Email, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nt_BYEmail, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 7://QQ/NSN/SKYPE
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_LinkManQQ, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nvc_LinkManMSN, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nvc_LinkManSKYPE, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 9://积分手机号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Mobile, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 0://全部
                        iquery = from i in iquery
                                 where
                                     SqlMethods.Like(i.nvc_UserNum, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Name, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_RealName, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_MobilePhone, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_TelPhone, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Email, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nt_BYEmail, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManQQ, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManMSN, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManSKYPE, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Mobile, string.Format("%{0}%", keyword))
                                 select i;
                        break;
                }
            }
            if (PId != 0)
            {
                iquery = from i in iquery where i.i_ProvinceId == PId select i;
            }
            if (CId != 0)
            {
                iquery = from i in iquery where i.i_CityId == CId select i;
            }
            if (AId != 0)
            {
                iquery = from i in iquery where i.i_AreaId == AId select i;
            }
            if (bigtime.Trim() != "")
            {
                iquery = from i in iquery
                         where Convert.ToDateTime(bigtime) < Convert.ToDateTime(i.dt_AddTime)
                         select i;
            }
            if (endtime.Trim() != "")
            {
                iquery = from i in iquery
                         where Convert.ToDateTime(i.dt_AddTime) < Convert.ToDateTime(endtime).AddDays(1)
                         select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 用户名登录
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="pwd"></param>
        /// <param name="id"></param>
        /// <param name="flag"></param>
        /// <returns></returns>
        public bool Member_Login(string username, string pwd, ref int id, int membertype, ref string name, ref string usernum, ref string flag)
        {
            pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5");
            t_Member model = null;
            if (username.IndexOf("@") > 0)
            {
                model = dmdc.t_Member.SingleOrDefault(a => a.nvc_Email == username && a.nvc_PassWord == pwd && a.i_MemberType == membertype);
            }
            else if (username.Length == 11 && IsNum(username))
            {
                model = dmdc.t_Member.SingleOrDefault(a => a.nvc_MobilePhone == username && a.nvc_PassWord == pwd && a.i_MemberType == membertype);
            }
            else
            {
                model = dmdc.t_Member.SingleOrDefault(a => a.nvc_Name == username && a.nvc_PassWord == pwd && a.i_MemberType == membertype);
            }
            if (model != null)
            {
                model.nvc_IP = System.Web.HttpContext.Current.Request.UserHostAddress;
                Member_Update(model);
                id = model.i_Id;
                name = model.nvc_Name;
                usernum = model.nvc_UserNum;
                flag = model.nvc_Flag;
                return true;
            }
            else
            {
                id = 0;
                name = "";
                return false;
            }
        }
        public t_Member Member_Login(string username, string pwd, int membertype)
        {
            pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "MD5");
            t_Member model = dmdc.t_Member.SingleOrDefault(a => (a.nvc_Name == username || a.nvc_Email == username || a.nvc_MobilePhone == username) && a.nvc_PassWord == pwd && a.i_MemberType == membertype);
            if (model != null)
            {
                model.nvc_IP = System.Web.HttpContext.Current.Request.UserHostAddress;
                Member_Update(model);
                return model;
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 获取所有邀请会员会员
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        //public IQueryable Please_Count(int pageindex, int pagesize, string Keyword, string hot_start_date, string hot_end_date, ref int count)
        //{
        //    DateTime startdata = hot_start_date != "" ? Convert.ToDateTime(hot_start_date) : DateTime.Now.AddYears(-10);
        //    DateTime enddata = hot_end_date != "" ? Convert.ToDateTime(hot_end_date).AddDays(1) : DateTime.Now.AddDays(1);
        //    var iquery = from i in dvdc.vw_Member
        //                 where i.i_Please != 0 && startdata < i.dt_AddTime && i.dt_AddTime < enddata
        //                 group i by new
        //                 {
        //                     i.i_Please,
        //                     i.nvc_PleaseName
        //                 } into g
        //                 select new
        //                 {
        //                     cou = g.Count(),
        //                     g.Key.i_Please,
        //                     g.Key.nvc_PleaseName
        //                 };
        //    if (Keyword != "")
        //    {
        //        iquery = from i in iquery where i.nvc_PleaseName.Contains(Keyword) select i;
        //    }
        //    count = iquery.Count();
        //    return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        //}
        /// <summary>
        /// 返回全部会员列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Member> WebPostClass_SelectAll()
        {
            return from i in dmdc.t_Member orderby i.i_Id ascending select i;
        }

        public IQueryable<vw_Member> Member_SelectPage(int pageindex, int pagesize, int mtype, int ktype, string keyword, int GId, int PId, int CId, int AId, string grade, string bigtime, string endtime, int orderby, ref int count)
        {
            var iquery = from i in dvdc.vw_Member select i;
            if (mtype != 0)
            {
                iquery = from i in iquery where i.i_MemberType == mtype select i;
            }
            if (keyword != "" && keyword != null)
            {
                switch (ktype)
                {
                    case 1://用户编号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_UserNum, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 2://会员账号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Name, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 3://客户姓名
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_RealName, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 4://手机号码
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_MobilePhone, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 5://电话号码
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_TelPhone, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 6://电子邮箱
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Email, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nt_BYEmail, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 7://QQ/NSN/SKYPE
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_LinkManQQ, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nvc_LinkManMSN, string.Format("%{0}%", keyword)) || SqlMethods.Like(i.nvc_LinkManSKYPE, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 9://积分手机号
                        iquery = from i in iquery where SqlMethods.Like(i.nvc_Mobile, string.Format("%{0}%", keyword)) select i;
                        break;
                    case 0://全部
                        iquery = from i in iquery
                                 where
                                     SqlMethods.Like(i.nvc_UserNum, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Name, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_RealName, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_MobilePhone, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_TelPhone, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Email, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nt_BYEmail, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManQQ, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManMSN, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_LinkManSKYPE, string.Format("%{0}%", keyword))
                                     || SqlMethods.Like(i.nvc_Mobile, string.Format("%{0}%", keyword))
                                 select i;
                        break;
                }
            }
            if (GId != 0)
            {
                iquery = from i in iquery where i.i_GuoJiId == GId select i;
            }
            if (PId != 0)
            {
                iquery = from i in iquery where i.i_ProvinceId == PId select i;
            }
            if (CId != 0)
            {
                iquery = from i in iquery where i.i_CityId == CId select i;
            }
            if (AId != 0)
            {
                iquery = from i in iquery where i.i_AreaId == AId select i;
            }
            if (grade != "")
            {
                iquery = from i in iquery where i.i_Grade == int.Parse(grade) select i;
            }
            if (bigtime.Trim() != "")
            {
                iquery = from i in iquery
                         where Convert.ToDateTime(bigtime) < Convert.ToDateTime(i.dt_AddTime)
                         select i;
            }
            if (endtime.Trim() != "")
            {
                iquery = from i in iquery
                         where Convert.ToDateTime(i.dt_AddTime) < Convert.ToDateTime(endtime).AddDays(1)
                         select i;
            }
            switch (orderby)
            {
                case 0: iquery = from i in iquery orderby i.i_Id descending select i; break;
                case 1: iquery = from i in iquery orderby i.nvc_Name descending select i; break;
                case 11: iquery = from i in iquery orderby i.nvc_Name ascending select i; break;
                case 2: iquery = from i in iquery orderby i.nvc_UserNum descending select i; break;
                case 22: iquery = from i in iquery orderby i.nvc_UserNum ascending select i; break;
                case 3: iquery = from i in iquery orderby i.nvc_GradeName descending select i; break;
                case 33: iquery = from i in iquery orderby i.nvc_GradeName ascending select i; break;
                case 4: iquery = from i in iquery orderby i.nvc_MobilePhone descending select i; break;
                case 44: iquery = from i in iquery orderby i.nvc_MobilePhone ascending select i; break;
                case 5: iquery = from i in iquery orderby i.nvc_TelPhone descending select i; break;
                case 55: iquery = from i in iquery orderby i.nvc_TelPhone ascending select i; break;
                case 6: iquery = from i in iquery orderby i.nvc_Email descending select i; break;
                case 66: iquery = from i in iquery orderby i.nvc_Email ascending select i; break;
                case 7: iquery = from i in iquery orderby i.i_Integral descending select i; break;
                case 77: iquery = from i in iquery orderby i.i_Integral ascending select i; break;
                case 8: iquery = from i in iquery orderby i.dt_AddTime descending select i; break;
                case 88: iquery = from i in iquery orderby i.dt_AddTime ascending select i; break;
                case 9: iquery = from i in iquery orderby i.nvc_Mobile descending select i; break;
                case 99: iquery = from i in iquery orderby i.nvc_Mobile ascending select i; break;
            }
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }

        /// <summary>
        /// 生成会员编号
        /// </summary>
        /// <param name="type">系统类型1专利2商标</param>
        /// <param name="mType">会员类型1个人2公司3事务所</param>
        /// <param name="guojia">国家ID</param>
        /// <returns></returns>
        public string SetMemberNumber(int type, int mType, int guojia)
        {
            dal_Nationality DALN = new dal_Nationality();
            string s = "", s1 = "", s2 = "";
            //类型分为：个人（P），公司（C），事务所（F）
            switch (mType)
            {
                case 1: s1 = "P"; break;
                case 2: s1 = "C"; break;
                case 3: s1 = "F"; break;
            }
            s2 = (1000 + GetMemberMaxId(type)).ToString();
            if (GetMemberMaxId(type) < 10)
            {
                s2 = "000" + GetMemberMaxId(type).ToString();
            }
            else if (GetMemberMaxId(type) < 100)
            {
                s2 = "00" + GetMemberMaxId(type).ToString();
            }
            else if (GetMemberMaxId(type) < 1000)
            {
                s2 = "0" + GetMemberMaxId(type).ToString();
            }
            else
            {
                s2 = GetMemberMaxId(type).ToString();
            }
            string jianxie = DALN.Nationality_Select_Id(guojia).nvc_Short;
            switch (type)
            {
                case 1: s = jianxie + s1 + "IP" + s2; break;
                case 2: s = jianxie + s1 + "TM" + s2; break;
            }
            return s;
        }
        /// <summary>
        /// 得到会员最大ID+1
        /// </summary>
        /// <returns></returns>
        public int GetMemberMaxId()
        {
            int id = dmdc.t_Member.Max(item => item.i_Id);
            id++;
            return id;
        }
        public int GetMemberMaxId(int type)
        {
            t_Member model = (from t in dmdc.t_Member where t.i_MemberType == type orderby t.i_Id descending select t).FirstOrDefault();
            int id = 0;
            if (model != null)
            {
                id = model.i_Id;
                id++;
            }
            else
            { 
                id = 1;
            }
            return id;
        }
        public void GetMemberPower(int mId, ref int daoru, ref int daochu, ref int xiugai, ref int shanchu)
        {
            t_Member tm = Member_Select_Id(mId);
            if (tm.nvc_Power != null && tm.nvc_Power != "")
            {
                daoru = Convert.ToInt32(tm.nvc_Power.Split(',')[0]);
                daochu = Convert.ToInt32(tm.nvc_Power.Split(',')[1]);
                xiugai = Convert.ToInt32(tm.nvc_Power.Split(',')[2]);
                shanchu = Convert.ToInt32(tm.nvc_Power.Split(',')[3]);
            }
        }

        private bool IsNum(string str)
        {
            return Regex.IsMatch(str, @"^[+-]?\d*$");
        }
    }
}