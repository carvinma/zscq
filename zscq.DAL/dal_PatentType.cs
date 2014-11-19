using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentType
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加专利类型
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentType_Add(t_PatentType model)
        {
            try
            {
                dzdc.t_PatentType.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int PatentType_Add(t_PatentType model, ref int ID)
        {
            try
            {
                dzdc.t_PatentType.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                ID = model.i_Id;
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利类型
        /// </summary>
        /// <param name="id"></param>
        public int PatentType_Del(int id)
        {
            try
            {
                t_PatentType model = dzdc.t_PatentType.Single(u => u.i_Id == id);
                dzdc.t_PatentType.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利类型列表
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentType_Update(t_PatentType moble)
        {
            try
            {
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条专利类型
        /// </summary>
        /// <param name="id"></param>
        public t_PatentType PatentType_Select_Id(int id)
        {
            try
            {
                t_PatentType model = dzdc.t_PatentType.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public t_PatentType PatentType_Select_GuoJiaIdAndName(int guojiaid, string zlname, string flag)
        {
            try
            {
                t_PatentType model = new t_PatentType();
                switch (flag)
                {
                    case "cn": model = dzdc.t_PatentType.SingleOrDefault(u => u.i_GuoJiaId == guojiaid && u.nvc_Name == zlname); break;
                    case "en": model = dzdc.t_PatentType.SingleOrDefault(u => u.i_GuoJiaId == guojiaid && u.nvc_EnglishName == zlname); break;
                    case "jp": model = dzdc.t_PatentType.SingleOrDefault(u => u.i_GuoJiaId == guojiaid && u.nvc_JapaneseName == zlname); break;
                    case "kr": model = dzdc.t_PatentType.SingleOrDefault(u => u.i_GuoJiaId == guojiaid && u.nvc_koreanName == zlname); break;
                }
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利类型列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentType> PatentType_SelectAll()
        {
            return from i in dzdc.t_PatentType orderby i.i_OrderBy ascending select i;
        }
        /// <summary>
        /// 返回全部专利类型列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentType> PatentType_SelectAllById(int tid)
        {
            return from i in dzdc.t_PatentType where i.i_Id == tid orderby i.i_OrderBy ascending select i;
        }

        public IQueryable<vw_PatentType> PatentType_SelectPage(int pageindex, int pagesiz, int guojiaId, ref int count)
        {
            var iquery = from i in dvdc.vw_PatentType select i;
            if (guojiaId != 0)
            {
                iquery = from i in iquery where i.i_GuoJiaId == guojiaId select i;
            }
            iquery = from i in iquery orderby i.i_OrderBy ascending, i.i_Id ascending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        public string GetStartDay(int flag)
        {
            string s = "";
            switch (flag)
            {
                case 0: s = "申请日"; break;
                case 1: s = "授权日"; break;
                case 2: s = "申请日的第二年"; break;
                case 3: s = "授权日的第二年"; break;
            }
            return s;
        }
        public List<t_PatentType> GetPatentType(string banben)
        {
            string sql = "";
            switch (banben)
            {
                case "cn": sql = "select i_Id,nvc_Name from t_PatentType as a where i_Id =(select max(i_Id) from t_PatentType as b where a.nvc_Name=b.nvc_Name)"; break;
                case "en": sql = "select i_Id,nvc_EnglishName from t_PatentType as a where i_Id =(select max(i_Id) from t_PatentType as b where a.nvc_EnglishName=b.nvc_EnglishName)"; break;
                case "jp": sql = "select i_Id,nvc_JapaneseName from t_PatentType as a where i_Id =(select max(i_Id) from t_PatentType as b where a.nvc_JapaneseName=b.nvc_JapaneseName)"; break;
                case "kr": sql = "select i_Id,nvc_koreanName from t_PatentType as a where i_Id =(select max(i_Id) from t_PatentType as b where a.nvc_koreanName=b.nvc_koreanName)"; break;
            }
            return dzdc.ExecuteQuery<t_PatentType>(sql).ToList();
        }
    }
}
