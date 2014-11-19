using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;
using zscq.Model;
using System.Data.Linq.SqlClient;

namespace zscq.DAL
{
    public class dal_Patent
    {
        DataZscqDataContext dzdc = new DataZscqDataContext();
        DataViewDataContext dvdc = new DataViewDataContext();
        DataMemberDataContext dmdc = new DataMemberDataContext();
        dal_PatentFee DALPF = new dal_PatentFee();
        dal_Member DALM = new dal_Member();
        dal_UserGrade DALUG = new dal_UserGrade();
        dal_Nationality DALN = new dal_Nationality();
        /// <summary>
        /// 添加专利
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Patent_Add(t_Patent model)
        {
            try
            {
                model.i_Show = 1;
                dzdc.t_Patent.InsertOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 删除专利
        /// </summary>
        /// <param name="id"></param>
        public int Patent_Del(int id)
        {
            try
            {
                t_Patent model = dzdc.t_Patent.Single(u => u.i_Id == id);
                dzdc.t_Patent.DeleteOnSubmit(model);
                dzdc.SubmitChanges();
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        /// <summary>
        /// 修改专利列表
        /// </summary>
        /// <param name="moble"></param>
        /// <returns></returns>
        public int Patent_Update(t_Patent moble)
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
        /// 获取一条专利
        /// </summary>
        /// <param name="id"></param>
        public t_Patent Patent_Select_Id(int id)
        {
            try
            {
                t_Patent model = dzdc.t_Patent.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public t_Patent Patent_Select_Number(string Number, int memberid)
        {
            try
            {
                t_Patent model = dzdc.t_Patent.SingleOrDefault(u => u.nvc_Number == Number && u.i_MemberId == memberid);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public int Patent_Select_Number(string Number, int shouquanguo, int memberid, int patentid)
        {
            var result = from i in dzdc.t_Patent where i.nvc_Number == Number && i.i_AuthorizeNationalityId == shouquanguo && i.i_MemberId == memberid select i;
            if (patentid != 0)
            {
                result = from i in result where i.i_Id != patentid select i;
            }
            return result.Count();
        }
        public vw_Patent Patent_SelectView_Id(int id)
        {
            try
            {
                vw_Patent model = dvdc.vw_Patent.SingleOrDefault(u => u.i_Id == id);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public vw_Patent Patent_SelectView_IdAndMemberId(int id, int uId)
        {
            try
            {
                vw_Patent model = dvdc.vw_Patent.SingleOrDefault(u => u.i_Id == id && u.i_MemberId == uId);
                return model;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<vw_Patent> Patent_VW_IdAndMemberId(int id, int uId)
        {
            try
            {
                IQueryable<vw_Patent> model = from u in dvdc.vw_Patent where u.i_Id == id && u.i_MemberId == uId select u;
                return model;
            }
            catch
            {
                return null;
            }
        }
        public IQueryable<vw_Patent> Patent_VW_Id(int id)
        {
            try
            {
                IQueryable<vw_Patent> model = from u in dvdc.vw_Patent where u.i_Id == id select u;
                return model;
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 通过年费状态得到专利个数
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Patent_SelectView_AnnualFeeStatus(int id)
        {
            try
            {
                IQueryable<vw_Patent> iquery = from i in dvdc.vw_Patent where i.i_AnnualFeeStatus == id select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        public int Patent_SelectView_AnnualFeeStatus(int id, int uId)
        {
            try
            {
                IQueryable<vw_Patent> iquery = from i in dvdc.vw_Patent select i;
                if (id != 0)
                {
                    iquery = from i in iquery where i.i_AnnualFeeStatus == id select i;
                }
                if (uId != 0)
                {
                    iquery = from i in iquery where i.i_MemberId == uId select i;
                }
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        public int Patent_SelectView_AnnualFeeStatusisshow(int id, int uId)
        {
            try
            {
                IQueryable<vw_Patent> iquery = from i in dvdc.vw_Patent select i;
                if (id != 0)
                {
                    iquery = from i in iquery where i.i_AnnualFeeStatus == id && i.i_Show == 1 select i;
                }
                if (uId != 0)
                {
                    iquery = from i in iquery where i.i_MemberId == uId && i.i_Show == 1 select i;
                }
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 通过授权国得到专利个数
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Patent_SelectView_AuthorizeNationalityId(int id)
        {
            try
            {
                IQueryable<vw_Patent> iquery = from i in dvdc.vw_Patent where i.i_AuthorizeNationalityId == id select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        public int Patent_SelectView_AuthorizeNationalityId(int id, int uId)
        {
            try
            {
                IQueryable<vw_Patent> iquery = from i in dvdc.vw_Patent where i.i_AuthorizeNationalityId == id && i.i_MemberId == uId select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 返回全部专利列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Patent> Patent_SelectAll()
        {
            return from i in dzdc.t_Patent orderby i.dt_AddTime ascending select i;
        }
        /// <summary>
        /// 返回某个用户的所有专利
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Patent> Patent_SelectAllByMenberId(int id)
        {
            return from i in dzdc.t_Patent where i.i_MemberId == id select i;
        }
        /// <summary>
        /// 返回根据类型Id全部专利列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<t_Patent> Patent_SelectAllByTypeId(int tid)
        {
            return from i in dzdc.t_Patent where i.i_PatentType == tid orderby i.dt_AddTime ascending select i;
        }
        /// <summary>
        /// 根据国家id返回全部专利列表
        /// </summary>
        /// <returns></returns>
        public IQueryable<vw_Patent> Patent_SelectAllByCid(int cid)
        {
            return from i in dvdc.vw_Patent where i.i_GuoJiId == cid select i;
        }
        public IQueryable<t_Patent> Patent_SelectAllByStatus(int memberid, int sid, int flag)
        {
            var iquery = from i in dzdc.t_Patent where i.i_MemberId == memberid && i.i_AnnualFeeStatus == sid select i;
            if (flag == 1)
            {
                iquery = from i in iquery where i.i_ReceiveEmail == 1 && i.i_SendEmail != sid select i;
            }
            else
            {
                iquery = from i in iquery where i.i_SendMessage != sid select i;
            }
            switch (sid)
            {
                case 1:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay > 90 select i;
                    break;
                case 2:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay >= 61 && i.i_AnnualFeeRestDay <= 90 select i;
                    break;
                case 3:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay >= 31 && i.i_AnnualFeeRestDay <= 60 select i;
                    break;
                case 4:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay >= 16 && i.i_AnnualFeeRestDay <= 30 select i;
                    break;
                case 5:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay >= 0 && i.i_AnnualFeeRestDay <= 15 select i;
                    break;
                case 6:
                    iquery = from i in iquery where i.i_AnnualFeeRestDay < 0 select i;
                    break;
            }
            return iquery;
        }
        public IQueryable<vw_Patent> Patent_SelectAllByStatusAndIsSend(int sid, string nationality)
        {
            var iquery = from i in dvdc.vw_Patent where i.i_IsSend == 1 && i.i_AnnualFeeStatus == sid && i.i_SendMessage != sid select i;
            switch (nationality)
            {
                case "cn": iquery = from i in iquery where i.i_GuoJiId == 1 select i; break;
                case "jp": iquery = from i in iquery where i.i_GuoJiId == 9 select i; break;
                case "kr": iquery = from i in iquery where i.i_GuoJiId == 5 select i; break;
                case "en": iquery = from i in iquery where i.i_GuoJiId != 5 && i.i_GuoJiId != 1 && i.i_GuoJiId != 9 select i; break;
            }
            return iquery;
        }
        /// <summary>
        /// 分页返回专利列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="keyword"></param>
        /// <param name="patenttype">字段类型</param>
        /// <param name="patenttype">专利类型</param>
        /// <param name="patentguoji">专利授权国</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public IQueryable<vw_Patent> Patent_SelectPage(int pageindex, int pagesiz, int userid, string keyword, int fieldtype, int patenttype, int patentguoji, ref int count)
        {
            var iquery = from i in dvdc.vw_Patent select i;
            if (keyword != "")
            {
                switch (fieldtype)
                {
                    case 0: iquery = from i in iquery where i.nvc_Name.Contains(keyword) select i;
                        break;
                    case 1: iquery = from i in iquery where i.nvc_Name.Contains(keyword) select i;
                        break;
                    case 2: iquery = from i in iquery where i.nvc_PatentInventor.Contains(keyword) select i;
                        break;
                    case 3: iquery = from i in iquery where i.nvc_UserName.Contains(keyword) select i;
                        break;
                }
            }
            if (patenttype != 0)
            {
                iquery = from i in iquery where i.i_PatentType == patenttype select i;
            }
            if (userid != 0)
            {
                iquery = from i in iquery where i.i_MemberId == userid select i;
            }
            if (patentguoji != 0)
            {
                iquery = from i in iquery where i.i_AuthorizeNationalityId == patentguoji select i;
            }
            iquery = from i in iquery orderby i.dt_AddTime descending select i;
            count = iquery.Count();

            return iquery.Skip((pageindex - 1) * pagesiz).Take(pagesiz);
        }
        /// <summary>
        /// 分页返回专利列表
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesiz"></param>
        /// <param name="orderby">排序字段</param>
        /// <param name="sqlwhere">条件</param>
        /// <param name="count"></param>
        /// <returns></returns>
        public List<vw_Patent> Patent_SelectPage(int pageindex, int pagesiz, string orderby, string orderbytype, string sqlwhere, ref int count)
        {
            try
            {
                int start = (pageindex - 1) * pagesiz + 1;
                int end = start + pagesiz - 1;
                string sql = "select * from(select row_number() over (order by " + orderby + " " + orderbytype + ")as rowid,* from vw_patent where " + sqlwhere + ")a  where rowid between " + start + " and " + end;
                string s = "select * from vw_Patent where " + sqlwhere;
                count = dzdc.ExecuteQuery<vw_Patent>(s).ToList().Count;
                return dzdc.ExecuteQuery<vw_Patent>(sql).ToList();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 采用SQL方式查询对应用户
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public List<string> Patent_Select_User()
        {
            try
            {
                string sql = "select distinct(nvc_UserNum) from dbo.t_Patent";
                return dzdc.ExecuteQuery<string>(sql).ToList();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 得到最大排序编号
        /// </summary>
        /// <returns></returns>
        public int Patent_SelectOneByOrderBy()
        {
            try
            {
                string sql = "select max(i_Id) from t_Patent";
                return dzdc.ExecuteQuery<int>(sql).ToList()[0] + 1;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 得到最大排序编号
        /// </summary>
        /// <returns></returns>
        public int Patent_SelectCount()
        {
            try
            {
                int num = dzdc.t_Patent.Max(a => a.i_Id);
                return num;
            }
            catch
            {
                return 0;
            }
        }
        /// <summary>
        /// 采用SQL方式查询对应的类型分布
        /// </summary>
        /// <param name="list"></param>
        /// <returns></returns>
        public List<vw_Patent> Patent_Select_TypeFenbu()
        {
            string sql = "select nvc_PatentTypeName from vw_Patent where nvc_PatentTypeName is not null group by nvc_PatentTypeName ";
            return dzdc.ExecuteQuery<vw_Patent>(sql).ToList();
        }

        public IQueryable<vw_PatentFenBu> Patent_Select_dengjiGuo()
        {
            return from i in dvdc.vw_PatentFenBu select i;
        }
        public int Patent_Select_ByCidUser(int cid)
        {
            try
            {
                var iquery = from i in dmdc.t_Member where i.i_MemberType == 1 && i.i_GuoJiId == cid select i;
                return iquery.Count();
            }
            catch
            {
                return 0;
            }
        }
        public string GetStatus(int status)
        {
            string s = "";
            switch (status)
            {
                case 0: s = ""; break;
                case 1: s = "已完成缴费，等待下次缴费（>90天)"; break;
                case 2: s = "距缴费日期<90天，尚未提交订单"; break;
                case 3: s = "距缴费日期<60天，尚未提交订单"; break;
                case 4: s = "距缴费日期<30天，尚未提交订单"; break;
                case 5: s = "距缴费日期<15天，尚未提交订单"; break;
                case 6: s = "距缴费日期<0天，尚未提交订单"; break;
                case 7: s = "已提交委托订单，尚未接收汇款"; break;
                case 8: s = "已提交委托订单，缴费中"; break;
                case 9: s = "经确认，放弃续费"; break;
                case 10: s = "联系不到缴费人，视为放弃缴费"; break;
                case 11: s = "缴费人无答复，视为放弃缴费"; break;
                case 12: s = "同日申请专利，自动失效"; break;
                case 13: s = "已完成所有年度缴费"; break;
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
                    case 0: s = ""; break;
                    case 1: s = "Current payment already done, and please wait for the next payment(>90 days)"; break;
                    case 2: s = "<90 days before the deadline, and no order submitted yet"; break;
                    case 3: s = "<60 days before the deadline, and no order submitted yet"; break;
                    case 4: s = "<30 days before the deadline, and no order submitted yet"; break;
                    case 5: s = "<15 days before the deadline, and no order submitted yet"; break;
                    case 6: s = "<0 days before the deadline, and no order submitted yet"; break;
                    case 7: s = "Order already submitted, and no remittance received yet"; break;
                    case 8: s = "Order already submitted and payment in progress"; break;
                    case 9: s = "Abandon the future payment through confirmation with the payer"; break;
                    case 10: s = "Deemed to abandon the further payment since failing to contact with the payer"; break;
                    case 11: s = "Deemed to abandon the further payment since receiving no response from the payer"; break;
                    case 12: s = "Auto invalidation upon invention patent at the same filing date"; break;
                    case 13: s = "All the annuity fee payments already done"; break;
                }
            }
            else if (gj == "kr")
            {
                switch (status)
                {
                    case 0: s = ""; break;
                    case 1: s = "납부완성  다음기한일까지(>90일)"; break;
                    case 2: s = "지불 날짜 <90 데이즈, 순서는 아직 제출하지 않은"; break;
                    case 3: s = "지불 날짜 <60 데이즈, 순서는 아직 제출하지 않은"; break;
                    case 4: s = "지불 날짜 <30 데이즈, 순서는 아직 제출하지 않은"; break;
                    case 5: s = "지불 날짜 <15 데이즈, 순서는 아직 제출하지 않은"; break;
                    case 6: s = "지불 날짜 <0 데이즈, 순서는 아직 제출하지 않은"; break;
                    case 7: s = "발주서 제출  송금않함"; break;
                    case 8: s = "발주서 제출 납부중"; break;
                    case 9: s = "포기처리"; break;
                    case 10: s = "련락없어서 포기처리함"; break;
                    case 11: s = "지시없어서 포기처리함"; break;
                    case 12: s = "동일한시간에 출원한특허 자동적으로 실효"; break;
                    case 13: s = "납부완성되였습니다"; break;
                }
            }
            else if (gj == "jp")
            {
                switch (status)
                {
                    case 0: s = ""; break;
                    case 1: s = "納付済。次回の納付待ち(>90日間)"; break;
                    case 2: s = "納付期限日まで<90日間、オーダーを未提出"; break;
                    case 3: s = "納付期限日まで<60日間、オーダーを未提出"; break;
                    case 4: s = "納付期限日まで<30日間、オーダーを未提出"; break;
                    case 5: s = "納付期限日まで<15日間、オーダーを未提出"; break;
                    case 6: s = "納付期限日まで<0日間、オーダーを未提出"; break;
                    case 7: s = "オーダーを提出済、未支払"; break;
                    case 8: s = "オーダーを提出済、費用納付中"; break;
                    case 9: s = "費用納付を放棄することを確認済"; break;
                    case 10: s = "費納付人と連絡できない為、費用納付を放棄す"; break;
                    case 11: s = "ることと見なす"; break;
                    case 12: s = "同日に特許を申請、自動的に失効"; break;
                    case 13: s = "全ての年度を納付済"; break;
                }
            }
            return s;
        }

        public int GetStatusByAnnualFeeRestDay(int days)
        {
            int status = 0;
            if (days > 90)
            {
                status = 1;
            }
            else if (days >= 61 && days <= 90)
            {
                status = 2;
            }
            else if (days >= 31 && days <= 60)
            {
                status = 3;
            }
            else if (days >= 16 && days <= 30)
            {
                status = 4;
            }
            else if (days >= 0 && days <= 15)
            {
                status = 5;
            }
            else if (days < 0)
            {
                status = 6;
            }
            else
            {
                status = 0;
            }
            return status;
        }
        /// <summary>
        /// 通过专利订单号得到专利ID列表
        /// </summary>
        /// <param name="number"></param>
        /// <returns></returns>
        public IQueryable<t_PatentOrderInfo> GetPatentIdByOrderNumber(int oid)
        {
            IQueryable<t_PatentOrderInfo> iquery = from i in dzdc.t_PatentOrderInfo where i.i_OrderId == oid select i;
            return iquery;
        }
        /// <summary>
        /// 得到需要自动计算的专利信息
        /// </summary>
        /// <param name="nId">授权国国籍</param>
        /// <param name="pId">授权国国籍</param>
        /// <param name="shenqingri">申请日</param>
        /// <param name="shouquanri">授权日</param>
        /// <param name="sId">授权人国籍</param>
        /// <param name="yijiaoyear">已缴年度</param>
        /// <param name="userNum">会员编号</param>
        /// <param name="yaoqiuxiang">权利要求项</param>
        /// <param name="yaoqiuxiang">剩余多少天到期</param>
        /// <returns></returns>
        public string GetPatentInfo(int nId, int pId, string shenqingri, string shouquanri, int sId, string yijiaoyear, int MemberId, int yaoqiuxiang)
        {
            string s = "";
            int dazhe = 0;
            t_Member user = DALM.Member_Select_Id(MemberId);
            if (user != null)
            {
                dazhe = user.i_PowerDaZhe;
            }
            var result = (from r in dzdc.t_PatentFee where r.i_NationalityId == nId && r.i_PatentTypeId == pId && r.nvc_Year == yijiaoyear orderby r.i_Id descending select r).Take(1);
            var result1 = from r1 in dzdc.t_PatentType where r1.i_Id == pId select r1;

            string youxiaoqistart = "";//有效期起算日
            string youxiaoqiend = "";//有效期终止日
            string nianxian = "";//专利于该授权国的有效维持年限
            decimal yearfeetotal = 0;//专利于该授权国已缴纳年费总额：
            string shengnianxian = "";//专利于该授权国的剩余有效维持年限(不包含当年)：
            decimal setfee = 0;//政府规定费用
            decimal shouxufee = 0;//汇款手续费
            decimal agentservicefee = 0;//代理服務費
            decimal chaoxiangfee = 0;//专利超项费
            decimal zhinajin = 0;//滞纳金
            decimal totalfee = 0;//费用小计
            string moneytype = DALN.Nationality_Select_Id(nId).nvc_Currency;//货币种类
            string prevjiaofeedate = "";//上一次年费缴纳期限日
            string jiaofeedate = "";//缴纳期限
            string jiaofeeday = "";//距离缴费所剩天数
            string daijiaoyear = "";//代缴年度
            int feeId = 0;
            string yijiaonian = "";
            foreach (var r in result)
            {
                feeId = r.i_Id;
            }
            var iquery = (from i in dzdc.t_PatentFee where i.i_NationalityId == nId && i.i_PatentTypeId == pId && i.i_Id > feeId select i).Take(1);
            foreach (var r in iquery)
            {
                yearfeetotal = 0;
                setfee = r.dm_SetFee;
                chaoxiangfee = r.dm_ChaoXiangFee * yaoqiuxiang;
                if (nId == sId)//本国国内汇款
                {
                    shouxufee = r.dm_ShouXuFee;
                    agentservicefee = r.dm_AgentServiceFee;
                }
                else if (sId == 1 && nId != 1)//中国国内汇款
                {
                    shouxufee = r.dm_ShouXuFee1;
                    agentservicefee = r.dm_AgentServiceFee1;
                }
                else if (sId != 1)//中国境外汇款
                {
                    shouxufee = r.dm_ShouXuFee2;
                    agentservicefee = r.dm_AgentServiceFee2;
                }
                if (dazhe != 0)//服务费折扣
                {
                    agentservicefee = agentservicefee * dazhe / 100;
                }
                //这个小计=（官费、代理费、汇款手续费）+超项费（单个费用*项数）+滞纳金（如果有的话）
                totalfee = setfee + agentservicefee + shouxufee + chaoxiangfee + zhinajin;
                daijiaoyear = r.nvc_Year;
            }
            foreach (var r1 in result1)
            {
                nianxian = r1.i_YouXiaoQi.ToString();
                if (r1.i_YouXiaoQiStart == 0)//有效期起始日=申请日
                {
                    youxiaoqistart = shenqingri;
                    youxiaoqiend = Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).ToShortDateString().ToString();
                    shengnianxian = (Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).Year - DateTime.Now.Year).ToString();

                }
                else//有效期起始日=授权日
                {
                    youxiaoqistart = shouquanri;
                    youxiaoqiend = Convert.ToDateTime(shouquanri).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                    shengnianxian = (Convert.ToDateTime(shenqingri).AddYears(r1.i_YouXiaoQi).Year - DateTime.Now.Year).ToString();
                }
                //以中国为例
                //上一次年费缴纳期限日（可手动更改）=申请日+已缴年度-1（这个申请日是根据专利类型设置的【缴费第一年起算日】得到的）
                //缴费期限=上一次年费缴纳期限日+1
                //代缴年度=已缴年度+1
                //距缴费期限所剩天数=缴费期限-当天日期
                //有的已缴费年度是这样的1~3.5 这样的7.5~11.5 还有这样的16~20 
                int addyue = 0, addmonth = 0;
                if (yijiaoyear.IndexOf('~') > 0 && yijiaoyear.IndexOf('.') > 0)
                {
                    yijiaonian = yijiaoyear.Split('~')[0];
                    yijiaoyear = yijiaoyear.Split('~')[1];
                    if (yijiaonian.IndexOf('.') > 0)
                    {
                        yijiaonian = yijiaonian.Split('.')[0];
                        addyue = 6;
                    }
                    if (yijiaoyear.IndexOf('.') > 0)
                    {
                        yijiaoyear = yijiaoyear.Split('.')[0];
                        addmonth = 6;
                    }
                }
                else
                {
                    if (yijiaoyear.IndexOf('~') > 0)
                    {
                        yijiaonian = yijiaoyear.Split('~')[0];
                        yijiaoyear = yijiaoyear.Split('~')[1];
                        yijiaonian = (Convert.ToInt32(yijiaonian) - 1).ToString();
                    }
                    else
                    {
                        yijiaonian = (Convert.ToInt32(yijiaoyear) - 1).ToString();
                    }
                }
                if (r1.i_paymentFirstYear == 0)//缴费第一年起算日等于申请日
                {
                    prevjiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaonian)).AddMonths(addyue).ToShortDateString();
                    jiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaoyear)).AddMonths(addmonth).ToShortDateString();
                    TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                    jiaofeeday = (ts.Days + 1).ToString();
                }
                if (r1.i_paymentFirstYear == 1)//缴费第一年起算日等于授权日
                {
                    prevjiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaonian)).AddMonths(addyue).ToShortDateString();
                    jiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaoyear)).AddMonths(addmonth).ToShortDateString();
                    TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                    jiaofeeday = (ts.Days + 1).ToString();
                }
                if (r1.i_paymentFirstYear == 2)//缴费第一年起算日等于申请日的第二年
                {
                    prevjiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaonian) + 1).AddMonths(addyue).ToShortDateString();
                    jiaofeedate = Convert.ToDateTime(shenqingri).AddYears(int.Parse(yijiaoyear) + 1).AddMonths(addmonth).ToShortDateString();
                    TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                    jiaofeeday = (ts.Days + 1).ToString();
                }
                if (r1.i_paymentFirstYear == 3)//缴费第一年起算日等于授权日的第二年
                {
                    prevjiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaonian) + 1).AddMonths(addyue).ToShortDateString();
                    jiaofeedate = Convert.ToDateTime(shouquanri).AddYears(int.Parse(yijiaoyear) + 1).AddMonths(addmonth).ToShortDateString();
                    TimeSpan ts = (TimeSpan)Convert.ToDateTime(jiaofeedate).Subtract(Convert.ToDateTime(DateTime.Now));
                    jiaofeeday = (ts.Days + 1).ToString();
                }
            }
            s = nianxian + "," + setfee + "," + shouxufee + "," + agentservicefee + "," + moneytype + "," + totalfee + "," + shengnianxian + "," + yearfeetotal + "," + chaoxiangfee + "," + youxiaoqistart + "," + youxiaoqiend + "," + prevjiaofeedate + "," + jiaofeedate + "," + jiaofeeday + "," + daijiaoyear;
            return s;
        }
        /// <summary>
        /// 通过专利类型跟申请日得到专利信息
        /// </summary>
        /// <param name="zlID">专利类型</param>
        /// <param name="sqR">申请日</param>
        /// <returns></returns>
        public void GetPatentInfoByPatentTypeAndShenQingRi(int zlID, string sqR, ref string sq_year, ref string sq_qs, ref string sq_date)
        {
            var bb = from r1 in dzdc.t_PatentType where r1.i_Id == zlID select r1;
            foreach (var r1 in bb)
            {
                if (r1.i_YouXiaoQiStart == 0)//有效期起始日==申请日
                {
                    sq_year = r1.i_YouXiaoQi.ToString();
                    sq_qs = sqR;
                    sq_date = Convert.ToDateTime(sqR).AddYears(r1.i_YouXiaoQi).ToShortDateString();
                }
            }
        }
        /// <summary>
        /// 通过专利过期时间、专利类型、缴费年度 得到专利的滞纳金
        /// </summary>
        /// <param name="AnnualFeeRestDay"></param>
        /// <param name="PatentType"></param>
        /// <param name="AnnualFeeNotPaymentYear"></param>
        /// <returns></returns>
        public string GetZhiNaJinByPatentInfo(int AnnualFeeRestDay, int PatentType, string AnnualFeeNotPaymentYear)
        {
            #region 算出专利过期几个月
            DateTime dtt = DateTime.Now;
            int month0_days = DateTime.DaysInMonth(dtt.Year, dtt.Month);
            int month1_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(1).Month);
            int month2_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(2).Month);
            int month3_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(3).Month);
            int month4_days = DateTime.DaysInMonth(dtt.Year, dtt.AddMonths(4).Month);
            int gq = 1;
            if (Math.Abs(AnnualFeeRestDay) - month0_days > 0)
            {
                gq = 2;
            }
            if (Math.Abs(AnnualFeeRestDay) - month0_days - month1_days > 0)
            {
                gq = 3;
            }
            if (Math.Abs(AnnualFeeRestDay) - month0_days - month1_days - month2_days > 0)
            {
                gq = 4;
            }
            if (Math.Abs(AnnualFeeRestDay) - month0_days - month1_days - month2_days - month3_days > 0)
            {
                gq = 5;
            }
            if (Math.Abs(AnnualFeeRestDay) - month0_days - month1_days - month2_days - month3_days - month4_days > 0)
            {
                gq = 6;
            }
            #endregion
            IQueryable<t_PatentFee> iquery = from r in dzdc.t_PatentFee where r.i_PatentTypeId == PatentType && r.nvc_Year == AnnualFeeNotPaymentYear select r;
            string zhinajin = "0.00-0.00-0.00-0.00-0.00-0.00";
            if (iquery.Count() > 0)
            {
                foreach (var i in iquery)
                {
                    zhinajin = i.nvc_ZhiNaJin;
                }
            }
            return gq + "," + zhinajin.Split('-')[gq - 1];
        }
        /// <summary>
        /// 更新专利费用
        /// </summary>
        /// <param name="tp"></param>
        public void EditPatentFee(t_Patent tp)
        {
            try
            {
                int nId = 0, sId = 0, dazhe = 0, dazhe1 = 0, jianmian1 = tp.i_JianMian1;
                nId = tp.i_AuthorizeNationalityId == 0 ? 1 : tp.i_AuthorizeNationalityId;
                sId = tp.i_PatentHolderNationalityId == 0 ? 1 : tp.i_PatentHolderNationalityId;
                t_Member tm = DALM.Member_Select_Id(tp.i_MemberId);
                if (tm != null)
                {
                    dazhe = tm.i_PowerDaZhe;
                    sId = tm.i_GuoJiId;
                    t_MemberGrade tmg = DALUG.UserGrade_Select_Id(tm.i_Grade);
                    if (tmg != null)
                    {
                        dazhe1 = Convert.ToInt32(tmg.i_Discount);
                    }
                }
                if (tp.nvc_AnnualFeeNotPaymentYear != "")
                {
                    #region
                    var result = DALPF.PatentFee_SelectFee(tp.i_AuthorizeNationalityId, tp.i_PatentType, tp.nvc_AnnualFeeNotPaymentYear);
                    decimal shouxufee = 0;//汇款手续费
                    decimal agentservicefee = 0;//代理服務費
                    foreach (var r in result)
                    {
                        tp.dm_AnnualFeeNextPaymentMoney = r.dm_SetFee;
                        if (nId == sId)//本国国内汇款
                        {
                            shouxufee = r.dm_ShouXuFee;
                            agentservicefee = r.dm_AgentServiceFee;
                        }
                        else if (sId == 1 && nId != 1)//中国国内汇款
                        {
                            shouxufee = r.dm_ShouXuFee1;
                            agentservicefee = r.dm_AgentServiceFee1;
                        }
                        else if (sId != 1)//中国境外汇款
                        {
                            shouxufee = r.dm_ShouXuFee2;
                            agentservicefee = r.dm_AgentServiceFee2;
                        }
                        //服务费折扣
                        if (dazhe != 0)
                        {
                            agentservicefee = agentservicefee * dazhe / 100;
                        }
                        if (dazhe1 != 0)
                        {
                            agentservicefee = agentservicefee * dazhe1 / 100;
                        }
                        if (tp.i_YaoQiuXiang != 0)
                        {
                            tp.dm_ChaoXiangFee = r.dm_ChaoXiangFee * tp.i_YaoQiuXiang;
                        }
                        else
                        {
                            tp.dm_ChaoXiangFee = r.dm_ChaoXiangFee;
                        }
                        if (tp.i_AnnualFeeRestDay < 0)
                        {
                            string str = GetZhiNaJinByPatentInfo(tp.i_AnnualFeeRestDay, tp.i_PatentType, tp.nvc_AnnualFeeNotPaymentYear);
                            tp.nvc_ZhiNaJin = str.Split(',')[1];
                        }
                        else
                        {
                            tp.nvc_ZhiNaJin = "0";
                        }

                        tp.dm_RemittanceFee = shouxufee;
                        tp.dm_AgentServiceFee = agentservicefee;

                        //减免
                        if (jianmian1 != 0)
                        {
                            tp.dm_AnnualFeeNextPaymentMoney -= tp.dm_AnnualFeeNextPaymentMoney * jianmian1 / 100;
                        }

                        tp.dm_FeeSubtotal = tp.dm_AnnualFeeNextPaymentMoney + tp.dm_RemittanceFee + tp.dm_AgentServiceFee + tp.dm_ChaoXiangFee + Convert.ToDecimal(tp.nvc_ZhiNaJin);
                    }
                    #endregion
                }
                else
                {
                    tp.dm_FeeSubtotal = 0;
                    tp.dm_AnnualFeeNextPaymentMoney = 0;
                    tp.dm_RemittanceFee = 0;
                    tp.dm_AgentServiceFee = 0;
                    tp.dm_ChaoXiangFee = 0;
                    tp.nvc_ZhiNaJin = "0";
                    tp.i_AnnualFeeRestDay = 0;
                    tp.i_AnnualFeeStatus = 13;
                }
                Patent_Update(tp);
            }
            catch { }
        }

        /// <summary>
        /// 更新当前用户的所有专利信息
        /// </summary>
        /// <param name="id"></param>
        public void EditPatentFeeByMemberId(int id)
        {
            var iquery = Patent_SelectAllByMenberId(id);
            foreach (var i in iquery)
            {
                EditPatentFee(i);
            }
        }
    }
}
