<%@ Page Title="Thai Bus" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ThaiBus._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">

        <div class="content-wrapper">
            <hgroup class="title">

                <h2>รถเมล์ไทย</h2>
            </hgroup>


            
                <asp:Label ID="Label1" runat="server" Text="เริ่ม"></asp:Label>
    
      
                <asp:TextBox ID="TextBox1" runat="server" class="tb" ToolTip="เลือกจุดเริ่มต้น"></asp:TextBox>

            
              <asp:TextBox ID="TextBox2" runat="server" ToolTip="จุดที่ต้องการไป"></asp:TextBox>

                <asp:Button ID="Button1" runat="server" Text="ค้นหา" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\data.accdb"
                    ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [tb_point]"></asp:SqlDataSource>

           

            <%--                <% 
                    If Request.QueryString("start") <> "" Then
                        Response.Write("จาก " & Request.QueryString("start"))
                        Response.Write("ไป " & Request.QueryString("stop"))
                   
                    End If
                %>--%>
        </div>




    </section>


</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    คุณเลือก: จาก
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    ไป
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display." DataKeyNames="id_bus" Width="326px" AllowPaging="True">
        <Columns>

            <asp:BoundField DataField="id_bus" HeaderText="id_bus" SortExpression="id_bus" ReadOnly="True" Visible="false" />

            <asp:BoundField DataField="num_bus" HeaderText="สาย" SortExpression="num_bus" />
            <asp:BoundField DataField="name_bus" HeaderText="ชื่อ" SortExpression="name_bus" />


        </Columns>
    </asp:GridView>


    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\data.accdb"
        SelectCommand="SELECT id_bus, num_bus, name_bus FROM tb_bus WHERE (id_bus IN (SELECT derivedtbl_1.id_bus FROM ((SELECT id_bus FROM tb_bp WHERE (id_point = (SELECT id_point FROM tb_point WHERE (name_point = ?)))) derivedtbl_1 INNER JOIN (SELECT id_bus FROM tb_bp tb_bp_1 WHERE (id_point = (SELECT id_point FROM tb_point tb_point_1 WHERE (name_point = ?)))) derivedtbl_2 ON derivedtbl_1.id_bus = derivedtbl_2.id_bus)))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label3" Name="num_bus" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="Label4" Name="?" PropertyName="Text" />
        </SelectParameters>
    </asp:AccessDataSource>




    <br />



    <br />

    <br />
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
        }
    </style>
</asp:Content>

