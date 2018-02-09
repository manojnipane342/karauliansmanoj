<%@ Page Title="" Language="C#" MasterPageFile="~/homeEng.Master" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="Karaulians.testpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">


    <form runat="server">
   <h1>total view</h1> <asp:Label ID="lblCounter" runat="server"></asp:Label>
        <asp:Button ID="btnlike" runat="server" Text="like" OnClick="btnlike_Click" />
        <h1>total likes</h1><asp:Label ID="lbllikes" runat="server"></asp:Label>
      </form>       <br />
    <h2>here is no. of vistor of website</h2> 
    <asp:Label ID="lblvisitor" runat="server"></asp:Label>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer1" Runat="Server">
</asp:Content>

