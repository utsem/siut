<script type="text/javascript">
    $(document).ready(function () {  
        var itemLevel = null;
        var itemSchoolYear = null;
        var itemSemester = null;
        var itemPeriod= null;
        var itemCategoryPayment = null;
        
        createDropDownStudyLevel("#paymentsPenaltyTypeLevelFilter",false);
        itemLevel = $('#paymentsPenaltyTypeLevelFilter').jqxDropDownList('getSelectedItem');
        
        if(itemLevel!=null || itemLevel!= undefined){
            createDropDownSemester(itemLevel.value, '#paymentsPenaltyTypeSemesterFilter', false);
            itemSemester = $('#paymentsPenaltyTypeSemesterFilter').jqxDropDownList('getSelectedItem');
            if(itemSemester!=null || itemSemester!= undefined){
                createDropDownSchoolYear("#schoolYearFilter");
                itemSchoolYear = $('#schoolYearFilter').jqxDropDownList('getSelectedItem');
                if(itemSchoolYear!=null || itemSchoolYear!= undefined){
                    var params = {
                        fkSchoolYear : itemSchoolYear.value   
                    };
                    createDropDownPeriodBySchoolYear('#paymentsPenaltyTypepaymentsPenaltyTypesFilter', params, false);
                    itemPeriod = $('#paymentsPenaltyTypepaymentsPenaltyTypesFilter').jqxDropDownList('getSelectedItem'); 
                    if(itemPeriod!=null || itemPeriod!= undefined){
                        createDropDownCategoryPayment("#paymentsPenaltyTypeCategoryFilter");
                        itemCategoryPayment = $('#paymentsPenaltyTypeCategoryFilter').jqxDropDownList('getSelectedItem');
                        $("#paymentsPenaltyTypeLevelFilter").on('change',function (event){  
                            var args = event.args;
                            if (args){
                                // index represents the item's index.                      
                                var index = args.index;
                                var item = args.item;
                                // get item's label and value.
                                var label = item.label;
                                var value = item.value;
                                var type = args.type; // keyboard, mouse or null depending on how the item was selected.  
                                itemLevel = $('#paymentsPenaltyTypeLevelFilter').jqxDropDownList('getSelectedItem');
                                createDropDownSemester(itemLevel.value, '#paymentsPenaltyTypeSemesterFilter', true);
                                itemSemester = $('#paymentsPenaltyTypeSemesterFilter').jqxDropDownList('getSelectedItem');
                                loadTable();
                            }                
                        });
                        
                        $("#schoolYearFilter").on('change',function (event){  
                            var args = event.args;
                            if (args){
                                // index represents the item's index.                      
                                var index = args.index;
                                var item = args.item;
                                // get item's label and value.
                                var label = item.label;
                                var value = item.value;
                                var type = args.type; // keyboard, mouse or null depending on how the item was selected.  
                                itemSchoolYear = $('#schoolYearFilter').jqxDropDownList('getSelectedItem');
                                var params = {
                                    fkSchoolYear : itemSchoolYear.value   
                                };
                                createDropDownPeriodBySchoolYear('#paymentsPenaltyTypepaymentsPenaltyTypesFilter', params, true);
                                itemPeriod = $('#paymentsPenaltyTypepaymentsPenaltyTypesFilter').jqxDropDownList('getSelectedItem'); 
                            }                
                        });
                        
                        $("#paymentsPenaltyTypepaymentsPenaltyTypesFilter").on('change',function (event){  
                            var args = event.args;
                            if (args){
                                // index represents the item's index.                      
                                var index = args.index;
                                var item = args.item;
                                // get item's label and value.
                                var label = item.label;
                                var value = item.value;
                                var type = args.type; // keyboard, mouse or null depending on how the item was selected.  
                                loadTable();
                            }                
                        });
                        
                        $("#paymentsPenaltyTypeCategoryFilter").on('change',function (event){  
                            var args = event.args;
                            if (args){
                                // index represents the item's index.                      
                                var index = args.index;
                                var item = args.item;
                                // get item's label and value.
                                var label = item.label;
                                var value = item.value;
                                var type = args.type; // keyboard, mouse or null depending on how the item was selected.  
                                loadTable();
                            }                
                        });
                        
                        loadTable();
                    }else{
                        createDropDownCategoryPayment("#paymentsPenaltyTypeCategoryFilter");
                        $("#paymentsPenaltyTypeCategoryFilter").jqxDropDownList("clear");
                    }
                }else{
                    createDropDownPeriodBySchoolYear('#paymentsPenaltyTypepaymentsPenaltyTypesFilter', {}, false);
                    createDropDownCategoryPayment("#paymentsPenaltyTypeCategoryFilter");
                    $("#paymentsPenaltyTypeCategoryFilter").jqxDropDownList("clear");
                }
            }else{
                createDropDownSchoolYear("#schoolYearFilter");
                $("#schoolYearFilter").jqxDropDownList("clear");
                createDropDownPeriodBySchoolYear('#paymentsPenaltyTypepaymentsPenaltyTypesFilter', {}, false);
                createDropDownCategoryPayment("#paymentsPenaltyTypeCategoryFilter");
                $("#paymentsPenaltyTypeCategoryFilter").jqxDropDownList("clear");
            }
        }else{
            createDropDownSemester(null, '#paymentsPenaltyTypeSemesterFilter', false);
            createDropDownSchoolYear("#schoolYearFilter");
            $("#schoolYearFilter").jqxDropDownList("clear");
            createDropDownPeriodBySchoolYear('#paymentsPenaltyTypepaymentsPenaltyTypesFilter', {}, false);
            createDropDownCategoryPayment("#paymentsPenaltyTypeCategoryFilter");
            $("#paymentsPenaltyTypeCategoryFilter").jqxDropDownList("clear");
        }
        
        var windowAddpaymentsPenaltyTypes = $('#jqxWindowAddpaymentsPenaltyTypes').jqxWindow({
            theme: theme,
            height: 280,
            width: 350,
            resizable: false,
            draggable: true,
            autoOpen: false,
            isModal: true,
            cancelButton: $('#cancelAdd'),
            initContent: function () {
                $('#name_penalty').jqxTextArea({ 
                    placeHolder: 'Concepto de pago', 
                    height: 90, 
                    width: 300, 
                    minLength: 1
                });
                $("#tariff").jqxNumberInput({ 
                    width: 120, 
                    height: 25, 
                    symbol: '$', 
                    digits:5,
                    min: 0, 
                    max: 1000, 
                    spinButtons: true 
                });
                $('#okAdd').jqxButton({
                    width: '80px',
                    theme: theme
                });
                $('#cancelAdd').jqxButton({
                    width: '80px',
                    theme: theme
                });
                $('#okAdd').focus();
            }
        });
        function loadTable(){
            itemLevel = $('#paymentsPenaltyTypeLevelFilter').jqxDropDownList('getSelectedItem');
            itemSemester = $('#paymentsPenaltyTypeSemesterFilter').jqxDropDownList('getSelectedItem');
            itemCategoryPayment = $('#paymentsPenaltyTypeCategoryFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#paymentsPenaltyTypepaymentsPenaltyTypesFilter').jqxDropDownList('getSelectedItem'); 
            var ordersSource ={
                dataFields: [
                    { name: 'dataProgresivNumber', type:'int'},
                    { name: 'dataPkPaymentPenaltyType', type: 'string' },
                    { name: 'dataNamePenalty', type: 'string' },
                    { name: 'dataTariff', type: 'string' },
                    { name: 'dataPkLevelStudy', type: 'string' },
                    { name: 'dataPkSemester', type: 'int' } ,
                    { name: 'dataPkCategory', type: 'int' },
                    { name: 'dataPkPeriod', type: 'int' }
                ],
                root: "__ENTITIES",
                data : {
                  pt_pk_level_study : itemLevel.value,
                  pt_pk_semester : itemSemester.value,
                  pt_pk_category : itemCategoryPayment.value,
                  pt_pk_period : itemPeriod.value
                },
                dataType: "json",
                async: false,
                id: 'dataPkPaymentPenaltyType',
                url: '../servicePaymentsPenaltyType?view',
                deleteRow: function (rowID, commit) {
                    // synchronize with the server - send delete command
                    // call commit with parameter true if the synchronization with the server is successful 
                    // and with parameter false if the synchronization failed.
                    $.ajax({
                        //Send the paramethers to servelt
                        type: "POST",
                        async: false,
                        url: "../servicePaymentsPenaltyType?delete",
                        data:{
                            'pt_pkPaymentsPenaltyType':rowID
                        },
                        beforeSend: function (xhr) {
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //This is if exits an error with the server internal can do server off, or page not found
                            alert("Error interno del servidor");
                        },
                        success: function (data, textStatus, jqXHR) {
                            if(data.indexOf('foreign')>=0){
                                $("#ok").hide();
                                $("#message").text("�Registros de entidades diferentes dependen de este registro, por lo que no es posible borrarlo!");
                                $("#jqxWindowWarning").jqxWindow('open');
                            }else if(data.indexOf('Deleted')>=0){
                                $("#tablepaymentsPenaltyTypes").jqxDataTable('updateBoundData');
                            }else{
                                commit(false);
                            }                        
                        }
                    });
                }
            };
            var dataAdapter = new $.jqx.dataAdapter(ordersSource);
            $("#tablepaymentsPenaltyTypes").jqxDataTable({
                width: 600,
                height: 400,
                selectionMode: "singleRow",
                localization: getLocalization("es"),
                source: dataAdapter,
                pageable: false,
                editable: true,
                filterable: false,
                showToolbar: true,
                altRows: true,
                toolbarHeight: 35,
                renderToolbar: function(toolBar){
                    var theme = "";
                    var toTheme = function (className) {
                        if (theme === "") return className;
                        return className + " " + className + "-" + theme;
                    };
                    // appends buttons to the status bar.
                    var container = $("<div style='overflow: hidden; position: relative; height: 100%; width: 100%;'></div>");
                    var buttonTemplate = "<div style='float: left; padding: 3px; margin: 2px;'><div style='margin: 4px; width: 16px; height: 16px;'></div></div>";
                    var addButton = $(buttonTemplate);
                    var editButton = $(buttonTemplate);
                    var deleteButton = $(buttonTemplate);
                    var cancelButton = $(buttonTemplate);
                    var updateButton = $(buttonTemplate);
                    container.append(addButton);
                    container.append(deleteButton);
                    toolBar.append(container);
                    addButton.jqxButton({cursor: "pointer", enableDefault: false,  height: 25, width: 25 });
                    addButton.find('div:first').addClass(toTheme('jqx-icon-plus'));
                    addButton.jqxTooltip({ position: 'bottom', content: "Agregar"});
                    deleteButton.jqxButton({ cursor: "pointer", disabled: true, enableDefault: false,  height: 25, width: 25 });
                    deleteButton.find('div:first').addClass(toTheme('jqx-icon-delete'));
                    deleteButton.jqxTooltip({ position: 'bottom', content: "Eliminar"});

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
                        }
                    };
                    var rowIndex = null;
                    $("#tablepaymentsPenaltyTypes").on('rowSelect', function (event) {
                        var args = event.args;
                        rowIndex = args.index;
                        updateButtons('Select');
                        if(args.row.dataActive==="Activo"){
                            updateButtons('Unselect');
                        }
                    });
                    $("#tablepaymentsPenaltyTypes").on('rowUnselect', function (event) {
                        
                        updateButtons('Unselect');
                    });
                    $("#tablepaymentsPenaltyTypes").on('rowEndEdit', function (event) {
                        updateButtons('End Edit');
                    });
                    $("#tablepaymentsPenaltyTypes").on('rowBeginEdit', function (event) {
                        updateButtons('Edit');
                    });
                    addButton.click(function (event) {
                        if (!addButton.jqxButton('disabled')) {
                            $("#validationStatus").hide();
                            windowAddpaymentsPenaltyTypes.jqxWindow('open');
                        }
                    });
                    deleteButton.click(function () {
                        $("#ok").show();
                        if (!deleteButton.jqxButton('disabled')) {
                            $("#message").text("�Estas seguro de borrar este registro!");
                            $("#jqxWindowWarning").jqxWindow('open');
                            $("#ok").off("click");
                            $("#ok").on("click", function (){
                                $("#jqxWindowWarning").jqxWindow('close');
                                $("#tablepaymentsPenaltyTypes").jqxDataTable('deleteRow', rowIndex);
                            });
                            updateButtons('delete');
                        }
                    });
                },
                columns: [
                    { text: 'NP',filterable: false, editable: false, dataField: 'dataProgresivNumber', width: 35, align:'center', cellsalign:'center' },
                    { text: 'Concepto de Pago', dataField: 'dataNamePenalty'},
                    { text: 'Monto',  columntype: 'custom', align:'center', cellsalign:'center', dataField: 'dataTariff', cellsformat: 'c2', width: 140,
                        createEditor: function (row, cellvalue, editor, cellText, width, height) {
                            // construct the editor. 
                            editor.jqxNumberInput({ 
                                width: width, 
                                height: height, 
                                symbol: '$',
                                digits:5,
                                spinButtons: true 
                            });                           
                        },
                        initEditor: function (row, cellvalue, editor, celltext, width, height) {
                            // set the editor's current value. The callback is called each time the editor is displayed.
                            //alert(celltext);
                            editor.jqxNumberInput({ decimal: parseFloat(cellvalue)});
                        },
                        getEditorValue: function (row, cellvalue, editor) {
                           // return the editor's value.

                           return cellvalue;
                        }
                    }
                ]
            }); 
        }
        $('#tablepaymentsPenaltyTypes').on('cellValueChanged', function (event) {
            // event args.
            var args = event.args;
            // cell value.
            var value = args.value;
            // old cell value.
            var oldValue = args.oldValue;
            // row data.
            var row = args.row;
            // row index.
            var index = args.index;
            // row's data bound index.
            var boundIndex = args.boundIndex;
            // row key.
            var rowKey = args.key;
            // column data field.
            var dataField = args.dataField;
            $.ajax({
                //Send the paramethers to servelt
                type: "POST",
                async: false,
                dataType: 'text',
                url: "../servicePaymentsPenaltyType?update",
                data:{
                    'pt_pk_payment_penalty': row.dataPkPaymentPenaltyType,
                    'pt_name_penalty': row.dataNamePenalty,
                    'pt_tariff': row.dataTariff
                },
                beforeSend: function (xhr) {
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //This is if exits an error with the server internal can do server off, or page not found
                    alert("Error interno del servidor");
                },
                success: function (data, textStatus, jqXHR) { 
                    //If is updated rechange the drowdown in the other flange...
                    loadTable();
                }
            });
        });
        $("#okAdd").click(function (){
            itemLevel = $('#paymentsPenaltyTypeLevelFilter').jqxDropDownList('getSelectedItem');
            itemSemester = $('#paymentsPenaltyTypeSemesterFilter').jqxDropDownList('getSelectedItem');
            itemCategoryPayment = $('#paymentsPenaltyTypeCategoryFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#paymentsPenaltyTypepaymentsPenaltyTypesFilter').jqxDropDownList('getSelectedItem');
            var name_penalty = $('#name_penalty').jqxTextArea('val');
            var tariff = $("#tariff").jqxNumberInput('val');
            if(name_penalty.length>0){
                if(tariff>0){
                    var data = {
                        pt_name_penalty : name_penalty,
                        pt_tariff : tariff,
                        pt_pk_level_study : itemLevel.value,
                        pt_pk_semester : itemSemester.value,
                        pt_pk_category : itemCategoryPayment.value,
                        pt_pk_period : itemPeriod.value
                    };
                    insert(data);
                    $("#validationStatus").hide();
                    windowAddpaymentsPenaltyTypes.jqxWindow('close');
                }else{
                    $("#validationStatus").show();
                    $("#validationStatus").text("Debes de establecer un monto...");
                }
            }else{
                $("#validationStatus").show();
                $("#validationStatus").text("El concepto de pago es requerido...");
            }                       
        });
        
        
        function insert(data){
            $.ajax({
                //Send the paramethers to servelt
                type: "POST",
                async: false,
                url: "../servicePaymentsPenaltyType?insert",
                data:{
                    'pt_pk_payment_penalty': data.pt_pk_payment_penalty,
                    'pt_name_penalty': data.pt_name_penalty,
                    'pt_tariff': data.pt_tariff,
                    'pt_pk_level_study': data.pt_pk_level_study,
                    'pt_pk_semester': data.pt_pk_semester,
                    'pt_pk_category': data.pt_pk_category,
                    'pt_pk_period': data.pt_pk_period
                },
                beforeSend: function (xhr) {
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //This is if exits an error with the server internal can do server off, or page not found
                    alert("Error interno del servidor");
                },
                success: function (data, textStatus, jqXHR) {
                    $("#tablepaymentsPenaltyTypes").jqxDataTable('updateBoundData');
                }
            });
        }
    });
