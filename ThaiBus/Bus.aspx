<%@ Page Title="Bus" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bus.aspx.vb" Inherits="ThaiBus.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
     
        <h2>รายชื่อรถเมล์.<br />

        </h2>

        </hgroup>
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_bus" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" Width="599px" CssClass="auto-style1" Height="258px">
        <Columns>
            <asp:BoundField DataField="id_bus" HeaderText="id_bus" ReadOnly="True" SortExpression="id_bus" Visible ="false"  />
            <asp:BoundField DataField="num_bus" HeaderText="สาย" SortExpression="num_bus" />
            <asp:BoundField DataField="name_bus" HeaderText="ชื่อ" SortExpression="name_bus" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\data.accdb" DeleteCommand="DELETE FROM `tb_bus` WHERE `id_bus` = ?" InsertCommand="INSERT INTO `tb_bus` (`id_bus`, `num_bus`, `name_bus`) VALUES (?, ?, ?)" SelectCommand="SELECT `id_bus`, `num_bus`, `name_bus` FROM `tb_bus`" UpdateCommand="UPDATE `tb_bus` SET `num_bus` = ?, `name_bus` = ? WHERE `id_bus` = ?">
        <DeleteParameters>
            <asp:Parameter Name="id_bus" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_bus" Type="String" />
            <asp:Parameter Name="num_bus" Type="String" />
            <asp:Parameter Name="name_bus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="num_bus" Type="String" />
            <asp:Parameter Name="name_bus" Type="String" />
            <asp:Parameter Name="id_bus" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
 
    </asp:Content>
      <asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
          <style type="text/css">
              .auto-style1 {}
          </style>
</asp:Content>

      