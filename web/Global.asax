<%@ Application Language="C#" %>
<script RunAt="server">
    void Application_Start(object sender, EventArgs e)
    {
        //在应用程序启动时运行的代码
        //定义定时器
        System.Timers.Timer myTimer = new System.Timers.Timer(1000*60*30);//毫秒多久执行一次
        myTimer.Elapsed += new System.Timers.ElapsedEventHandler(myTimer_Elapsed);
        myTimer.Enabled = true;
        myTimer.AutoReset = true;
        
        zscq.BLL.BaseDataUtil data = new zscq.BLL.BaseDataUtil();
        data.InitData(); //初始化商标下拉框状态
    }
    void myTimer_Elapsed(object source, System.Timers.ElapsedEventArgs e)
    {
        try
        {
            //Log.Log_add(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ":AutoTask is Working!");
            YourTask();
        }
        catch (Exception ee)
        {
            //Log.Log_SaveException(ee);
        }
    }
    void YourTask()
    {
        //在这里写你需要执行的任务
        //zscq.DAL.dal_Member member = new zscq.DAL.dal_Member();
        //zscq.Model.t_Member model = member.Member_Select_Id(181);
        //model.dt_AddTime = DateTime.Now;
        //member.Member_Update(model);
        GlobalSend gs = new GlobalSend();
        gs.SendEmail_Patent("zl_status0", "txt_zl_con0", 6);
        gs.SendEmail_Patent("zl_status15", "txt_zl_con15", 5);
        gs.SendEmail_Patent("zl_status30", "txt_zl_con30", 4);
        gs.SendEmail_Patent("zl_status60", "txt_zl_con60", 3);
        gs.SendEmail_Patent("zl_status90", "txt_zl_con90", 2);
        gs.SendEmail_Patent("zl_status", "txt_zl_con", 1);

        gs.SendEmail_PatentOrder("i_ZlStatus11", "nvc_ZlStatus11", 1);
        gs.SendEmail_PatentOrder("i_ZlStatus22", "nvc_ZlStatus22", 2);
        gs.SendEmail_PatentOrder("i_ZlStatus33", "nvc_ZlStatus33", 3);
        gs.SendEmail_PatentOrder("i_ZlStatus44", "nvc_ZlStatus44", 4);
        gs.SendEmail_PatentOrder("i_ZlStatus55", "nvc_ZlStatus55", 5);
        gs.SendEmail_PatentOrder("i_ZlStatus66", "nvc_ZlStatus66", 6);
        gs.SendEmail_PatentOrder("i_ZlStatus77", "nvc_ZlStatus77", 7);
        gs.SendEmail_PatentOrder("i_ZlStatus88", "nvc_ZlStatus88", 8);

        gs.SendEmail_SB("sb_status0", "txt_sb_con0", 1);
        gs.SendEmail_SB("sb_status15", "txt_sb_con15", 2);
        gs.SendEmail_SB("sb_status30", "txt_sb_con30", 3);
        gs.SendEmail_SB("sb_status60", "txt_sb_con60", 4);
        gs.SendEmail_SB("sb_status90", "txt_sb_con90", 5);
        gs.SendEmail_SB("sb_status", "txt_sb_con", 6);

        gs.SendEmail_SbOrder("i_SbStatus11", "nvc_SbStatus11", 1);
        gs.SendEmail_SbOrder("i_SbStatus22", "nvc_SbStatus22", 2);
        gs.SendEmail_SbOrder("i_SbStatus33", "nvc_SbStatus33", 3);
        gs.SendEmail_SbOrder("i_SbStatus44", "nvc_SbStatus44", 4);
        //================================================
        gs.SendMessage_Patent("zl_status_0", "txt_zl_con_0", 6);
        gs.SendMessage_Patent("zl_status_15", "txt_zl_con_15", 5);
        gs.SendMessage_Patent("zl_status_30", "txt_zl_con_30", 4);
        gs.SendMessage_Patent("zl_status_60", "txt_zl_con_60", 3);
        gs.SendMessage_Patent("zl_status_90", "txt_zl_con_90", 2);
        gs.SendMessage_Patent("zl_status_s", "txt_zl_con_s", 1);

        gs.SendMessage_PatentOrder("i_ZlStatus1", "nvc_ZlStatus1", 1);
        gs.SendMessage_PatentOrder("i_ZlStatus2", "nvc_ZlStatus2", 2);
        gs.SendMessage_PatentOrder("i_ZlStatus3", "nvc_ZlStatus3", 3);
        gs.SendMessage_PatentOrder("i_ZlStatus4", "nvc_ZlStatus4", 4);
        gs.SendMessage_PatentOrder("i_ZlStatus5", "nvc_ZlStatus5", 5);
        gs.SendMessage_PatentOrder("i_ZlStatus6", "nvc_ZlStatus6", 6);
        gs.SendMessage_PatentOrder("i_ZlStatus7", "nvc_ZlStatus7", 7);
        gs.SendMessage_PatentOrder("i_ZlStatus8", "nvc_ZlStatus8", 8);

        gs.SendMessage_SB("sb_status_0", "txt_sb_con_0", 6);
        gs.SendMessage_SB("sb_status_15", "txt_sb_con_15", 5);
        gs.SendMessage_SB("sb_status_30", "txt_sb_con_30", 4);
        gs.SendMessage_SB("sb_status_60", "txt_sb_con_60", 3);
        gs.SendMessage_SB("sb_status_90", "txt_sb_con_90", 2);
        gs.SendMessage_SB("sb_status_s", "txt_sb_con_s", 1);
        
        gs.SendMessage_SbOrder("i_SbStatus1", "nvc_SbStatus1", 1);
        gs.SendMessage_SbOrder("i_SbStatus2", "nvc_SbStatus2", 2);
        gs.SendMessage_SbOrder("i_SbStatus3", "nvc_SbStatus3", 3);
        gs.SendMessage_SbOrder("i_SbStatus4", "nvc_SbStatus4", 4);
    }
    void Application_End(object sender, EventArgs e)
    {
        //在应用程序关闭时运行的代码
        //Log.Log_add(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ":Application End!");
        //下面的代码是关键，可解决IIS应用程序池自动回收的问题
        System.Threading.Thread.Sleep(1000);
        //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start
        string url = "index.aspx";
        System.Net.HttpWebRequest myHttpWebRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(url);
        System.Net.HttpWebResponse myHttpWebResponse = (System.Net.HttpWebResponse)myHttpWebRequest.GetResponse();
        System.IO.Stream receiveStream = myHttpWebResponse.GetResponseStream();//得到回写的字节流
    }

    void Application_Error(object sender, EventArgs e)
    {
        //在出现未处理的错误时运行的代码
        //string exurl = "error.aspx";
        //Response.Redirect(exurl);
    }

    void Session_Start(object sender, EventArgs e)
    {
        //在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        //在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式 
        //设置为 StateServer 或 SQLServer，则不会引发该事件。

    }
</script>
