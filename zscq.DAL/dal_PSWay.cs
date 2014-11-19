using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_PSWay
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 添加配送方式
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PSWay_Add(t_PSWay model)
        {
            try
            {
                var iquey = from i in dsdc.t_PSWay where i.nvc_Name == model.nvc_Name select i;
                if (iquey.Count() > 0)
                {
                    return 2;
                }

                dsdc.t_PSWay.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除配送方式
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public int PSWay_Del(int Pid)
        {
            try
            {
                t_PSWay PW = dsdc.t_PSWay.SingleOrDefault(a => a.i_Id == Pid);
                if (PW != null)
                {
                    dsdc.t_PSWay.DeleteOnSubmit(PW);
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
        /// 修改配送方式
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PSWay_Update(t_PSWay model)
        {
            try
            {
                var iquey = from i in dsdc.t_PSWay where i.nvc_Name == model.nvc_Name && i.i_Id != model.i_Id select i;
                if (iquey.Count() > 0)
                {
                    return 2;
                }

                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取全部配送方式
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PSWay> PSWay_Select_All()
        {
            return from i in dsdc.t_PSWay select i;
        }
        /// <summary>
        /// 根据表id获取某个配送方式
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_PSWay PSWay_Select_Id(int Pid)
        {
            try
            {
                t_PSWay PW = dsdc.t_PSWay.SingleOrDefault(a => a.i_Id == Pid);
                return PW;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据表Name获取某个配送方式
        /// </summary>
        /// <param name="Pid"></param>
        /// <returns></returns>
        public t_PSWay PSWay_Select_Name(string PName)
        {
            try
            {
                t_PSWay PW = dsdc.t_PSWay.SingleOrDefault(a => a.nvc_Name == PName);
                return PW;
            }
            catch
            {
                return null;
            }
        }
    }
}
