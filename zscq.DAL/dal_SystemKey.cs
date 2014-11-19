using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_SystemKey
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 修改t_SystemKey
        /// </summary>
        /// <param name="newmodel"></param>
        public int SystemKey_Submit()
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
        /// 获取t_RestsSetup
        /// </summary>
        /// <returns></returns>
        public t_SystemKey SystemKey_Select_Key(string key)
        {
            try
            {
                return dsdc.t_SystemKey.SingleOrDefault(a => a.nvc_Key == key);
            }
            catch
            {
                return null;
            }
        }
        public t_SystemKey SystemKey_Select_Key(string key,string language)
        {
            try
            {
                return dsdc.t_SystemKey.SingleOrDefault(a => a.nvc_Key == key && a.nvc_Language==language);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部Key
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_SystemKey> SystemKey_SelectAll()
        {
            return from i in dsdc.t_SystemKey select i;
        }
    }
}
