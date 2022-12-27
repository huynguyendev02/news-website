package com.messi.king.messinews.controllers;

import com.messi.king.messinews.models.*;
import com.messi.king.messinews.services.*;
import com.messi.king.messinews.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/Home/*")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getPathInfo();
        if (url == null || url.equals("/")) {
            url = "/";
        }
        switch (url) {
            case "/":

                List <Articles> top10AllCate = ArticlesService.top10AllCate();
                List <Articles> top5AllCateInWeek = ArticlesService.top5AllCateInWeek();
                List <Articles> latestNewsAllCate = ArticlesService.latestNewsAllCate();
                List <Articles> newest10PerCate = ArticlesService.newest10PerCate();

                request.setAttribute("top10AllCate",  top10AllCate);
                request.setAttribute("top5AllCateInWeek", top5AllCateInWeek);
                request.setAttribute("latestNewsAllCate", latestNewsAllCate);
                request.setAttribute("newest10PerCate",newest10PerCate);

                ServletUtils.forward("/views/vwGeneral/General.jsp",request,response);
                break;
            case "/Details":
                int id=0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    ServletUtils.redirect("/views/204.jsp", request, response);

                }
                System.out.print(id);
                Articles art = ArticlesService.findById(id);
                if (art!=null) {
                    ArticlesService.viewArticle(id);

                    request.setAttribute("article",art);
                    request.setAttribute("related", ArticlesService.newsRelated(id));
                    request.setAttribute("comments", CommentService.findByArtId(id));
                    ServletUtils.forward("/views/vwGeneral/Details.jsp",request,response);
                } else {
                    ServletUtils.redirect("/views/204.jsp", request, response);
                }
                break;
            case "/ByPCat":
                getArticlesAndForward(1, request, response);
                break;
            case "/ByCat":
                getArticlesAndForward(2, request, response);
                break;
            case "/ByTag":
                getArticlesAndForward(3, request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
        }
    }

    private void getArticlesAndForward(int service, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {


        }
        List<Articles> arts = null;
        String title="";
        List<Categories> cate = null;
        switch (service){
            case 1:
                ParentCategories pcate = CategoriesService.findPCatById(id);
                if (pcate!= null) {
                    title = pcate.getName_parent_cate();
                    cate = CategoriesService.findAllByParentId(id);
                    arts = ArticlesService.findByPCatId(id);
                } else
                    ServletUtils.forward("/views/204.jsp",request,response);
                break;
            case 2:
                Categories newCate = CategoriesService.findById(id);
                title = newCate.getName_category();
                cate = CategoriesService.findAllByParentId(newCate.getParent_cate_id());
                arts = ArticlesService.findByCatId(id);
                break;
            case 3:
                title = TagsService.findById(id).getName_tags();
                arts = ArticlesService.findByTagId(id);
                break;
        }
        request.setAttribute("titleTopic", title);
        request.setAttribute("cateRelated", cate);
        request.setAttribute("articles",arts);
        ServletUtils.forward("/views/vwGeneral/Topic.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getPathInfo();
        switch (url) {
            case "/Details/Comment/Add":
                addComment(request, response);
                break;
            case "/Details/Comment/Edit":
                editComment(request, response);
                break;
            case "/Details/Comment/Delete":
                deleteComment(request,response);
                break;
            default:
                ServletUtils.forward("/views/204.jsp",request,response);
                break;
        }
    }

    private static void editComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int commentId=0;
        try {
            commentId = Integer.parseInt(request.getParameter("commentId"));
        } catch (NumberFormatException e) {
        }
        Comments comment = CommentService.findById(commentId);
        if (comment!=null){
            String content = request.getParameter("comment");
            CommentService.updateComment(commentId, content);

            ServletUtils.redirect(request.getServletPath(),request,response);

        } else {
            ServletUtils.redirect("/views/204.jsp", request, response);
        }
    }
    private static void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int commentId=0;
        try {
            commentId = Integer.parseInt(request.getParameter("commentId"));
        } catch (NumberFormatException e) {

        }
        Comments comment = CommentService.findById(commentId);
        if (comment!=null){

            CommentService.delete(commentId);
            ServletUtils.redirect(request.getServletPath(),request,response);

        } else {
            ServletUtils.redirect("/views/204.jsp", request, response);
        }
    }

    private static void addComment(HttpServletRequest request,HttpServletResponse response ) throws IOException {
        int artId=0;
        try {
            artId = Integer.parseInt(request.getParameter("artId"));
        } catch (NumberFormatException e) {

        }

        Articles art = ArticlesService.findById(artId);
        if (art!=null) {
            String comment = request.getParameter("comment");

            Users user = (Users) request.getSession().getAttribute("authUser");
            CommentService.add(user.getId(), artId,comment );

            ServletUtils.redirect(request.getServletPath(),request,response);
        }
    }
}
