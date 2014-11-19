using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;

namespace zscq.BLL
{
    public class bll_UserIntegralNote
    {
        DataMemberDataContext dmdc = new DataMemberDataContext();
        dal_UserIntegralNote DALUIN = new dal_UserIntegralNote();
        //dal_Order DaoOrder = new dal_Order();
        dal_Member DALM = new dal_Member();
        dal_IntegralMobile DALIM = new dal_IntegralMobile();
        /// <summary>
        /// 积分流水
        /// </summary>
        /// <param name="MemberId"></param>
        /// <param name="NoteType"></param>
        /// <param name="Integral"></param>
        /// <returns></returns>
        public int UserIntegralNote_UpdateIntegr(int MemberId, int Integral, int orderid)
        {
            try
            {
                t_Member UserCp = DALM.Member_Select_Id(MemberId);
                UserCp.i_Integral = UserCp.i_Integral + Integral;
                DALM.Member_Update(UserCp);

                //t_IntegralMobile model = DALIM.IntegralMobile_SelectByMemberId(MemberId);
                //model.i_Integral = model.i_Integral + Integral;
                //DALIM.IntegralMobile_Updata(model);

                var models = (DALUIN.IntegralNote_Select_OrderId(orderid)).ToList();
                for (int i = 0; i < models.Count; i++)
                {
                    models[0].i_status = 1;
                }
                return DALUIN.IntegralNote_Update(models[0]);
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// 添加一条立即生效的积分流水
        /// </summary>
        /// <param name="MemberId"></param>
        /// <param name="NoteType"></param>
        /// <param name="Integral"></param>
        /// <returns></returns>
        public int UserIntegralNote_Add(int MemberId, string NoteType, int Integral)
        {
            try
            {
                t_IntegralMobile im = DALIM.IntegralMobile_SelectByMemberId(MemberId);
                t_Member member = DALM.Member_Select_Id(MemberId);

                t_UserIntegralNote model = new t_UserIntegralNote();
                model.i_IntegralMobileId = member.i_IntegralMobileId;
                model.i_UserId = MemberId;
                model.nvc_NoteType = NoteType;
                //model.i_Integral_1 = UserCp.i_Integral; 
                model.i_Integral_1 = im.i_Integral;
                model.i_Integral_2 = Integral;
                //UserCp.i_Integral = UserCp.i_Integral + model.i_Integral_2;
                //DALM.Member_Update(UserCp); 
                im.i_Integral = im.i_Integral + Integral;
                DALIM.IntegralMobile_Updata(im);
                model.i_status = 1;
                //model.i_Integral_3 = UserCp.i_Integral;
                model.i_Integral_3 = im.i_Integral;
                return DALUIN.IntegralNote_Add(model);
            }
            catch
            {
                return 0;
            }
        }

        public int UserIntegralNote_Add(int MemberId, string NoteType, int Integral, int OrderId, int status)
        {
            try
            {
                if (OrderId != 0)
                {
                    if (DALUIN.IntegralNote_Count(i => i.i_OrderID == OrderId && i.nvc_NoteType == NoteType) > 0)
                    {
                        return 0;
                    }
                }
                //t_Member UserCp = DALM.Member_Select_Id(MemberId);
                t_IntegralMobile IM = DALIM.IntegralMobile_SelectByMemberId(MemberId);
                t_UserIntegralNote model = new t_UserIntegralNote();
                model.i_IntegralMobileId = IM.i_Id;
                model.i_UserId = MemberId;
                model.nvc_NoteType = NoteType;
                //model.i_Integral_1 = UserCp.i_Integral;
                model.i_Integral_1 = IM.i_Integral;
                model.i_Integral_2 = Integral;

                IM.i_Integral = IM.i_Integral + model.i_Integral_2;
                //UserCp.i_Integral = UserCp.i_Integral + model.i_Integral_2;
                if (status == 1)
                {
                    DALIM.IntegralMobile_Updata(IM);
                    //DALM.Member_Update(UserCp);
                }
                //model.i_Integral_3 = UserCp.i_Integral;
                model.i_Integral_3 = IM.i_Integral;
                model.i_status = status;
                model.i_OrderID = OrderId;
                return DALUIN.IntegralNote_Add(model);
            }
            catch
            {
                return 0;
            }
        }



    }
}
