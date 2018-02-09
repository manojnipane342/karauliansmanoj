﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Karaulians
{
    public partial class home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataSet tmpDs = new DataSet();
                tmpDs.ReadXml(Server.MapPath("~/counter.xml"));

                lblCount.Text = tmpDs.Tables[0].Rows[0]["hits"].ToString();

                int a;
                a = Convert.ToInt32((tmpDs.Tables[0].Rows[0]["hits"].ToString()));
                lblCount.Text = Convert.ToString(a);
                if (a < 10)
                    lblCount.Text = "000" + lblCount.Text;
                else if (a < 100)
                    lblCount.Text = "00" + lblCount.Text;
                else if (a < 1000)
                    lblCount.Text = "0" + lblCount.Text;

            }
            catch
            {
            }
        }
    }
}