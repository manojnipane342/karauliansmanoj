﻿using Karaulians;
using Karaulians.App_Start;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Security;
using System.Web.SessionState;

namespace PickPackPic
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            AutoMapperConfig.Initialize();
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}