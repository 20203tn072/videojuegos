package mx.edu.utez.model.games;

import mx.edu.utez.model.category.BeanCategory;
import mx.edu.utez.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class DaoGames {
    private Connection con;
    private CallableStatement cstm;
    private ResultSet rs;
    final private Logger CONSOLE = LoggerFactory.getLogger(DaoGames.class);

    public List<BeanGames> findAll(){
        List<BeanGames> listGames = new ArrayList<>();

        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_findGames}");
            rs = cstm.executeQuery();

            while (rs.next()){
                BeanCategory beanCategory = new BeanCategory();
                BeanGames beanGames = new BeanGames();

                beanCategory.setIdCategory(rs.getInt("idCategory"));
                beanCategory.setName(rs.getString("name"));
                beanCategory.setStatus(rs.getInt("status"));

                beanGames.setIdGames(rs.getInt("idGames"));
                beanGames.setName(rs.getString("name"));
                String photo = Base64.getEncoder().encodeToString(rs.getBytes("imgGames"));
                beanGames.setdate_premiere(rs.getString("datePremiere"));
                beanGames.setStatus(rs.getInt("status"));
                beanGames.setCategory_idCategory(beanCategory);

                listGames.add(beanGames);
            }
        }catch(SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }
        return listGames;
    }

    public BeanGames findById(int idGames){
        BeanGames beanGames = null;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("SELECT * FROM games AS G INNER JOIN category AS C ON G.idCategory_idCategory = C.idCategory WHERE G.idGame = ?");
            cstm.setLong(1, idGames);
            rs = cstm.executeQuery();

            if (rs.next()){
                BeanCategory beanCategory = new BeanCategory();
                beanGames = new BeanGames();

                beanCategory.setIdCategory(rs.getInt("idCategory"));
                beanCategory.setName(rs.getString("name"));
                beanCategory.setStatus(rs.getInt("status"));

                beanGames.setIdGames(rs.getInt("idGames"));
                beanGames.setName(rs.getString("name"));
                String photo = Base64.getEncoder().encodeToString(rs.getBytes("imgGames"));
                beanGames.setdate_premiere(rs.getString("datePremiere"));
                beanGames.setStatus(rs.getInt("status"));
                beanGames.setCategory_idCategory(beanCategory);
            }
        }catch (SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());

        }finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }
        return beanGames;
    }

    public boolean create(BeanGames beanGames, InputStream image){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?)}");
            cstm.setBlob(1, image);

            cstm.setString(1, beanGames.getName());
            cstm.setString(2, beanGames.getImgGame());
            cstm.setString(3, beanGames.getdate_premiere());
            cstm.setInt(4, beanGames.getCategory_idCategory().getIdCategory());
            cstm.execute();
            flag = true;
        }catch (SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }

    public boolean update(BeanGames beanGames){
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?)}");

            cstm.setString(1, beanGames.getName());
            cstm.setString(2, beanGames.getImgGame());
            cstm.setString(3, beanGames.getdate_premiere());
            cstm.setInt(4, beanGames.getCategory_idCategory().getIdCategory());
            cstm.setInt(5,beanGames.getIdGames());

            flag = cstm.execute();
        }catch (SQLException e){
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }

    public boolean delete(long idGame) {
        boolean flag = false;
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setLong(1, idGame);

            flag = cstm.execute();
        } catch (SQLException e) {
            CONSOLE.error("Ha ocurrido un error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm);
        }
        return flag;
    }
}
