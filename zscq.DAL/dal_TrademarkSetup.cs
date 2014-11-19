using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_TrademarkSetup
    {
        DataZscqDataContext dc = new DataZscqDataContext();
        /// <summary>
        /// 系统设置修改
        /// </summary>
        /// <returns></returns>
        public int TrademarkSetup_Submit()
        {
            try
            {
                dc.SubmitChanges();
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
        public t_TradeMarkSetup TrademarkSetup_Select()
        {
            return (from f in dc.t_TradeMarkSetup select f).FirstOrDefault();
        }
        /// <summary>
        /// 检查网站是否过期
        /// </summary>
        /// <returns></returns>
        public bool CheckSystem()
        {
            DateTime End = Convert.ToDateTime("2014-03-15");
            if (System.DateTime.Now > End)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
