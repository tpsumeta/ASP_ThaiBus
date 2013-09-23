<%@ Page Title="Line" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Line.aspx.vb" Inherits="ThaiBus.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>เส้นทางเดินรถ.
            <br />
        </h2>

    </hgroup>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\data.accdb"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT * FROM [tb_bp]" DeleteCommand="DELETE FROM [tb_bp] WHERE [id_bp] = ?" InsertCommand="INSERT INTO [tb_bp] ([id_bp], [id_bus], [id_point]) VALUES (?, ?, ?)" UpdateCommand="UPDATE [tb_bp] SET [id_bus] = ?, [id_point] = ? WHERE [id_bp] = ?"
        >
        <DeleteParameters>
            <asp:Parameter Name="id_bp" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_bp" Type="Int32" />
            <asp:Parameter Name="id_bus" Type="String" />
            <asp:Parameter Name="id_point" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_bus" Type="String" />
            <asp:Parameter Name="id_point" Type="String" />
            <asp:Parameter Name="id_bp" Type="Int32" />
        </UpdateParameters>


       

    </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" DataKeyNames="id_bp">
        <Columns>
            <asp:BoundField DataField="id_bp" HeaderText="id_bp" SortExpression="id_bp" InsertVisible="false" ReadOnly="True"/>
            <asp:BoundField DataField="id_bus" HeaderText="id_bus" SortExpression="id_bus" />
            <asp:BoundField DataField="id_point" HeaderText="id_point" SortExpression="id_point" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
          


        </Columns>
    </asp:GridView>
    <br />
    <asp:FormView ID="FormView6" runat="server" DataKeyNames="id_bp" DataSourceID="SqlDataSource6">
        <EditItemTemplate>
            id_bp:
            <asp:Label ID="id_bpLabel1" runat="server" Text='<%# Eval("id_bp") %>' />
            <br />
            id_bus:
            <asp:TextBox ID="id_busTextBox" runat="server" Text='<%# Bind("id_bus") %>' />
            <br />
            id_point:
            <asp:TextBox ID="id_pointTextBox" runat="server" Text='<%# Bind("id_point") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            id_bus:
            <asp:TextBox ID="id_busTextBox" runat="server" Text='<%# Bind("id_bus") %>' />
            <br />
            id_point:
            <asp:TextBox ID="id_pointTextBox" runat="server" Text='<%# Bind("id_point") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
         
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\data.accdb" DeleteCommand="DELETE FROM [tb_bp] WHERE [id_bp] = ?" InsertCommand="INSERT INTO [tb_bp] ([id_bp], [id_bus], [id_point]) VALUES (?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [tb_bp]" UpdateCommand="UPDATE [tb_bp] SET [id_bus] = ?, [id_point] = ? WHERE [id_bp] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id_bp" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_bp" Type="Int32" />
            <asp:Parameter Name="id_bus" Type="Int32" />
            <asp:Parameter Name="id_point" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_bus" Type="Int32" />
            <asp:Parameter Name="id_point" Type="String" />
            <asp:Parameter Name="id_bp" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_bus" DataSourceID="AccessDataSource2" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="id_bus" HeaderText="id_bus" ReadOnly="True" SortExpression="id_bus" />
            <asp:BoundField DataField="num_bus" HeaderText="num_bus" SortExpression="num_bus" />
            <asp:BoundField DataField="name_bus" HeaderText="name_bus" SortExpression="name_bus" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\data.accdb" DeleteCommand="DELETE FROM `tb_bus` WHERE `id_bus` = ?" InsertCommand="INSERT INTO `tb_bus` (`id_bus`, `num_bus`, `name_bus`) VALUES (?, ?, ?)" SelectCommand="SELECT `id_bus`, `num_bus`, `name_bus` FROM `tb_bus`" UpdateCommand="UPDATE `tb_bus` SET `num_bus` = ?, `name_bus` = ? WHERE `id_bus` = ?">
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
    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_point" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display." Height="162px" Width="233px">
        <Columns>
            <asp:BoundField DataField="id_point" HeaderText="id_point" ReadOnly="True" SortExpression="id_point" />
            <asp:BoundField DataField="name_point" HeaderText="name_point" SortExpression="name_point" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\data.accdb" DeleteCommand="DELETE FROM `tb_point` WHERE `id_point` = ?" InsertCommand="INSERT INTO `tb_point` (`id_point`, `name_point`) VALUES (?, ?)" SelectCommand="SELECT `id_point`, `name_point` FROM `tb_point`" UpdateCommand="UPDATE `tb_point` SET `name_point` = ? WHERE `id_point` = ?">
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


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    </asp:Content>

