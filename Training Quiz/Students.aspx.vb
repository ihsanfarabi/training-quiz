Imports DevExpress.Web

Public Class Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If Request.QueryString("delete") IsNot Nothing Then
            Dim context As New TrainingContext()
            Dim student As Student = context.Students.Find(Guid.Parse(Request.QueryString("delete")))
            context.Students.Remove(student)
            context.SaveChanges()
            Session.Clear()
            Response.Redirect("Students.aspx")
        End If

        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'Create columns on the first load.
            Dim columnArray(6) As GridViewDataColumn
            columnArray(0) = New GridViewDataColumn With {.FieldName = "StudentID", .Visible = False}
            columnArray(1) = New GridViewDataColumn With {.FieldName = "Student Name"}
            columnArray(2) = New GridViewDataColumn With {.FieldName = "ID#"}
            columnArray(3) = New GridViewDataColumn With {.FieldName = "ID Type"}
            columnArray(4) = New GridViewDataColumn With {.FieldName = "DOB"}
            columnArray(5) = New GridViewDataColumn With {.FieldName = "Contact No"}
            columnArray(6) = New GridViewDataColumn With {.FieldName = "Gender"}
            Grid.Columns.AddRange(columnArray)
        End If

        'Bind the grid only once
        If (Not IsPostBack) Then
            Grid.DataBind()
        End If
    End Sub

    Protected Sub Grid_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
        ' Assign the data source in grid_DataBinding
        Grid.KeyFieldName = "StudentID"
        Grid.DataSource = GetTable()
    End Sub

    Private Function GetTable() As DataTable
        'You can store a DataTable in the session state
        Dim table As DataTable = TryCast(Session("Table"), DataTable)
        If table Is Nothing Then
            table = New DataTable()
            table.Columns.Add("StudentID", GetType(Guid))
            table.Columns.Add("Student Name", GetType(String))
            table.Columns.Add("ID#", GetType(String))
            table.Columns.Add("ID Type", GetType(Short))
            table.Columns.Add("DOB", GetType(String))
            table.Columns.Add("Contact No", GetType(String))
            table.Columns.Add("Gender", GetType(Short))
            Dim context As New TrainingContext()
            Dim students = context.Students.ToList()
            For Each element As Student In students
                table.Rows.Add(element.StudentID,
                               element.StudentName,
                               element.IDNo,
                               element.IDType,
                               Format(element.DOB, "dd-MMM-yy"),
                               element.ContactNo,
                               element.Gender)
            Next element

            Session("Table") = table
        End If
        Return table
    End Function

    Protected Sub DeleteLink_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim link As ASPxHyperLink = TryCast(sender, ASPxHyperLink)
        Dim container As GridViewDataItemTemplateContainer = TryCast(link.NamingContainer, GridViewDataItemTemplateContainer)
        link.Text = "Delete"
        link.NavigateUrl = "Students.aspx?delete=" & container.KeyValue.ToString()
    End Sub

    Protected Sub EditLink_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim link As ASPxHyperLink = TryCast(sender, ASPxHyperLink)
        Dim container As GridViewDataItemTemplateContainer = TryCast(link.NamingContainer, GridViewDataItemTemplateContainer)
        link.Text = "Edit"
        link.NavigateUrl = "EditStudent.aspx?id=" & container.KeyValue.ToString()
    End Sub

    Protected Sub AddButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("EditStudent.aspx")
    End Sub

End Class