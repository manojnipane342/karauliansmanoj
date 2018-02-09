using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Karaulians.API.ViewModel
{
    public class BlogVM
    {
        public int id { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<System.DateTime> created_date { get; set; }
        public string description { get; set; }
        public string images { get; set; }
    }
}