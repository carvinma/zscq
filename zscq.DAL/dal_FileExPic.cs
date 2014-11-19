using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;

namespace zscq.DAL
{
    public class dal_FileExPic
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();
        /// <summary>
        /// 添加文件图片
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int FileExPic_Add(t_FileExPic model)
        {
            try
            {
                dsdc.t_FileExPic.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除文件图片
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public int FileExPic_Del(int id)
        {
            try
            {
                t_FileExPic model = dsdc.t_FileExPic.SingleOrDefault(a => a.i_Id == id);
                if (model != null)
                {
                    dsdc.t_FileExPic.DeleteOnSubmit(model);
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
        /// 修改文件图片
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int FileExPic_Update(t_FileExPic model)
        {
            try
            {
                t_FileExPic UF = dsdc.t_FileExPic.SingleOrDefault(a => a.i_Id == model.i_Id);
                if (UF != null)
                {
                    UF.nvc_FileExtensions = model.nvc_FileExtensions;
                    UF.nvc_Pic = model.nvc_Pic;
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
        /// 获取全部文件图片
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_FileExPic> FileExPic_Select_All()
        {
            var iquery = from i in dsdc.t_FileExPic orderby i.i_Id descending select i;
            return iquery;
        }
        /// <summary>
        /// 获取某个文件图片
        /// </summary>
        /// <param name="Gid"></param>
        /// <returns></returns>
        public t_FileExPic FileExPic_Select_Id(int fid)
        {
            try
            {
                t_FileExPic UF = dsdc.t_FileExPic.SingleOrDefault(a => a.i_Id == fid);
                return UF;
            }
            catch
            {
                return null;
            }
        }
    }
}
