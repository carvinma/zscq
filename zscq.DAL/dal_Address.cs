using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.Model;
using System.Web.UI.WebControls;

namespace zscq.DAL
{
    public class dal_Address
    {
        DataSystemDataContext dsdc = new DataSystemDataContext();

        #region 省
        /// <summary>
        /// 添加省
        /// </summary>
        /// <param name="p"></param>
        /// <returns></returns>
        public int Province_Add(t_Province p)
        {
            try
            {
                dsdc.t_Province.InsertOnSubmit(p);
                dsdc.SubmitChanges();
                return p.i_ID;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除省
        /// </summary>
        /// <param name="id"></param>
        public int Province_Del(int id)
        {
            try
            {
                t_Province p = dsdc.t_Province.Single(a => a.i_ID == id);
                dsdc.t_Province.DeleteOnSubmit(p);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改省
        /// </summary>
        /// <param name="m"></param>
        public int Province_Update(t_Province m)
        {
            try
            {
                t_Province t = dsdc.t_Province.Single(a => a.i_ID == m.i_ID);
                t.provinceID = m.provinceID;
                t.provinceName = m.provinceName;
                t.guojiaID = m.guojiaID;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取省
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_Province Province_Select_Id(int id)
        {
            try
            {
                t_Province model = dsdc.t_Province.SingleOrDefault(a => a.i_ID == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取全部省
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Province> Province_SelectAll()
        {
            var query = from q in dsdc.t_Province orderby q.provinceID ascending select q;
            return query;
        }
        /// <summary>
        /// 后台分页获取省
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable Province_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from q in dsdc.t_Province select q;
            if (name != "")
            {
                iquery = from q in dsdc.t_Province where q.provinceName.Contains(name) select q;
            }
            iquery = from i in iquery orderby i.provinceID ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取全部省会加入dropdownlist
        /// </summary>
        /// <param name="ddl"></param>
        public void Provice_Bind_DDL(DropDownList ddl)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from p in dsdc.t_Province orderby p.provinceID ascending select p;
            foreach (var s in iquery)
            {
                ListItem item2 = new ListItem(s.provinceName, s.i_ID.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

        #region 市
        /// <summary>
        /// 添加市
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public int City_Add(t_City c)
        {
            try
            {
                dsdc.t_City.InsertOnSubmit(c);
                dsdc.SubmitChanges();
                return c.i_ID;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除市
        /// </summary>
        /// <param name="id"></param>
        public int City_Del(int id)
        {
            try
            {
                t_City p = dsdc.t_City.Single(a => a.i_ID == id);
                dsdc.t_City.DeleteOnSubmit(p);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改市
        /// </summary>
        /// <param name="m"></param>
        public int City_Update(t_City m)
        {
            try
            {
                t_City t = dsdc.t_City.Single(a => a.i_ID == m.i_ID);
                t.provinceID = m.provinceID;
                t.cityID = m.cityID;
                t.cityName = m.cityName;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID获取市
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public t_City City_Select_Id(int id)
        {
            try
            {
                t_City model = dsdc.t_City.SingleOrDefault(a => a.i_ID == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据省ID获取全部市
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_City> City_Select_ProvinceId(int id)
        {
            var query = from q in dsdc.t_City
                        where q.provinceID == id
                        orderby q.cityID ascending
                        select q;
            return query;
        }
        /// <summary>
        /// 分页获取城市
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable City_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from a in dsdc.t_City
                         join b in dsdc.t_Province on a.provinceID equals b.i_ID
                         select new
                         {
                             id = a.i_ID,
                             cityid = a.cityID,
                             cityname = a.cityName,
                             pname = b.provinceName
                         };
            if (name != "")
            {
                iquery = from i in iquery where i.cityname.Contains(name) select i;
            }
            iquery = from i in iquery orderby i.cityid ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 精准单条件根据省Id获取城市
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="ProviceID"></param>
        public void City_Bind_DDL_PId(DropDownList ddl, string ProviceID)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from c in dsdc.t_City where c.provinceID == Convert.ToInt32(ProviceID) orderby c.cityID ascending select c;
            foreach (var q in iquery)
            {
                ListItem item2 = new ListItem(q.cityName, q.i_ID.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

        #region 区
        /// <summary>
        /// 添加地区
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public int Area_Add(t_Area a)
        {
            try
            {
                dsdc.t_Area.InsertOnSubmit(a);
                dsdc.SubmitChanges();
                return a.i_ID;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 根据ID删除区
        /// </summary>
        /// <param name="id"></param>
        public int Area_Del(int id)
        {
            try
            {
                t_Area p = dsdc.t_Area.Single(a => a.i_ID == id);
                dsdc.t_Area.DeleteOnSubmit(p);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 修改区
        /// </summary>
        /// <param name="m"></param>
        public int Area_Update(t_Area m)
        {
            try
            {
                t_Area t = dsdc.t_Area.Single(a => a.i_ID == m.i_ID);
                t.cityID = m.cityID;
                t.areaID = m.areaID;
                t.areaName = m.areaName;
                t.i_Remote = m.i_Remote;
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 精准单条件根据ID获取区
        /// </summary>
        /// <param name="AId"></param>
        /// <returns></returns>
        public t_Area Area_Select_Id(int AId)
        {
            try
            {
                t_Area model = dsdc.t_Area.SingleOrDefault(a => a.i_ID == AId);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 获取市ID获取全部地区
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Area> Area_Select_CityId(int id)
        {
            var query = from q in dsdc.t_Area
                        where q.cityID == id
                        orderby q.areaID ascending
                        select q;
            return query;
        }
        /// <summary>
        /// 分页获取地区
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public IQueryable Area_SelectPage(int startIndex, int pageSize, string name, ref int count)
        {
            var iquery = from a in dsdc.t_Area
                         join b in dsdc.t_City on a.cityID equals b.i_ID
                         join c in dsdc.t_Province on b.provinceID equals c.i_ID                         
                         select new
                         {
                             id = a.i_ID,
                             quhao=a.nvc_Quhao,
                             areaid = a.areaID,
                             name = a.areaName,
                             cname = b.cityName,
                             pname = c.provinceName,
                             remote = a.i_Remote
                         };
            if (name != "")
            {
                iquery = from i in iquery where i.name.Contains(name) select i;
            }
            iquery = from i in iquery orderby i.areaid ascending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }
        /// <summary>
        /// 获取指定城市的地区
        /// </summary>
        /// <param name="ddl"></param>
        /// <param name="CityID"></param>
        public void Area_Bind_DDL_CId(DropDownList ddl, string CityID)
        {
            ddl.Items.Clear();
            ListItem item = new ListItem("请选择", "0");
            ddl.Items.Add(item);
            var iquery = from a in dsdc.t_Area where a.cityID == Convert.ToInt32(CityID) orderby a.areaID ascending select a;
            foreach (var q in iquery)
            {
                ListItem item2 = new ListItem(q.areaName, q.i_ID.ToString());
                ddl.Items.Add(item2);
            }
        }
        #endregion

        #region 省市区
        public string Set_AddressName_PId_CId_AId(int pid, int cid, int aid)
        {
            t_Province pro = Province_Select_Id(pid);
            t_City city = City_Select_Id(cid);
            t_Area area = Area_Select_Id(aid);
            string address = String.Empty;
            if (pro != null)
                address = pro.provinceName;
            if (city != null)
                address += " " + city.cityName;
            if (area != null)
                address += " " + area.areaName; 
            return address;
        }
        #endregion

        #region 省市区
        dal_Nationality DALN = new dal_Nationality();
        public string Set_AddressName_Gid_PId_CId_AId(int guoji,int pid, int cid, int aid)
        {
            t_Nationality county = DALN.Nationality_Select_Id(guoji);
            t_Province pro = Province_Select_Id(pid);
            t_City city = City_Select_Id(cid);
            t_Area area = Area_Select_Id(aid);
            string address = String.Empty;
            if (county != null)
            {
                address = county.nvc_Name;
            }
            if (pro != null)
                address +=" "+ pro.provinceName;
            if (city != null)
                address += " " + city.cityName;
            if (area != null)
                address += " " + area.areaName;
            return address;
        }
        #endregion
        //获取运费
        public string Get_City_i_RemoteAmount(string pro, string cityname, string city)
        {
            string GetValue_i_remote = "";
            var iquery = (from a in dsdc.t_Area
                          join b in dsdc.t_City on a.cityID equals b.i_ID
                          join c in dsdc.t_Province on b.provinceID equals c.i_ID
                          where a.areaName == city && b.cityName ==cityname && c.provinceName == pro
                          select new
                          {
                              id = a.i_ID,
                              remote = a.i_Remote
                          }).ToList();
            for (int i = 0; i < iquery.Count; i++)
            {
                GetValue_i_remote = iquery[0].remote.ToString();
            }
            return GetValue_i_remote; 

        }
    }
}
