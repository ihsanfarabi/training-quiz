Imports System.Web.SessionState
Imports DevExpress.Security.Resources
Imports DevExpress.Web

Public Class Global_asax
    Inherits System.Web.HttpApplication
        Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        AddHandler DevExpress.Web.ASPxWebControl.CallbackError, AddressOf Application_Error
        AccessSettings.DataResources.SetRules(DirectoryAccessRule.Allow(Server.MapPath("~/Content")), UrlAccessRule.Allow())
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application ends
    End Sub
End Class