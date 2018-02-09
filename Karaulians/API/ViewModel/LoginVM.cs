using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Karaulians.API.ViewModel
{
    public class LoginVM
    {
        public int LG_id { get; set; }
        public string Login_Username { get; set; }
        public string Password_login { get; set; }
        public string Login_Type { get; set; }
    }
}