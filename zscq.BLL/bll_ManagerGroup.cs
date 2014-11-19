using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.Model;

namespace zscq.BLL
{
    public class bll_ManagerGroup
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        dal_ManagerGroup DALMG = new dal_ManagerGroup();

        /// <summary>
        /// 新增一条记录
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ManagerGroup_Add(t_ManagerGroup model)
        {
            try
            {
                t_ManagerGroup m = dsdc.t_ManagerGroup.FirstOrDefault(a => a.nvc_Name == model.nvc_Name);
                if (m == null)
                {
                    return DALMG.ManagerGroup_Add(model);
                }
                else
                {
                    return 2;
                }
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
                t_ManagerGroup Admin = dsdc.t_ManagerGroup.SingleOrDefault(a => a.i_Id == model.i_Id);//首先看看ID是否正确
                var iquery = from i in dsdc.t_ManagerGroup where i.i_Id != model.i_Id && i.nvc_Name == model.nvc_Name select i;
                if (iquery.Count() == 0)
                {
                    return DALMG.ManagerGroup_Update(model);
                }
                else
                {
                    return 2;
                }
            }
            catch
            {
                return 0;
            }
        }
    }
}
