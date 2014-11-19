using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_MessageSetup
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 系统设置修改
        /// </summary>
        /// <returns></returns>
        public int MessageSetup_Submit()
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
        /// 获取系统信息
        /// </summary>
        /// <returns></returns>
        public t_MessageSetup MessageSetup_Select()
        {
            return (from f in dsdc.t_MessageSetup select f).FirstOrDefault();
        }
    }
}
