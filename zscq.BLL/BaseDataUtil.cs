using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using zscq.DAL;

namespace zscq.BLL
{
    public class BaseDataUtil
    {
       
        public static IList<t_NewTradeMarkStatus> tradeMarkApplyStatuslist = new List<t_NewTradeMarkStatus>(); //申请状态
        public static IList<t_NewTradeMarkStatus> tradeMarkRenewedStatuslist = new List<t_NewTradeMarkStatus>();//续展状态
        public static IList<t_NewTradeMarkStatus> tradeMarkStatuslist = new List<t_NewTradeMarkStatus>(); //商标状态
        public void InitData() 
        {
            dal_NewTrademark mark = new dal_NewTrademark();
            var allResult = mark.rademarkStatus_Select_All().ToList();
            tradeMarkApplyStatuslist = allResult.Where(p => p.StatusType == 0).ToList();
            tradeMarkRenewedStatuslist= allResult.Where(p => p.StatusType == 1).ToList();
            tradeMarkStatuslist=allResult.Where(p => p.StatusType == 2).ToList();
        }

    }
}
