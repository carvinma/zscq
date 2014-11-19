using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using System.Web.UI.WebControls;

namespace zscq.BLL
{
    public class bll_AdvType
    {
        dal_AdvType DALAT = new dal_AdvType();
        /// <summary>
        /// 绑定广告分类
        /// </summary>
        /// <param name="ddl"></param>
        public void AdvType_Bind_DDL(DropDownList ddl)
        {
            ddl.Items.Clear();
            ListItem item1 = new ListItem("请选择", "0");
            ddl.Items.Add(item1);
            var iquery = DALAT.AdvType_SelectAll();
            foreach (var q in iquery)
            {
                ListItem Item = new ListItem(q.nvc_Name, q.i_Id.ToString());
                ddl.Items.Add(Item);
            }
        }
        public void AdvType_Bind_DDL(DropDownList ddl, string lang)
        {
            ddl.Items.Clear();
            ListItem item1 = new ListItem("请选择", "0");
            ddl.Items.Add(item1);
            var iquery = DALAT.AdvType_SelectAll(lang);
            foreach (var q in iquery)
            {
                ListItem Item = new ListItem(q.nvc_Name, q.i_Id.ToString());
                ddl.Items.Add(Item);
            }
        }

        //dal_WebAdType DWAT = new dal_WebAdType();
        //public void WebAdType_Bind_DDL(DropDownList ddl)
        //{
        //    ddl.Items.Clear();
        //    ListItem item1 = new ListItem("请选择", "0");
        //    ddl.Items.Add(item1);
        //    var iquery = DWAT.AdvType_SelectAll();

        //    foreach (var q in iquery)
        //    {
        //        ListItem Item = new ListItem(q.nvc_Name, q.i_Id.ToString());
        //        ddl.Items.Add(Item);
        //    }
        //}
    }
}
