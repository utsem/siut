<script type="text/javascript">
    $(document).ready(function () {
        var pt_pk_study_plann = <%out.print(request.getParameter("pt_pk_study_plann"));%>;
        var pt_pk_type = <%out.print(request.getParameter("pt_pk_type"));%>;
        function loadSource(pt_pk_study_plann, pt_pk_type){
            var ordersSource ={
                dataFields: [
                    { name: 'dataPkCompetenceProfessional', type:'int'},
                    { name: 'dataProgresivNumber', type:'int'},
                    { name: 'dataNameCompetences', type: 'string' },
                    { name: 'dataPkStudyPlann', type:'int'}
                ],
                dataType: "json",
                async: false,
                id: 'dataPkCompetenceProfessional',
                url: '../serviceCompetenceProfessional?view&&pt_pk_study_plann='+pt_pk_study_plann+'&&pt_fk_type='+pt_pk_type,
                addRow: function (rowID, rowData, position, commit) {
                    // synchronize with the server - send insert command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    // you can pass additional argument to the commit callback which represents the new ID if it is generated from a DB.
                    $.ajax({
                        //Send the paramethers to servelt
                        type: "POST",
                        async: false,
                        url: "../serviceCompetenceProfessional?insert",
                        data:{
                            'pt_fk_type' : pt_pk_type,
                            'pt_pk_study_plann' : pt_pk_study_plann,
                            'pt_concept' : ""
                        },
                        beforeSend: function (xhr) {
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //This is if exits an error with the server internal can do server off, or page not found
                            alert("Error interno del servidor");
                        },
                        success: function (data, textStatus, jqXHR) {
                            commit(true);
                            $("#tableCompetences").jqxDataTable('updateBoundData');
                            $("#tableCompetences").jqxDataTable('goToPage', 0);
                            $("#tableCompetences").jqxDataTable('beginRowEdit', 0);
                        }
                    });
                },
                updateRow: function (rowID, rowData, commit) {
                    // synchronize with the server - send update command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    var dataNameCompetences = rowData.dataNameCompetences;
                    $.ajax({
                        //Send the paramethers to servelt
                        type: "POST",
                        async: false,
                        url: "../serviceCompetenceProfessional?update",
                        data:{
                            'pt_pk_competence_professional':rowID,
                            'pt_concept':dataNameCompetences
                        },
                        beforeSend: function (xhr) {
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //This is if exits an error with the server internal can do server off, or page not found
                            alert("Error interno del servidor");
                        },
                        success: function (data, textStatus, jqXHR) { 
                            //If is updated rechange the drowdown in the other flange...
                            commit(true);
                        }
                    });
                },
                deleteRow: function (rowID, commit) {
                    // synchronize with the server - send delete command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    $.ajax({
                        //Send the paramethers to servelt
                        type: "POST",
                        async: false,
                        url: "../serviceCompetenceProfessional?delete",
                        data:{
                            'pt_pk_competence_professional':rowID
                        },
                        beforeSend: function (xhr) {
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //This is if exits an error with the server internal can do server off, or page not found
                            alert("Error interno del servidor");
                        },
                        success: function (data, textStatus, jqXHR) {
                            commit(true);
                            $("#tableCompetences").jqxDataTable('updateBoundData');
                        }
                    });
                }
            };
            return ordersSource;
        };
        var dataAdapter;
        loadTable(pt_pk_study_plann, pt_pk_type);
        function loadTable(pt_pk_study_plann, pt_pk_type){
            dataAdapter = new $.jqx.dataAdapter(loadSource(pt_pk_study_plann, pt_pk_type));
            $("#tableCompetences").jqxDataTable({
                width: 450,
                height : 240,
                selectionMode: "singleRow",
                localization: getLocalization("es"),
                source: dataAdapter,
                pageable: true,
                editable: true,
                filterable: false,
                showToolbar: true,
                altRows: true,
                pagerButtonsCount: 10,
                toolbarHeight: 35,
                renderToolbar: function(toolBar){
                    var theme = "";
                    var toTheme = function (className) {
                        if (theme === "") return className;
                        return className + " " + className + "-" + theme;
                    };
                    // appends buttons to the nameCareerAbreiated bar.
                    var container = $("<div style='overflow: hidden; position: relative; height: 100%; width: 100%;'></div>");
                    var buttonTemplate = "<div style='float: left; padding: 3px; margin: 2px;'><div style='margin: 4px; width: 16px; height: 16px;'></div></div>";
                    var addButton = $(buttonTemplate);
                    var editButton = $(buttonTemplate);
                    var deleteButton = $(buttonTemplate);
                    var cancelButton = $(buttonTemplate);
                    var updateButton = $(buttonTemplate);
                    container.append(addButton);
                    container.append(editButton);
                    container.append(deleteButton);
                    container.append(cancelButton);
                    container.append(updateButton);
                    toolBar.append(container);
                    addButton.jqxButton({cursor: "pointer", enableDefault: false,  height: 25, width: 25 });
                    addButton.find('div:first').addClass(toTheme('jqx-icon-plus'));
                    addButton.jqxTooltip({ position: 'bottom', content: "Agregar"});
                    editButton.jqxButton({ cursor: "pointer", disabled: true, enableDefault: false,  height: 25, width: 25 });
                    editButton.find('div:first').addClass(toTheme('jqx-icon-edit'));
                    editButton.jqxTooltip({ position: 'bottom', content: "Editar"});
                    deleteButton.jqxButton({ cursor: "pointer", disabled: true, enableDefault: false,  height: 25, width: 25 });
                    deleteButton.find('div:first').addClass(toTheme('jqx-icon-delete'));
                    deleteButton.jqxTooltip({ position: 'bottom', content: "Eliminar"});
                    updateButton.jqxButton({ cursor: "pointer", disabled: true, enableDefault: false,  height: 25, width: 25 });
                    updateButton.find('div:first').addClass(toTheme('jqx-icon-save'));
                    updateButton.jqxTooltip({ position: 'bottom', content: "Guardar"});
                    cancelButton.jqxButton({ cursor: "pointer", disabled: true, enableDefault: false,  height: 25, width: 25 });
                    cancelButton.find('div:first').addClass(toTheme('jqx-icon-cancel'));
                    cancelButton.jqxTooltip({ position: 'bottom', content: "Cancelar"});
                    var updateButtons = function (action) {
                        switch (action) {
                            case "Select":
                                addButton.jqxButton({ disabled: false });
                                deleteButton.jqxButton({ disabled: false });
                                editButton.jqxButton({ disabled: false });
                                cancelButton.jqxButton({ disabled: true });
                                updateButton.jqxButton({ disabled: true });
                                break;
                            case "Unselect":
                                addButton.jqxButton({ disabled: false });
                                deleteButton.jqxButton({ disabled: true });
                                editButton.jqxButton({ disabled: true });
                                cancelButton.jqxButton({ disabled: true });
                                updateButton.jqxButton({ disabled: true });
                                break;
                            case "Edit":
                                addButton.jqxButton({ disabled: true });
                                deleteButton.jqxButton({ disabled: true });
                                editButton.jqxButton({ disabled: true });
                                cancelButton.jqxButton({ disabled: false });
                                updateButton.jqxButton({ disabled: false });
                                break;
                            case "End Edit":
                                addButton.jqxButton({ disabled: false });
                                deleteButton.jqxButton({ disabled: false });
                                editButton.jqxButton({ disabled: false });
                                cancelButton.jqxButton({ disabled: true });
                                updateButton.jqxButton({ disabled: true });
                                break;
                        }
                    };
                    var rowIndex = null;
                    $("#tableCompetences").on('rowSelect', function (event) {
                        var args = event.args;
                        rowIndex = args.index;
                        updateButtons('Select');
                    });
                    $("#tableCompetences").on('rowUnselect', function (event) {
                        updateButtons('Unselect');
                    });
                    $("#tableCompetences").on('rowEndEdit', function (event) {
                        updateButtons('End Edit');
                    });
                    $("#tableCompetences").on('rowBeginEdit', function (event) {
                        updateButtons('Edit');
                    });
                    addButton.click(function (event) {
                        if (!addButton.jqxButton('disabled')) {
                            // add new empty row.
                            $("#tableCompetences").jqxDataTable('addRow', null, {}, 'first');
                            // select the first row and clear the selection.
                            $("#tableCompetences").jqxDataTable('clearSelection');
                            $("#tableCompetences").jqxDataTable('selectRow', 0);
                            // edit the new row.
                            //$("#tableCompetences").jqxDataTable('beginRowEdit', 0);
                            updateButtons('add');
                        }
                    });
                    cancelButton.click(function (event) {
                        if (!cancelButton.jqxButton('disabled')) {
                            // cancel changes.
                            $("#tableCompetences").jqxDataTable('endRowEdit', rowIndex, true);
                        }
                    });
                    updateButton.click(function (event) {
                        if (!updateButton.jqxButton('disabled')) {
                            // save changes.
                            $("#tableCompetences").jqxDataTable('endRowEdit', rowIndex, false);
                        }
                    });
                    editButton.click(function () {
                        if (!editButton.jqxButton('disabled')) {
                            $("#tableCompetences").jqxDataTable('beginRowEdit', rowIndex);
                            updateButtons('edit');
                        }
                    });
                    deleteButton.click(function () {
                        if (!deleteButton.jqxButton('disabled')) {
                            $("#jqxWindowWarningCompetences").jqxWindow('open');
                            $("#okCompetences").click(function (){
                                $("#tableCompetences").unbind("bindingComplete");
                                $("#okCompetences").unbind("click"); 
                                $("#jqxWindowWarningCompetences").jqxWindow('close');
                                $("#tableCompetences").jqxDataTable('deleteRow', rowIndex);
                            });
                            updateButtons('delete');
                        }
                    });
                },
                ready: function(){

                },
                columns: [
                    { text: 'NP',filterable: false, editable: false, dataField: 'dataProgresivNumber', width: 25 },
                    { text: 'Competencia', dataField: 'dataNameCompetences',
                        createEditor: function (row, cellvalue, editor, cellText, width, height) {
                            // construct the editor. 
                            $(editor).keyup(function() {
                                $(this).val($(this).val().toUpperCase());
                            });
                        },
                        getEditorValue: function (row, cellvalue, editor) {
                            // return the editor's value.
                            return $(editor).val().toUpperCase();
                        }
                    }
                ]
            }); 
        }
    });
</script>

<div id="tableCompetences"></div>