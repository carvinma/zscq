using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_CaseNoOrder
    {
        DataTradeMarkDataContext mark = new DataTradeMarkDataContext();
        public string GetTodayMaxCaseNo()
        {
           t_CaseNoOrder model= mark.t_CaseNoOrder.FirstOrDefault(p => p.SystemDate == DateTime.Today);
           string no = string.Empty;
           if (model != null && model.OrderNo != null)
           {
               no = (model.OrderNo+1).ToString();
               model.OrderNo += 1;
               mark.SubmitChanges();
           }
           else
           {
               no= "1";
               model = new t_CaseNoOrder();
               model.SystemDate = DateTime.Today;
               model.OrderNo = 1;
               mark.t_CaseNoOrder.InsertOnSubmit(model);
               mark.SubmitChanges();
           }
            return  DateTime.Today.ToString("yyMMdd")+ no.PadLeft(3, '0');
        }
    }
}
