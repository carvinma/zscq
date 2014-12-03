using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using zscq.DAL;
using zscq.BLL;
using zscq.Model;

public partial class Shop_Manage_NewManage_TradeMarkStatus : System.Web.UI.Page
{
    public bool ifhave = Manager.GetManagerQX(42, 2);
    public bool pageupdate = Manager.GetManagerQX(42, 3);
    private int statusType = 0;
    dal_NewTrademark mark = new dal_NewTrademark();
    protected void Page_Load(object sender, EventArgs e)
    {
        div_a.InnerHtml = "";
        if (Request.QueryString["type"] == "0")
        { statusType = 0; }
        else statusType = 1;
     
        if (Request.Cookies["zscqmanage"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (Request.Cookies["zscqmanage"]["flag"] == null || Request.Cookies["zscqmanage"]["flag"] == "")
        {
            Response.Redirect("Login.aspx");
        }
        HiddenDel.Value = "";
        if (!IsPostBack)
        {
            DataGridDataBind();
        }
    }

    private void DataGridDataBind()
    {
        try
        {
            dgEdit.DataSource = statusType == 0 ? BaseDataUtil.tradeMarkStatuslist : BaseDataUtil.tradeMarkRenewedStatuslist;
            dgEdit.DataBind();
        }
        catch (Exception error)
        {
            Response.Write(error.ToString());
        }
    }


    protected void btnDel_Click(object sender, EventArgs e)
    {
        //if (Request.Form["inputPageid"] != null)
        //{
        //    string[] IDList = Request.Form["inputPageid"].ToString().Split(',');
        //    for (int i = 0; i < IDList.Length; i++)
        //    {
        //        goods.DetailCategory_Del(int.Parse(IDList[i]));
        //    }
        //    Manager.AddLog(0, "商品类别管理", "删除商品小类别");
        //}
        //BindDetailCategory(aspPage.CurrentPageIndex, this.hoot.Value.Trim());
        //HiddenDel.Value = "del";
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int value = 0;
        t_NewTradeMarkStatus model = new t_NewTradeMarkStatus();
        model.StatusName = this.txtName.Value.Trim();
        if (int.TryParse(this.txtValue.Value.Trim(), out value))
        {
            model.StatusValue = value;
        }
        model.StatusType = statusType;

        if (mark.TrademarkStatus_Add(model) > 0)
        {
            this.txtName.Value = "";
            this.txtValue.Value = "";
            if (statusType == 0)
            {
                BaseDataUtil.tradeMarkStatuslist.Add(model);
            }
            else
            {
                BaseDataUtil.tradeMarkRenewedStatuslist.Add(model);
            }
            DataGridDataBind();
        }

    }
    protected void dgEdit_CancelCommand(object source, DataGridCommandEventArgs e)
    {
        dgEdit.EditItemIndex = -1;
        DataGridDataBind();
    }
    protected void dgEdit_EditCommand(object source, DataGridCommandEventArgs e)
    {
        dgEdit.EditItemIndex = e.Item.ItemIndex;
        DataGridDataBind();
    }
    protected void dgEdit_UpdateCommand(object source, DataGridCommandEventArgs e)
    {
        int id = (int)dgEdit.DataKeys[e.Item.ItemIndex];
        TextBox newStatusName = (TextBox)e.Item.FindControl("txtStatusName");
        TextBox newStatusValue = (TextBox)e.Item.FindControl("txtStatusValue");
        t_NewTradeMarkStatus model = new t_NewTradeMarkStatus();
        model.i_Id = id;
        model.StatusType = statusType;
        model.StatusName = newStatusName.Text.Trim();
        int value = 0;
        if (int.TryParse(newStatusValue.Text, out value))
            model.StatusValue = value;
        if (mark.TrademarkStatus_Update(model)>0)
        {
            int index = 0;
            if (statusType == 0)
            {
                foreach (var p in BaseDataUtil.tradeMarkStatuslist)
                {
                    if (p.i_Id == model.i_Id)
                    {
                        break;
                    }
                    index++;
                }
                BaseDataUtil.tradeMarkStatuslist.RemoveAt(index);
                BaseDataUtil.tradeMarkStatuslist.Insert(index, model);
            }
            else
            {
                foreach (var p in BaseDataUtil.tradeMarkRenewedStatuslist)
                {
                    if (p.i_Id == model.i_Id)
                    {
                        break;
                    }
                    index++;
                }
                BaseDataUtil.tradeMarkRenewedStatuslist.RemoveAt(index);
                BaseDataUtil.tradeMarkRenewedStatuslist.Insert(index, model);
            }
            
        }
        try
        {
            DataGridDataBind();
        }
        catch (Exception err)
        {
           
        }
        finally
        {
            
        }
    }
    protected void dgEdit_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int id = (int)dgEdit.DataKeys[e.Item.ItemIndex];
        if (mark.TrademarkStatus_Del(id) > 0)
        {
            if (statusType == 0)
            {
                BaseDataUtil.tradeMarkStatuslist.Remove(BaseDataUtil.tradeMarkStatuslist.First(p => p.i_Id == id));
            }
            else
            {
                BaseDataUtil.tradeMarkRenewedStatuslist.Remove(BaseDataUtil.tradeMarkRenewedStatuslist.First(p => p.i_Id == id));
            }
            DataGridDataBind();
        }
    }
    protected void dgEdit_ItemCreated(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.EditItem)
        {
            TableCell myTableCell;
            myTableCell = e.Item.Cells[3];
            LinkButton btnDel = (LinkButton)myTableCell.Controls[0];
            btnDel.Attributes.Add("onclick", "return confirm('您真的要删除此行吗？');");
            btnDel.Text = "删除";
        }
    }
}