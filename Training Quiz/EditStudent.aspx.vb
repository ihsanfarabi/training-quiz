Public Class EditStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Request.QueryString("id") IsNot Nothing AndAlso (Not IsPostBack) AndAlso (Not IsCallback) Then
            Dim context As New TrainingContext()
            Dim student As Student = context.Students.Find(Guid.Parse(Request.QueryString("id")))
            StudentName.Value = student.StudentName.Trim()
            IDType.SelectedIndex = student.IDType
            IDNo.Value = student.IDNo.Trim()
            Gender.SelectedIndex = student.Gender
            DOB.Value = student.DOB
            ContactNo.Value = student.ContactNo.Trim()
        End If
    End Sub

    Protected Sub btn_Click(ByVal sender As Object, ByVal e As EventArgs)
        StudentName.Validate()
        IDType.Validate()
        IDNo.Validate()
        Gender.Validate()
        DOB.Validate()
        ContactNo.Validate()

        If StudentName.IsValid() And
            IDType.IsValid() And
            IDNo.IsValid() And
            Gender.IsValid() And
            DOB.IsValid() And
            ContactNo.IsValid() Then

            Dim context As New TrainingContext()

            If Request.QueryString("id") IsNot Nothing Then
                Dim currentStudent = context.Students.Find(Guid.Parse(Request.QueryString("id")))
                currentStudent.StudentName = StudentName.Value
                currentStudent.IDType = IDType.Value
                currentStudent.IDNo = IDNo.Value
                currentStudent.Gender = Gender.Value
                currentStudent.DOB = DOB.Value
                currentStudent.ContactNo = ContactNo.Value
                context.SaveChanges()
                Session.Clear()
                Response.Redirect("Students.aspx")
            Else
                Dim newStudent As Student = New Student With {
                    .StudentID = Guid.NewGuid(),
                    .StudentName = StudentName.Value,
                    .IDType = IDType.Value,
                    .IDNo = IDNo.Value,
                    .Gender = Gender.Value,
                    .DOB = DOB.Value,
                    .ContactNo = ContactNo.Value
                }

                Dim existingStudent = context.Students.Where(Function(x) x.StudentName = newStudent.StudentName).ToList()

                If existingStudent.Count = 0 Then
                    context.Students.Add(newStudent)
                    context.SaveChanges()
                    Session.Clear()
                    Response.Redirect("Students.aspx")
                Else
                    StudentName.IsValid = False
                    StudentName.ErrorText = "Student name already exist"
                End If
            End If
        End If
    End Sub

End Class