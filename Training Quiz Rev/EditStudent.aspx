<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditStudent.aspx.vb" Inherits="Training_Quiz_Rev.EditStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                <Items>
                    <dx:LayoutItem ColSpan="1" Caption="Student Name">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" ID="StudentName" MaxLength="255">
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Compulsory field" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ID Type" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxComboBox runat="server" ID="IDType">
                                    <Items>
                                        <dx:ListEditItem Text="NRIC" Value="0"></dx:ListEditItem>
                                        <dx:ListEditItem Text="FIN" Value="1"></dx:ListEditItem>
                                        <dx:ListEditItem Text="PASSPORT" Value="2"></dx:ListEditItem>
                                    </Items>
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Compulsory field" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="ID#" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" ID="IDNo" MaxLength="20">
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Compulsory field" IsRequired="True" />
                                        <RegularExpression ValidationExpression="^[a-zA-Z0-9_]*$" ErrorText="Only alphanumeric allowed" />  
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Gender" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxRadioButtonList runat="server" ID="Gender" RepeatColumns="3">
                                    <Items>
                                        <dx:ListEditItem Text="Male" Value="0"></dx:ListEditItem>
                                        <dx:ListEditItem Text="Female" Value="1"></dx:ListEditItem>
                                        <dx:ListEditItem Text="Unknown" Value="2"></dx:ListEditItem>
                                    </Items>
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Compulsory field" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxRadioButtonList>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Date of Birth" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxDateEdit ID="DOB" runat="server" DisplayFormatString="dd-MMM-yy" EditFormatString ="dd-MMM-yy">
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RequiredField ErrorText="Compulsory field" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Contact No" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" ID="ContactNo">
                                    <ValidationSettings ValidateOnLeave="False">
                                        <RegularExpression ValidationExpression="^[0-9]*$" ErrorText="Only numeric allowed" />  
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Save" OnClick="Btn_Click" CausesValidation="False" AutoPostBack="false"></dx:ASPxButton>
        </div>
    </form>
</body>
</html>

