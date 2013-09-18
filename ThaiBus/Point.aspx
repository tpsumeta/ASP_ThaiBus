<%@ Page Title="Point" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Point.aspx.vb" Inherits="ThaiBus.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">

        <h2>รายชื่อสถานที่. </h2>
        
        </hgroup>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id_point" DataSourceID="AccessDataSource2" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="id_point" HeaderText="id_point" ReadOnly="True" SortExpression="id_point" Visible ="false" />
            <asp:BoundField DataField="name_point" HeaderText="สถานที่" SortExpression="name_point" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\data.accdb" DeleteCommand="DELETE FROM `tb_point` WHERE `id_point` = ?" InsertCommand="INSERT INTO `tb_point` (`id_point`, `name_point`) VALUES (?, ?)" SelectCommand="SELECT `id_point`, `name_point` FROM `tb_point`" UpdateCommand="UPDATE `tb_point` SET `name_point` = ? WHERE `id_point` = ?">
        <DeleteParameters>
            <asp:Parameter Name="id_point" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_point" Type="String" />
            <asp:Parameter Name="name_point" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name_point" Type="String" />
            <asp:Parameter Name="id_point" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <br />
    
    <asp:FormView ID="FormView2" runat="server" DataKeyNames="id_point" DataSourceID="SqlDataSource2">
      
        <InsertItemTemplate>
            name_point:
            <asp:TextBox ID="name_pointTextBox" runat="server" Text='<%# Bind("name_point") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\data.accdb" DeleteCommand="DELETE FROM [tb_point] WHERE (([id_point] = ?) OR ([id_point] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [tb_point] ([name_point]) VALUES (?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [tb_point]" UpdateCommand="UPDATE [tb_point] SET [name_point] = ? WHERE (([id_point] = ?) OR ([id_point] IS NULL AND ? IS NULL))">
       
        <InsertParameters>
            <asp:Parameter Name="id_point" Type="String" />
            <asp:Parameter Name="name_point" Type="String" />
        </InsertParameters>
       
    </asp:SqlDataSource>
</asp:Content>