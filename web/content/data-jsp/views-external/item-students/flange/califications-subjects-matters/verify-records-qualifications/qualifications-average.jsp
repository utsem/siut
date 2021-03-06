<script>
    $(document).ready(function () {
        var itemLevel = 0;
        var itemCareer = 0;
        var itemStudyPlan = 0;
        var itemPeriod = 0;
        var itemGroup = 0;
        var itemSemester = 0;
        var itemSubjectMatter = 0;
        var itemTypeEvaluation = 0;
        
        var buttonTemplate = "<div style='float: left; padding: 3px; margin: 2px;'><div style='margin: 4px; width: 16px; height: 16px;'></div></div>";
        var lockButton = $(buttonTemplate);
        var unlockButton = $(buttonTemplate);
        var showButton = $(buttonTemplate);
        var exportButton = $(buttonTemplate);
        var infoButton = $(buttonTemplate);
        var dateContent = $('<div style="float: right; margin-top: 2px; margin-right: 2px;"><div class="calendarInput" ></div></div>');
        var infoElaborateDate = $('<div style="float: left; margin-right: 5px;">Fecha de Elaboraci�n<br><div id="datePrint"></div><span>DD-MM-AAAA</span></div>');
        var container = $("<div class='container' style='overflow: hidden; position: relative; height: 100%; width: 100%;'></div>");
        
        createDropDownStudyLevel("#qualificationsLevelFilter",false);
        itemLevel = $('#qualificationsLevelFilter').jqxDropDownList('getSelectedItem');
        if(itemLevel!==undefined){
            createDropDownPeriod("comboActiveYear","#qualificationsPeriodFilter");
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');   
            $('#qualificationsPeriodFilter').jqxDropDownList({width: 180});
            createDropDownCareer(itemLevel.value ,"#qualificationsCareerFilter",false);
            itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
            if(itemCareer!==undefined){
                createDropDownStudyPlan(itemCareer.value,"#qualificationsStudyPlanFilter",false);
                itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');                
                if(itemStudyPlan!==undefined){
                    var filtrableSemester = {
                        pkCareer : itemCareer.value,
                        pkPeriod : itemPeriod.value,
                        pkStudyPlan : itemStudyPlan.value
                    };
                    createDropDownCurrentSemester("#qualificationsSemesterFilter", filtrableSemester,  false);
                    itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem');
                    if(itemSemester!==undefined){   
                        var filtrableGroup = {
                            pkCareer : itemCareer.value,
                            pkSemester : itemSemester.value,
                            pkPeriod : itemPeriod.value
                        };
                        createDropDownGruopByCurrentSemester("#qualificationsGroupFilter", filtrableGroup, false);
                        itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');                    
                        if(itemGroup!=undefined || itemGroup!=null){
                            var filtrableSubjectMatters = {
                                pkCareer : itemCareer.value,
                                pkSemester : itemSemester.value,
                                pkStudyPlan : itemStudyPlan.value,
                                pkPeriod : itemPeriod.value
                            };
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", filtrableSubjectMatters, false);
                            $("#qualificationsSubjectMatterFilter").jqxDropDownList({width: 330});
                            itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                            if(itemSubjectMatter!=undefined || itemSubjectMatter!=null){   
                                itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                                itemSubjectMatter=$('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');  
                                itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                                var data = {
                                    "fkGroup":itemGroup.value,
                                    "fkMatter":itemSubjectMatter.value,
                                    "fkPeriod":itemPeriod.value
                                };
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", data, false);
                                if(itemTypeEvaluation!=undefined || itemTypeEvaluation!=null){
                                    loadTableQualifications();
                                }else{
                                    $("#tableQualifications").parent().hide();
                                }
                            }else{
                                createDropDownEvaluationType("#qualificationsCalEvaluationType",{}, false);
                                $("#tableQualifications").parent().hide();
                            }
                        }else{
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
                            $("#qualificationsSubjectMatterFilter").jqxDropDownList({width: 330});
                            createDropDownEvaluationType("#qualificationsCalEvaluationType",{}, false);
                            $("#tableQualifications").parent().hide();
                        } 
                    }else{
                        createDropDownGruopByCurrentSemester("#qualificationsGroupFilter", {}, false);
                        createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
                        $("#qualificationsSubjectMatterFilter").jqxDropDownList({width: 330});
                        createDropDownEvaluationType("#qualificationsCalEvaluationType",{}, false);
                        $("#tableQualifications").parent().hide();
                    }
                }else{
                    createDropDownCurrentSemester("#qualificationsSemesterFilter",{},false);
                    createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, false);
                    createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
                    $("#qualificationsSubjectMatterFilter").jqxDropDownList({width: 330});
                    createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, false);  
                    $("#tableQualifications").parent().hide();
                }
                $('#qualificationsLevelFilter').on('change',function (event){  
                    itemLevel = $('#qualificationsLevelFilter').jqxDropDownList('getSelectedItem');
                    if(itemLevel!=undefined){
                        createDropDownCareer(itemLevel.value ,"#qualificationsCareerFilter",true);
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        if(itemCareer!=undefined || itemCareer!=null){
                            itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem'); 
                            if(itemSemester==null || itemSemester==undefined){
                                createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                                createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                $("#tableQualifications").parent().hide();
                            }else{
                                itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                                if(itemGroup==null || itemGroup==undefined){
                                    createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                    createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                    $("#tableQualifications").parent().hide();
                                }else{
                                    itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                                    if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                                        createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                        $("#tableQualifications").parent().hide();
                                    }
                                }
                            }
                        }else{
                            createDropDownCurrentSemester("#qualificationsSemesterFilter",{},true);
                            createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                            $("#tableQualifications").parent().hide();
                        }
                    }else{
                        createDropDownCareer(null ,"#qualificationsCareerFilter",true);
                        createDropDownCurrentSemester("#qualificationsSemesterFilter",{},true);
                        createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                        createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                        createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                        $("#tableQualifications").parent().hide();
                    }
                });
                $('#qualificationsPeriodFilter').on('change',function (event){  
                    itemLevel = $('#qualificationsLevelFilter').jqxDropDownList('getSelectedItem');
                    if(itemLevel!=undefined){
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                        if(itemCareer!=undefined){                        
                            var filtrableSemester = {
                                pkCareer : itemCareer.value,
                                pkStudyPlan : itemStudyPlan.value,
                                pkPeriod : itemPeriod.value
                            };
                            createDropDownCurrentSemester("#qualificationsSemesterFilter", filtrableSemester, true);
                            itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem'); 
                            if(itemSemester==null || itemSemester==undefined){
                                createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                                createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                $("#tableQualifications").parent().hide();
                            }else{
                                itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                                if(itemGroup==null || itemGroup==undefined){
                                    createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                    createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                    $("#tableQualifications").parent().hide();
                                }else{
                                    itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                                    if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                                        createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                        $("#tableQualifications").parent().hide();
                                    }
                                }
                            }
                        }else{
                            createDropDownCurrentSemester("#qualificationsSemesterFilter",{},true);
                            createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                            $("#tableQualifications").parent().hide();
                        }
                    }else{
                        createDropDownCurrentSemester("#qualificationsSemesterFilter",{},true);
                        createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                        createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                        createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                        $("#tableQualifications").parent().hide();
                    }
                });
                $('#qualificationsCareerFilter').on('change',function (event){  
                    var args = event.args;
                    if (args) {
                        // index represents the item's index.                      
                        var index = args.index;
                        var item = args.item;
                        // get item's label and value.
                        var label = item.label;
                        var value = item.value;
                        var type = args.type; // keyboard, mouse or null depending on how the item was selected. 
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        createDropDownStudyPlan(itemCareer.value,"#qualificationsStudyPlanFilter",true);
                        itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');
                        if(itemStudyPlan==null || itemStudyPlan==undefined){
                            createDropDownCurrentSemester("#qualificationsSemesterFilter",{},false);
                            createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, false);
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, false);  
                            $("#tableQualifications").parent().hide();
                        }else{
                            itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem');
                            if(itemSemester==null || itemSemester==undefined){
                                createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                                createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                $("#tableQualifications").parent().hide();
                            }else{
                                itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                                if(itemGroup==null || itemGroup==undefined){
                                    createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                    createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                    $("#tableQualifications").parent().hide();
                                }else{
                                    itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                                    if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                                        createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true);
                                        $("#tableQualifications").parent().hide();
                                    }
                                }
                            }
                        }
                    }                
                });
                $('#qualificationsStudyPlanFilter').on('change',function (event){
                    var args = event.args;
                    if (args) {
                        // index represents the item's index.                      
                        var index = args.index;
                        var item = args.item;
                        // get item's label and value.
                        var label = item.label;
                        var value = item.value;
                        var type = args.type; // keyboard, mouse or null depending on how the item was selected.
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                        var filtrableSemester = {
                            pkCareer : itemCareer.value,
                            pkStudyPlan : itemStudyPlan.value,
                            pkPeriod : itemPeriod.value
                        };
                        createDropDownCurrentSemester("#qualificationsSemesterFilter", filtrableSemester, true);
                        itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem');
                        if(itemSemester==null || itemSemester==undefined){
                            createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, true);
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                            $("#tableQualifications").parent().hide();
                        }else{
                            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                            if(itemGroup==null || itemGroup==undefined){
                                createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                $("#tableQualifications").parent().hide();
                            }else{
                                itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                                if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                                    createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                    $("#tableQualifications").parent().hide();
                                }
                            }
                        }
                    }   
                });
                $("#qualificationsSemesterFilter").on('change',function (event){
                    var args = event.args;
                    if (args) {
                        // index represents the item's index.                      
                        var index = args.index;
                        var item = args.item;
                        // get item's label and value.
                        var label = item.label;
                        var value = item.value;
                        var type = args.type; // keyboard, mouse or null depending on how the item was selected.
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');
                        itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem');
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                        var filtrableGroup = {
                            pkCareer : itemCareer.value,
                            pkSemester : itemSemester.value,
                            pkPeriod : itemPeriod.value
                        };
                        createDropDownGruopByCurrentSemester("#qualificationsGroupFilter", filtrableGroup, true);  
                        itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                        if(itemGroup==null || itemGroup==undefined){
                            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, true);
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                            $("#tableQualifications").parent().hide();
                        }else{
                            itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                            if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                                $("#tableQualifications").parent().hide();
                            }
                        }
                    }
                });
                $("#qualificationsGroupFilter").on('change',function (event){  
                    var args = event.args;
                    if (args){
                        // index represents the item's index.                      
                        var index = args.index;
                        var item = args.item;
                        // get item's label and value.
                        var label = item.label;
                        var value = item.value;
                        var type = args.type; // keyboard, mouse or null depending on how the item was selected.
                        itemCareer = $('#qualificationsCareerFilter').jqxDropDownList('getSelectedItem');
                        itemStudyPlan = $('#qualificationsStudyPlanFilter').jqxDropDownList('getSelectedItem');
                        itemSemester = $('#qualificationsSemesterFilter').jqxDropDownList('getSelectedItem');
                        itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');     
                        
                        var filtrableSubjectMatters = {
                            pkCareer : itemCareer.value,
                            pkSemester : itemSemester.value,
                            pkStudyPlan : itemStudyPlan.value,
                            pkPeriod : itemPeriod.value
                        };
                        createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", filtrableSubjectMatters, true);
                        itemSubjectMatter = $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');
                        if(itemSubjectMatter==null || itemSubjectMatter==undefined){
                            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, true); 
                            $("#tableQualifications").parent().hide();
                        }
                    }
                });
                $("#qualificationsSubjectMatterFilter").on('change',function (event){  
                    var args = event.args;
                    if (args){
                        // index represents the item's index.                      
                        var index = args.index;
                        var item = args.item;
                        // get item's label and value.
                        var label = item.label;
                        var value = item.value;
                        var type = args.type; // keyboard, mouse or null depending on how the item was selected.  
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                        itemSubjectMatter=$('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');  
                        itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                        var data = {
                            "fkGroup":itemGroup.value,
                            "fkMatter":itemSubjectMatter.value,
                            "fkPeriod":itemPeriod.value
                        };
                        createDropDownEvaluationType("#qualificationsCalEvaluationType", data, true);
                    }                
                });
                $("#qualificationsCalEvaluationType").on('change',function (event){ 
                    var args = event.args;
                    if (args) {
                        loadTableQualifications();
                    }
                }); 
            }else{
                createDropDownCareer(null ,"#qualificationsCareerFilter",false);
                createDropDownCurrentSemester("#qualificationsSemesterFilter",{},false);
                createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, false);
                createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
                createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, false);
            }     
        }else{
            createDropDownCareer(null ,"#qualificationsCareerFilter",false);
            createDropDownCurrentSemester("#qualificationsSemesterFilter",{},false);
            createDropDownGruopByCurrentSemester("#qualificationsGroupFilter",{}, false);
            createDropDownSubjectMatterByCurrentSemester("#qualificationsSubjectMatterFilter", {}, false);
            createDropDownEvaluationType("#qualificationsCalEvaluationType", {}, false); 
        }

        function loadSource(){
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemSubjectMatter=$('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem');  
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $('#qualificationsCalEvaluationType').jqxDropDownList('getSelectedItem');
            var ordersSource ={
                dataFields: [
                    { name: 'id', type:'int'},
                    { name: 'dataProgresivNumber', type:'int'},
                    { name: 'dataEnrollment', type: 'string' },
                    { name: 'dataFkStudent', type: 'int' },
                    { name: 'dataStudentName', type: 'string' },
                    { name: 'dataCalificationBe', type: 'double' },
                    { name: 'dataCalificationKnow', type: 'double' },
                    { name: 'dataCalificationDo', type: 'double' },
                    { name: 'dataAvg', type: 'double'},
                    { name: 'dataLetter', type: 'string'}
                ],
                root: "__ENTITIES",
                dataType: "json",
                id: 'id',
                async: false,
                url: '../serviceCalification?view=recordsCalifications&&pkTypeEvaluation='+itemTypeEvaluation.value+'&&fkPeriod='+itemPeriod.value+'&&fkMatter='+itemSubjectMatter.value+'&&fkGroup='+itemGroup.value+''
            };
            return ordersSource;
        }
        function loadSourceDescription(){
            var ordersSource ={
                dataFields: [
                    { name: 'dataIntegradora', type: 'string' },
                    { name: 'dataNoIntegradora', type: 'string' }
                ],
                root: "__ENTITIES",
                dataType: "json",
                id: 'id',
                async: false,
                url: '../serviceCalification?view=recordsCalificationsDescription'
            };
            return ordersSource;
        }
        function loadTableDescription(){
            var dataAdapter = new $.jqx.dataAdapter(loadSourceDescription());
            $("#tableDescription").jqxGrid({
                width: 225,
                height: 127,
                selectionMode: "singlerow",
                localization: getLocalization("es"),
                source: dataAdapter,
                pageable: false,
                editable: false,
                filterable: false,
                altRows: true,
                columns: [
                    { text: 'Integradoras',disabled: true, align: 'center', dataField: 'dataNoIntegradora'}
                ]
            });
            $("#tableDescription2").jqxGrid({
                width: 225,
                height: 127,
                selectionMode: "singlerow",
                localization: getLocalization("es"),
                source: dataAdapter,
                pageable: false,
                editable: false,
                filterable: false,
                altRows: true,
                columns: [
                    { text: 'No integradoras',disabled: true, align: 'center', dataField: 'dataIntegradora'}
                ]
            });
        }
        
        
        function loadTableQualifications(){     
            $("#tableQualifications").parent().show();
            var status = isClosedWorkPlanning();
            var length =0 ;
            var dataAdapter = new $.jqx.dataAdapter(loadSource(),{
                loadComplete: function () {
                    length = dataAdapter.records.length;
                }
            }); 
            var cellclass = function (row, columnfield, value) {
                itemTypeEvaluation = $('#qualificationsCalEvaluationType').jqxDropDownList('getSelectedItem');
                var classTheme="";
                if(status==1){
                    var data = $('#tableQualifications').jqxGrid('getrowdata', row);
                    $('#tableQualifications').jqxGrid({ enablehover: false}); 
                    $('#tableQualifications').jqxGrid({ selectionmode: 'none'}); 
                    if(data.dataAvg>=8 || data.dataAvg==="/"){
                        classTheme="disabled";
                    }else{
                        classTheme="not-approved";
                    }     
                }else{
                    $('#tableQualifications').jqxGrid({ selectionmode: 'singlerow'}); 
                    $('#tableQualifications').jqxGrid({ enablehover: true}); 
                }
                return classTheme;
            };
            
            var exportSourse = function (){
                var canPrintResult;
                itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
                itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
                $.ajax({
                    url: "../serviceCalification?canPrint",
                    data: {
                        "fkType": itemTypeEvaluation.value, 
                        "fkMatter": itemSubjectMatter.value,
                        "fkGroup": itemGroup.value,
                        "fkPeriod": itemPeriod.value
                    },
                    type: 'POST',
                    async: false,
                    dataType: 'json',
                    beforeSend: function (xhr) {
                    },
                    success: function (data, textStatus, jqXHR) {
                        canPrintResult = data;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("Error interno del servidor");                
                    }
                });
                return canPrintResult;
            };
            
            var toolbarfunc = function (toolbar) {
                var themeRenderToolbar = "";
                var toTheme = function (className) {
                    if (themeRenderToolbar === "") return className;
                    return className + " " + className + "-" + themeRenderToolbar;
                }; 
                
                
                container.append(unlockButton);
                container.append(exportButton);
                
                
                getDatePrint();
                getDateClosedES();
                container.append(infoButton);
                container.append(lockButton);
                container.append(infoElaborateDate);
                container.append(dateContent); 
                toolbar.append(container);
                var me = this;    
                
                lockButton.jqxButton({cursor: "pointer", enableDefault: true,  height: 25, width: 25 });
                lockButton.find('div:first').addClass(toTheme('jqx-icon-lock'));
                lockButton.jqxTooltip({ position: 'bottom', content: "Cerrar calificaciones"});
                lockButton.attr("id","lockButton");
                
                unlockButton.jqxButton({cursor: "pointer", enableDefault: true,  height: 25, width: 25 });
                unlockButton.find('div:first').addClass(toTheme('jqx-icon-unlock'));
                unlockButton.jqxTooltip({ position: 'bottom', content: "Abrir calificaciones"});
                unlockButton.jqxButton({ disabled: false });
                unlockButton.attr("id","unlockButton");

                exportButton.jqxButton({cursor: "pointer", enableDefault: true,  height: 25, width: 25 });
                exportButton.find('div:first').addClass(toTheme('jqx-icon-export'));
                exportButton.jqxTooltip({ position: 'bottom', content: "Exportar a pdf"});
                exportButton.attr("id","exportButton");

                infoButton.jqxButton({ cursor: "pointer", disabled: false, enableDefault: true,  height: 25, width: 25 });
                infoButton.find('div:first').addClass(toTheme('jqx-icon-info'));
                infoButton.css({"float":"right","cursor":"pointer"});
                infoButton.jqxTooltip({ position: 'bottom', content: "Descripci�n de letra"});

                showButton.jqxButton({ cursor: "pointer", disabled: false, enableDefault: true,  height: 25, width: 25 });
                showButton.find('div:first').addClass(toTheme('jqx-icon-show'));
                showButton.css({"float":"right","cursor":"pointer"});
                showButton.jqxTooltip({ position: 'bottom', content: "Agregar observaciones"});
                showButton.attr("id","showButton");
                
                $('.calendarInput').jqxDateTimeInput({culture: 'es-MX',formatString: "yyyy/MM/dd", theme: theme, width: '120px', height: '30px'});
                $('.calendarInput').off('change');
                $('.calendarInput').on('change', function (event) {
                    if(event.args){
                        itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
                        itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
                        itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
                        itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
                        var Date = $('.calendarInput').jqxDateTimeInput('getDate').toJSON();
                        var flDateClosed = Date;
                        $.ajax({
                            url: "../serviceCalification?setDateCloseES",
                            data: {
                                "fkType": itemTypeEvaluation.value, 
                                "flDateClosed": flDateClosed, 
                                "fkMatter": itemSubjectMatter.value,
                                "fkGroup": itemGroup.value,
                                "fkPeriod": itemPeriod.value
                            },
                            type: 'POST',
                            beforeSend: function (xhr) {
                            },
                            success: function (data, textStatus, jqXHR) {
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("Error interno del servidor");                
                            }
                        });    
                    }
                }); 
                
                lockButton.off("click");
                lockButton.click(function (){           
                    if(status==0){
                        var exportSettings = exportSourse()[0];
                        itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
                        if(itemTypeEvaluation.value==1){
                            $("#messageWarning").text("�Una vez cerradas las calificaciones el profesor no podr� hacer modificaciones a estas, esta seguro que desea continuar...?");
                            $("#typeEval").val("average");
                            $('#jqxWindowWarningCalications').jqxWindow("open");
                        }else if(itemTypeEvaluation.value==2){
                            $("#messageWarning").text("�Una vez cerradas las calificaciones el profesor no podr� hacer modificaciones a estas, esta seguro que desea continuar...?");
                            $("#typeEval").val("average");
                            $('#jqxWindowWarningCalications').jqxWindow("open");
                        }else if(itemTypeEvaluation.value==3){
                            if(exportSettings.canPrint==="0"){                                
                                if(exportSettings.items>0){
                                    var source = exportSettings.items;
                                    var dataAdapter = new $.jqx.dataAdapter(source);
                                    // Create a jqxListBox
                                    $("#listTeacher").jqxListBox('clear');
                                    $("#listTeacher").jqxListBox({ 
                                        source: dataAdapter, 
                                        displayMember: "dataNameTeacher", 
                                        valueMember: "dataPkTeacher", 
                                        width: 310, 
                                        height: 120,
                                        renderer: function (index, label, value) {
                                            var datarecord = source[index];
                                            return datarecord.dataNameTeacher + "<br>" + datarecord.dataNameSubjectMatter;
                                        }
                                    });
                                    $('#jqxWindowMissingTeachers').jqxWindow("open");
                                }else{
                                    $("#messageWarning").text("�Una vez cerradas las calificaciones el profesor no podr� hacer modificaciones a estas, esta seguro que desea continuar...?");
                                    $("#typeEval").val("average");
                                    $('#jqxWindowWarningCalications').jqxWindow("open");
                                }
                            }else if(exportSettings.canPrint==="1"){
                                $("#messageWarning").text("�Una vez cerradas las calificaciones el profesor no podr� hacer modificaciones a estas, esta seguro que desea continuar...?");
                                $("#typeEval").val("average");
                                $('#jqxWindowWarningCalications').jqxWindow("open");
                            }else{
                                alert("Lamentamos que estemos teniendo problemas, por favor reporta el problema.");
                            }
                        }
                    }else{
                        $("#messageWarning").html("Para poder cerrar acumulado debes de terminar de evaluar todas tus actividades para este grupo...!");
                        $('#jqxWindowWarningCalications').jqxWindow("open");
                    }
                });
                
                unlockButton.off("click");
                unlockButton.click(function (){
//                    $("#messageWarning").html("El sistema no permite abrir tus calificaciones, si la necesidad persiste acudir con el administrador del sistema...!");
//                    $('#jqxWindowWarningCalications').jqxWindow("open");
                    openWorkPlanningByGroupMatters();
                });
                
                var onShow=true;
                showButton.off("click");
                showButton.click(function (){
                   if(onShow){
                        $("#tableDescription").hide();
                        $("#tableDescription2").hide();
                        onShow=false;
                        on=true;
                    }else{
                        onShow=true;
                    }
                });
                var on=true;
                infoButton.off("click");
                infoButton.click(function (){
                    if(on){
                        $("#tableDescription").fadeIn("slow");
                        $("#tableDescription2").fadeIn("slow");
                        on=false;
                        onShow=true;
                    }else{
                        $("#tableDescription").fadeOut("slow");
                        $("#tableDescription2").fadeOut("slow");
                        on=true;
                    }
                });
                exportButton.off("click");
                exportButton.click(function (){
                    var exportSettings = exportSourse()[0];
                    itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
                    if(itemTypeEvaluation.value==1 || itemTypeEvaluation.value==2){
                        printReport();
                    }else if(itemTypeEvaluation.value==3){
                        if(exportSettings.canPrint==="0"){                            
                            if(exportSettings.items>0){
                                var source = exportSettings.items;
                                var dataAdapter = new $.jqx.dataAdapter(source);
                                // Create a jqxListBox
                                $("#listTeacher").jqxListBox('clear');
                                $("#listTeacher").jqxListBox({ 
                                    source: dataAdapter, 
                                    displayMember: "dataNameTeacher", 
                                    valueMember: "dataPkTeacher", 
                                    width: 310, 
                                    height: 120,
                                    renderer: function (index, label, value) {
                                        var datarecord = source[index];
                                        return datarecord.dataNameTeacher + "<br>" + datarecord.dataNameSubjectMatter;
                                    }
                                });
                                $('#jqxWindowMissingTeachers').jqxWindow("open");
                            }else{
                                $("#messageWarning").html("Lamentamos que estemos teniendo problemas, por favor reporta el problema....!");
                                $('#jqxWindowWarningCalications').jqxWindow("open");
                            }
                        }else if(exportSettings.canPrint==="1"){
                            printReport();
                        }else{
                            $("#messageWarning").html("Lamentamos que estemos teniendo problemas, por favor reporta el problema....!");
                            $('#jqxWindowWarningCalications').jqxWindow("open");
                        }
                    }
                });
            };
            if(status==1){
                lockButton.hide();
                unlockButton.show();
                exportButton.show();
                showButton.show();
                infoButton.show();
            }else if(status==0){   
                lockButton.show();
                unlockButton.hide();
                exportButton.hide();
                showButton.show();
                infoButton.show();
            }else if(status==3){
                lockButton.show();
                unlockButton.hide();
                exportButton.hide();
                showButton.show();
            }
            $("#tableQualifications").jqxGrid({
                width: 800,
                height: 450,
                selectionMode: "singlerow",
                localization: getLocalization("es"),
                source: dataAdapter,
                pageable: false,
                editable: false,
                toolbarheight: 34,
                filterable: false,
                altRows: true,
                ready: function(){
                    $("#tableQualifications").jqxGrid('focus');
                    if(status==1){
                        lockButton.hide();
                        unlockButton.show();
                        exportButton.show();
                        showButton.show();
                    }else if(status==0){    
                        lockButton.show();
                        unlockButton.hide();
                        exportButton.hide();
                        showButton.show();
                    }else if(status==3){
                        lockButton.show();
                        unlockButton.hide();
                        exportButton.hide();
                        showButton.show();
                    }
                    loadTableDescription();
                },
                columngroups: [
                    { text: 'Calificaci�n', align: 'center', name: 'calification' }
                ],
                columns: [
                    { text: '#', cellclassname: cellclass,  disabled: true, filterable: false, editable: false, dataField: 'dataProgresivNumber', width: 25 },
                    { text: 'Matr�cula', cellclassname: cellclass, disabled: true, align: 'center', dataField: 'dataEnrollment', editable: false, width: 140 },
                    { text: 'Alumno', cellclassname: cellclass, disabled: true, align: 'center', dataField: 'dataStudentName', editable: false},
                    { text: 'Ser', cellclassname: cellclass,  columngroup: 'calification', parentgroup: 'calification', dataField: 'dataCalificationBe', cellsalign: 'center', align: 'center', width: 60 },
                    { text: 'Saber', cellclassname: cellclass, columngroup: 'calification', cellsalign: 'center', align: 'center', dataField: 'dataCalificationKnow', width: 60},
                    { text: 'Hacer', cellclassname: cellclass, columngroup: 'calification', cellsalign: 'center', align: 'center', dataField: 'dataCalificationDo', width: 60},
                    { text: 'Numero', cellclassname: cellclass, columngroup: 'calification', cellsalign: 'center', align: 'center', dataField: 'dataAvg', width: 80},
                    { text: 'Letra',  cellclassname: cellclass, columngroup: 'calification', cellsalign: 'center', align: 'center', dataField: 'dataLetter', width: 80}
                ],
                showtoolbar: true,
                rendertoolbar: toolbarfunc
            });
        }
        function getDatePrint(){
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../serviceCalification?getDatePrint",
                data: {"fkType": itemTypeEvaluation.value, "fkMatter": itemSubjectMatter.value,"fkGroup": itemGroup.value,"fkPeriod": itemPeriod.value},
                type: 'POST',
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    $('#datePrint').text(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }
        function getDateClosedES(){
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../serviceCalification?getDateClosedES",
                data: {
                    "fkType": itemTypeEvaluation.value, 
                    "fkMatter": itemSubjectMatter.value,
                    "fkGroup": itemGroup.value,
                    "fkPeriod": itemPeriod.value
                },
                type: 'POST',
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    $('.calendarInput').val(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }
        function isClosedWorkPlanning(){
            var status;
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../serviceCalification?isCloseWorkPlanningES",
                data: {"fkType": itemTypeEvaluation.value, "fkMatter": itemSubjectMatter.value,"fkGroup": itemGroup.value,"fkPeriod": itemPeriod.value},
                type: 'POST',
                async: false,
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    var items = data[0].items;
                    for(var i=0; i<items.length; i++){
                        var item = $("#qualificationsCalEvaluationType").jqxDropDownList('getItemByValue', items[i].valueMember);
                        if(items[i].status==="-1"){
                            $("#qualificationsCalEvaluationType").jqxDropDownList('disableItem', item ); 
                        }else{
                            $("#qualificationsCalEvaluationType").jqxDropDownList('enableItem', item ); 
                        }        
                    }
                    status=parseInt(data[0].closed);  
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
            return status;
        }
        
        function closeWorkPlanningByGroupMatters(){
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../serviceCalification?closeWorkPlanningES",
                data: {
                    "fkType": itemTypeEvaluation.value, 
                    "fkMatter": itemSubjectMatter.value,
                    "fkGroup": itemGroup.value,
                    "fkPeriod": itemPeriod.value
                },
                type: 'POST',
                async: true,
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    loadTableQualifications();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }
        
        function openWorkPlanningByGroupMatters(){
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $("#qualificationsCalEvaluationType").jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../serviceCalification?openWorkPlanningSE",
                data: {
                    "fkType": itemTypeEvaluation.value, 
                    "fkMatter": itemSubjectMatter.value,
                    "fkGroup": itemGroup.value,
                    "fkPeriod": itemPeriod.value
                },
                type: 'POST',
                async: true,
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    loadTableQualifications();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }
        function printReport(){
            itemSubjectMatter= $('#qualificationsSubjectMatterFilter').jqxDropDownList('getSelectedItem'); 
            itemGroup = $('#qualificationsGroupFilter').jqxDropDownList('getSelectedItem');
            itemPeriod = $('#qualificationsPeriodFilter').jqxDropDownList('getSelectedItem');
            itemTypeEvaluation = $('#qualificationsCalEvaluationType').jqxDropDownList('getSelectedItem');
            $.ajax({
                url: "../content/data-jr/recordsCalifications/index.jsp?session",
                data: { 
                    "pt_matter": itemSubjectMatter.value,
                    "pt_group": itemGroup.value,
                    "pt_period": itemPeriod.value,
                    "pt_evaluation_type" : itemTypeEvaluation.value
                },
                type: 'POST',
                beforeSend: function (xhr) {
                },
                success: function (data, textStatus, jqXHR) {
                    window.open("../content/data-jr/recordsCalifications");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error interno del servidor");                
                }
            });
        }       
        
        $('#okWarning').click(function (){            
            if($("#typeEval").val()==="average"){
                closeWorkPlanningByGroupMatters();
            }
        });
    });
