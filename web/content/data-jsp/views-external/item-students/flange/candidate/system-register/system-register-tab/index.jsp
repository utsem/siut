<script type="text/javascript">
    $(document).ready(function () {
        var initDataTable = function () {
            var url = "../serviceCandidate?selectCandidatesMissingInscription";
            // prepare the data
            var cellsrenderer = function (row, column, value) {
                return "<div style='margin:4px;'>" + (value + 1) + "</div>";
            };
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'fl_progressiv_number', type: 'int' },
                    { name: 'fl_folioSystem_temp_system', type: 'string' },
                    { name: 'fl_register_date', type: 'string' },
                    { name: 'fl_name', type: 'string' },
                    { name: 'fl_career', type: 'string' },
                    { name: 'fl_user_name', type: 'string' },
                    { name: 'fl_password', type: 'string' }
                ],
                id: 'id',
                url: url
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#jqxDataTablePreregisters").jqxDataTable({
                width: 850,
                height: 521, 
                pageable: false,
                sortable: true,
                localization: getLocalization("es"),
                source: dataAdapter,
                filterable: true,
                selectionMode: 'singlecell',
                columns: [
                    { text: 'N.P', datafield: 'fl_progressiv_number', cellsrenderer:cellsrenderer,  width: 40, cellsalign: 'center', resizable: false, filterable: false },
                    { text: 'Folio Sistema', datafield: 'fl_folioSystem_temp_system', width: 110, resizable: false },
                    { text: 'Nombre', datafield: 'fl_name', width: 200, filterable: true },
                    { text: 'Usuario', datafield: 'fl_user_name', width: 150, filterable: true },
                    { text: 'Contrase�a', datafield: 'fl_password', width: 150, filterable: false },
                    { text: 'Carrera', datafield: 'fl_career', width: 120, cellsalign: 'center' },
                    { text: 'Fecha registro', datafield: 'fl_register_date', width: 250, resizable: false, filterable: false }
                    
                ]
            });
        };
        // create context menu
        var contextMenu = $("#jqxMenuContext").jqxMenu({ 
            width: 150, 
            height: 65, 
            autoOpenPopup: false, 
            mode: 'popup'
        });
        contextMenu.jqxMenu('disable', 'options', true); 
        // initialize the popup window and buttons.
        var popupWindow = $("#popupWindowCedule").jqxWindow({ 
            width: 800,
            minWidth: '1200px',
            height: 800,
            minHeight: '850px', 
            resizable: false, 
            isModal: true, 
            autoOpen: false, 
            modalOpacity: 0.7 
        });
        $("#jqxDataTablePreregisters").on('contextmenu', function () {
            return false;
        });
        var fl_folioSystem_temp_system=undefined;
        $('#jqxDataTablePreregisters').on('rowSelect', function (event){
            contextMenu.jqxMenu('close');
        });
        $('#jqxDataTablePreregisters').on('rowDoubleClick', function (event){
            var row = event.args.row;
            fl_folioSystem_temp_system=row.fl_folioSystem_temp_system;
            $.ajax({
                type: "POST",
                async: true,
                url: "../servicePdf?cedule=session",
                data: {"folioSystem": fl_folioSystem_temp_system},
                beforeSend: function (xhr) {
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");
                },
                success: function (data, textStatus, jqXHR) {
                    var iframe = $('<iframe style="width: 1185px; height: 810px;">');
                    iframe.attr('src','../servicePdf?cedule=print');
                    $('#contentPDF').html(iframe);
                }
            });
            popupWindow.jqxWindow('show');
        });
        $("#jqxDataTablePreregisters").on('rowClick', function (event) {
            if (event.args.originalEvent.button==2) {
                $("#jqxDataTablePreregisters").jqxDataTable('selectRow', event.args.rowindex);
                var row = event.args.row;
                fl_folioSystem_temp_system=row.fl_folioSystem_temp_system;
                var scrollTop = $(window).scrollTop();
                var scrollLeft = $(window).scrollLeft();
                contextMenu.jqxMenu('open', parseInt(event.args.originalEvent.clientX) + 5 + scrollLeft, parseInt(event.args.originalEvent.clientY) + 5 + scrollTop);
                return false;
            }
        });
        // handle context menu clicks.
        contextMenu.on('itemclick', function (event) {
            var args = event.args;
            if ($.trim($(args).text()) === "Generar C�dula") {
                $.ajax({
                    type: "POST",
                    async: false,
                    url: "../servicePdf?cedule=session",
                    data: {"folioSystem": fl_folioSystem_temp_system},
                    beforeSend: function (xhr) {
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("Error interno del servidor");
                    },
                    success: function (data, textStatus, jqXHR) {
                        var iframe = $('<iframe style="width: 1185px; height: 810px;">');
                        iframe.attr('src','../servicePdf?cedule=print');
                        $('#contentPDF').html(iframe);
                    }
                });
                popupWindow.jqxWindow('show');
            }
        });

        initDataTable();
    });
</script>
<div id="jqxDataTablePreregisters"></div>
<div id='jqxMenuContext'>
    <ul>
        <li id="options"><span>Opciones</span></li>
        <li type='separator'></li>
        <li>Generar C�dula</li>
    </ul>
</div>
<div id="popupWindowCedule">
    <div>C�dula</div>
    <div style="overflow: hidden;" id="contentPDF">
    </div>
</div>