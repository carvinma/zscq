using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_ManagerGroup
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();

        /// <summary>
        /// 新增一条记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ManagerGroup_Add(t_ManagerGroup model)
        {
            try
            {
                dsdc.t_ManagerGroup.InsertOnSubmit(model);
                dsdc.SubmitChanges();
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
        public int ManagerGroup_Del(int id)
        {
            try
            {
                t_ManagerGroup model = dsdc.t_ManagerGroup.SingleOrDefault(b => b.i_Id == id);
                dsdc.t_ManagerGroup.DeleteOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 管理员组修改信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ManagerGroup_Update(t_ManagerGroup model)
        {
            try
            {
                t_ManagerGroup Admin = dsdc.t_ManagerGroup.SingleOrDefault(a => a.i_Id == model.i_Id);
                Admin.nvc_Name = model.nvc_Name;
                Admin.nvc_Power = model.nvc_Power;
                Admin.nvc_Remarks = model.nvc_Remarks;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取一条ManagerGroup
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_ManagerGroup ManagerGroup_Select_Id(int id)
        {
            try
            {
                t_ManagerGroup m = dsdc.t_ManagerGroup.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部管理组
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_ManagerGroup> ManagerGroup_SelectAll()
        {
            return from i in dsdc.t_ManagerGroup select i;
        }
        /// <summary>
        /// 分页获取管理员组列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<t_ManagerGroup> ManagerGroup_SelectPage(int startIndex, int pageSize, ref int count)
        {
            var iquery = from m in dsdc.t_ManagerGroup orderby m.i_Id descending select m;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 管理员获取权限
        /// </summary>
        /// <param name="Aid"></param>
        /// <param name="Dw"></param>
        /// <param name="Xw"></param>
        /// <returns></returns>
        public bool ManagerGroupPowre_Check(int Aid, int Dw, int Xw)
        {
            bool ret = false;
            try
            {
                t_ManagerGroup Admin = dsdc.t_ManagerGroup.SingleOrDefault(a => a.i_Id == Aid);
                if (Admin != null)
                {
                    string[] flagList = Admin.nvc_Power.Split('|');
                    if (int.Parse(flagList[Dw][Xw].ToString()) == 1)
                    {
                        ret = true;
                    }
                    else
                    {
                        ret = false;
                    }
                }
            }
            catch
            {
                ret = false;
            }
            return ret;
        }
    }
}