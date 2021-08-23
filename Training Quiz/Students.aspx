<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Students.aspx.vb" Inherits="Training_Quiz.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="Grid" AutoGenerateColumns="False" OnDataBinding="Grid_DataBinding" runat="server" >
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Column">
                        <DataItemTemplate>
                            <dx:ASPxHyperLink runat="server" ID="DeleteLink" OnInit="DeleteLink_Init"></dx:ASPxHyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Column">
                        <DataItemTemplate>
                            <dx:ASPxHyperLink runat="server" ID="EditLink" OnInit="EditLink_Init"></dx:ASPxHyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <br />
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Add New Student" OnClick="AddButton_Click"></dx:ASPxButton>
        </div>
    </form>
</body>
</html>
