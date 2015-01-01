using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

namespace zscq.BLL
{
    public class bll_MemberGrade
    {
        dal_Member DALM = new dal_Member();
        dal_TrademarkOrder DALO = new dal_TrademarkOrder();
        dal_UserGrade DALUG = new dal_UserGrade();
        DataMemberDataContext dmdc = new DataMemberDataContext();
        /// <summary>
        /// 升级降级
        /// </summary>
        /// <param name="Order_Model"></param>
        /// <param name="CType"></param>
        /// <returns></returns>
        public int Member_UpdateGrade(t_TrademarkOrder Order_Model, int CType)
        {
            try
            {
                t_Member Member = DALM.Member_Select_Id(Order_Model.i_MemberId);
                if (Member != null)
                {
                    var iquery = from i in DALO.TrademarkOrder_Select_MemberId(Order_Model.i_MemberId) where i.i_Status == 4 select i;
                    if (iquery.Count() > 0)
                    {
                        //var siquery = (from i in DALO.TrademarkOrder_Select_MemberId(Order_Model.i_MemberId) where i.i_Status == 4 select i.dm_SumMoney).Sum();//计算消费额
                        //var UG = from i in (IQueryable<t_MemberGrade>)DALUG.UserGrade_Select_All() where i.i_Jifen < siquery orderby i.i_Jifen descending select i;//查找低于消费额的等级
                        //foreach (var q in UG.Take(1))
                        //{
                        //    t_MemberGrade ug = DALUG.UserGrade_Select_Id(Member.i_Grade);//找该会员目前的等级
                        //    if (ug != null)
                        //    {
                        //        if (CType == 0)//如果是升级
                        //        {
                        //            if (ug.i_Grade < q.i_Grade)//如果查询到的等级的级别大于目前等级的级别，那么就升级了  




                        //            {
                        //                Member.i_Grade = q.i_id;
                        //            }
                        //        }
                        //        else if (CType == 1)//如果是降级
                        //        {
                        //            Member.i_Grade = q.i_id;
                        //        }
                        //        DALM.Member_Update(Member);
                        //        return 1;
                        //    }
                        //}
                    }
                    else
                    {
                        Member.i_Grade = 1;
                        DALM.Member_Update(Member);
                        return 1;
                    }
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 升级降级
        /// </summary>
        /// <param name="Order_Model"></param>
        /// <param name="CType"></param>
        /// <returns></returns>
        public int Member_UpdateGrade(t_NewTrademarkOrder Order_Model, int CType)
        {
            try
            {
                t_Member Member = DALM.Member_Select_Id(Order_Model.i_MemberId);
                if (Member != null)
                {
                    var iquery = from i in DALO.TrademarkOrder_Select_New_MemberId(Order_Model.i_MemberId) where i.i_Status == 4 select i;
                    if (iquery.Count() > 0)
                    {
                    }
                    else
                    {
                        Member.i_Grade = 1;
                        DALM.Member_Update(Member);
                        return 1;
                    }
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取会员级别
        /// </summary>
        /// <param name="memeberid"></param>
        /// <returns></returns>
        public string GetMemberGrade(string memeberid)
        {
            string name1 = "";
            var grade = from p in dmdc.t_Member where p.i_Id == Convert.ToInt32(memeberid) select p.i_Grade;
            foreach (var item in grade.Take(1))
            {
                var name = from g in dmdc.t_MemberGrade where g.i_id == item select g.nvc_Name;
                foreach (var na in name.Take(1))
                {
                    name1 = na;
                }
            }
            return name1;
        }
    }
}
