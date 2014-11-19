using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Linq.Expressions;

namespace zscq.DAL
{
    public class dal_ReceiveAddress
    {
        DataMemberDataContext dodc = new DataMemberDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 插入数据
        /// </summary>
        /// <param name="model"></param>
        public int ReceiveAddress_Add(t_ReceiveAddress model)
        {
            try
            {
                var iquery = from i in dodc.t_ReceiveAddress where i.i_MemberId == model.i_MemberId && i.nvc_Consignee == model.nvc_Consignee && i.i_PId == model.i_PId && i.i_CId == model.i_CId && i.i_Gid == model.i_Gid && i.i_AId == model.i_AId && i.nvc_StreetAddress == model.nvc_StreetAddress select i;
                if (iquery.Count() > 0)
                {
                    return 2;
                }
                else
                {
                    dodc.t_ReceiveAddress.InsertOnSubmit(model);
                    dodc.SubmitChanges();
                    return 1;
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
        public int ReceiveAddress_Del(int id)
        {
            try
            {
                t_ReceiveAddress product = dodc.t_ReceiveAddress.Single(b => b.i_Id == id);
                dodc.t_ReceiveAddress.DeleteOnSubmit(product);
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除判断默认地址
        /// </summary>
        /// <param name="id"></param>
        public int ReceiveAddress_Del2(int id)
        {
            try
            {
                t_ReceiveAddress model = dodc.t_ReceiveAddress.Single(b => b.i_Id == id);
                t_Member Member = (from i in dodc.t_Member where i.i_Id == model.i_MemberId select i).FirstOrDefault();
                if (Member.i_DefaultAddress == id)
                {
                    Member.i_DefaultAddress = 0;
                }
                dodc.t_ReceiveAddress.DeleteOnSubmit(model);
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ReceiveAddress_Update(t_ReceiveAddress model)
        {
            try
            {
                var iquery = from i in dodc.t_ReceiveAddress where i.i_Id != model.i_Id && i.i_MemberId == model.i_MemberId && i.nvc_Consignee == model.nvc_Consignee && i.i_PId == model.i_PId && i.i_CId == model.i_CId && i.i_AId == model.i_AId && i.nvc_StreetAddress == model.nvc_StreetAddress select i;
                if (iquery.Count() > 0)
                {
                    return 2;
                }
                else
                {
                    dodc.SubmitChanges();
                    return 1;
                }
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int ReceiveAddress_Update_Mr(int AId)
        {
            try
            {
                t_ReceiveAddress model = ReceiveAddress_Select_Id(AId);
                t_Member Member = (from i in dodc.t_Member where i.i_Id == model.i_MemberId select i).FirstOrDefault();
                Member.i_DefaultAddress = AId;
                dodc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据id返回单条记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_ReceiveAddress ReceiveAddress_Select_Id(int id)
        {
            try
            {
                t_ReceiveAddress m = dodc.t_ReceiveAddress.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        public vw_ReceiveAddress ReceiveAddress_vw_Select_Id(int id)
        {
            try
            {
                vw_ReceiveAddress m = dvdc.vw_ReceiveAddress.SingleOrDefault(a => a.i_Id == id);
                return m;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<t_ReceiveAddress> ReceiveAddress_Select_MemberId(int userid)
        {
            var iquery = from i in dodc.t_ReceiveAddress where i.i_MemberId == userid select i;
            return iquery;
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_ReceiveAddress> ReceiveAddress_vw_Select_MemberId(int userid)
        {
            var iquery = from i in dvdc.vw_ReceiveAddress where i.i_MemberId == userid select i;
            return iquery;
        }
        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable<vw_ReceiveAddress> ReceiveAddress_vw_Select_MemberId(int pageindex, int pagesize, int userid, ref int count)
        {
            var iquery = from i in dvdc.vw_ReceiveAddress where i.i_MemberId == userid select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 根据判断是否重复
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<t_ReceiveAddress> ReceiveAddress_Select_Same(int id, string name, int p, int c, int a, string address, string phone, int tid)
        {
            var iquery = from i in dodc.t_ReceiveAddress
                         where i.i_MemberId == id && i.nvc_Consignee == name && i.i_PId == p && i.i_CId == c && i.i_AId == a && i.nvc_StreetAddress == address && i.nvc_MobilePhone == phone && i.i_Id != tid
                         select i;
            return iquery;
        }
    }
}
