using AutoMapper;
using Karaulians.API.Helpers;
using Karaulians.API.Models;
using Karaulians.API.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Karaulians.API.Repository
{
    public class UserRepository
    {
        private karauliansEntities db = new karauliansEntities();

        public UserVM Login(UserVM userVM)
        {
            user user = new user();
            try
            {
                if (string.IsNullOrWhiteSpace(userVM.email))
                {
                    throw new Exception(Messages.BAD_DATA);
                }

                user = db.users.FirstOrDefault(x =>
                                                   x.email.ToLower() == userVM.email.ToLower()
                                                && x.password == userVM.password
                                                && x.is_active == true
                                                && x.is_delete == false);


                if (userVM == null)
                {
                    throw new Exception(Messages.INVALID_USER_PASS);
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
            var _data = Mapper.Map<user, UserVM>(user);
            _data.RoleName = db.user_role.FirstOrDefault(c => c.id == _data.role_id).role_name;
            return _data;
        }

        public List<user> GetUsers()
        {
            var userlist = db.users.Where(x => x.role_id == 2).ToList();
            return userlist;

        }

        public DataTableFilterModel GetUsers(DataTableFilterModel filter)
        {
            var data = db.users.Select(c => new
                               {
                                   ProfileImage = c.profile_pic,
                                   Name = c.first_name,
                                   Email = c.email,
                                   Password = c.password,
                                   Status = c.is_active == true && c.is_delete == false ? "Active" : "Deactive",
                                   CreatedDate = c.created_date,
                                   RoleID = c.role_id,
                               })
                               .AsEnumerable();

            var totalCount = data.Count();
            if (!string.IsNullOrWhiteSpace(filter.search.value))
            {
                data = data.Where(d => (!string.IsNullOrEmpty(d.Name)) && d.Name.ToLower().Contains(filter.search.value.ToLower()) && d.RoleID == 1);
            }

            var o = filter.order[0];
            var name = filter.columns[filter.order[0].column].data;
            if (o.dir == "asc")
            {
                data = data.OrderBy(x => x.GetType().GetProperty(name).GetValue(x));
            }
            else
            {
                data = data.OrderByDescending(x => x.GetType().GetProperty(name).GetValue(x));
            }
            var filteredCount = data.Count();
            filter.recordsTotal = totalCount;
            filter.recordsFiltered = filteredCount;
            filter.data = data.Skip(filter.start).Take(filter.length).ToList();
            return filter;
        }

        public void AddOrUpdateUser(UserVM userVM)
        {
            user _MapData = Mapper.Map<UserVM, user>(userVM);
            if (_MapData.id == 0)
            {
                if (db.users.Where(v => v.email == _MapData.email).Count() == 0)
                {
                    _MapData.is_active = true;
                    _MapData.is_delete = false;
                    _MapData.role_id = 1;
                    db.Entry(_MapData).State = EntityState.Added;
                    db.SaveChanges();
                }
                else
                {
                    throw new Exception("Email Id Already Exist.");
                }
            }
            else
            {
                user _OldData = db.users.FirstOrDefault(x => x.id == _MapData.id && x.is_active == true && x.is_delete == false);
                {
                    _OldData.id = _MapData.id;
                    _OldData.email = _MapData.email;
                    _OldData.password = _MapData.password;
                    _OldData.profile_pic = _MapData.profile_pic;
                    _OldData.is_active = _MapData.is_active;
                    _OldData.is_delete = _MapData.is_delete;
                    _OldData.created_date = DateTime.Now;
                    _OldData.role_id = 1;
                    db.SaveChanges();
                }
            }
        }
    }
}