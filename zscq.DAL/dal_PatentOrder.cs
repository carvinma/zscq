using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_PatentOrder
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
        dal_PatentOperateNote DALPON = new dal_PatentOperateNote();
        /// <summary>
        /// 添加专利订单
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int PatentOrder_Add(t_PatentOrder model)
        {
            try
            {
                dzdc.t_PatentOrder.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利订单
        /// </summary>
        /// <param name="id"></param>
        public int PatentOrder_Del(int id)
        {
            try
            {
                t_PatentOrder model = dzdc.t_PatentOrder.Single(u => u.i_Id == id);
                dzdc.t_PatentOrder.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利订单
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int PatentOrder_Update(t_PatentOrder moble)
        {
            try
            {
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 获取一条专利订单
        /// </summary>
        /// <param name="id"></param>
        public t_PatentOrder PatentOrder_Select_Id(int id)
        {
            try
            {
                t_PatentOrder model = dzdc.t_PatentOrder.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<vw_PatentOrder> PatentOrder_Select_Status(int id, string nationality)
        {
            var iquery = from i in dvdc.vw_PatentOrder where i.i_Status == id && i.i_SendEmailOrder != id select i;
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        public IQueryable<vw_PatentOrder> PatentOrder_Select_StatusAndIsSend(int id, string nationality)
        {
            var iquery = from i in dvdc.vw_PatentOrder where i.i_IsSend == 1 && i.i_Status == id && i.i_SendMessageOrder != id select i;
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        public vw_PatentOrder PatentOrder_vw_Select_Id(int id)
        {
            try
            {
                vw_PatentOrder model = dvdc.vw_PatentOrder.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public t_PatentOrder PatentOrder_Select_OrderNum(string onum)
        {
            try
            {
                t_PatentOrder model = dzdc.t_PatentOrder.SingleOrDefault(u => u.nvc_OrderNumber == onum);
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 返回全部专利订单
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_PatentOrder> PatentOrder_SelectAll()
        {
            return from i in dzdc.t_PatentOrder orderby i.i_Id ascending select i;
        }
        /// <summary>
        /// 分页获取订单信息列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="status"></param>
        /// <param name="keyword"></param>
        /// <param name="fieldtype"></param>
        /// <param name="TimeType"></param>
        /// <param name="STime"></param>
        /// <param name="ETime"></param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_PatentOrder> PatentOrder_SelectPage(int pageindex, int pagesiz, int status, int orderby, string keyword, int fieldtype, int nType, int TimeType, string STime, string ETime, ref int count)
        {
            var iquery = from i in dvdc.vw_PatentOrder select i;
            if (status != 0)
            {
                iquery = from i in iquery where i.i_Status == status select i;
            }
            if (keyword != "")
            {
                if (fieldtype == 0)
                {
                    #region 全部
                    List<vw_PatentOrder> list = new List<vw_PatentOrder>();
                    foreach (var v in iquery)
                    {
                        if (v.nvc_OrderNumber.Contains(keyword) || v.nvc_PayType.Contains(keyword) || v.nvc_MemberName.Contains(keyword) || v.nvc_UserNum.Contains(keyword))
                        {
                            list.Add(v);
                        }
                        else
                        {
                            var result = DALPOI.PatentOrderInfo_Select_OrderId(v.i_Id);
                            foreach (var a in result)
                            {
                                if (a.nvc_PatentName.Contains(keyword) || a.nvc_PatentNumber.Contains(keyword))
                                {
                                    list.Add(v);
                                    break;
                                }
                            }
                        }
                    }
                    foreach (var v in iquery)
                    {
                        var result = DALPON.PatentOperateNote_Select_OrderID(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_Remark.Contains(keyword))
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
                else if (fieldtype == 1)
                {
                    iquery = from i in iquery where i.nvc_OrderNumber.Contains(keyword) select i;
                }
                else if (fieldtype == 2)
                {
                    #region 专利号
                    List<vw_PatentOrder> list = new List<vw_PatentOrder>();
                    foreach (var v in iquery)
                    {
                        var result = DALPOI.PatentOrderInfo_Select_OrderId(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_PatentNumber.Contains(keyword))
                            {
                                list.Add(v);
                                break;
                            }
                        }
                    }
                    iquery = from i in list.AsQueryable() select i;
                    #endregion
                }
                else if (fieldtype == 3)
                {
                    #region 专利名称
                    List<vw_PatentOrder> list = new List<vw_PatentOrder>();
                    foreach (var v in iquery)
                    {
                        var result = DALPOI.PatentOrderInfo_Select_OrderId(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_PatentName.Contains(keyword))
                            {
                                list.Add(v);
                                break;
                            }
                        }
                    }
                    iquery = from i in list.AsQueryable() select i;
                    #endregion
                }
                else if (fieldtype == 4)
                {
                    iquery = from i in iquery where i.nvc_PayType.Contains(keyword) select i;
                }
                else if (fieldtype == 5)
                {
                    iquery = from i in iquery where i.nvc_MemberName.Contains(keyword) select i;
                }
                else if (fieldtype == 6)
                {
                    iquery = from i in iquery where i.nvc_UserNum.Contains(keyword) select i;
                }
                else if (fieldtype == 7)
                {
                    #region 操作备注
                    List<vw_PatentOrder> list = new List<vw_PatentOrder>();
                    foreach (var v in iquery)
                    {
                        var result = DALPON.PatentOperateNote_Select_OrderID(v.i_Id);
                        foreach (var a in result)
                        {
                            if (a.nvc_Remark.Contains(keyword))
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
            if (nType != 0)
            {
                #region 授权国ID
                List<vw_PatentOrder> list = new List<vw_PatentOrder>();
                foreach (var v in iquery)
                {
                    var result = DALPOI.PatentOrderInfo_Select_OrderId(v.i_Id);
                    foreach (var a in result)
                    {
                        if (a.i_PatentShouQuanGuoId == nType)
                        {
                            list.Add(v);
                            break;
                        }
                    }
                }
                iquery = from i in list.AsQueryable() select i;
                #endregion
            }
            if (STime != null && STime != "")
            {
                if (TimeType == 1)
                {
                    iquery = from i in iquery where i.dt_AddTime >= Convert.ToDateTime(STime) && i.dt_AddTime <= Convert.ToDateTime(ETime).AddDays(1) select i;
                }
                else
                {
                    iquery = from i in iquery where i.dt_PayMoneyTime >= Convert.ToDateTime(STime) && i.dt_PayMoneyTime <= Convert.ToDateTime(ETime).AddDays(1) select i;
                }

            }
            if (orderby != 0)
            {
                switch (orderby)
                {
                    case 1: iquery = from i in iquery orderby i.i_Status descending select i;
                        break;
                    case 2: iquery = from i in iquery orderby i.i_Status ascending select i;
                        break;
                    case 3: iquery = from i in iquery orderby i.dt_AddTime descending select i;
                        break;
                    case 4: iquery = from i in iquery orderby i.dt_AddTime ascending select i;
                        break;
                    case 5: iquery = from i in iquery orderby i.dt_PayMoneyTime descending select i;
                        break;
                    case 6: iquery = from i in iquery orderby i.dt_PayMoneyTime ascending select i;
                        break;
                }
            }
            else
            {
                iquery = from i in iquery orderby i.dt_AddTime descending select i;
            }
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }

        public IQueryable<t_PatentOrder> PatentOrder_SelectPage(int pageindex, int pagesiz, int userId, ref int count)
        {
            var iquery = from i in dzdc.t_PatentOrder select i;
            if (userId != 0)
            {
                iquery = from i in iquery where i.i_UserId == userId select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            count = iquery.Count();
            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        //public string GetStatus(int status)
        //{
        //    string s = "";
        //    switch (status)
        //    {
        //        case 1: s = "待付款"; break;
        //        case 2: s = "待缴费"; break;
        //        case 3: s = "待出发票"; break;
        //        case 4: s = "已完成"; break;
        //        case 5: s = "无效"; break;
        //    }
        //    return s;
        //}
        public string GetStatus(int status)
        {
            string s = "";
            switch (status)
            {
                case 0: s = "已保存,未提交"; break;
                case 1: s = "已提交订单,尚未接收汇款"; break;
                case 2: s = "已提交订单,接收部分汇款,缴费中"; break;
                case 3: s = "已提交订单,接收部分汇款,未缴费"; break;
                case 4: s = "已提交订单,金额已付,缴费中"; break;
                case 5: s = "缴费成功,部分金额未付"; break;
                case 6: s = "缴费成功,发票已发出,请注意查收"; break;
                case 7: s = "缴费成功"; break;
                case 8: s = "取消缴费"; break;
                case 9: s = "无效订单"; break;
            }
            return s;
        }

        public string GetStatus(int status, string gj)
        {
            string s = "";
            if (gj == "en")
            {
                switch (status)
                {
                    case 0: s = "Saved,uncommitted"; break;
                    case 1: s = "Order was already submitted, and the remittance has not been received yet"; break;
                    case 2: s = "Order already submitted, and payment is in progress with part of remittance received"; break;
                    case 3: s = "Order already submitted, while payment is pending with part of remittance received"; break;
                    case 4: s = "Order already submitted, and payment is in progress with full remittance received"; break;
                    case 5: s = "Payment is done successfully with part of remittance not received yet"; break;
                    case 6: s = "Payment is done successfully with invoice already sent"; break;
                    case 7: s = "Payment is done successfully"; break;
                    case 8: s = "Payment is cancelled"; break;
                    case 9: s = "Invalid order"; break;
                }
            }
            else if (gj == "kr")
            {
                switch (status)
                {
                    case 0: s = "저장된 않은 제출"; break;
                    case 1: s = "발주서 제출  송금않함"; break;
                    case 2: s = "주문제출  일부분송금 확인 납부중입니다"; break;
                    case 3: s = "주문제출 일부분송금 확인 납부하지않았습니다"; break;
                    case 4: s = "주문제출 송금확인 납부중입니다"; break;
                    case 5: s = "납부성공 일부분송금 하지않았습니다"; break;
                    case 6: s = "납부성공 영수정 우송중입니다"; break;
                    case 7: s = "납부성공"; break;
                    case 8: s = "주문 취소"; break;
                    case 9: s = "무효주문"; break;
                }
            }
            else if (gj == "jp")
            {
                switch (status)
                {
                    case 0: s = "保存され、未提出"; break;
                    case 1: s = "オーダーを提出済、未支払"; break;
                    case 2: s = "オーダー提出済みで、一部分の振込を接収し、費用納付中"; break;
                    case 3: s = "オーダー提出済みで、一部分の振込を接収し、費用未納付"; break;
                    case 4: s = "オーダー提出済み、且つ支払い済みで、費用納付中"; break;
                    case 5: s = "費用納付でき、一部分の金額が未納付"; break;
                    case 6: s = "費用納付済み、且つ領収書発送済み"; break;
                    case 7: s = "費用納付済み"; break;
                    case 8: s = "オーダーをキャンセル"; break;
                    case 9: s = "無効なオーダー"; break;
                }
            }
            return s;
        }
        /// <summary>
        /// 订单状态与专利状态的触发
        /// </summary>
        /// <param name="ordernum"></param>
        /// <param name="status"></param>
        public void ChangePantentStatus(int orderid, int status)
        {
            dal_PatentOrderInfo DALPOI = new dal_PatentOrderInfo();
            dal_Patent DALP = new dal_Patent();
            IQueryable<t_PatentOrderInfo> result = DALPOI.PatentOrderInfo_Select_OrderId(orderid);
            foreach (var r in result)
            {
                t_Patent model = DALP.Patent_Select_Id(r.i_PatentId);
                if (status == 1 || status == 2 || status == 3 || status == 4)
                {
                    model.i_AnnualFeeStatus = 8;
                }
                if (status == 5 || status == 6 || status == 7)
                {
                    if (model.i_AnnualFeeRestDay < 0)
                    {
                        model.i_AnnualFeeStatus = 6;
                    }
                    if (model.i_AnnualFeeRestDay < 15 && model.i_AnnualFeeRestDay >= 0)
                    {
                        model.i_AnnualFeeStatus = 5;
                    }
                    if (model.i_AnnualFeeRestDay < 30 && model.i_AnnualFeeRestDay >= 15)
                    {
                        model.i_AnnualFeeStatus = 4;
                    }
                    if (model.i_AnnualFeeRestDay < 60 && model.i_AnnualFeeRestDay >= 30)
                    {
                        model.i_AnnualFeeStatus = 3;
                    }
                    if (model.i_AnnualFeeRestDay < 90 && model.i_AnnualFeeRestDay >= 60)
                    {
                        model.i_AnnualFeeStatus = 2;
                    }
                    if (model.i_AnnualFeeRestDay >= 90)
                    {
                        model.i_AnnualFeeStatus = 1;
                    }
                }
                DALP.Patent_Update(model);
            }
        }
        /// <summary>
        /// 判断缴费框是否显示
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="pid"></param>
        /// <returns></returns>
        public bool PanDuanJiaoFeeShow(int uid, int pid)
        {
            bool flag = false;
            var result = from r in dzdc.t_PatentOrder where r.i_UserId == uid && r.i_Status < 5 select r;
            foreach (var v in result)
            {
                var iquery = from i in dzdc.t_PatentOrderInfo where i.i_OrderId == v.i_Id && i.i_PatentId == pid select i;
                if (iquery.Count() > 0)
                {
                    flag = true;
                }
            }
            //var result = from r in dvdc.vw_PatentOrder where r.i_UserId == uid && r.i_PatentId == pid && r.i_Status < 5 select r;
            //if (result.Count() > 0)
            //{
            //    flag = true;
            //}
            return flag;
        }

        public decimal GetPayMoneyByHuiLv(decimal totalmoney, string bizhong, string paybizhong)
        {
            dal_Nationality DALN = new dal_Nationality();
            decimal paytatal = totalmoney;
            double huilv1 = 1;//汇率1 专利授权国对美元的汇率
            double huilv2 = 1;//汇率2  客户费用缴纳国对美元的汇率
            #region 除以小的 乘以大的
            t_Nationality tn = DALN.Nationality_Select_BiZhong(bizhong);
            if (tn != null)
            {
                decimal h1 = (tn.dm_Exchange1 == 0 ? 1 : tn.dm_Exchange1);
                decimal h2 = (tn.dm_Exchange1 == 0 ? 1 : tn.dm_Exchange2);
                if (h1 > h2)
                {
                    huilv1 = Convert.ToDouble(h2);
                }
                else
                {
                    huilv1 = Convert.ToDouble(h1);
                }
                t_Nationality tns = DALN.Nationality_Select_BiZhong(paybizhong);
                if (tns != null)
                {
                    decimal h1s = (tns.dm_Exchange1 == 0 ? 1 : tns.dm_Exchange1);
                    decimal h2s = (tns.dm_Exchange1 == 0 ? 1 : tns.dm_Exchange2);
                    if (h1s > h2s)
                    {
                        huilv2 = Convert.ToDouble(h1s);
                    }
                    else
                    {
                        huilv2 = Convert.ToDouble(h2s);
                    }
                }
            }
            #endregion
            if (bizhong != "" && bizhong == paybizhong)
            {
                return Convert.ToDecimal(paytatal.ToString("0.00"));
            }
            else
            {
                double tt = 0;
                if (huilv1 > 0)
                {
                    tt = Convert.ToDouble(totalmoney) / huilv1;
                }
                else
                {
                    tt = Convert.ToDouble(totalmoney);
                }
                if (huilv2 > 0)
                {
                    tt = tt * huilv2;
                }

                paytatal = Convert.ToDecimal(tt);
            }
            return Convert.ToDecimal(paytatal.ToString("0.00"));
        }
    }
}
