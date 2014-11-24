using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Data.Linq;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_Apply
    {
        private DataTradeMarkDataContext mark = new DataTradeMarkDataContext();
        /// <summary>
        /// 添加申请人信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Apply_Add(t_Apply model)
        {
            try
            {
                model.AddTime = DateTime.Now;
                mark.t_Apply.InsertOnSubmit(model);
                mark.SubmitChanges(ConflictMode.ContinueOnConflict);
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据当前申请人ID获取其信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Apply Apply_Select_Id(int id)
        {
            try
            {
                t_Apply guest = mark.t_Apply.SingleOrDefault(u => u.i_Id == id);
                return guest;
            }
            catch
            {
                return null;
            }
        }

        public int Apply_Del(int id)
        {
            try
            {
                t_Apply model = mark.t_Apply.SingleOrDefault(b => b.i_Id == id);
                if (model != null)
                {
                    mark.t_Apply.DeleteOnSubmit(model);
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

        public IQueryable<t_Apply> Apply_SelectPage(int pageindex, int pagesize, int type, string keyword, int MemberID, ref int count)
        {
            var iquery = mark.t_Apply.Where(p => p.MemberID == MemberID);
            //var iquery = from i in mark.t_Apply select i;
            //0 企业单位 1自然人
            if (type >= 0)
            {
                iquery = from i in iquery where i.ApplyType == type select i;
            }
            if (!string.IsNullOrEmpty(keyword))
            {
                iquery = from i in iquery where SqlMethods.Like(i.ApplyPinYin, string.Format("%{0}%", keyword)) select i;
            }

            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
    }
}
