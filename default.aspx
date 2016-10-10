<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="waDEIG._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DEIG Meeting List</title>
</head>
<body>
    <form id="form1" runat="server">
    <div padding="10x">
    <asp:Table runat="server">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Day of Week</asp:TableHeaderCell>
            <asp:TableHeaderCell>Time</asp:TableHeaderCell>
            <asp:TableHeaderCell>Town</asp:TableHeaderCell>
            <asp:TableHeaderCell>Get</asp:TableHeaderCell>            
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlDOW" runat="server" DataSourceID="SqlDsDOW" DataTextField="DayName" DataValueField="Id"></asp:DropDownList>
                </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlTime" runat="server" DataSourceID="SqlDsTime" DataTextField="xTime" DataValueField="TimeID"></asp:DropDownList>
                </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlTown" runat="server" DataSourceID="SqlDsTown" DataTextField="Town" DataValueField="Town"></asp:DropDownList>
                </asp:TableCell>
            <asp:TableCell>
                  <asp:LinkButton ID="lbGet" runat="server" OnClick="lbGet_Click">Get Selection</asp:LinkButton>      
               </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell colspan="3">
                <asp:Label ID="lblFilter" runat="server" Text="Information: " ></asp:Label>
                </asp:TableCell> 
            </asp:TableRow>
    </asp:Table>  
       
        <asp:SqlDataSource ID="SqlDsTown" runat="server" ConnectionString="<%$ ConnectionStrings:cnDEIG %>" SelectCommand="SELECT Town FROM vTown ORDER BY Town"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsTime" runat="server" ConnectionString="<%$ ConnectionStrings:cnDEIG %>" SelectCommand="SELECT TimeID, xTime FROM aTime ORDER BY TimeID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsDOW" runat="server" ConnectionString="<%$ ConnectionStrings:cnDEIG %>" SelectCommand="SELECT Id, DayName FROM DOW ORDER BY Id"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDsList" runat="server" ConnectionString="<%$ ConnectionStrings:cnDEIG %>" SelectCommand="SELECT DOW, TimeID, Town, GroupName, Information, Location, Type
            FROM  List ORDER BY DOW, TimeID, Town"></asp:SqlDataSource>
    </div>
        <section>
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDsList" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Day" SortExpression="DOW">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DOW") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDsDOW" DataTextField="DayName" DataValueField="Id" SelectedValue='<%# Bind("DOW") %>' BackColor="White" Enabled="False" Font-Bold="True">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Time" SortExpression="TimeID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TimeID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDsTime" DataTextField="xTime" DataValueField="TimeID" SelectedValue='<%# Bind("TimeID") %>' BackColor="White" Enabled="False" Font-Bold="True">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Town" HeaderText="Town" SortExpression="Town" />
                    <asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />
                    <asp:BoundField DataField="Information" HeaderText="Information" SortExpression="Information" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <asp:LinkButton ID="LnkExport" runat="server" OnClick="LnkExport_Click">Export List to text file</asp:LinkButton>
        </section>
    </form>
</body>
</html>
