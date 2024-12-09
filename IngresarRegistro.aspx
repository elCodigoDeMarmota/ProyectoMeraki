<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="IngresarRegistro.aspx.cs" Inherits="Meraki.IngresarRegistro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <style>

        .Contenido 
        {
            position: relative;
            z-index: 1; /* Asegura que el contenido esté por encima del video */
            background: white; /* Fondo blanco sólido */
            padding: 50px; /* Espaciado interno */
            border-radius: 10px; /* Bordes redondeados */
            max-width: 850px; /* Ancho máximo del contenedor */
            margin: 20px auto; /* Centra el contenedor horizontal y verticalmente */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
        }
       

        h1 
        {
            color: #079ea4; 
            font-family: 'Arial', sans-serif; 
            font-size: 2rem; 
            text-align: center; 
            margin-top: 20px; 
            margin-left: 80px;
        }

        h4 {
            color: #079ea4;
            font-family: 'Arial', sans-serif;
            font-size: 2rem;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
        }

         .btnCrear
 {
     background-color: #079ea4; 
     color: white; 
     border: none; 
     border-radius: 10px; 
     padding: 10px 20px; 
     font-size: 1.5rem; 
     font-family: 'Arial', sans-serif; 
     cursor: pointer; 
     box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); 
     transition: background-color 0.3s ease; 
     text-align: center; 
 }

 .DivBoton 
 {
     text-align:center;
     margin-top: 50px; 
 }

    </style>

        <div class="video_contenedor">
<video class="video_fondo" autoplay muted loop>
<source src="Fondo_Animado.mp4" type="video/mp4" />

</video>


</div>




    <div class="Contenido">
        <h4>Ingresar Registro Paciente</h4>

<div class="camposCrear">
    <asp:Label ID="lblRUN" runat="server" Text="RUN:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtRUN" runat="server" CssClass="textboxRUN"></asp:TextBox>
    <asp:Label ID="lblGuion" runat="server" Text="-"></asp:Label>
    <asp:TextBox ID="txtDV" runat="server" CssClass="textboxDV" MaxLength="1" OnTextChanged="txtDV_TextChanged" Width="22px"></asp:TextBox>

    <!-- CustomValidator para validar ambos campos -->
    <asp:CustomValidator
        ID="CustomVal_RUN_DV" 
        runat="server" 
        CssClass="mensajeError"
        ErrorMessage=""
        OnServerValidate="ValidarRunYDV" 
        Display="Dynamic" ValidationGroup="a">
    </asp:CustomValidator>
    <div class="EspacioReservado"> </div> <!-- Espacio reservado -->
</div>

    <div class="camposRegistrar">
    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtNombre_" runat="server" CssClass="textboxCrear" ></asp:TextBox>
    <asp:RequiredFieldValidator
     ID="Req_Nombre" 
     runat="server" CssClass="mensajeError"
    ErrorMessage="Este campo es obligatorio" ControlToValidate="txtNombre_" ValidationGroup="a">
    </asp:RequiredFieldValidator>
</div>

        <div class="camposRegistrar">
        <asp:Label ID="lblApellido" runat="server" Text="Apellidos:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Apellidos" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtApellidos" ValidationGroup="a">
        </asp:RequiredFieldValidator>
    </div>

        <div class="camposRegistrar">
        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Fecha_Nacimiento" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtFechaNacimiento" Type="Date" ValidationGroup="a" >
        </asp:RequiredFieldValidator>
    </div>

  <%--  <div class="camposRegistrar">
    <asp:Label ID="lblRUN" runat="server" Text="RUN:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtRUN" runat="server" CssClass="textboxRUN"></asp:TextBox>
    <asp:Label ID="lblGuion" runat="server" Text="-"></asp:Label>
    <asp:TextBox ID="txtDV" runat="server" CssClass="textboxDV" MaxLength="1"></asp:TextBox>

    <!-- CustomValidator para validar ambos campos -->
    <asp:CustomValidator 
        ID="CustomVal_RUN_DV" 
        runat="server" 
        CssClass="mensajeError"
        ErrorMessage=""
        OnServerValidate="ValidarRunYDV" 
        Display="Dynamic">
    </asp:CustomValidator>
    <div class="EspacioReservado"> </div> <!-- Espacio reservado -->
</div>--%>

     <div class="camposRegistrar">
     <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="labelCrear"></asp:Label>
     <asp:TextBox ID="txtCorreo" runat="server" CssClass="textboxCrear"></asp:TextBox>
     <asp:RequiredFieldValidator
      ID="Req_Correo" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
     </asp:RequiredFieldValidator>
 </div>

         <div class="camposRegistrar">
     <asp:Label ID="Label1" runat="server" Text="Fono:" CssClass="labelCrear"></asp:Label>
     <asp:TextBox ID="TextBox1" runat="server" CssClass="textboxCrear"></asp:TextBox>
     <asp:RequiredFieldValidator
      ID="RequiredFieldValidator1" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
     </asp:RequiredFieldValidator>
 </div>

    <div class="camposCrear">
        <asp:Label ID="Label2" runat="server" Text="celular:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtCelular" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="RequiredFieldValidator2" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
        </asp:RequiredFieldValidator>
    </div>

                 <div class="camposRegistrar">
     <asp:Label ID="Label3" runat="server" Text="Dirección:" CssClass="labelCrear"></asp:Label>
     <asp:TextBox ID="txtDireccion" runat="server" CssClass="textboxCrear" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
     <asp:RequiredFieldValidator
      ID="RequiredFieldValidator3" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
     </asp:RequiredFieldValidator>
 </div>

                 <div class="camposRegistrar">
     <asp:Label ID="Label4" runat="server" Text="Tipo de Consulta:" CssClass="labelCrear"></asp:Label>
                     <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                     
     <asp:RequiredFieldValidator
      ID="RequiredFieldValidator4" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
     </asp:RequiredFieldValidator>
 </div> 

                     <div class="camposRegistrar">
     <asp:Label ID="Label5" runat="server" Text="Especialidad:" CssClass="labelCrear"></asp:Label>
                     <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                     
     <asp:RequiredFieldValidator
      ID="RequiredFieldValidator5" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="DropDownList2" ValidationGroup="a" InitialValue="-1">
     </asp:RequiredFieldValidator>
 </div> 

                     <div class="camposRegistrar">
     <asp:Label ID="Label6" runat="server" Text="Prioridad:" CssClass="labelCrear"></asp:Label>
                     <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                     
     <asp:RequiredFieldValidator
      ID="RequiredFieldValidator6" 
      runat="server" CssClass="mensajeError"
     ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo" ValidationGroup="a">
     </asp:RequiredFieldValidator>
 </div> 
<div class="DivBoton">
    <asp:Button ID="Button1" runat="server" Text="CREAR" Cssclass="btnCrear" CausesValidation="true" OnClick="Button1_Click" ValidationGroup="a" />
    </div>
</div>




</asp:Content>
