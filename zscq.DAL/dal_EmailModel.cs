using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_EmailModel
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 添加邮件模板
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EmailModel_Add(t_EmailModel model)
        {
            try
            {
                dsdc.t_EmailModel.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除邮件模板
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public int EmailModel_Del(int Pid)
        {
            try
            {
                t_EmailModel PW = dsdc.t_EmailModel.SingleOrDefault(a => a.i_Id == Pid);
                dsdc.t_EmailModel.DeleteOnSubmit(PW);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改邮件模板
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int EmailModel_Update(t_EmailModel model)
        {
            try
            {
                t_EmailModel PW = dsdc.t_EmailModel.SingleOrDefault(a => a.i_Id == model.i_Id);
                PW.i_OrderbyNo = model.i_OrderbyNo;
                PW.nt_Content = model.nt_Content;
                PW.nvc_Name = model.nvc_Name;
                PW.nvc_Title = model.nvc_Title;
                PW.nvc_Language = model.nvc_Language;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据表id获取某个邮件模板
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_EmailModel EmailModel_Select_Id(int Pid)
        {
            try
            {
                t_EmailModel PW = dsdc.t_EmailModel.SingleOrDefault(a => a.i_Id == Pid);
                return PW;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据表id获取某个邮件模板
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_EmailModel EmailModel_Select_Name(string Name)
        {
            t_EmailModel PW = dsdc.t_EmailModel.FirstOrDefault(a => a.nvc_Name == Name);
            return PW;
        }
        /// <summary>
        /// 获取全部邮件模板
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_EmailModel> EmailModel_SelectAll()
        {
            return from i in dsdc.t_EmailModel select i;
        }
        /// <summary>
        /// 获取全部邮件模板
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_EmailModel> EmailModel_SelectAll_Orderby()
        {
            return from i in dsdc.t_EmailModel orderby i.i_OrderbyNo ascending, i.i_Id descending select i;
        }
        public IQueryable<t_EmailModel> EmailModel_SelectAll_Orderby(string lang)
        {
            return from i in dsdc.t_EmailModel where i.nvc_Language == lang orderby i.i_OrderbyNo ascending, i.i_Id descending select i;
        }
        /// <summary>
        /// 分页获取供应商列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="name"></param>
        /// <param name="fenlei"></param>
        /// <param name="daili"></param>
        /// <param name="pid"></param>
        /// <param name="count"></param>
        /// <param name="leibie"></param>
        /// <returns></returns>
        public IQueryable<t_EmailModel> EmailModel_SelectPage(int PageIndex, int PageSize, string Keyword, ref int count)
        {
            Expression<Func<t_EmailModel, bool>> WhereExpr = PredicateExtensions.True<t_EmailModel>();

            if (Keyword != "")
            {
                WhereExpr = WhereExpr.And(a => a.nvc_Name.Contains(Keyword));
            }
            WhereExpr = WhereExpr.And(a => a.i_Id != 1);

            var iquery = from c in dsdc.t_EmailModel.Where(WhereExpr) orderby c.i_Id descending select c;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        public IQueryable<t_EmailModel> EmailModel_SelectPage(int PageIndex, int PageSize, string Keyword, ref int count, string lang)
        {
            Expression<Func<t_EmailModel, bool>> WhereExpr = PredicateExtensions.True<t_EmailModel>();

            if (Keyword != "")
            {
                WhereExpr = WhereExpr.And(a => a.nvc_Name.Contains(Keyword));
            }
            WhereExpr = WhereExpr.And(a => a.i_Id != 1);
            WhereExpr = WhereExpr.And(a => a.nvc_Language == lang);
            var iquery = from c in dsdc.t_EmailModel.Where(WhereExpr) orderby c.i_Id descending select c;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
        public IQueryable<t_EmailModel> EmailModel_SelectPage(int PageIndex, int PageSize, string Keyword, string language, ref int count)
        {
            Expression<Func<t_EmailModel, bool>> WhereExpr = PredicateExtensions.True<t_EmailModel>();

            if (Keyword != "")
            {
                WhereExpr = WhereExpr.And(a => a.nvc_Name.Contains(Keyword));
            }
            if (language != "")
            {
                WhereExpr = WhereExpr.And(a => a.nvc_Language.Contains(language));
            }
            var iquery = from c in dsdc.t_EmailModel.Where(WhereExpr) orderby c.i_Id descending select c;
            count = iquery.Count();
            return iquery.Skip((PageIndex - 1) * PageSize).Take(PageSize);
        }
    }
}
