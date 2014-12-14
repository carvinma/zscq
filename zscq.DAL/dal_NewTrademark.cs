using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using zscq.Model;
namespace zscq.DAL
{
    public class dal_NewTrademark
    {
        DataTradeMarkDataContext mark = new DataTradeMarkDataContext();
       // DataViewDataContext dvdc = new DataViewDataContext();

        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int Trademark_Add(t_NewTradeMarkInfo model)
        {
            try
            {
                mark.t_NewTradeMarkInfo.InsertOnSubmit(model);
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        public int Trademark_Del(int id)
        {
            try
            {
                t_NewTradeMarkInfo Trademark = mark.t_NewTradeMarkInfo.SingleOrDefault(b => b.i_Id == id);
                if (Trademark != null)
                {
                    mark.t_NewTradeMarkInfo.DeleteOnSubmit(Trademark);
                    mark.SubmitChanges();
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
        /// 修改商标
        /// </summary>
        /// <param name="Model"></param>
        public int Trademark_Submit()
        {
            try
            {
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据id返回一条商标信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_NewTradeMarkInfo Trademark_Select_Id(int id)
        {
            try
            {
                t_NewTradeMarkInfo m = (from a in mark.t_NewTradeMarkInfo where (a.i_Id == id) select a).FirstOrDefault();
                return m;
            }
            catch
            {
                return null;
            }
        }

         /// <summary>
        /// 前台商标分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<t_NewTradeMarkInfo> Trademark_web_SelectPage(int PageIndex, int PageSize,
            int userid, int? applyType,
            string ByCaseNo, string ByName, string Bytype, string ByStatus, 
            string qCaseNo,string qName, int? qStatus, ref int count)
        {
            Expression<Func<t_NewTradeMarkInfo, bool>> WhereExpr = PredicateExtensions.True<t_NewTradeMarkInfo>();
            WhereExpr = WhereExpr.And(a => a.i_MemberId == userid);
            if (applyType.HasValue)
                WhereExpr = WhereExpr.And(a => a.ApplyType == applyType.Value);
            if(!string.IsNullOrEmpty(qCaseNo))
                WhereExpr = WhereExpr.And(a => a.CaseNo.Contains(qCaseNo));
            if (!string.IsNullOrEmpty(qName))
                WhereExpr = WhereExpr.And(a => a.ApplyName.Contains(qName));
            if (qStatus.HasValue)
                WhereExpr = WhereExpr.And(a => a.Status == qStatus.Value);

            var sortedList = mark.t_NewTradeMarkInfo.Where(WhereExpr);
            if (!string.IsNullOrEmpty(ByCaseNo))
            {
                sortedList=ByCaseNo == "desc" ? sortedList.OrderByDescending(p => p.CaseNo):sortedList.OrderBy(p => p.CaseNo);
            }
            if (!string.IsNullOrEmpty(ByName))
            {
                sortedList=ByName == "desc" ? sortedList.OrderByDescending(p => p.ApplyName):sortedList.OrderBy(p => p.ApplyName);
            }
            if (!string.IsNullOrEmpty(Bytype))
            {
                sortedList=Bytype == "desc" ? sortedList.OrderByDescending(p => p.ApplyType):sortedList.OrderBy(p => p.ApplyType);
            }
            if (!string.IsNullOrEmpty(ByStatus))
            {
                sortedList = ByStatus == "desc" ? sortedList.OrderByDescending(p => p.Status) : sortedList.OrderBy(p => p.Status);
            }
            count = sortedList.Count();
            return sortedList.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }

        #region 商标状态管理

        public IQueryable<t_NewTradeMarkStatus> rademarkStatus_Select_All()
        {
             //var query = from q in dsdc.t_Province orderby q.provinceID ascending select q;
           // return query;
            return mark.t_NewTradeMarkStatus.OrderBy(p => p.StatusValue);
        }
        public int TrademarkStatus_Add(t_NewTradeMarkStatus model)
        {
            try
            {
                mark.t_NewTradeMarkStatus.InsertOnSubmit(model);
                mark.SubmitChanges();
                return model.i_Id;
            }
            catch
            {
                return 0;
            }
        }

        public int TrademarkStatus_Del(int id)
        {
            try
            {
                var Trademark = mark.t_NewTradeMarkStatus.SingleOrDefault(b => b.i_Id == id);
                if (Trademark != null)
                {
                    mark.t_NewTradeMarkStatus.DeleteOnSubmit(Trademark);
                    mark.SubmitChanges();
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
       
        public int TrademarkStatus_Update(t_NewTradeMarkStatus m)
        {
            try
            {
                var t = mark.t_NewTradeMarkStatus.Single(a => a.i_Id == m.i_Id);
                t.StatusName = m.StatusName;
                t.StatusValue = m.StatusValue;
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 查询该商标下的商标状态日期
        /// </summary>
        /// <param name="trademarkid"></param>
        /// <returns></returns>
        public IQueryable<t_NewTradeMarkStatusDate> trademarkStatusdate_Select_id(int trademarkid)
        { 
            var iquery = from i in mark.t_NewTradeMarkStatusDate where i.TradeMarkId == trademarkid select i;
            return iquery;
        }

        public int trademarkStatusdateSumbit(t_NewTradeMarkStatusDate model)
        {
            try
            {
                var find = mark.t_NewTradeMarkStatusDate.Where(p => p.TradeMarkId == model.TradeMarkId && p.TradeMarkStatusId == model.TradeMarkStatusId);
                if (find == null)
                {
                    mark.t_NewTradeMarkStatusDate.InsertOnSubmit(model);
                    mark.SubmitChanges();
                }
                else
                {
                    find.First().TradeMarkDate = model.TradeMarkDate;
                    mark.SubmitChanges();
                }
                return 1;
            }
            catch { return 0; }
        }
        #endregion

        #region 商标续展

        /// <summary>
        /// 注册公告日
        /// </summary>
        /// <param name="list"></param>
        /// <param name="TrademarkId"></param>
        /// <returns></returns>
        public int TrademarkRenewalDate_Add(List<t_NewTradeMarkRenewalInfo> list, int TrademarkId)
        {
            try
            {
                var tmplist = mark.t_NewTradeMarkRenewalInfo.Where(p => p.TradeMarkId == TrademarkId).ToList();
                mark.t_NewTradeMarkRenewalInfo.DeleteAllOnSubmit(tmplist);
                mark.t_NewTradeMarkRenewalInfo.InsertAllOnSubmit(list);
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 商标描述填写示例的获取
        /// </summary>
        /// <returns></returns>
        public string TrademarkRenewalWriteSample()
        {
           return  mark.t_NewTradeMarkRenewalDesc.First().WriteSample;
        }
        public int TrademarkRenewalWriteSample_Update(string writeSample)
        {
            try
            {
                var t = mark.t_NewTradeMarkRenewalDesc.First();
                t.WriteSample = writeSample;
                mark.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        #endregion

        #region
        //#region
       
        ///// <summary>
        ///// 根据id返回一条商标信息
        ///// </summary>
        ///// <param name="id"></param>
        ///// <returns></returns>
        //public vw_Trademark Trademark_vw_Select_Id(int id)
        //{
        //    try
        //    {
        //        vw_Trademark m = (from a in dvdc.vw_Trademark where (a.i_Id == id) select a).FirstOrDefault();
        //        return m;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        ///// <summary>
        ///// 添加商标时下一步显示商标信息生成 word文档
        ///// </summary>
        ///// <param name="id">商标id</param>
        ///// <returns></returns>

        //public IQueryable<vw_Trademark> Trademark_vw_Select_ById(int id)
        //{
        //    var iquery = from i in dvdc.vw_Trademark where i.i_Id == id select i;
        //    return iquery;
        //}
        ///// <summary>
        ///// 根据国家Id查询
        ///// </summary>
        ///// <param name="id">国家id</param>
        ///// <returns></returns>

        //public IQueryable<vw_Trademark> Trademark_vw_Select_ByCid(int id, int typeid)
        //{
        //    var iquery = from i in dvdc.vw_Trademark where i.i_GuoJiId == id select i;
        //    if (typeid != 0)
        //    {
        //        iquery = from i in iquery where i.i_JiaoFeiType == typeid select i;
        //    }

        //    return iquery;
        //}

        ///// <summary>
        ///// 根据商标编号获取商标
        ///// </summary>
        ///// <param name="i_Number"></param>
        ///// <returns></returns>
        //public t_Trademark Trademark_Select_No(string i_Number)
        //{
        //    try
        //    {
        //        t_Trademark model = (from a in mark.t_Trademark where (a.nvc_SBRegNum == i_Number) select a).FirstOrDefault();
        //        return model;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        //public t_Trademark Trademark_Select_No(string i_Number, int uid)
        //{
        //    try
        //    {
        //        t_Trademark model = (from a in mark.t_Trademark where (a.nvc_SBRegNum == i_Number && a.i_MemberId == uid) select a).FirstOrDefault();
        //        return model;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}



        ///// <summary>
        ///// 采用SQL方式根据商标id串查询对应商标
        ///// </summary>
        ///// <param name="list"></param>
        ///// <returns></returns>
        //public List<t_Trademark> Trademark_Select_IdS(string list)
        //{
        //    try
        //    {
        //        string sql = "select * from dbo.t_Trademark where i_Id in(" + list + ")";
        //        return mark.ExecuteQuery<t_Trademark>(sql).ToList();
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        ///// <summary>
        ///// 采用SQL方式查询对应用户
        ///// </summary>
        ///// <param name="list"></param>
        ///// <returns></returns>
        //public List<int> Trademark_Select_User()
        //{
        //    try
        //    {
        //        string sql = "select distinct(i_MemberId) from dbo.t_Trademark";
        //        return mark.ExecuteQuery<int>(sql).ToList();
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        ///// <summary>
        ///// 采用SQL方式查询国家对应用户
        ///// </summary>
        ///// <param name="list"></param>
        ///// <returns></returns>
        //public List<int> Patent_Select_ByCidUser(int cid)
        //{
        //    try
        //    {
        //        string sql = "select distinct(i_MemberId) from vw_Trademark where i_GuoJiId=" + cid + "";
        //        return mark.ExecuteQuery<int>(sql).ToList();
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //}
        ///// <summary>
        ///// 根据商标编号获取商标
        ///// </summary>
        ///// <param name="i_Number"></param>
        ///// <returns></returns>
        //public IQueryable<vw_Trademark> Trademark_vw_Select_StyleNo(string i_Number, int Show)
        //{
        //    var iquery = from i in dvdc.vw_Trademark where i.nvc_SBRegNum == i_Number select i;
        //    if (Show != -1)
        //    {
        //        iquery = from i in iquery where i.i_State == Show select i;
        //    }
        //    return iquery;
        //}
        ///// <summary>
        ///// 获取全部商标
        ///// </summary>
        ///// <returns></returns>
        //public IQueryable<t_Trademark> Trademark_SelectAll()
        //{
        //    return from i in mark.t_Trademark select i;
        //}
        ///// <summary>
        ///// 获取全部商标用户
        ///// </summary>
        ///// <returns></returns>
        //public IQueryable<vw_Trademark> Trademark_SelectAllByUser()
        //{
        //    return from i in dvdc.vw_Trademark select i;
        //}
        ///// <summary>
        ///// 获取全部商标获得国家
        ///// </summary>
        ///// <returns></returns>
        //public IQueryable<vw_TrademarkFenbu> Trademark_SelectAllFenBu()
        //{
        //    return from i in dvdc.vw_TrademarkFenbu select i;
        //}
        ///// <summary>
        ///// 后台商标分页获取
        ///// </summary>
        ///// <param name="startIndex"></param>
        ///// <param name="pageSize"></param>
        ///// <returns></returns>
        //public IQueryable<vw_Trademark> Trademark_SelectPage(int PageIndex, int PageSize, int userid, int SType, string Keyword, int jiaofeitype, int guoji, int usertypeid, int regtypeid, int state, string bianhao, string shangbiaotype, string jiaofei, string dizhi, string username, string stime, string ptime, string zhuangtai, int sbdays, string bigtime, string endtime, string uname, string ubianhao, int jiaofeitypezt, ref int count)
        //{
        //    Expression<Func<vw_Trademark, bool>> WhereExpr = PredicateExtensions.True<vw_Trademark>();

        //    WhereExpr = WhereExpr.And(a => a.i_Id != 0);
        //    if (userid != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_MemberId == userid);
        //    }
        //    if (jiaofeitype != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_JiaoFeiType == jiaofeitype);
        //    }
        //    if (jiaofeitypezt != -1)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_IsPayState == jiaofeitypezt);
        //    }
        //    if (guoji != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_GuoJiId == guoji);
        //    }
        //    if (usertypeid != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_UserTypeId == usertypeid);
        //    }
        //    if (regtypeid != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_RegTypeId == regtypeid);
        //    }
        //    if (Keyword != "")
        //    {
        //        switch (SType)
        //        {
        //            case 0:
        //                WhereExpr = WhereExpr.And(a => a.nvc_SBRegNum.Contains(Keyword) || a.nvc_SBRegName.Contains(Keyword) || a.nvc_SBDescribe.Contains(Keyword) || a.nvc_Name == Keyword || a.nvc_UserNum == Keyword || a.nvc_SBType == Keyword || a.nvc_MobilePhone == Keyword);
        //                break;
        //            case 1:
        //                WhereExpr = WhereExpr.And(a => a.nvc_SBRegName.Contains(Keyword));
        //                break;
        //            case 2:
        //                WhereExpr = WhereExpr.And(a => a.nvc_SBRegNum.Contains(Keyword));
        //                break;
        //            case 4:
        //                WhereExpr = WhereExpr.And(a => a.i_Id == int.Parse(Keyword));
        //                break;
        //            case 5:
        //                WhereExpr = WhereExpr.And(a => a.nvc_Name.Contains(Keyword));
        //                break;
        //            case 6:
        //                WhereExpr = WhereExpr.And(a => a.nvc_UserNum.Contains(Keyword));
        //                break;
        //            case 7:
        //                WhereExpr = WhereExpr.And(a => a.nvc_SBType == Keyword);
        //                break;
        //            case 8:
        //                WhereExpr = WhereExpr.And(a => a.nvc_MobilePhone.Contains(Keyword));
        //                break;
        //        }
        //    }
        //    if (state != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_State == state);
        //    }
        //    var Trademark = from c in dvdc.vw_Trademark.Where(WhereExpr) orderby c.i_Id descending select c;

        //    if (bigtime.Trim() != "" && endtime.Trim() != "")
        //    {
        //        Trademark = from c in Trademark where Convert.ToDateTime(bigtime) < Convert.ToDateTime(c.dt_AddTime) && Convert.ToDateTime(c.dt_AddTime) < Convert.ToDateTime(endtime).AddDays(1) orderby c.i_Id descending select c;
        //    }
        //    if (sbdays != 0)
        //    {
        //        switch (sbdays)
        //        {
        //            case 1:
        //                Trademark = from c in Trademark where c.i_ShengDays > 90 orderby c.i_Id descending select c;
        //                break;
        //            case 2:
        //                Trademark = from c in Trademark where c.i_ShengDays > 60 && c.i_ShengDays <= 90 orderby c.i_Id descending select c;
        //                break;
        //            case 3:
        //                Trademark = from c in Trademark where c.i_ShengDays > 30 && c.i_ShengDays <= 60 orderby c.i_Id descending select c;
        //                break;
        //            case 4:
        //                Trademark = from c in Trademark where c.i_ShengDays > 15 && c.i_ShengDays <= 30 orderby c.i_Id descending select c;
        //                break;
        //            case 5:
        //                Trademark = from c in Trademark where c.i_ShengDays >= 0 && c.i_ShengDays <= 15 orderby c.i_Id descending select c;
        //                break;

        //        }

        //    }
        //    #region 排序
        //    if (bianhao != "")
        //    {
        //        if (bianhao == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegNum descending, c.i_Id descending select c;
        //        }
        //        if (bianhao == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegNum ascending, c.i_Id descending select c;
        //        }
        //        //case "nvc_Name":
        //        //    Trademark = from c in Trademark orderby c.nvc_SBRegName descending, c.i_Id descending select c;
        //        //    break;
        //        //case "nvc_No":
        //        //    Trademark = from c in Trademark orderby c.nvc_SBRegNum descending, c.i_Id descending select c;
        //        //    break;
        //        //case "dt_AddTime":
        //        //    Trademark = from c in Trademark orderby c.dt_AddTime descending, c.i_Id descending select c;
        //        //    break;

        //    }
        //    if (shangbiaotype != "")
        //    {
        //        if (shangbiaotype == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBType descending, c.i_Id descending select c;
        //        }
        //        if (shangbiaotype == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBType ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (jiaofei != "")
        //    {
        //        if (jiaofei == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_JiaoFeiType descending, c.i_Id descending select c;
        //        }
        //        if (jiaofei == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_JiaoFeiType ascending, c.i_Id descending select c;
        //        }
        //    }

        //    if (dizhi != "")
        //    {
        //        if (dizhi == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegAddress descending, c.i_Id descending select c;
        //        }
        //        if (dizhi == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegAddress ascending, c.i_Id descending select c;
        //        }
        //    }

        //    if (username != "")
        //    {
        //        if (username == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_Name descending, c.i_Id descending select c;
        //        }
        //        if (username == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_Name ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (stime != "")
        //    {
        //        if (stime == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.dt_AddTime descending, c.i_Id descending select c;
        //        }
        //        if (stime == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.dt_AddTime ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (ptime != "")
        //    {
        //        if (ptime == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.dt_PassTime descending, c.i_Id descending select c;
        //        }
        //        if (ptime == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.dt_PassTime ascending, c.i_Id descending select c;
        //        }
        //    } if (zhuangtai != "")
        //    {
        //        if (zhuangtai == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_IsPayState descending, c.i_Id descending select c;
        //        }
        //        if (zhuangtai == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_IsPayState ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (uname != "")
        //    {
        //        if (uname == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_Name descending, c.i_Id descending select c;
        //        }
        //        if (uname == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_Name ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (ubianhao != "")
        //    {
        //        if (ubianhao == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_UserNum descending, c.i_Id descending select c;
        //        }
        //        if (ubianhao == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_UserNum ascending, c.i_Id descending select c;
        //        }
        //    }
        //    #endregion
        //    count = Trademark.Count();
        //    return Trademark.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        //}
        ///// <summary>
        ///// 前台商标分页获取
        ///// </summary>
        ///// <param name="startIndex"></param>
        ///// <param name="pageSize"></param>
        ///// <returns></returns>
        //public IQueryable<vw_Trademark> Trademark_web_SelectPage(int PageIndex, int PageSize, int userid, string shangbiaotype, string jiaofeitype, string sbregname, string sbnum, string sbjiaofei, string sbtime, string Stime, int isjiaofei, int jiaofeistate, string sb_num, string sb_type, string sb_regname, int guoji, string sb_passtime, string c_anjuanhao, string cuname, string caddress, string ctel, ref int count)
        //{
        //    Expression<Func<vw_Trademark, bool>> WhereExpr = PredicateExtensions.True<vw_Trademark>();

        //    WhereExpr = WhereExpr.And(a => a.i_Id != 0);
        //    if (userid != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_MemberId == userid);
        //    }
        //    var Trademark = from c in dvdc.vw_Trademark.Where(WhereExpr) orderby c.i_Id descending select c;
        //    if (isjiaofei != -1)
        //    {
        //        Trademark = from c in Trademark where c.i_IsPayState == isjiaofei orderby c.i_Id descending select c;
        //    }
        //    if (jiaofeistate != 0)
        //    {
        //        Trademark = from c in Trademark where c.i_State == jiaofeistate orderby c.i_Id descending select c;
        //    }
        //    if (sb_num != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_SBRegNum.Contains(sb_num) orderby c.i_Id descending select c;
        //    }
        //    if (sb_type != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_SBType == sb_type orderby c.i_Id descending select c;
        //    }
        //    if (sb_regname != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_SBRegName.Contains(sb_regname) orderby c.i_Id descending select c;
        //    }
        //    if (guoji != 0)
        //    {
        //        Trademark = from c in Trademark where c.i_GuoJiId == guoji orderby c.i_Id descending select c;
        //    }
        //    if (sb_passtime != "")
        //    {
        //        Trademark = from c in Trademark where c.dt_PassTime == DateTime.Parse(sb_passtime) orderby c.i_Id descending select c;
        //    }
        //    if (c_anjuanhao != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_CFaxnumber.Contains(cuname) orderby c.i_Id descending select c;
        //    }
        //    if (cuname != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_OtherName.Contains(cuname) orderby c.i_Id descending select c;
        //    }
        //    if (caddress != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_CAddress.Contains(caddress) orderby c.i_Id descending select c;
        //    }
        //    if (ctel != "")
        //    {
        //        Trademark = from c in Trademark where c.nvc_CTel.Contains(ctel) orderby c.i_Id descending select c;
        //    }
        //    if (Stime != "")
        //    {
        //        if (Stime == "90")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays > 90 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "61-90")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 61 && c.i_ShengDays <= 90 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "31-60")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 31 && c.i_ShengDays <= 60 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "16-30")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 16 && c.i_ShengDays <= 30 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "0-15")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 0 && c.i_ShengDays <= 15 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "chao")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays < 0 orderby c.i_Id descending select c;
        //        }
        //    }
        //    #region 排序
        //    if (shangbiaotype != "")
        //    {
        //        if (shangbiaotype == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBType descending, c.i_Id descending select c;
        //        }
        //        if (shangbiaotype == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBType ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (jiaofeitype != "")
        //    {
        //        if (jiaofeitype == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_JiaoFeiType descending, c.i_Id descending select c;
        //        }
        //        if (jiaofeitype == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_JiaoFeiType ascending, c.i_Id descending select c;
        //        }
        //    }

        //    if (sbregname != "")
        //    {
        //        if (sbregname == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegName descending, c.i_Id descending select c;
        //        }
        //        if (sbregname == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegName ascending, c.i_Id descending select c;
        //        }
        //    }

        //    if (sbnum != "")
        //    {
        //        if (sbnum == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegNum descending, c.i_Id descending select c;
        //        }
        //        if (sbnum == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.nvc_SBRegNum ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (sbjiaofei != "")
        //    {
        //        if (sbjiaofei == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_IsPayState descending, c.i_Id descending select c;
        //        }
        //        if (sbjiaofei == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_IsPayState ascending, c.i_Id descending select c;
        //        }
        //    }
        //    if (sbtime != "")
        //    {
        //        if (sbtime == "desc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_ShengDays descending, c.i_Id descending select c;
        //        }
        //        if (sbtime == "asc")
        //        {
        //            Trademark = from c in Trademark orderby c.i_ShengDays ascending, c.i_Id descending select c;
        //        }
        //    }

        //    #endregion
        //    count = Trademark.Count();
        //    return Trademark.Skip((PageIndex - 1) * PageSize).Take(PageSize);

        //}




        ///// <summary>
        ///// 前台商标统计获取
        ///// </summary>
        ///// <param name="startIndex"></param>
        ///// <param name="pageSize"></param>
        ///// <returns></returns>
        //public IQueryable<vw_Trademark> Trademark_web_SelectCount(int userid, int state, int isjiaofei, string Stime)
        //{
        //    Expression<Func<vw_Trademark, bool>> WhereExpr = PredicateExtensions.True<vw_Trademark>();

        //    WhereExpr = WhereExpr.And(a => a.i_Id != 0);
        //    if (userid != 0)
        //    {
        //        WhereExpr = WhereExpr.And(a => a.i_MemberId == userid);
        //    }
        //    var Trademark = from c in dvdc.vw_Trademark.Where(WhereExpr) orderby c.i_Id descending select c;
        //    #region 缴费时间
        //    if (isjiaofei != -1)
        //    {
        //        Trademark = from c in Trademark where c.i_IsPayState == isjiaofei orderby c.i_Id descending select c;
        //    }
        //    if (state != 0)
        //    {
        //        Trademark = from c in Trademark where c.i_State == state orderby c.i_Id descending select c;
        //    }
        //    if (Stime != "")
        //    {
        //        if (Stime == "90")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays > 90 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "61-90")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 61 && c.i_ShengDays <= 90 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "31-60")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 31 && c.i_ShengDays <= 60 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "16-30")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 16 && c.i_ShengDays <= 30 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "0-15")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays >= 0 && c.i_ShengDays <= 15 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //        if (Stime == "chao")
        //        {
        //            Trademark = from c in Trademark where c.i_ShengDays < 0 && c.i_IsPayState != 1 orderby c.i_Id descending select c;
        //        }
        //    }
        //    #endregion
        //    return Trademark;
        //}


        ///// <summary>
        ///// 返回是否促销
        ///// </summary>
        ///// <param name="i_Promotion"></param>
        ///// <param name="dt_BeginTime"></param>
        ///// <param name="dt_EndTime"></param>
        ///// <returns></returns>
        //public bool Set_TrademarkPromotion(object i_Promotion, object dt_BeginTime, object dt_EndTime)
        //{
        //    try
        //    {
        //        if (i_Promotion.ToString() == "1")
        //        {
        //            if (Convert.ToDateTime(dt_BeginTime) < DateTime.Now && DateTime.Now < Convert.ToDateTime(dt_EndTime))
        //            {
        //                return true;
        //            }
        //        }
        //    }
        //    catch { }
        //    return false;
        //}
        ///// <summary>
        ///// 添加商标时 更加注册名来返回数据判断主体资格文件
        ///// </summary>
        ///// <param name="sbregname">商标注册人</param>
        ///// <returns></returns>

        //public IQueryable<vw_Trademark> Trademark_vw_Select_ByName(string sbregname, int uid)
        //{
        //    var iquery = from i in dvdc.vw_Trademark where i.nvc_SBRegName == sbregname && i.i_MemberId == uid select i;
        //    return iquery;
        //}
        //public IQueryable<t_Trademark> Trademark_SelectAllByStatus(int memberid, int sid, int flag)
        //{
        //    var iquery = from i in mark.t_Trademark where i.i_MemberId == memberid && i.i_AnnualFeeStatus == sid select i;
        //    if (flag == 1)
        //    {
        //        iquery = from i in iquery where i.i_SendEmail != sid select i;
        //    }
        //    else
        //    {
        //        iquery = from i in iquery where i.i_SendMessage != sid select i;
        //    }
        //    switch (sid)
        //    {
        //        case 1:
        //            iquery = from i in iquery where i.i_ShengDays > 90 select i;
        //            break;
        //        case 2:
        //            iquery = from i in iquery where i.i_ShengDays >= 61 && i.i_ShengDays <= 90 select i;
        //            break;
        //        case 3:
        //            iquery = from i in iquery where i.i_ShengDays >= 31 && i.i_ShengDays <= 60 select i;
        //            break;
        //        case 4:
        //            iquery = from i in iquery where i.i_ShengDays >= 16 && i.i_ShengDays <= 30 select i;
        //            break;
        //        case 5:
        //            iquery = from i in iquery where i.i_ShengDays >= 0 && i.i_ShengDays <= 15 select i;
        //            break;
        //        case 6:
        //            iquery = from i in iquery where i.i_ShengDays < 0 select i;
        //            break;
        //    }
        //    return iquery;
        //}
        //#endregion
        #endregion
    }
}
