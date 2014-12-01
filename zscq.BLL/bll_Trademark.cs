using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

namespace zscq.BLL
{
   public  class bll_Trademark
    {
       private dal_Apply apply = new dal_Apply();

       public int Apply_Add(t_Apply model)
       {
           return apply.Apply_Add(model);
       }
       public t_Apply Apply_Select_Id(int memberid)
       {
           return apply.Apply_Select_Id(memberid);
       }
       public IQueryable<t_Apply> Apply_SelectPage(int pageindex, int pagesize, int type, string keyword, int MemberID, ref int count)
       {
           return apply.Apply_SelectPage(pageindex, pagesize, type, keyword, MemberID, ref count);
       }
        
    }
}
