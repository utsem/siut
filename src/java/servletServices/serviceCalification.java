/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletServices;

import control.calificationControl;
import control.evaluationTypeControl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.calificationModel;
import model.evaluationTypeModel;
import model.propetiesTableModel;
import model.subjectMattersModel;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Carlos
 */
@WebServlet(name = "serviceCalification", urlPatterns = {"/serviceCalification"})
public class serviceCalification extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("application/json"); 
            if(request.getParameter("view")!=null){
                if(request.getParameter("view").equals("calificationsNow")){
                    int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));
                    int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                    int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                    ArrayList<calificationModel> listStudents=new calificationControl().SelectCalificationNow(fkGroup, fkMatter, fkPeriod);
                    JSONArray principal = new JSONArray();
                    JSONObject settings = new JSONObject();
                    JSONArray content = new JSONArray();
                    settings.put("__entityModel","Students"); 
                    for(int i=0;i<listStudents.size();i++){
                        JSONObject datos = new JSONObject();
                        datos.put("id", i+1);
                        datos.put("dataProgresivNumber", i+1);
                        datos.put("dataPkCalification", listStudents.get(i).getPK_CALIFICATION());
                        datos.put("dataEnrollment", listStudents.get(i).getFL_ENROLLMENT());
                        datos.put("dataFkStudent", listStudents.get(i).getFK_STUDENT());
                        datos.put("dataStudentName", listStudents.get(i).getFL_NAME());
                        datos.put("dataCalificationBe", listStudents.get(i).getFL_CALIFICATION_BE());
                        datos.put("dataCalificationKnow", listStudents.get(i).getFL_CALIFICATION_KNOW());
                        datos.put("dataCalificationDo", listStudents.get(i).getFL_CALIFICATION_DO());
                        datos.put("dataAvg", listStudents.get(i).getFL_AVG());
                        content.add(datos); 
                    }
                    settings.put("__ENTITIES", content);
                    principal.add(settings);
                    response.setContentType("application/json"); 
                    out.print(principal);
                    out.flush(); 
                    out.close();
                }else if(request.getParameter("view").equals("recordsCalifications")){
                    int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));
                    int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                    int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                    int pkTypeEvaluation = Integer.parseInt(request.getParameter("pkTypeEvaluation"));
                    ArrayList<calificationModel> listStudents=new calificationControl().SelectCalificationRecordsAverage(fkGroup, fkMatter, fkPeriod, pkTypeEvaluation);
                    JSONArray principal = new JSONArray();
                    JSONObject settings = new JSONObject();
                    JSONArray content = new JSONArray();
                    settings.put("__entityModel","Students"); 
                    for(int i=0;i<listStudents.size();i++){
                        JSONObject datos = new JSONObject();
                        datos.put("id", i+1);
                        datos.put("dataProgresivNumber", i+1);
                        datos.put("dataPkCalification", listStudents.get(i).getPK_CALIFICATION());
                        datos.put("dataEnrollment", listStudents.get(i).getFL_ENROLLMENT());
                        datos.put("dataFkStudent", listStudents.get(i).getFK_STUDENT());
                        datos.put("dataStudentName", listStudents.get(i).getFL_NAME());
                        datos.put("dataCalificationBe", listStudents.get(i).getFL_CALIFICATION_BE());
                        datos.put("dataCalificationKnow", listStudents.get(i).getFL_CALIFICATION_KNOW());
                        datos.put("dataCalificationDo", listStudents.get(i).getFL_CALIFICATION_DO());
                        datos.put("dataLetter", listStudents.get(i).getFL_LETTER());
                        datos.put("dataAvg", listStudents.get(i).getFL_AVG());
                        content.add(datos); 
                    }
                    settings.put("__ENTITIES", content);
                    principal.add(settings);
                    response.setContentType("application/json"); 
                    out.print(principal);
                    out.flush(); 
                    out.close();
                }else if(request.getParameter("view").equals("recordsCalificationsDescription")){
                    ArrayList<calificationModel> listStudents=new calificationControl().SelectCalificationRecordsDescription();
                    JSONArray principal = new JSONArray();
                    JSONObject settings = new JSONObject();
                    JSONArray content = new JSONArray();
                    settings.put("__entityModel","Students"); 
                    for(int i=0;i<listStudents.size();i++){
                        JSONObject datos = new JSONObject();
                        datos.put("id", i+1);
                        datos.put("dataNoIntegradora", listStudents.get(i).getFL_NAME_DESCRIPTION_NOT_INTEGRADORAS());
                        datos.put("dataIntegradora", listStudents.get(i).getFL_NAME_DESCRIPTION_INTEGRADORAS());
                        content.add(datos);
                    }
                    settings.put("__ENTITIES", content);
                    principal.add(settings);
                    response.setContentType("application/json"); 
                    out.print(principal);
                    out.flush(); 
                    out.close();
                }
            }
            if(request.getParameter("getTypeEvaluations")!=null){
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                ArrayList<evaluationTypeModel> listItems=new evaluationTypeControl().SelectEvaluationType("all",fkGroup, fkMatter, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                settings.put("__entityModel","TypeEvaluations"); 
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("displayMember", listItems.get(i).getFL_NAME_TYPE());
                    datos.put("valueMember", listItems.get(i).getPK_EVALUATION_TYPE());
                    datos.put("status", listItems.get(i).getFL_STATUS());
                    content.add(datos);
                }
                settings.put("__ENTITIES", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();
            }
            if(request.getParameter("getTypeEvaluationsUnlocked")!=null){
                ArrayList<evaluationTypeModel> listItems=new evaluationTypeControl().SelectEvaluationTypeAll();
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                settings.put("__entityModel","TypeEvaluations"); 
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("displayMember", listItems.get(i).getFL_NAME_TYPE());
                    datos.put("valueMember", listItems.get(i).getPK_EVALUATION_TYPE());
                    content.add(datos);
                }
                settings.put("__ENTITIES", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();
            }
            if(request.getParameter("setObservations")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));  
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String flObservations = request.getParameter("flObservations");
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().SetObservations(fkType, fkMatter, fkGroup, fkPeriod, flObservations));               
            }
            if(request.getParameter("getObservations")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod")); 
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().GetObservations(fkType, fkMatter, fkGroup, fkPeriod));               
            }
            if(request.getParameter("setDateCloseES")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));  
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String flDateClosed = request.getParameter("flDateClosed");
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().SetDateCloseES(fkType, fkMatter, fkGroup, fkPeriod, flDateClosed));               
            }
            if(request.getParameter("setDatePrint")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));  
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String flDatePrint = request.getParameter("flDatePrint");
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().SetDatePrint(fkType, fkMatter, fkGroup, fkPeriod, flDatePrint));               
            }
            if(request.getParameter("getDateClosedES")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod")); 
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().GetDateClosedES(fkType, fkMatter, fkGroup, fkPeriod));               
            }
            if(request.getParameter("getDatePrint")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod")); 
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().GetDatePrint(fkType, fkMatter, fkGroup, fkPeriod));               
            }
            if(request.getParameter("closeWorkPlanningES")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("text/html;charset=UTF-8"); 
                response.setContentType("application/json");
                JSONObject datos = new JSONObject();
                datos.put("status", new calificationControl().CloseWorkPlanningByGroupMatterES(fkType, fkMatter, fkGroup, fkPeriod));
                out.print(datos);          
            }
            if(request.getParameter("closeWorkPlanning")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("text/html;charset=UTF-8"); 
                out.print(new calificationControl().CloseWorkPlanningByGroupMatter(fkType, fkMatter, fkGroup, fkPeriod));               
            }
            if(request.getParameter("teacherMissingCloseAcumulatedByStudent")!=null){
                int fkStudent = Integer.parseInt(request.getParameter("fkStudent"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                ArrayList<subjectMattersModel> listItems=new calificationControl().SubjectsMattersMissingCloseAcumulatedByStudent(fkStudent, fkType, fkGroup, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("dataPkTeacher", listItems.get(i).getPK_WORKER());
                    datos.put("dataNameTeacher", listItems.get(i).getFL_NAME_WORKER());
                    datos.put("dataPkSubjectMatter", listItems.get(i).getPK_SUBJECT_MATTER());
                    datos.put("dataNameSubjectMatter", listItems.get(i).getFL_NAME_SUBJECT_MATTER());
                    content.add(datos);
                }
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();                 
            }
            if(request.getParameter("teacherMissingCloseRegularizationByStudent")!=null){
                int fkStudent = Integer.parseInt(request.getParameter("fkStudent"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                ArrayList<subjectMattersModel> listItems=new calificationControl().SubjectsMattersMissingCloseRegularizationAndRepprovedByStudent(fkStudent, fkType, fkGroup, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("dataPkTeacher", listItems.get(i).getPK_WORKER());
                    datos.put("dataNameTeacher", listItems.get(i).getFL_NAME_WORKER());
                    datos.put("dataPkSubjectMatter", listItems.get(i).getPK_SUBJECT_MATTER());
                    datos.put("dataNameSubjectMatter", listItems.get(i).getFL_NAME_SUBJECT_MATTER());
                    content.add(datos);
                }
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();                 
            }
            if(request.getParameter("subjectsMattersRepprovedRegularizationByStudent")!=null){
                int fkStudent = Integer.parseInt(request.getParameter("fkStudent"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                ArrayList<subjectMattersModel> listItems=new calificationControl().SubjectsMattersRepprovedRegularizationByStudent(fkStudent, fkType, fkGroup, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("dataPkTeacher", listItems.get(i).getPK_WORKER());
                    datos.put("dataNameTeacher", listItems.get(i).getFL_NAME_WORKER());
                    datos.put("dataPkSubjectMatter", listItems.get(i).getPK_SUBJECT_MATTER());
                    datos.put("dataNameSubjectMatter", listItems.get(i).getFL_NAME_SUBJECT_MATTER());
                    content.add(datos);
                }
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();                 
            }
            if(request.getParameter("canPrint")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String canPrint =  new calificationControl().CanPrint(fkType, fkMatter, fkGroup, fkPeriod);
                ArrayList<subjectMattersModel> listItems=new calificationControl().TeacherMissingClose(fkType, fkMatter, fkGroup, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("dataPkTeacher", listItems.get(i).getPK_WORKER());
                    datos.put("dataNameTeacher", listItems.get(i).getFL_NAME_WORKER());
                    datos.put("dataPkSubjectMatter", listItems.get(i).getPK_SUBJECT_MATTER());
                    datos.put("dataNameSubjectMatter", listItems.get(i).getFL_NAME_SUBJECT_MATTER());
                    content.add(datos);
                }
                settings.put("canPrint", canPrint);
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();                 
            }
            if(request.getParameter("openWorkPlanning")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("application/json");
                JSONObject datos = new JSONObject();
                datos.put("status", new calificationControl().OpenWorkPlanningByGroupMatter(fkType, fkMatter, fkGroup, fkPeriod));
                out.print(datos);               
            }
            if(request.getParameter("openWorkPlanningSE")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                response.setContentType("application/json");
                JSONObject datos = new JSONObject();
                datos.put("status", new calificationControl().OpenWorkPlanningByGroupMatterES(fkType, fkMatter, fkGroup, fkPeriod));
                out.print(datos);               
            }
            if(request.getParameter("isCloseWorkPlanningES")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String closed =  new calificationControl().IsCloseWorkPlanningByGroupMatterES(fkType, fkMatter, fkGroup, fkPeriod);
                ArrayList<evaluationTypeModel> listItems=new evaluationTypeControl().SelectEvaluationType("all",fkGroup, fkMatter, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                settings.put("__entityModel","TypeEvaluations"); 
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("displayMember", listItems.get(i).getFL_NAME_TYPE());
                    datos.put("valueMember", listItems.get(i).getPK_EVALUATION_TYPE());
                    datos.put("status", listItems.get(i).getFL_STATUS());
                    content.add(datos);
                }
                settings.put("closed", closed);
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();          
            }
            if(request.getParameter("isCloseWorkPlanning")!=null){
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));
                int fkType = Integer.parseInt(request.getParameter("fkType"));  
                String closed =  new calificationControl().IsCloseWorkPlanningByGroupMatter(fkType, fkMatter, fkGroup, fkPeriod);
                ArrayList<evaluationTypeModel> listItems=new evaluationTypeControl().SelectEvaluationType("all",fkGroup, fkMatter, fkPeriod);
                JSONArray principal = new JSONArray();
                JSONObject settings = new JSONObject();
                JSONArray content = new JSONArray();
                settings.put("__entityModel","TypeEvaluations"); 
                for(int i=0;i<listItems.size();i++){
                    JSONObject datos = new JSONObject();
                    datos.put("displayMember", listItems.get(i).getFL_NAME_TYPE());
                    datos.put("valueMember", listItems.get(i).getPK_EVALUATION_TYPE());
                    datos.put("status", listItems.get(i).getFL_STATUS());
                    content.add(datos);
                }
                settings.put("closed", closed);
                settings.put("items", content);
                principal.add(settings);
                response.setContentType("application/json"); 
                out.print(principal);
                out.flush(); 
                out.close();          
            }
            if(request.getParameter("table")!=null){
                int fkCareer = Integer.parseInt(request.getParameter("fkCareer"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkSubjectMatter = Integer.parseInt(request.getParameter("fkSubjectMatter"));
                int fkEvaluationType = Integer.parseInt(request.getParameter("fkEvaluationType"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));     
                ArrayList<propetiesTableModel> listColumns=new calificationControl().SelectCalificationNowTutoringColumns(fkCareer, fkGroup, fkSubjectMatter, fkPeriod);
                JSONArray contentRowsCal=new calificationControl().SelectCalificationRows(fkCareer, fkGroup, fkSubjectMatter, fkEvaluationType, fkPeriod);
                JSONArray contentColums = new JSONArray();
                JSONArray contentDataFields = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rowsCal = new JSONObject();
                JSONObject columns = new JSONObject();
                JSONObject dataFields = new JSONObject();
              
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataColums = new JSONObject();
                    dataColums.put("text", "<div desc='"+listColumns.get(i).getFL_TEXT_EXTENDS()+"'>"+ listColumns.get(i).getFL_TEXT()+"</div>");
                    dataColums.put("datafield", listColumns.get(i).getFL_DATA_FIELD());
                    dataColums.put("align", listColumns.get(i).getFL_ALIGN());
                    dataColums.put("cellsalign", listColumns.get(i).getFL_CELLSALING());
                    if(listColumns.get(i).getFL_CELLSRENDERER()!=null){
                        dataColums.put("cellclassname", listColumns.get(i).getFL_CELLSRENDERER());
                    }
                    if(listColumns.get(i).getFL_PINNED()!=null){
                        dataColums.put("pinned", listColumns.get(i).getFL_PINNED());
                    }
                    if(listColumns.get(i).getFL_RENDERED()!=null){
                        dataColums.put("rendered", listColumns.get(i).getFL_RENDERED());
                    }
                    if(listColumns.get(i).getFL_COLUMNGROUP()!=null){
                        dataColums.put("columngroup", listColumns.get(i).getFL_COLUMNGROUP());
                    }
                    dataColums.put("width", listColumns.get(i).getFL_WIDHT());
                    contentColums.add(dataColums); 
                }
                for(int i=0;i<listColumns.size();i++){
                    JSONObject datadataFields = new JSONObject();
                    datadataFields.put("name", listColumns.get(i).getFL_DATA_FIELD());
                    datadataFields.put("type", "string");                    
                    contentDataFields.add(datadataFields); 
                }
                rowsCal.put("rowsCal", contentRowsCal);
                columns.put("columns", contentColums);
                dataFields.put("dataFields", contentDataFields);
                bulding.add(columns);
                bulding.add(dataFields);
                bulding.add(rowsCal);
                response.setContentType("application/json"); 
                out.print(bulding);
                out.flush(); 
                out.close();
            }
            
            if(request.getParameter("tableByAllCalificationsAverage")!=null){
                int fkCareer = Integer.parseInt(request.getParameter("fkCareer"));
                int pkSemester = Integer.parseInt(request.getParameter("pkSemester"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                ArrayList<propetiesTableModel> listColumns=new calificationControl().SelectCalificationBySubjectMattersAverage(fkCareer, pkSemester, fkGroup, fkPeriod);
                JSONArray contentRowsCal=new calificationControl().SelectCalificationsBySubjectMattersAverageRows(fkCareer, pkSemester, fkGroup, fkPeriod);
                JSONArray contentColums = new JSONArray();
                JSONArray contentDataFields = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rowsCal = new JSONObject();
                JSONObject columns = new JSONObject();
                JSONObject dataFields = new JSONObject();
              
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataColums = new JSONObject();
                    dataColums.put("text", "<div desc='"+listColumns.get(i).getFL_TEXT_EXTENDS()+"'>"+ listColumns.get(i).getFL_TEXT()+"</div>");
                    dataColums.put("datafield", listColumns.get(i).getFL_DATA_FIELD());
                    dataColums.put("align", listColumns.get(i).getFL_ALIGN());
                    dataColums.put("cellsalign", listColumns.get(i).getFL_CELLSALING());
                    if(listColumns.get(i).getFL_AGGREGATES()!=null){
                        dataColums.put("aggregates", listColumns.get(i).getFL_AGGREGATES());
                    }
                    if(listColumns.get(i).getFL_CELLSRENDERER()!=null){
                        dataColums.put("cellclassname", listColumns.get(i).getFL_CELLSRENDERER());
                    }
                    if(listColumns.get(i).getFL_PINNED()!=null){
                        dataColums.put("pinned", listColumns.get(i).getFL_PINNED());
                    }
                    if(listColumns.get(i).getFL_RENDERED()!=null){
                        dataColums.put("rendered", listColumns.get(i).getFL_RENDERED());
                    }
                    if(listColumns.get(i).getFL_COLUMNGROUP()!=null){
                        dataColums.put("columngroup", listColumns.get(i).getFL_COLUMNGROUP());
                    }
                    dataColums.put("width", listColumns.get(i).getFL_WIDHT());
                    contentColums.add(dataColums); 
                }
                for(int i=0;i<listColumns.size();i++){
                    JSONObject datadataFields = new JSONObject();
                    datadataFields.put("name", listColumns.get(i).getFL_DATA_FIELD());
                    datadataFields.put("type", "string");                    
                    contentDataFields.add(datadataFields); 
                }
                rowsCal.put("rowsCal", contentRowsCal);
                columns.put("columns", contentColums);
                dataFields.put("dataFields", contentDataFields);
                bulding.add(columns);
                bulding.add(dataFields);
                bulding.add(rowsCal);
                response.setContentType("application/json"); 
                out.print(bulding);
                out.flush(); 
                out.close();
            }
            
            if(request.getParameter("tableByAllActivities")!=null){
                int fkCareer = Integer.parseInt(request.getParameter("fkCareer"));
                int fkMatter = Integer.parseInt(request.getParameter("fkMatter"));
                int fkGroup = Integer.parseInt(request.getParameter("fkGroup"));
                int fkPeriod = Integer.parseInt(request.getParameter("fkPeriod"));   
                ArrayList<propetiesTableModel> listColumns=new calificationControl().SelectCalificationByActivitiesColums(fkCareer, fkGroup, fkMatter, fkPeriod);
                JSONArray contentRowsCal=new calificationControl().SelectCalificationsByActivitiesRows(fkCareer, fkMatter, fkGroup, fkPeriod);
                JSONArray contentColums = new JSONArray();
                JSONArray contentDataFields = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rowsCal = new JSONObject();
                JSONObject columns = new JSONObject();
                JSONObject dataFields = new JSONObject();
              
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataColums = new JSONObject();
                    dataColums.put("text", "<div desc='"+listColumns.get(i).getFL_TEXT_EXTENDS()+"'>"+ listColumns.get(i).getFL_TEXT()+"</div>");
                    dataColums.put("datafield", listColumns.get(i).getFL_DATA_FIELD());
                    dataColums.put("align", listColumns.get(i).getFL_ALIGN());
                    dataColums.put("cellsalign", listColumns.get(i).getFL_CELLSALING());
                    if(listColumns.get(i).getFL_CELLSRENDERER()!=null){
                        dataColums.put("cellclassname", listColumns.get(i).getFL_CELLSRENDERER());
                    }
                    if(listColumns.get(i).getFL_PINNED()!=null){
                        dataColums.put("pinned", listColumns.get(i).getFL_PINNED());
                    }
                    if(listColumns.get(i).getFL_RENDERED()!=null){
                        dataColums.put("rendered", listColumns.get(i).getFL_RENDERED());
                    }
                    if(listColumns.get(i).getFL_COLUMNGROUP()!=null){
                        dataColums.put("columngroup", listColumns.get(i).getFL_COLUMNGROUP());
                    }
                    dataColums.put("width", listColumns.get(i).getFL_WIDHT());
                    contentColums.add(dataColums); 
                }
                for(int i=0;i<listColumns.size();i++){
                    JSONObject datadataFields = new JSONObject();
                    datadataFields.put("name", listColumns.get(i).getFL_DATA_FIELD());
                    datadataFields.put("type", "string");                    
                    contentDataFields.add(datadataFields); 
                }
                rowsCal.put("rowsCal", contentRowsCal);
                columns.put("columns", contentColums);
                dataFields.put("dataFields", contentDataFields);
                bulding.add(columns);
                bulding.add(dataFields);
                bulding.add(rowsCal);
                response.setContentType("application/json"); 
                out.print(bulding);
                out.flush(); 
                out.close();
            }
            
            if(request.getParameter("actievementQuartely")!=null){
                response.setContentType("application/json"); 
                int pkPeriod = Integer.parseInt(request.getParameter("pkPeriod"));                     
                ArrayList<calificationModel> listColumns=new calificationControl().SelectActievementQuartely(0, pkPeriod, 0);
                JSONArray principal = new JSONArray();
                JSONArray contentRows = new JSONArray();
                JSONObject rows = new JSONObject();
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataRows = new JSONObject();
                    dataRows.put("dataProgresivNumber", i+1);
                    dataRows.put("dataYear", listColumns.get(i).getFL_YEAR());
                    dataRows.put("dataMonth", listColumns.get(i).getFL_MONTH());
                    dataRows.put("dataNameCareer", listColumns.get(i).getFL_NAME_CAREER());
                    dataRows.put("dataStudentsFinishedSemester", listColumns.get(i).getFL_STUDENTS_FINISHED_SEMESTER());
                    dataRows.put("dataStudentsFinishedSemesterAsAcumulated", listColumns.get(i).getFL_STUDENTS_FINISHED_SEMESTER_AS_ACUMULATED());
                    dataRows.put("dataStudentsFinishedSemesterAsRegularization", listColumns.get(i).getFL_STUDENTS_FINISHED_SEMESTER_AS_REGULARIZATION());
                    dataRows.put("dataStudentsFinishedSemesterAsGlobal", listColumns.get(i).getFL_STUDENTS_FINISHED_SEMESTER_AS_GLOBAL());
                    dataRows.put("dataStudentsFinishedSemesterAsRepproved", listColumns.get(i).getFL_STUDENTS_FINISHED_SEMESTER_AS_REPPROVED());
                    dataRows.put("dataAverageCareer", listColumns.get(i).getFL_AVG());
                    contentRows.add(dataRows); 
                }
                rows.put("rows", contentRows);   
                principal.add(rows);
                out.print(contentRows);
                
                out.flush(); 
                out.close();
            }
            
            if(request.getParameter("tableCalMattersStudent")!=null){
                int pkStudent = 0;
                if(session.getAttribute("pkStudent")!=null){
                    pkStudent = Integer.parseInt(session.getAttribute("pkStudent").toString());

                }
                if(request.getParameter("pkStudent")!=null){
                    pkStudent = Integer.parseInt(request.getParameter("pkStudent"));
                }        
                ArrayList<calificationModel> listColumns=new calificationControl().SelectCalificationNowStudent(pkStudent);
                JSONArray contentRows = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rows = new JSONObject();
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataRows = new JSONObject();
                    dataRows.put("dataNameSubjectMatter", listColumns.get(i).getFL_NAME_SUBJECT_MATTER());
                    dataRows.put("dataNameTeacher", listColumns.get(i).getFL_NAME_WORKER());
                    dataRows.put("dataObtained", listColumns.get(i).getFL_TOTAL_OBTAINED());
                    dataRows.put("dataEvaluated", listColumns.get(i).getFL_TOTAL_EVALUATED());
                    contentRows.add(dataRows); 
                }
                rows.put("rows", contentRows);
                bulding.add(rows);            
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "POST,PUT, GET, OPTIONS, DELETE");
                response.setHeader("Access-Control-Max-Age", "3600");
                response.setHeader("Access-Control-Allow-Headers"," Origin, X-Requested-With, Content-Type, Accept,AUTH-TOKEN");
                response.setContentType("application/json");
                out.print(bulding);
                out.flush(); 
                out.close();
            }
            if(request.getParameter("calMattersStudentChart")!=null){
                int pkStudent = 0;
                if(session.getAttribute("pkStudent")!=null){
                    pkStudent = Integer.parseInt(session.getAttribute("pkStudent").toString());

                }
                if(request.getParameter("pkStudent")!=null){
                    pkStudent = Integer.parseInt(request.getParameter("pkStudent"));
                }        
                ArrayList<calificationModel> listColumns=new calificationControl().SelectCalificationMattersStudent(pkStudent);
                JSONArray contentRows = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rows = new JSONObject();
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataRows = new JSONObject();
                    dataRows.put("index", i);
                    dataRows.put("Pk_matter", listColumns.get(i).getPK_SUBJECT_MATTER());
                    dataRows.put("Materias", listColumns.get(i).getFL_NAME_SUBJECT_MATTER());
                    dataRows.put("Profesor", listColumns.get(i).getFL_NAME_WORKER());
                    dataRows.put("MateriasAbre", "M"+(i+1));
                    dataRows.put("Evaluado", Double.parseDouble(listColumns.get(i).getFL_TOTAL_EVALUATED()));
                    dataRows.put("Obtenido", Double.parseDouble(listColumns.get(i).getFL_TOTAL_OBTAINED()));
                    contentRows.add(dataRows); 
                }
                rows.put("rows", contentRows);
                bulding.add(rows);            
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "POST,PUT, GET, OPTIONS, DELETE");
                response.setHeader("Access-Control-Max-Age", "3600");
                response.setHeader("Access-Control-Allow-Headers"," Origin, X-Requested-With, Content-Type, Accept,AUTH-TOKEN");
                response.setContentType("application/json");
                out.print(bulding);
                out.flush(); 
                out.close();
            }
            if(request.getParameter("tableCalMattersStudentHistory")!=null){
                int pkStudent = Integer.parseInt(session.getAttribute("pkStudent").toString()); 
                int pkPeriod = Integer.parseInt(request.getParameter("pkPeriod")); 
                ArrayList<calificationModel> listColumns=new calificationControl().SelectCalificationHistoryStudent(pkStudent, pkPeriod);
                JSONArray contentRows = new JSONArray();
                JSONArray bulding = new JSONArray();
                JSONObject rows = new JSONObject();
                for(int i=0;i<listColumns.size();i++){
                    JSONObject dataRows = new JSONObject();
                    dataRows.put("dataNameSubjectMatter", listColumns.get(i).getFL_NAME_SUBJECT_MATTER());
                    dataRows.put("dataAvg", listColumns.get(i).getFL_AVG());
                    contentRows.add(dataRows); 
                }
                rows.put("rows", contentRows);
                bulding.add(rows);                
                out.print(bulding);
                out.flush(); 
                out.close();
            }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
