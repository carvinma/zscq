using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Web;

namespace zscq.DAL
{
    public class dal_TrademarkOrder
    {
        DataZscqDataContext dsdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        dal_TrademarkOrderDetails DALTOD = new dal_TrademarkOrderDetails();
        dal_TrademarkOrderOperateInfos DALTOOI = new dal_TrademarkOrderOperateInfos();
        /// <summary>
        /// 插入广告订单表
        /// </summary>
        /// <param name="AdvTypeModel"></param>
        /// <returns></returns>
        public int TrademarkOrder_Add(t_TrademarkOrder model)
        {
            try
            {
                dsdc.t_TrademarkOrder.InsertOnSubmit(model);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除指定广告订单
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public int TrademarkOrder_Del(int TId)
        {
            try
            {
                t_TrademarkOrder tmodel = dsdc.t_TrademarkOrder.FirstOrDefault(u => u.i_Id == TId);
                dsdc.t_TrademarkOrder.DeleteOnSubmit(tmodel);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 更新订单
        /// </summary>
        /// <param name="AdvModel"></param>
        /// <returns></returns>
        public int TrademarkOrder_Update(t_TrademarkOrder model)
        {
            try
            {
                t_TrademarkOrder Newmodel = dsdc.t_TrademarkOrder.SingleOrDefault(b => b.i_Id == model.i_Id);
                dsdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据Userid返回所有订单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IQueryable<t_TrademarkOrder> TrademarkOrder_Select_MemberId(int id)
        {
            var tables = from table in dsdc.t_TrademarkOrder where table.i_MemberId == id select table;
            return tables;
        }
        /// <summary>
        /// 根据ID获取订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public t_TrademarkOrder TrademarkOrder_Select_Id(int TId)
        {
            try
            {
                return dsdc.t_TrademarkOrder.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<vw_TrademarkOrder> TrademarkOrder_Select_Status(int sid, string nationality)
        {
            var iquery = from i in dvdc.vw_TrademarkOrder where i.i_Status == sid && i.i_SendEmailOrder != sid select i;
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        public IQueryable<vw_TrademarkOrder> TrademarkOrder_Select_StatusAndIsSend(int sid, string nationality)
        {
            var iquery = from i in dvdc.vw_TrademarkOrder where i.i_IsSend == 1 && i.i_Status == sid && i.i_SendPhoneOrder != sid select i;
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        public t_TrademarkOrder TrademarkOrder_Select_Number(string num)
        {
            try
            {
                return dsdc.t_TrademarkOrder.FirstOrDefault(u => u.nvc_OrderNumber == num);
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 根据ID获取商标订单信息
        /// </summary>
        /// <param name="i_Id"></param>
        /// <returns></returns>
        public vw_TrademarkOrder TrademarkOrder_vw_Select_Id(int TId)
        {
            try
            {
                return dvdc.vw_TrademarkOrder.FirstOrDefault(u => u.i_Id == TId);
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// 商标订单分页数据
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="keyWords">广告位</param>
        /// <param name="i_Id"></param>
        /// <param name="PageType"></param>
        /// <param name="Count"></param>
        /// <returns></returns>

        public string Set_TrademarkOrderState(object obj)
        {
            try
            {
                if (obj.ToString() == "0" || obj.ToString() == "1")
                    return "待付款";
                else if (obj.ToString() == "2")
                    return "已付款";
                else if (obj.ToString() == "3")
                    return "已审核";
                else if (obj.ToString() == "4")
                    return "已完成";
                else if (obj.ToString() == "5")
                    return "取消";
                else if (obj.ToString() == "6")
                    return "无效订单";

            }
            catch { }
            return "数据异常";
        }

        public string Set_TrademarkOrderState(object obj, string gj)
        {
            try
            {
                if (gj == "en")
                {
                    if (obj.ToString() == "0" || obj.ToString() == "1")
                        return "Pending payment";
                    else if (obj.ToString() == "2")
                        return "Paid";
                    else if (obj.ToString() == "3")
                        return "checked";
                    else if (obj.ToString() == "4")
                        return "Completed";
                    else if (obj.ToString() == "5")
                        return "cancelled";
                    else if (obj.ToString() == "6")
                        return "Invalid orders";
                }
                if (gj == "kr")
                {
                    if (obj.ToString() == "0" || obj.ToString() == "1")
                        return "지불을 기다리다";
                    else if (obj.ToString() == "2")
                        return "이미 지불";
                    else if (obj.ToString() == "3")
                        return "이미 심사";
                    else if (obj.ToString() == "4")
                        return "완료";
                    else if (obj.ToString() == "5")
                        return "취소";
                    else if (obj.ToString() == "6")
                        return "잘못된 주문";
                }
                if (gj == "jp")
                {
                    if (obj.ToString() == "0" || obj.ToString() == "1")
                        return "待支払い";
                    else if (obj.ToString() == "2")
                        return "すでに支払い";
                    else if (obj.ToString() == "3")
                        return "すでに審査";
                    else if (obj.ToString() == "4")
                        return "已完成";
                    else if (obj.ToString() == "5")
                        return "キャンセル";
                    else if (obj.ToString() == "6")
                        return "無効注文";
                }


            }
            catch { }
            return "Data anomalies";
        }
        /// <summary>
        /// 商标订单分页数据
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="Keyword"></param>
        /// <param name="SType"></param>
        /// <param name="status"></param>
        /// <param name="PId"></param>
        /// <param name="CId"></param>
        /// <param name="AId"></param>
        /// <param name="TimeType"></param>
        /// <param name="STime"></param>
        /// <param name="ETime"></param>
        /// <param name="DealerId"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrder> TrademarkOrder_SelectPage(int startIndex, int pageSize, string Keyword, int SType, int status, int regType, int sbType, int TimeType, string STime, string ETime, string ordernum, string username, string cname, string cbianhao, string orderstate, string totalmoney, string addtime, string paytime, ref int count)
        {
            var iquery = from i in dvdc.vw_TrademarkOrder select i;
            iquery = from i in iquery orderby i.i_Id descending select i;
            if (status != 0)
            {
                iquery = from i in iquery where i.i_Status == status select i;
            }

            if (Keyword != "")
            {
                if (SType == 0)
                {
                    #region 商标注册号
                    List<vw_TrademarkOrder> list = new List<vw_TrademarkOrder>();
                    foreach (var v in iquery)
                    {
                        if (v.nvc_PayType != null && v.nvc_Name != null && v.nvc_UserNum != null)
                        {
                            if (v.nvc_OrderNumber.Contains(Keyword) || v.nvc_PayType.Contains(Keyword) || v.nvc_Name.Contains(Keyword) || v.nvc_UserNum.Contains(Keyword))
                            {
                                list.Add(v);
                            }
                            else
                            {
                                var result = DALTOD.OrderDetails_Select_OrderId(v.i_Id);
                                foreach (var a in result)
                                {
                                    if (a.nvc_SBRegNum.Contains(Keyword))
                                    {
                                        list.Add(v);
                                        break;
                                    }
                                }
                            }
                        }

                    }
                    #endregion
                    #region 操作备注
                    foreach (var v in iquery)
                    {
                        var result = DALTOOI.OrderOperateInfo_Select_OrderID(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_Info_1.Contains(Keyword))
                            {
                                list.Add(v);
                                break;
                            }
                        }
                    }
                    list = list.Distinct().ToList();
                    iquery = from i in list.AsQueryable() select i;
                    #endregion
                }
                else if (SType == 1)
                {
                    iquery = from i in iquery where i.nvc_OrderNumber.Contains(Keyword) select i;
                }
                else if (SType == 2)
                {
                    #region 商标注册号
                    List<vw_TrademarkOrder> list = new List<vw_TrademarkOrder>();
                    foreach (var v in iquery)
                    {
                        var result = DALTOD.OrderDetails_Select_OrderId(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_SBRegNum.Contains(Keyword))
                            {
                                list.Add(v);
                                break;
                            }
                        }
                    }
                    iquery = from i in list.AsQueryable() select i;
                    #endregion
                }
                else if (SType == 4)
                {
                    iquery = from i in iquery where i.nvc_PayType.Contains(Keyword) select i;
                }
                else if (SType == 5)
                {
                    iquery = from i in iquery where i.nvc_Name.Contains(Keyword) select i;
                }
                else if (SType == 6)
                {
                    iquery = from i in iquery where i.nvc_UserNum.Contains(Keyword) select i;
                }
                else if (SType == 7)
                {
                    #region 操作备注
                    List<vw_TrademarkOrder> list = new List<vw_TrademarkOrder>();
                    foreach (var v in iquery)
                    {
                        var result = DALTOOI.OrderOperateInfo_Select_OrderID(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_Info_1.Contains(Keyword))
                            {
                                list.Add(v);
                                break;
                            }
                        }
                    }
                    iquery = from i in list.AsQueryable() select i;
                    #endregion
                }
            }
            if (regType != 0)
            {
                iquery = from i in iquery where i.i_RegTypeId == regType select i;
            }
            if (sbType != 0)
            {
                iquery = from i in iquery where i.i_UserTypeId == sbType select i;
            }

            DateTime SDateTime = DateTime.Now.AddYears(-10);
            if (STime != null && STime != "")
            {
                SDateTime = Convert.ToDateTime(STime);
            }
            DateTime EDateTime = DateTime.Now.AddDays(1);
            if (ETime != null && ETime != "")
            {
                EDateTime = Convert.ToDateTime(ETime).AddDays(1);
            }
            if (TimeType == 1)
            {
                iquery = from i in iquery where SDateTime < i.dt_AddTime && i.dt_AddTime < EDateTime select i;
            }
            else if (TimeType == 2)
            {
                iquery = from i in iquery where SDateTime < i.dt_PayTime && i.dt_PayTime < EDateTime select i;
            }
            if (ordernum != "")
            {
                if (ordernum == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_OrderNumber descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_OrderNumber ascending select i;
                }
            }
            if (username != "")
            {
                if (username == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_Name descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_Name ascending select i;
                }
            }
            if (cname != "")
            {
                if (cname == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_RealName descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_RealName ascending select i;
                }
            }
            if (cbianhao != "")
            {
                if (cbianhao == "desc")
                {
                    iquery = from i in iquery orderby i.nvc_UserNum descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.nvc_UserNum ascending select i;
                }
            }
            if (totalmoney != "")
            {
                if (totalmoney == "desc")
                {
                    iquery = from i in iquery orderby i.dm_TotalMoney descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.dm_TotalMoney ascending select i;
                }
            }
            if (orderstate != "")
            {
                if (orderstate == "desc")
                {
                    iquery = from i in iquery orderby i.i_Status descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.i_Status ascending select i;
                }
            }
            if (addtime != "")
            {
                if (addtime == "desc")
                {
                    iquery = from i in iquery orderby i.dt_AddTime descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.dt_AddTime ascending select i;
                }
            }
            if (paytime != "")
            {
                if (paytime == "desc")
                {
                    iquery = from i in iquery orderby i.dt_PayTime descending select i;
                }
                else
                {
                    iquery = from i in iquery orderby i.dt_PayTime ascending select i;
                }
            }
            iquery = from i in iquery select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }

        /// <summary>
        /// 商标前台订单分页数据
        /// </summary>
        /// <param name="startIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="uid"></param>

        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_TrademarkOrder> TrademarkOrder_Web_SelectPage(int startIndex, int pageSize, int uid, ref int count)
        {
            var iquery = from i in dvdc.vw_TrademarkOrder select i;
            if (uid != 0)
            {
                iquery = from i in iquery where i.i_MemberId == uid select i;
            }
            iquery = from i in iquery orderby i.i_Id descending select i;
            count = iquery.Count();
            return iquery.Skip((startIndex - 1) * pageSize).Take(pageSize);
        }





        /// <summary>
        /// 返回一个订单号
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public string Set_OrderNo()
        {
            //int len = 8;
            //string orderno = RndNum(len);        
            //    return orderno;
            return "S" + ((DateTime.Now.ToUniversalTime().Ticks - 621355968000000000) / 10000000).ToString();
        }
        /// <summary>
        /// 生成随机的字母
        /// </summary>
        /// <param name="VcodeNum">生成字母的个数</param>
        /// <returns>string</returns>
        private string RndNum(int VcodeNum)
        {
            string Vchar = "1,2,3,4,5,6,7,8,9,0,A,B,C,D,E,F,G,Q";
            string[] VcArray = Vchar.Split(',');
            string VNum = ""; //由于字符串很短，就不用StringBuilder了
            int temp = -1; //记录上次随机数值，尽量避免生产几个一样的随机数
            //采用一个简单的算法以保证生成随机数的不同
            Random rand = new Random();
            for (int i = 1; i < VcodeNum + 1; i++)
            {
                if (temp != -1)
                {
                    rand = new Random(i * temp * unchecked((int)DateTime.Now.Ticks));
                }
                int t = rand.Next(VcArray.Length);
                if (temp != -1 && temp == t)
                {
                    return RndNum(VcodeNum);
                }
                temp = t;
                VNum += VcArray[t];
            }
            return VNum;
        }
    }
}
