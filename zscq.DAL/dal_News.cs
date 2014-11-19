using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_News
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 添加文章内容
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int News_Add(t_News model)
        {
            try
            {
                dsdc.t_News.InsertOnSubmit(model);
                //dsdc.SubmitChanges();
                dsdc.SubmitChanges(ConflictMode.ContinueOnConflict);
                return model.i_Id;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除文章内容
        /// </summary>
        /// <param name="id"></param>
        public int News_Del(int id)
        {
            try
            {
                t_News model = dsdc.t_News.SingleOrDefault(u => u.i_Id == id);
                dsdc.t_News.DeleteOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除文章内容
        /// </summary>
        /// <param name="id"></param>
        public int News_DelByType(int tid)
        {
            try
            {
                var iquery = from i in dsdc.t_News where i.i_NewsTypeId == tid select i;
                dsdc.t_News.DeleteAllOnSubmit(iquery);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改文章内容
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int News_Update(t_News model)
        {
            try
            {
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public t_News News_Select_Id(int NId)
        {
            try
            {
                return dsdc.t_News.SingleOrDefault(a => a.i_Id == NId);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public IQueryable<t_News> News_Select_All()
        {
            try
            {
                return from i in dsdc.t_News orderby i.i_OrderBy ascending, i.i_Id descending select i;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据类型获取一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public IQueryable<t_News> News_Select_All(int PId)
        {
            try
            {
                return from i in dsdc.t_News where i.i_NewsTypeId == PId orderby i.i_OrderBy ascending, i.i_Id descending select i;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<t_News> News_Select_Allshow(int PId,string language)
        {
            try
            {
                return from i in dsdc.t_News where i.i_NewsTypeId == PId && i.nvc_Language == language orderby i.i_OrderBy ascending, i.i_Id descending select i;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据获取第一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public t_News News_Select_First(int PId)
        {
            try
            {
                return (from i in dsdc.t_News where i.i_NewsTypeId == PId orderby i.i_OrderBy ascending, i.i_Id descending select i).FirstOrDefault();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据类型获取一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public int News_Select_Count(int PId)
        {
            try
            {
                return (from i in dsdc.t_News where i.i_NewsTypeId == PId select i).Count();
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取一条文章
        /// </summary>
        /// <param name="NId"></param>
        /// <returns></returns>
        public vw_News News_vw_Select_Id(int NId)
        {
            try
            {
                return dvdc.vw_News.SingleOrDefault(a => a.i_Id == NId);
            }
            catch
            {
                return null;
            }
        }
        public vw_News News_vw_Select_First(string key, string language)
        {
            try
            {
                var iquery = from i in dvdc.vw_News where i.nvc_key == key && i.nvc_Language == language && i.i_Show == 1 orderby i.i_OrderBy ascending, i.dt_AddTime descending, i.i_Id descending select i;
                return iquery.FirstOrDefault();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 分页 返回文章列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="upid"></param>
        /// <param name="keyworeds">关键词</param>
        /// <param name="clas">文章类别</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_News> News_SelectPage(int pageindex, int pagesiz, int TType, string keyworeds, int SType, int AType, ref int count)
        {
            var iquery = from i in dvdc.vw_News select i;
            if (keyworeds != null && keyworeds != "")
            {
                switch (SType)
                {
                    case 0:
                        iquery = from i in iquery where i.nvc_Title.Contains(keyworeds) || i.nt_Content.Contains(keyworeds) || i.nvc_SubTitle.Contains(keyworeds) || i.nvc_PageTitle.Contains(keyworeds) || i.nvc_PageKeywords.Contains(keyworeds) || i.nvc_PageDescription.Contains(keyworeds) select i;
                        break;
                    case 1:
                        iquery = from i in iquery where i.nvc_Title.Contains(keyworeds) select i;
                        break;
                    case 2:
                        iquery = from i in iquery where i.nt_Content.Contains(keyworeds) select i;
                        break;
                    case 3:
                        iquery = from i in iquery where i.nvc_SubTitle.Contains(keyworeds) select i;
                        break;
                }
            }
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_NewsTypeId == TType select i;
            }
            if (AType != -1)
            {
                iquery = from i in iquery where i.i_Show == AType select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        /// <summary>
        /// 分页 返回文章列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="upid"></param>
        /// <param name="keyworeds">关键词</param>
        /// <param name="clas">文章类别</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_News> News_SelectPage(int pageindex, int pagesiz, int TType, string keyworeds, int SType, int AType, string lang, ref int count)
        {
            var iquery = from i in dvdc.vw_News select i;
            if (lang != null && lang != "")
            {
                iquery = from i in iquery where i.nvc_Language == lang select i;
            }
            if (keyworeds != null && keyworeds != "")
            {
                switch (SType)
                {
                    case 0:
                        iquery = from i in iquery where i.nvc_Title.Contains(keyworeds) || i.nt_Content.Contains(keyworeds) || i.nvc_SubTitle.Contains(keyworeds) || i.nvc_PageTitle.Contains(keyworeds) || i.nvc_PageKeywords.Contains(keyworeds) || i.nvc_PageDescription.Contains(keyworeds) select i;
                        break;
                    case 1:
                        iquery = from i in iquery where i.nvc_Title.Contains(keyworeds) select i;
                        break;
                    case 2:
                        iquery = from i in iquery where i.nt_Content.Contains(keyworeds) select i;
                        break;
                    case 3:
                        iquery = from i in iquery where i.nvc_SubTitle.Contains(keyworeds) select i;
                        break;
                }
            }
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_NewsTypeId == TType select i;
            }
            if (AType != -1)
            {
                iquery = from i in iquery where i.i_Show == AType select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        /// <summary>
        /// 分页 返回文章列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="upid"></param>
        /// <param name="keyworeds">关键词</param>
        /// <param name="clas">文章类别</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_News> News_Select_Show(int pageindex, int pagesiz, int TType, ref int count)
        {
            var iquery = from i in dvdc.vw_News where i.i_Show == 1 select i;
            if (TType != 0)
            {
                iquery = from i in iquery where i.i_NewsTypeId == TType select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        /// <summary>
        /// 分页 返回文章列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="upid"></param>
        /// <param name="keyworeds">关键词</param>
        /// <param name="clas">文章类别</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_News> News_Select_ShowNews(int pageindex, int pagesiz, int TType, ref int count)
        {
            var iquery = from i in dsdc.t_News where i.i_Show == 1 select i;
            if (TType != 0)
            {
                iquery = from i in iquery where i.i_NewsTypeId == TType select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        public IQueryable<vw_News> vwNews_Select_ShowNews(int pageindex, int pagesiz, string sortkey, string lang, ref int count)
        {
            var iquery = from i in dvdc.vw_News where i.i_Show == 1 select i;
            if (sortkey != "" && lang != "")
            {
                iquery = from i in iquery where i.nvc_key == sortkey && i.nvc_Language == lang select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        public IQueryable<vw_News> vwNews_Select_ShowNews(int Id, string lang, ref int count)
        {
            var iquery = from i in dvdc.vw_News where i.i_Show == 1 && i.i_Id == Id orderby i.i_OrderBy ascending, i.i_Id descending select i;
            count = iquery.Count();
            return iquery;
        }
        public IQueryable<vw_News> vwNews_Select_ShowNewsAll(string sortkey, string lang)
        {
            var iquery = from i in dvdc.vw_News where i.i_Show == 1 select i;
            if (sortkey != "" && lang != "")
            {
                iquery = from i in iquery where i.nvc_key == sortkey && i.nvc_Language == lang select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id descending select i;
            return iquery;
        }
    }
}