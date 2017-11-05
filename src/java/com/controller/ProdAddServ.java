package com.controller;

import com.dao.ProductDetailsImp;
import com.model.ProductDetails;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author hackey.jay
 */
public class ProdAddServ extends HttpServlet {
    private final String Dest="F:\\Study\\Notes\\Final Project\\OnlineBookKart\\web\\img\\Product_Img\\";
    static String filename="";
    static String Name,Desp;
    static int price,category;
    boolean fileCheck=false;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(false);
        if("POST".equalsIgnoreCase(request.getMethod())){
            if(ServletFileUpload.isMultipartContent(request)){
                try{
                    List<FileItem> Filepart= new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                    for(FileItem file:Filepart){                        
                        if(!file.isFormField()){                            
                            if("file".equals(file.getFieldName())){
                                if(file.getSize()!=0){
                                    String name= new File(file.getName()).getName();
                                    String ext= FilenameUtils.getExtension(name);
                                    String fullfile=new Random().nextInt()+new Random().toString()+"."+ext;
                                    ProdAddServ.filename="img/Product_Img/"+fullfile;                                
                                    file.write(new File(Dest+File.separator+fullfile));                              
                                    fileCheck=true;                                
                                }else{
                                    ProdAddServ.filename="img/Product_Img/default.png";
                                    fileCheck=true;
                                }
                                
                            }
                                
                        }                       
                        else if(file.isFormField()){
                            String prd_name=file.getFieldName();                                                        
                            switch (prd_name) {
                                case "p_name":
                                    String prodName=file.getString();
                                    ProdAddServ.Name=prodName;
                                    break;
                                case "sel_cat":
                                    String cat=file.getString();
                                    ProdAddServ.category=new Integer(cat);
                                    break;
                                case "price":
                                    String pri=file.getString();
                                    ProdAddServ.price=new Integer(pri);
                                    break;
                                case "desp":
                                    String descrip=file.getString();
                                    ProdAddServ.Desp=descrip;
                                    break;
                            }
                            fileCheck=true;
                        }
                    }
                    if(fileCheck==true){
                        ProductDetails prodAdd=new ProductDetails( ProdAddServ.category, ProdAddServ.price, ProdAddServ.Name, ProdAddServ.filename, ProdAddServ.Desp);
                        ProductDetailsImp prodDao=new ProductDetailsImp();
                        int status=prodDao.prodInsert(prodAdd);
                            if(status!=0){
                                System.out.println("Successfully Added...");                                    
                                session.setAttribute("success", "Product Added Successfully");                                    
                                response.sendRedirect("admin_home");
                            }else{
                                session.setAttribute("error", "Product not added Successfull process");
                                response.sendRedirect("admin_home");
                            }                        
                    }else{
                        session.setAttribute("error", "File not Uploaded Successfully");
                        response.sendRedirect("admin_home");
                    }
                }catch(FileUploadException fue){
                    System.out.println("File Exception::"+fue.getMessage());
                }catch(Exception e){
                    System.out.println("File Exception::"+e.getMessage());
                }                
            }
        }else{
            out.println("illegal mode...");
            request.setAttribute("error", "File not Uploaded Successfully");
            request.getRequestDispatcher("admin_home").forward(request, response);
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
