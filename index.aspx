+<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hola.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
             <title>Google maps picker </title>
    <!--bnoostrap y jquery-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!--complemento del planing-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDlv2PNwLztXH4VUYD9J9jW5vuv-T6YzRs'></script>
<script src="js/locationpicker.jquery.js"></script>
</head>
<body>

    <form id="form1" runat="server">
      <!--crear el botton-->
        <div class="container">
            <button type="button" data-toggle="modal" data-target="#ModalMap" class=" btn btn-default">
                <span class="glyphicon glyphicon-map-marker"></span><span id="ubicacion">seleccionar ubicacion</span>
                <!--proveniente del js-->
            </button>
            <style>
                .pac-container{
                    z-index:999999;
                }
            </style>
            <!--creacion del modal-->
            <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-body">
                               <div class="form-horizontal">
                                   <div class="form-group">
                                       <label class="col-sm-2 control-label">ubicacion:</label>
                                       <div class="col-sm-9">
                                           <asp:TextBox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                       </div>
                                       <!-- AHORA AGREGAMOS UN BOTON PARA CORRER EL MODAL-->
                                        <div class="cool-sm-1">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="cerrar">
                                               <span aria-hidden="true">&times;</span>
                                             </button>
                                        </div>
                                   </div>
                                   <div id="ModalMapPreview" style="width:100%; height:400px;"></div>
                                   <div class="clearfix">&nbsp;</div>
                                   <div class="m-t-small">
                                            <label class="p-r-small col-sm-1 control-label">latitud:</label>
                                   <div class="col-sm-3">
                                            <asp:TextBox ID="ModalMapLat" CssClass="form-control" runat="server"></asp:TextBox>
                                   </div>
                                            <label class="p-r-small col-sm-1 control-label">longitud:</label>
                                            <div class="col-sm-3">
                                            <asp:TextBox ID="ModalMapLong" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                       <div class="col-sm-3">
                                           <button type="button" class="btn btn-primary btn-blck" data-dismiss="modal">Aceptar</button>
                                       </div>
                                       <div class="clearfix"></div>
                                       </div>
                                     <script>
                                         $('#ModalMapPreview').locationpicker({
                                             radius: 0,
                                             location: {
                                                 latitude: 27.371872886250113,
                                                 longitude: -109.93098791787901
                                             },
                                             enableAutocomplete: true,
                                             inputBinding: {
                                                 latitudeInput: $('#<%=ModalMapLat.ClientID%>'),
                                                longitudeInput: $('#<%=ModalMapLong.ClientID%>'),
                                                locationNameInput: $('#<%=ModalMapaddress.ClientID%>')
                                            },
                                            onchanged: function (currentlocate, radius, isMarkerDropped) {
                                                $('#ubicacion').html($('#<%=ModalMapaddress.ClientID%>').val());
                                            }

                                        });
                                         $('ModalMap').on('show.bs.modal', function () {
                                             $('#ModalMapPreview').locationpicker('autosize');
                                         });
                                         
                                     </script>
                               </div>
                           </div>
                       </div>
                </div>
            </div>
               
        </div>
    </form>
</body>
</html>
