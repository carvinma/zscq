using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_Manager
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();

        /// <summary>
        /// 新增一条记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Manager_Add(t_Manager model)
        {
            try
            {
                t_Manager m = dsdc.t_Manager.FirstOrDefault(a => a.nvc_Name == model.nvc_Name);
                if (m == null)
                {
                    dsdc.t_Manager.InsertOnSubmit(model);
                    dsdc.SubmitChanges();
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
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        public int Manager_Del(int id)
        {
            try
            {
                t_Manager model = dsdc.t_Manager.SingleOrDefault(b => b.i_Id == id);
                dsdc.t_Manager.DeleteOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改Manager的密码
        /// </summary>
        /// <param name="manager"></param>
        public int Manager_UpdatePwd(t_Manager manager)
        {
            try
            {
                t_Manager m = dsdc.t_Manager.SingleOrDefault(a => a.i_Id == manager.i_Id);
                if (m != null)
                {
                    m.nvc_PassWord = manager.nvc_PassWord;
                    dsdc.SubmitChanges();
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
        /// <summary>
        /// 管理员修改信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Manager_Update(t_Manager model)
        {
            try
            {
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取一条Manager
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Manager Manager_Select_Id(int id)
        {
            try
            {
                t_Manager m = dsdc.t_Manager.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取一条Manager
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public vw_Manager Manager_vw_Select_Id(int id)
        {
            try
            {
                vw_Manager m = dvdc.vw_Manager.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部Manager
        /// </summary>
        /// <returns></returns>
        public IQueryable<vw_Manager> Manager_Select_GId(int GId)
        {
            return from a in dvdc.vw_Manager where a.i_GroupId == GId select a;
        }
        /// <summary>
        /// 分页获取管理员列表
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_Manager> Manager_SelectPage(int startIndex, int pageSize, int TType, ref int count)
        {
            var iquery = from m in dvdc.vw_Manager select m;
            if (TType != -1)
            {
                iquery = from i in iquery where i.i_GroupId == TType select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取全部Manager
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Manager> Manager_SelectAll()
        {
            return from a in dsdc.t_Manager select a;
        }
        /// <summary>
        /// 管理员获取权限
        /// </summary>
        /// <param name="Aid"></param>
        /// <param name="Dw"></param>
        /// <param name="Xw"></param>
        /// <returns></returns>
        public bool ManagerPowre_Check(int Aid, int Dw, int Xw)
        {
            bool ret = false;
            try
            {
                vw_Manager Admin = dvdc.vw_Manager.SingleOrDefault(a => a.i_Id == Aid);
                if (Admin != null)
                {
                    string[] flagList = (Admin.i_GroupId == 0 ? Admin.nvc_Power.Split('|') : Admin.nvc_GroupPower.Split('|'));
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
        /// <summary>
        /// 管理员登录
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="pwd"></param>
        /// <param name="id"></param>
        /// <param name="flag"></param>   
        /// <param name="type">管理员登录类型 1是专利，2是商标</param>
        /// <returns></returns>
        public bool Manager_Login(string uid, string pwd, ref int id, ref string flag, ref int type, ref string realname)
        {
            vw_Manager model = dvdc.vw_Manager.SingleOrDefault(a => a.nvc_Name == uid && a.nvc_PassWord == pwd);
            if (model != null)
            {
                id = model.i_Id;
                flag = (model.i_GroupId == 0 ? model.nvc_Power : model.nvc_GroupPower);
                realname = model.nvc_RealName;
                type = model.i_ManagerType;
                return true;
            }
            else
            {
                id = 0;
                flag = string.Empty;
                return false;
            }
        }

        #region 记录系统日志
        /// <summary>
        /// 添加系统日志
        /// </summary>
        /// <param name="log"></param>
        public int SystemLog_Add(t_SystemLog log)
        {
            try
            {
                dsdc.t_SystemLog.InsertOnSubmit(log);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据ID删除系统日志
        /// </summary>
        /// <param name="id"></param>
        public int SystemLog_Del(int id)
        {
            try
            {
                t_SystemLog log = dsdc.t_SystemLog.Single(a => a.LogID == id);
                dsdc.t_SystemLog.DeleteOnSubmit(log);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 分页获取系统日志
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="name"></param>
        /// <param name="yemian"></param>
        /// <param name="begine"></param>
        /// <param name="end"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable SystemLog_SelectPage(int startIndex, int pageSize, string name, string yemian, DateTime begine, DateTime end, ref int count)
        {
            Expression<Func<t_SystemLog, bool>> WhereExpr = PredicateExtensions.True<t_SystemLog>();
            if (!string.IsNullOrEmpty(yemian) && yemian != "0")
            {
                WhereExpr = WhereExpr.And(a => a.pindao == yemian);
            }
            if (begine != DateTime.MinValue)
            {
                WhereExpr = WhereExpr.And(a => a.Time >= begine);
            }
            if (begine != DateTime.MinValue)
            {
                WhereExpr = WhereExpr.And(a => a.Time < end);
            }
            var iquery = from i in dsdc.t_SystemLog.Where(WhereExpr)
                         join b in dsdc.t_Manager on i.AdminID equals b.i_Id into c
                         from d in c.DefaultIfEmpty()
                         select new
                         {
                             id = i.LogID,
                             time = i.Time,
                             i.ip,
                             i.pindao,
                             jilu = i.nvc_LogContent,
                             name = d.nvc_Name,
                             AdminID = i.AdminID
                         };
            if (!string.IsNullOrEmpty(name))
            {
                iquery = from i in iquery where i.AdminID.ToString() == name select i;
            }
            iquery = from i in iquery orderby i.time descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取系统日志的类别
        /// </summary>
        /// <returns></returns>
        public IQueryable Set_SystemType()
        {
            var q = from a in dsdc.t_SystemLog
                    group a by new
                    {
                        a.pindao
                    }
                        into f
                        select new
                        {
                            leibie = f.Key.pindao
                        };
            return q;
        }
        #endregion
    }
}