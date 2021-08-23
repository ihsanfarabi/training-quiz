Imports System
Imports System.Data.Entity
Imports System.ComponentModel.DataAnnotations.Schema
Imports System.Linq

Partial Public Class TrainingContext
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=TrainingContext")
    End Sub

    Public Overridable Property Students As DbSet(Of Student)

    Protected Overrides Sub OnModelCreating(ByVal modelBuilder As DbModelBuilder)
        modelBuilder.Entity(Of Student)() _
            .Property(Function(e) e.IDNo) _
            .IsFixedLength()

        modelBuilder.Entity(Of Student)() _
            .Property(Function(e) e.ContactNo) _
            .IsUnicode(False)
    End Sub
End Class
