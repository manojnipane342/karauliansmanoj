using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Karaulians.API.ViewModel
{
    public class UserVM
    {
        public int id { get; set; }
        public string first_name { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string profile_pic { get; set; }
        public Nullable<bool> is_delete { get; set; }
        public Nullable<bool> is_active { get; set; }
        public string mobile { get; set; }

        public Nullable<System.DateTime> created_date { get; set; }
        public int role_id { get; set; }
        public string RoleName { get; set; }
    }
}