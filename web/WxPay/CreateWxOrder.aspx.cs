﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WxPay_CreateWxOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        string reurl = "jsapi.aspx?order_no=" + r.Next(1000, 10000000);
        Response.Redirect(wxpayApp.TenpayUtil.CreateOauthUrlForCode("snsapi_base"));
        //Response.Write(wxpayApp.TenpayUtil.CreateOauthUrlForCode("snsapi_base"));
    }
}