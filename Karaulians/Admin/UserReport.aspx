<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="Karaulians.Admin.UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="main-page">
            <div class="panel-body widget-shadow">
                <table id="tblUserMaster" class="table table-hover table-vertical-middle nomargin" width="100%">
                    <thead>
                        <tr>
                            <th>Prfile Image</th>
                            <th>Name</th>
                            <th>Email Id</th>
                            <th>Password</th>
                            <th>Status</th>
                            <th>Created Date</th>
                        </tr>
                    </thead>
                </table>

            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            LoadCountryList();
        })
        function LoadCountryList() {
            $("#tblUserMaster").DataTable({
                "searching": true,
                "serverSide": true,
                "order": [[1, "asc"]],
                "orderMulti": false,
                "ajax": {
                    url: "../api/service/getusersmasterlist",
                    type: "POST",
                    datatype: "json"
                },
                "columns": [
                        {
                            "data": "ProfileImage",
                            orderable: false, render:
                                function (data, type, full, meta) {

                                    var objstring = ''; objstring = data != "" && data != null ? ('<img alt="image" class="img-circle" src="../profile_img/' + data + '">') : ('<img alt="image" class="img-circle" src="../profile_img/' + full.id + '.jpg" />'); return objstring;
                                }, width: "10%"
                        },
                        { "data": "Name" },
                        { "data": "Email" },
                        { "data": "Password" },
                        { "data": "Status" },
                        { "data": "CreatedDate" },
                        {
                            "mRender": function (data, type, row) {
                                var action = "<center>";
                                action += '<a class="btn-sm btn-primary" onclick="EditCountryForm(this)" data-id=' + row.CountryId + '>Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;';
                                action += '<a data-id=' + row.CountryId + ' class="btn-sm btn-danger">Delete</a></center>';
                                return action;
                            }, orderable: false
                        }
                ]
            });
            $("#tblUserMaster").css("float", "right");
        }
    </script>
</asp:Content>
