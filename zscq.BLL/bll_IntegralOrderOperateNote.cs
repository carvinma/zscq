using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

namespace zscq.BLL
{
    public class bll_IntegralOrderOperateNote
    {
        dal_IntegralOrderOperateNote DALIOO = new dal_IntegralOrderOperateNote();
        /// <summary>
        /// 评论添加
        /// </summary>
        /// <param name="Fraction"></param>
        /// <param name="MemberId"></param>
        /// <param name="ProductId"></param>
        /// <param name="_Content"></param>
        /// <returns></returns>
        public int IntegralOrderOperateNote_Add(string NType, string Remark, int MemberId, int OrderId)
        {
            try
            {
                t_IntegralOrderOperateNote model = new t_IntegralOrderOperateNote();
                model.nvc_Type = NType;
                model.nvc_Remark = Remark;
                model.i_OrderId = OrderId;
                model.i_ManagerId = MemberId;
                return DALIOO.IntegralOrderOperateNote_Add(model);
            }
            catch
            {
                return 0;
            }
        }
    }
}
