package mx.edu.utez.controller;

import com.google.gson.Gson;
import mx.edu.utez.model.category.BeanCategory;
import mx.edu.utez.model.games.BeanGames;
import mx.edu.utez.model.games.DaoGames;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig
@WebServlet(name = "ServletGame", urlPatterns = {"/readGames", "/creatGames", "/updateGames", "deleteGame"})
public class ServletGame extends HttpServlet {
    private Map map = new HashMap();
    final private Logger CONSOLE = LoggerFactory.getLogger(ServletGame.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("session") != null){
            //request.setAttribute("listGames", new DaoGames().findAll());
            //request.getRequestDispatcher("views/game/games.jsp").forward(request, response);
            map.put("listGames", new DaoGames().findAll());
            write(response, map);
        }else{
            request.getRequestDispatcher("/").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        BeanCategory beanCategory = new BeanCategory();
        BeanGames beanGames = new BeanGames();
        DaoGames daoGames = new DaoGames();
        switch (action){
            case "create":
                Part part = request.getPart("imagen");
                InputStream image = part.getInputStream();
                beanCategory.setIdCategory(Integer.parseInt(request.getParameter("idCategory")));

                beanGames.setName(request.getParameter("name"));
                beanGames.setdate_premiere(request.getParameter("date"));
                beanGames.setCategory_idCategory(beanCategory);
                boolean flag = daoGames.create(beanGames, image);

                if (flag){
                    map.put("message", "Se ha registrado correctamente");
                }else{
                    map.put("message", "No se registro correctamente");
                }
                break;
            case "update":
                beanCategory.setIdCategory(Integer.parseInt(request.getParameter("idCategory")));
                beanGames.setIdGames(Integer.parseInt(request.getParameter("idGame")));
                beanGames.setName(request.getParameter("name"));
                beanGames.setdate_premiere(request.getParameter("date"));
                beanGames.setCategory_idCategory(beanCategory);
                boolean flag1 = daoGames.update(beanGames);

                if (flag1){
                    map.put("message", "Se ha actualizado correctamente");
                }else{
                    map.put("message", "No se actualizado correctamente");
                }
                break;

            case "delete":
                if (new DaoGames().delete(Integer.parseInt(request.getParameter("idGame")))){
                    request.setAttribute("message", "Se ha eliminado correctamente");
                }else{
                    CONSOLE.error("No se ha eliminado correctamente");
                }
                break;

            default:
                //no supported
                request.getRequestDispatcher("/").forward(request, response);
                break;
        }

        response.sendRedirect(request.getContextPath() + "/readGames");
    }

    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException{
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(map));
    }
}
