using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Comment
    {
        DataProductDataContext dpdc = new DataProductDataContext();
        DataOrderDataContext dodc = new DataOrderDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 插入评论信息
        /// </summary>
        /// <param name="buidingModel"></param>
        /// <returns></returns>
        public int Comment_Add(t_Comment model)
        {
            try
            {
                var iquery = from i in dodc.t_OrderDetails where i.i_OrderId == model.i_OrderId && i.i_ProductId == model.i_ProductId select i;
                foreach (var q in iquery)
                {
                    q.i_Comment = 1;
                    dodc.SubmitChanges();
                }
                model.dt_AddTime = DateTime.Now;
                dpdc.t_Comment.InsertOnSubmit(model);
                dpdc.SubmitChanges();
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
        public int Comment_Del(int id)
        {
            try
            {
                t_Comment Comment = dpdc.t_Comment.FirstOrDefault(b => b.i_Id == id);
                dpdc.t_Comment.DeleteOnSubmit(Comment);
                dpdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据id获取单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Comment Comment_Select_Id(int id)
        {
            try
            {
                t_Comment t_Comment = dpdc.t_Comment.FirstOrDefault(Comment => Comment.i_Id == id);
                return t_Comment;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据商品id获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<vw_Comment> Comment_SelectPage_ProductId(int startIndex, int pageSize, int id, int SType, ref int count)
        {
            var iquery = from i in dvdc.vw_Comment where i.i_ProductId == id select i;
            if (SType != 0)
            {
                switch (SType)
                {
                    case 1:
                        iquery = from i in iquery where i.i_Fraction == 4 || i.i_Fraction == 5 select i;
                        break;
                    case 2:
                        iquery = from i in iquery where i.i_Fraction == 3 || i.i_Fraction == 2 select i;
                        break;
                    case 3:
                        iquery = from i in iquery where i.i_Fraction == 1 select i;
                        break;
                }
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 根据会员id获取
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<vw_Comment> Comment_SelectPage_MemberId(int startIndex, int pageSize, int id, ref int count)
        {
            var iquery = from i in dvdc.vw_Comment where i.i_MemberId == id orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_Comment> Comment_SelectPage(int startIndex, int pageSize, string Keyword, int Stype, string STime, string ETime, ref int count)//后台
        {
            var iquery = from i in dvdc.vw_Comment select i;
            if (Keyword != "")
            {
                switch (Stype)
                {
                    case 1:
                        //多字段
                        iquery = from i in iquery where i.nvc_CommentContent.Contains(Keyword) || i.nvc_ProductName.Contains(Keyword) || i.nvc_MemberName.Contains(Keyword) select i;
                        break;
                    case 2:
                        //评论内容
                        iquery = from i in iquery where i.nvc_CommentContent.Contains(Keyword) select i;
                        break;
                    case 3:
                        //商品名称
                        iquery = from i in iquery where i.nvc_ProductName.Contains(Keyword) select i;
                        break;
                    case 4:
                        //会员名称
                        iquery = from i in iquery where i.nvc_MemberName.Contains(Keyword) select i;
                        break;
                }
            }
            DateTime SDateTime = DateTime.Now.AddYears(-10);
            if (STime.Trim() != "")
            {
                SDateTime = Convert.ToDateTime(STime);
            }
            DateTime EDateTime = DateTime.Now.AddDays(1);
            if (ETime.Trim() != "")
            {
                EDateTime = Convert.ToDateTime(ETime);
            }
            iquery = from i in iquery where SDateTime < i.dt_AddTime && i.dt_AddTime < EDateTime select i;
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 根据会员ID未评价的商品
        /// </summary>
        /// <param name="i_ProductId"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public IQueryable<vw_OrderDetails> CommentProduct_Select_MemberId(int userid)
        {
            var iquery = from i in dvdc.vw_OrderDetails where i.i_MemberId == userid && i.Status == 6 && i.i_Comment == 0 select i;
            return iquery;
        }
        /// <summary>
        /// 根据会员ID未评价的商品ref count = iquery.Count();
        /// </summary>
        /// <param name="i_ProductId"></param>
        /// <param name="userid"></param>
        /// <returns></returns>
        public IQueryable<vw_OrderDetails> CommentProduct_Select_MemberId_ref(int startIndex, int pageSize, int userid, ref int ccount)
        {
            var iquery = from i in dvdc.vw_OrderDetails where i.i_MemberId == userid && i.Status == 6 && i.i_Comment == 0 select i;
            ccount = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize); ;
        }
        /// <summary>
        /// 计算总评分和平均值
        /// </summary>
        /// <param name="id"></param>
        /// <param name="avg"></param>
        /// <param name="good"></param>
        /// <param name="ordinary"></param>
        /// <param name="nogood"></param>
        public void Set_Product_Fraction(int id, ref int isum, ref int igoodssum, ref int iordinarysum, ref int inogoodsum, ref double avg, ref double good, ref double ordinary, ref double nogood)
        {
            var iquery = from a in dpdc.t_Comment where a.i_ProductId == id select a.i_Fraction;
            foreach (var q in iquery)
            {
                isum++;
                if (q == 5 || q == 4)
                {
                    igoodssum++;
                }
                else if (q == 3 || q == 2)
                {
                    iordinarysum++;
                }
                else if (q == 1)
                {
                    inogoodsum++;
                }
            }
            if (iquery.Count() > 0)
            {
                avg = iquery.Average();
                good = Math.Round(Convert.ToDouble(igoodssum) / Convert.ToDouble(isum), 2) * 100;
                ordinary = Math.Round(Convert.ToDouble(iordinarysum) / Convert.ToDouble(isum), 2) * 100;
                nogood = 100 - good - ordinary;
            }
        }
    }
}
