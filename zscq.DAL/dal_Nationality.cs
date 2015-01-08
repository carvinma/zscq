using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;
using System.Web;
using System.Web.UI.WebControls;
namespace zscq.DAL
{
    public class dal_Nationality
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataSystemDataContext dsdc = new DataSystemDataContext();
        #region 国家
        /// <summary>
        /// 添加国家
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        public int Nationality_Add(t_Nationality p)
        {
            try
            {
                dzdc.t_Nationality.InsertOnSubmit(p);
                dzdc.SubmitChanges();
                return p.i_Id;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除国家
        /// </summary>
        /// <param name="id"></param>
        public int Nationality_Del(int id)
        {
            try
            {
                t_Nationality p = dzdc.t_Nationality.Single(a => a.i_Id == id);
                dzdc.t_Nationality.DeleteOnSubmit(p);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改国家
        /// </summary>
        /// <param name="m"></param>
        public int Nationality_Update(t_Nationality m)
        {
            try
            {
                t_Nationality t = dzdc.t_Nationality.Single(a => a.i_Id == m.i_Id);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取国家
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Nationality Nationality_Select_Id(int id)
        {
            try
            {
                t_Nationality model = dzdc.t_Nationality.SingleOrDefault(a => a.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public t_Nationality Nationality_Select_ByMemberId(int uid)
        {   
            DataMemberDataContext daMem=new DataMemberDataContext();
            t_Member member= daMem.t_Member.First(p => p.i_Id == uid);
            if (member.i_GuoJiId>0)
            {
               return dzdc.t_Nationality.First(p => p.i_Id == member.i_GuoJiId);
            }
            return null;
        }
        public t_Nationality Nationality_Select_Name(string name, string flag)
        {
            try
            {
                t_Nationality model = new t_Nationality();
                switch (flag)
                {
                    case "cn": model = dzdc.t_Nationality.SingleOrDefault(a => a.nvc_Name == name); break;
                    case "en": model = dzdc.t_Nationality.SingleOrDefault(a => a.nvc_EnName == name); break;
                    case "jp": model = dzdc.t_Nationality.SingleOrDefault(a => a.nvc_JpanName == name); break;
                    case "kr": model = dzdc.t_Nationality.SingleOrDefault(a => a.nvc_HanName == name); break;
                }
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据缴费币种来算缴费的汇率
        /// </summary>
        /// <param name="bizhong"></param>
        /// <returns></returns>
        public t_Nationality Nationality_Select_BiZhong(string bizhong)
        {
            try
            {
                t_Nationality model = dzdc.t_Nationality.FirstOrDefault(a => a.nvc_Currency == bizhong);
                return model;
            }
            catch
            {
                return null;
            }
        }


        /// <summary>
        /// 获取全部国家
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Nationality> Nationality_SelectAll()
        {
            var query = from q in dzdc.t_Nationality orderby q.i_Id ascending select q;
            return query;
        }
        /// <summary>
        /// 后台分页获取国家
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable Nationality_SelectPage(int startIndex, int pageSize, string name, int ctype, ref int count)
        {
            var iquery = from q in dzdc.t_Nationality select q;
            if (name != "")
            {
                if (ctype == 1)
                {
                    iquery = from q in dzdc.t_Nationality where q.nvc_Name.Contains(name) select q;
                }
                if (ctype == 2)
                {
                    iquery = from q in dzdc.t_Nationality where q.nvc_EnName.Contains(name) select q;
                }
                if (ctype == 3)
                {
                    iquery = from q in dzdc.t_Nationality where q.nvc_JpanName.Contains(name) select q;
                }
                if (ctype == 4)
                {
                    iquery = from q in dzdc.t_Nationality where q.nvc_HanName.Contains(name) select q;
                }
            }
            iquery = from i in iquery orderby i.i_Orderby ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取全部国家会加入dropdownlist
        /// </summary>
        /// <param name="ddl"></param>
        public void Nationality_Bind_DDL(DropDownList ddl)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
            foreach (var s in iquery)
            {
                ListItem item2 = new ListItem(s.nvc_Name, s.i_Id.ToString());
                ddl.Items.Add(item2);
            }
        }
        public void Nationality_Bind_DDL(DropDownList ddl, string gj)
        {
            ddl.Items.Clear();
            if (gj == "en")
            {
                ListItem item = new ListItem("Please select", "0");
                ddl.Items.Add(item);
                var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
                foreach (var s in iquery)
                {
                    ListItem item2 = new ListItem(s.nvc_EnName, s.i_Id.ToString());
                    ddl.Items.Add(item2);
                }
            }
            else if (gj == "kr")
            {
                ListItem item = new ListItem("선택하십시오.", "0");
                ddl.Items.Add(item);
                var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
                foreach (var s in iquery)
                {
                    ListItem item2 = new ListItem(s.nvc_HanName, s.i_Id.ToString());
                    ddl.Items.Add(item2);
                }
            }
            else if (gj == "jp")
            {
                ListItem item = new ListItem("を選択してください", "0");
                ddl.Items.Add(item);
                var iquery = from p in dzdc.t_Nationality orderby p.i_Id ascending select p;
                foreach (var s in iquery)
                {
                    ListItem item2 = new ListItem(s.nvc_JpanName, s.i_Id.ToString());
                    ddl.Items.Add(item2);
                }
            }

        }
        #endregion
        /// <summary>
        /// 根据国家ID绑定省
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="guojiaid"></param>
        public void Provice_Bind_DDL_NId(DropDownList ddl, string guojiaid)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from c in dsdc.t_Province where c.guojiaID == Convert.ToInt32(guojiaid) orderby c.provinceID ascending select c;
            foreach (var q in iquery)
            {
                ListItem item2 = new ListItem(q.provinceName, q.i_ID.ToString());
                ddl.Items.Add(item2);
            }
        }
    }
}
