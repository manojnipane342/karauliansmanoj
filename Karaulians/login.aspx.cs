using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Karaulians
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string SaveUserLoginData(string id, string email, string usertype, string name, string profile_pic)
        {
            try
            {
                HttpContext.Current.Session["UserId"] = id;
                HttpContext.Current.Session["email"] = email;
                HttpContext.Current.Session["usertype"] = usertype;
                HttpContext.Current.Session["name"] = name;
                HttpContext.Current.Session["profile_pic"] = "/profile_img/" + profile_pic;

                return usertype;
            }
            catch (Exception ex)
            {
                return "Fail";
            }
        }
    }
}