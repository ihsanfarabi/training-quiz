Imports System
Imports System.Collections.Generic
Imports System.ComponentModel.DataAnnotations
Imports System.ComponentModel.DataAnnotations.Schema
Imports System.Data.Entity.Spatial

<Table("Student")>
Partial Public Class Student
    Public Property StudentID As Guid

    <Required>
    <StringLength(255)>
    Public Property StudentName As String

    <Required>
    <StringLength(20)>
    Public Property IDNo As String

    Public Property IDType As Short

    Public Property DOB As Date

    <StringLength(50)>
    Public Property ContactNo As String

    Public Property Gender As Short
End Class
