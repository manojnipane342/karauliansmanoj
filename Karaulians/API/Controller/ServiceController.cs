using Karaulians.API.Helpers;
using Karaulians.API.Models;
using Karaulians.API.Repository;
using Karaulians.API.ViewModel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;


namespace Karaulians.API.Controller
{
    public class ServiceController : ApiController
    {
        #region --------------- Declaration ------------------
        private karauliansEntities db = new karauliansEntities();
        private UserRepository _userRepo = new UserRepository();
        #endregion

        #region ------------------- Common Methods ----------------------

        public string SaveImageFromBase64(string filename)
        {
            string data = filename;
           

            string NewFileName = RandomString(3) + "_" + DateTime.Now.ToString("dd_MM_yyyy_hh_mm_ss") + ".jpg";
            string[] pd = data.Split(',');
            byte[] imageBytes = Convert.FromBase64String(pd[1]);
            string filePath = System.Web.HttpContext.Current.Server.MapPath("~/profile_img/" + NewFileName);
            File.WriteAllBytes(filePath, imageBytes);

            //Width = 50;
            //Height = 50;
            //if (Width != 0 && Height != 0)
            //{
            //    Image imgOriginal = Image.FromFile(filePath);
            //    Image imgActual = Scale(imgOriginal, ImageFor);
            //    imgOriginal.Dispose();
            //    imgActual.Save(filePath);
            //    imgActual.Dispose();
            //}
            //imageResult.ImageName = fileName;


            return NewFileName;
        }

        private Random random = new Random((int)DateTime.Now.Ticks);
        private string RandomString(int Size)
        {
            string input = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            StringBuilder builder = new StringBuilder();
            char ch;
            for (int i = 0; i < Size; i++)
            {
                ch = input[random.Next(0, input.Length)];
                builder.Append(ch);
            }
            return builder.ToString();
        }
        #endregion


        [HttpPost]
        public IHttpActionResult Login(UserVM userVM)
        {
            try
            {
                var user = new UserRepository().Login(userVM);
                if (user != null)
                {
                    return Success(Messages.SUCCESS, user);
                }
                return Error(Messages.FAIL);
            }
            catch (Exception ex)
            {
                return Error(ex.Message.ToString());
            }
        }

        [HttpPost]
        public IHttpActionResult SaveUser(UserVM userVM)
        {
            try
            {
                userVM.profile_pic = userVM.profile_pic != null ? SaveImageFromBase64(userVM.profile_pic) : userVM.profile_pic;

                _userRepo.AddOrUpdateUser(userVM);
                return Success(Messages.SUCCESS);
            }
            catch (Exception ex)
            {
                return Error(ex.Message.ToString());
            }
        }

        [HttpPost]
        public IHttpActionResult GetUsersMasterList(DataTableFilterModel filter)
        {
            var _data =  new UserRepository().GetUsers(filter);
            return Ok(_data);
        }



        #region ------------------ Reply Format ----------------------

        public IHttpActionResult Success(string txt, dynamic data = null)
        {
            return PrepareReply(false, txt, data);
        }

        public IHttpActionResult Error(string txt)
        {
            return PrepareReply(true, txt);
        }

        public IHttpActionResult PrepareReply(bool isError, string txt, dynamic data = null)
        {
            var reply = new Reply
            {
                status = isError ? Messages.FAIL : Messages.SUCCESS,
                msg = isError ? "" : txt,
                error = isError ? txt : null,
                data = data,
            };
            return Ok(reply);
        }

        public class Reply
        {
            public string status { get; set; }
            public string msg { get; set; }
            public string error { get; set; }
            public dynamic data { get; set; }
        }

        #endregion


    }
}
