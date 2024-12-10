<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminCuentas.aspx.cs" Inherits="Meraki.AdminCuentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Colapsable</title>
    <link rel="stylesheet" href="styles.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .btn-primary {
            background-color: #079ea4; /* Color del botón */
            color: white; /* Color del texto */
            border: none; /* Sin bordes */
            border-radius: 10px; /* Bordes redondeados */
            padding: 7px 20px; /* Espaciado interno */
            font-size: 14px; /* Tamaño del texto */
            cursor: pointer; /* Cambia el cursor a "puntero" */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* Sombra para darle un efecto flotante */
            transition: background-color 0.3s ease; /* Animación de color al pasar el mouse */
            text-align: center; /* Asegura que el texto esté centrado */
            display: inline-block; /* Mantiene el botón en línea */
        }

            .btn-primary:hover {
                background-color: #066f7c; /* Color al pasar el mouse */
            }

            .btn-primary:active {
                background-color: #055862; /* Color al hacer clic */
                transform: scale(0.98); /* Efecto de clic */
            }

        /* Botón de cerrar */
        .close-btn {
            color: #333; /* Color del botón */
            font-size: 20px; /* Tamaño del botón */
            font-weight: bold; /* Negrita */
            float: right; /* Alineado a la derecha */
            cursor: pointer; /* Manito al pasar por encima */
        }

            .close-btn:hover {
                color: #f00; /* Color rojo al pasar el mouse */
            }


        .Contenido {
            position: relative;
            z-index: 1; /* Asegura que el contenido esté por encima del video */
            background: white; /* Fondo blanco sólido */
            padding: 0px; /* Espaciado interno */
            border-radius: 10px; /* Bordes redondeados */
            max-width: 1350px; /* Ancho máximo del contenedor */
            margin: 20px auto; /* Centra el contenedor horizontal y verticalmente */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
        }

        h3 {
            color: #079ea4;
            font-family: 'Arial', sans-serif;
            font-size: 2rem;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
        }

        .labelCrear {
            color: #079ea4;
            font-family: 'Arial', sans-serif;
            font-size: 1.2rem;
            text-align: left;
            margin-top: 20px;
            margin-left: 180px;
            width: 400px;
            font-weight: bold;
        }

        .botones {
            background-color: #079ea4;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 7px 20px;
            margin-left: 20px;
            font-size: 1rem;
            font-family: 'Arial', sans-serif;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .DivBoton {
            text-align: center;
            margin-top: 50px;
        }

        .textboxCrear {
            display: inline-table;
            width: 400px; /* Ancho */
            height: 35px; /* Alto */
            font-size: 16px; /* Tamaño de la fuente */
            padding: 5px; /* Espaciado interno */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Bordes redondeados */
            text-align: center;
            flex-grow: 1;
            margin-left: 85px
        }

        .camposCrear {
            /*display: flex;*/
            align-items: center;
            margin-bottom: 10px;
            justify-content: flex-start; /* Alineación horizontal */
            align-items: center; /* Alineación vertical */
            padding: 20px;
        }


        .Menu {
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
            margin-right: 20px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            background-color: #079ea4;
            color: white;
            height: 100%; /*El menú ocupa el 100% del alto de su contenedor */
            overflow-y: auto; /*Scroll si el contenido del menú es más alto que el contenedor*/
        }

            .Menu a {
                color: white; /* Hace que el texto de los enlaces sea blanco */
                text-decoration: none; /* Quita el subrayado */
            }

                .Menu a:hover {
                    color: #ddd; /* Cambia el color cuando el mouse pasa sobre el enlace */
                }


        .mensajeError {
            min-height: 20px; /* Reserva espacio */
            width: 300px; /* Asegura un ancho uniforme */
            display: inline-block; /* Mantiene el espacio aunque esté vacío */
            margin-top: 5px;
            text-align: left;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            align-items: center;
            padding: 5px;
            margin-left: 85px;
        }

        .checkboxMostrarTodo {
            color: #079ea4;
            font-family: 'Arial', sans-serif;
            font-size: 1.2rem;
            text-align: left;
            margin-top: 20px;
            margin-left: 160px;
            width: 400px;
            font-weight: bold;
            padding-left: 20px;
        }

            .checkboxMostrarTodo input[type="checkbox"] {
                width: 20px; /* Ancho del CheckBox */
                height: 20px; /* Alto del CheckBox */
                accent-color: #079ea4; /* Color personalizado del CheckBox */
                padding-left: 20px;
            }

        .gridViewStyle {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

            .gridViewStyle th, .gridViewStyle td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .gridViewStyle th {
                background-color: #f4f4f4;
                font-weight: bold;
            }

            .gridViewStyle td {
                word-wrap: break-word; /* Ajusta el contenido largo */
            }

        .modal {
    display: none; /* Por defecto, el modal está oculto */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5); /* Fondo oscuro */
}

.modal-content {
    background-color: #fff;
    margin: 10% auto; /* Centrar verticalmente */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* Ajustar el tamaño */
    border-radius: 5px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.close-btn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
    </style>

    <div class="Contenido">
        <h3>Administrar Cuentas</h3>
        <br />
        <table style="width: 100%; border-collapse: collapse; table-layout: fixed; padding-top: 50px;">
            <tr>
                <!-- Columna 1: Menú -->
                <td style="background-color: #079ea4; padding: 10px; width: 260px; vertical-align: top; padding-top: 50px;">
                    <asp:Menu ID="Menu3" runat="server" CssClass="Menu" Orientation="Vertical">
                        <Items>
                            <asp:MenuItem Text="○ Lista usuarios registrados" Value="PanelUsuarios" />
                            <asp:MenuItem Text="○ Gestión de roles y permisos" Value="~/Permisos" />
                            <asp:MenuItem Text="○ Gestión de cuentas" Value="~/GestionCuentas" />
                        </Items>
                    </asp:Menu>
                </td>

                <!-- Columna 2: GridView -->
                <asp:Panel ID="PanelUsuarios" runat="server">
                    <td style="padding: 20px; vertical-align: top;">
                        <div class="camposCrear">
                            <asp:TextBox ID="txtBuscarUsuario" runat="server" CssClass="textboxCrear"></asp:TextBox>
                            <asp:Button ID="btnBuscarUsuario" runat="server" Text="Buscar usuario" OnClick="ButtonBuscar_Click" CssClass="botones" />
                            <asp:Label ID="LabelMensajeError" runat="server" CssClass="mensajeError"></asp:Label>
                            <br />
                            <asp:CheckBox ID="CheckBoxMostrarTodo" runat="server" Text="Mostrar todas las cuentas registradas"
                                AutoPostBack="True" OnCheckedChanged="CheckBoxMostrarTodos_CheckedChanged" CssClass="checkboxMostrarTodo" />


                        </div>
                         <asp:GridView ID="GridViewDatosUsuario" runat="server" AutoGenerateColumns="False" CssClass="gridViewStyle" OnRowCommand="GridViewDatosUsuario_RowCommand" Visible="False"
                            Style="width: 100%; border: 1px solid #ddd;">
                            <Columns>
                                <asp:BoundField DataField="Nombre_Usuario" HeaderText="Nombre Usuario" />
                                <asp:BoundField DataField="RUT" HeaderText="RUT" />
                                <asp:BoundField DataField="ID_Usuario" HeaderText="ID Usuario" />
                                <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo Electrónico" />
                                <asp:BoundField DataField="Rol" HeaderText="Rol" />
                                <asp:BoundField DataField="EstadoCuenta" HeaderText="Estado Cuenta" />
                                <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button
                                        ID="btnEditar"
                                        runat="server"
                                        CssClass="btn btn-primary"
                                        CommandName="EditarUsuario"
                                        CommandArgument='<%# Eval("ID_Usuario") %>'
                                        Text="Editar"
                                        data-rut='<%# Eval("ID_Usuario") %>'
                                        OnClientClick="setHiddenFieldAndOpenModal(this); return false;" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <asp:HiddenField ID="HiddenFieldID_UsuarioT" runat="server" />

                    </td>
                </asp:Panel>
            </tr>
        </table>


        <div id="modalEditarUsuario" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close-btn" id="closeModal">&times;</span>
                <h3>Editar Datos de Usuario</h3>
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
                <br>
                <label for="txtCorreo">Correo Electrónico:</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Placeholder="Correo Electrónico"></asp:TextBox>
                <br>
                <label for="ddlRol">Rol:</label>
                <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control">
<%--                    <asp:ListItem Value="Jefatura" Text="Jefatura"></asp:ListItem>
                    <asp:ListItem Value="Admicionista" Text="Admicionista"></asp:ListItem>--%>
                </asp:DropDownList>
                <br>
                <label for="ddlEstadoCuenta">Estado de Cuenta:</label>
                <asp:DropDownList ID="ddlEstadoCuenta" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Activa" Text="Activa"></asp:ListItem>
                    <asp:ListItem Value="Inactiva" Text="Inactiva"></asp:ListItem>
                </asp:DropDownList>
                <br>
                <asp:Button ID="btnGuardarCambios" runat="server" Text="Guardar Cambios" CssClass="btn" OnClick="GuardarCambios_Click" />
            </div>
        </div>
    </div>
     <script>
        // Función para abrir el modal
        function abrirModal() {
            document.getElementById("modalEditarUsuario").style.display = "block";
        }

        // Función para cerrar el modal
        function cerrarModal() {
            document.getElementById("modalEditarUsuario").style.display = "none";
        }

        // Asignar evento al botón de cerrar
        document.addEventListener("DOMContentLoaded", function () {
            var closeModal = document.getElementById("closeModal");
            if (closeModal) {
                closeModal.onclick = cerrarModal;
            }
        });

<%--         function setHiddenFieldAndOpenModal(button) {
             // Obtén el valor del atributo data-rut
             var rut = button.getAttribute("data-rut");
             // Asigna el valor al HiddenField
             document.getElementById('<%= HiddenFieldRUT.ClientID %>').value = rut;
        // Abre el modal
        abrirModal();
    }--%>
    </script>
</asp:Content>
