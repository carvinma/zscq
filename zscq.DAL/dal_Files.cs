using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_Files
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        /// <summary>
        /// 添加文件
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Files_Add(t_Files model)
        {
            try
            {
                dsdc.t_Files.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public int Files_Del(int id)
        {
            try
            {
                t_Files model = dsdc.t_Files.SingleOrDefault(a => a.i_Id == id);
                if (model != null)
                {
                    dsdc.t_Files.DeleteOnSubmit(model);
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
        /// 修改文件
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Files_Update(t_Files model)
        {
            try
            {
                t_Files UF = dsdc.t_Files.SingleOrDefault(a => a.i_Id == model.i_Id);
                if (UF != null)
                {
                    UF.i_Order = model.i_Order;
                    UF.i_TypeId = model.i_TypeId;
                    UF.nvc_FileName = model.nvc_FileName;
                    model.nvc_FilePath = model.nvc_FilePath;
                    model.i_PicId = model.i_PicId;
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
        /// 获取全部文件
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Files> Files_Select_All()
        {
            var iquery = from i in dsdc.t_Files orderby i.i_Id descending select i;
            return iquery;
        }
        public IQueryable<t_Files> Files_Select_All(int pageindex, int pagesize, ref int count)
        {
            var iquery = from i in dsdc.t_Files orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IQueryable<t_Files> Files_Select_All(int pageindex, int pagesize, int typeid, ref int count)
        {
            var iquery = from i in dsdc.t_Files where i.i_TypeId == typeid orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        /// <summary>
        /// 获取某个文件
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public t_Files Files_Select_Id(int fid)
        {
            try
            {
                t_Files UF = dsdc.t_Files.SingleOrDefault(a => a.i_Id == fid);
                return UF;
            }
            catch
            {
                return null;
            }
        }
        public vw_Files vwFiles_Select_Id(int fid)
        {
            try
            {
                vw_Files UF = dvdc.vw_Files.SingleOrDefault(a => a.i_Id == fid);
                return UF;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<vw_Files> vwFiles_Select_All()
        {
            var iquery = from i in dvdc.vw_Files orderby i.i_Id descending select i;
            return iquery;
        }
        public IQueryable<vw_Files> vwFiles_Select_All(int pageindex, int pagesize, ref int count)
        {
            var iquery = from i in dvdc.vw_Files orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IQueryable<vw_Files> vwFiles_Select_All(int pageindex, int pagesize, int typeid, ref int count)
        {
            var iquery = from i in dvdc.vw_Files where i.i_TypeId == typeid orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
        public IQueryable<vw_Files> vwFiles_Select_All(int pageindex, int pagesize, int typeid, ref int count, string lang)
        {
            var iquery = from i in dvdc.vw_Files where i.i_TypeId == typeid && i.nvc_Language == lang orderby i.i_Order ascending,i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesize).Take(pagesize);
        }
    }
}
