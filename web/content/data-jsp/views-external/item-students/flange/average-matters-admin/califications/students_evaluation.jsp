<%-- 
    Document   : catalogos
    Created on : 14/02/2015, 09:47:03 AM
    Author     : CARLOS
--%>
<%
if(session.getAttribute("logueado") != null){%>
    <script>
        $(document).ready(function (){
            var tabActive;
            var selectedTab = $.cookie('tabActive');
            $('#jqxTabs').on('selected', function (event) { 
                selectedTab = event.args.item;
                $.cookie('tabActive',selectedTab);
            }); 
            $('#jqxTabs').jqxTabs({theme:theme,selectedItem:tabActive||0, width:'99.9%',height:'100%',scrollPosition: 'both', position: 'top',  collapsible: false }); 
            $("#evaluationStudentsTab").load("../content/data-jsp/views-external/item-students/flange/average-matters-admin/califications/students_evaluation-detail-flange/index.jsp");
        });
    </script>
    <div id='jqxTabs'>
        <ul>
            <li class="jqxTabsTitle" dir="update-data">Reporte evaluación de alumnos</li>
        </ul>
        <div>
            <div class="hidenTab" style="display: none;">
                <div id="evaluationStudentsTab" style="padding: 20px;"></div>
            </div>
        </div>
    </div>
<%}else{
    out.print("Pagina no encontrada");
    response.sendRedirect("index.jsp");
}%>