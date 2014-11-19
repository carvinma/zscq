using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_SinglePage
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 修改t_SinglePage
        /// </summary>
        /// <param name="newmodel"></param>
        public int SinglePage_Submit()
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
        /// 获取t_SinglePage
        /// </summary>
        /// <returns></returns>
        public t_SinglePage SinglePage_Select_Key(string key, string language)
        {
            try
            {
                return dsdc.t_SinglePage.SingleOrDefault(a => a.nvc_Key == key && a.nvc_Language == language);
            }
            catch
            {
                return null;
            }
        }
    }
}
