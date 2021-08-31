Imports DevExpress.Web

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub StudentsGridView_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
        Dim context As New TrainingEntities()
        Dim id As Guid = Guid.Parse(e.Parameters)
        Dim student As Student = context.Students.Find(id)
        context.Students.Remove(student)
        context.SaveChanges()
        StudentsGridView.DataBind()
    End Sub

End Class