</script>
<div id='jqxWindowAddpaymentsPenaltyTypes'>
    <div>Agregar nuevo concepto</div>
    <div>
        <div>
            <div style="display: inline-block; margin-right: 5px;">
                <span>Concepto</span><br>
                <textarea id="name_penalty"></textarea>
            </div>
            <br>
            <div style="display: inline-block; margin-right: 5px;">
                <span>Monto</span><br>
                <div style='margin-top: 3px;' id='tariff'></div>
            </div>
            <br>
            <div style="margin-right: 5px;">
                <span id="validationStatus" style="display: none; color: red;"></span>
            </div>
        </div>
        <div style="float: right; bottom: 10px; right: 20px;  position: absolute;">
            <input type="button" id="okAdd" value="Agregar" style="margin-right: 10px" />
            <input type="button" id="cancelAdd" value="Cancelar" />
        </div>
    </div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Nivel de estudio<br>
    <div id='paymentsPenaltyTypeLevelFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Cuatrimestre<br>
    <div id='paymentsPenaltyTypeSemesterFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    <span>Siclo Escolar</span><br>
    <div id="schoolYearFilter"></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Periodo <br>
    <div id='paymentsPenaltyTypepaymentsPenaltyTypesFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Categor�a <br>
    <div id='paymentsPenaltyTypeCategoryFilter'></div>
</div>
<div id="tablepaymentsPenaltyTypes"></div>