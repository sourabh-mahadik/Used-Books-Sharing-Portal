<%@ Page Language="C#" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 182px;
        }
        .auto-style3 {
            width: 182px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 182px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 182px;
            height: 27px;
        }
        .auto-style8 {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
          <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=AuthorList]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Enter Book Details : </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">UserId-:</td>
                <td>
                    <asp:Label ID="lbl_userid" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Book Name/Title"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_title" ErrorMessage=" Title Field Cannot Be Empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Category"></asp:Label>
                    </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>Fiction</asp:ListItem>
            <asp:ListItem>Educational</asp:ListItem>
            <asp:ListItem>Children</asp:ListItem>
            <asp:ListItem>Philosophy</asp:ListItem>
            <asp:ListItem>Business & Management</asp:ListItem>
            <asp:ListItem>Biography</asp:ListItem>
            <asp:ListItem>Money & Investment</asp:ListItem>
            <asp:ListItem>Competitive Examinations</asp:ListItem>
            <asp:ListItem>Computers, Mobile, Digital</asp:ListItem>
            <asp:ListItem>Religion & Spirituality</asp:ListItem>
            <asp:ListItem>Self Help</asp:ListItem>
            <asp:ListItem>Miscellaneous</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please select atleast one category" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Author"></asp:Label>
                    -:</td>
                <td>
                    <asp:ListBox ID="AuthorList" runat="server" SelectionMode="Multiple"></asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AuthorList" ErrorMessage="Please select atleast one Author name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="txt_auth" runat="server" Width="178px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%--<asp:Button ID="btn_Add_Auth" runat="server" OnClick="btn_Add_Auth_Click" Text="Add Author" />--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    No of Pages</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txt_no_of_pages" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    Publication-:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txt_publication" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_publication" ErrorMessage="Please specify Publication " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Enter Original Price"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_oprice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Enter Selling Price"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txt_sprice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_sprice" ErrorMessage="Specify Selling Price" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    Exchange</td>
                <td>
                    <asp:RadioButtonList ID="rb_exchange" runat="server">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    Status_book</td>
                <td class="auto-style6">
                    <asp:RadioButtonList ID="rbstatus" runat="server">
                        <asp:ListItem Value="1">Available</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rbstatus" ErrorMessage="Book Status Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                </td>
                <td class="auto-style4">
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Image"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="fileupload1" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="fileupload1" ErrorMessage="Please upload a book image" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnUploadFile" runat="server" OnClick="btnUploadFile_Click" Text="Upload" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