</script>
<style>
    .disabled:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected), .jqx-widget .disabled:not(.jqx-grid-cell-hover):not(.jqx-grid-cell-selected) {
        color: #656565 !important;
        background-color: #E0E0E0 !important;
    }
    .approved{
        background-color: rgb(117, 201, 228) !important;
    }
    .not-approved{
        color: #656565 !important;
        background-color: #D7C1C1 !important;
    }
    .jqx-slider-tickscontainer{
        color: rgb(84, 146, 95) !important;
    }
</style>
<div style="display: inline-block; margin-right: 5px;">
    Nivel de estudio<br>
    <div id='qualificationsLevelFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Carrera <br>
    <div id='qualificationsCareerFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Plan de estudio<br>
    <div id='qualificationsStudyPlanFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Periodo <br>
    <div id='qualificationsPeriodFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Cuatrimestre<br>
    <div id='qualificationsSemesterFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Grupo<br>
    <div id='qualificationsGroupFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Materia<br>
    <div id='qualificationsSubjectMatterFilter'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    Tipo<br>
    <div id='qualificationsCalEvaluationType'></div>
</div>
<div style="display: inline-block; margin-right: 5px;">
    <div style="" id="tableQualifications"></div>
</div>
<div style="float: left; margin-top: 15px; margin-right: 15px; display: none" id="tableDescription2"></div>
<div style="float: left; margin-top: 15px; display: none" id="tableDescription"></div>