<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Training_Quiz_Rev._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function DeleteStudent(id) {
            StudentsGridView.PerformCallback(id);
        }

        function EditStudent(id) {
            window.location.href = "EditStudent.aspx?id=" + id;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="StudentsGridView" runat="server" DataSourceID="EntityDataSource" AutoGenerateColumns="False" KeyFieldName="StudentID"
                OnCustomCallback="StudentsGridView_CustomCallback"
                ClientInstanceName="StudentsGridView">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="StudentName" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="IDNo" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="IDType" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DOB" VisibleIndex="5"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="ContactNo" VisibleIndex="6"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Gender" VisibleIndex="7"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn VisibleIndex="0" FieldName="StudentID">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:DeleteStudent('{0}')" Text="Delete"></PropertiesHyperLinkEdit>
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataHyperLinkColumn VisibleIndex="1" FieldName="StudentID">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:EditStudent('{0}')" Text="Edit"></PropertiesHyperLinkEdit>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:EntityDataSource runat="server" ID="EntityDataSource" DefaultContainerName="TrainingEntities" ConnectionString="name=TrainingEntities" EnableFlattening="False" EntitySetName="Students" EntityTypeFilter="Student"></asp:EntityDataSource>
            <dx:ASPxButton ID="NewStudentButton" runat="server" Text="New Student">
                <ClientSideEvents Click="javascript:EditStudent('')" />
            </dx:ASPxButton>
        </div>
    </form>
</body>
</html>
