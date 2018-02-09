using AutoMapper;
using Karaulians.API.Models;
using Karaulians.API.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Karaulians.App_Start
{
    public class AutoMapperConfig
    {
        public static void Initialize()
        {
            Mapper.Initialize(cfg =>
            {
                
                cfg.CreateMap<UserVM, user>();
                cfg.CreateMap<user, UserVM>();

                cfg.CreateMap<BlogVM, blog>();
                cfg.CreateMap<blog, BlogVM>();


                cfg.CreateMap<RoleVM, user_role>();
                cfg.CreateMap<user_role, RoleVM>();

            });
        }
    }
}