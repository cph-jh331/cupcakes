package backend;

import cake.CakeBottom;
import cake.CakeTopping;
import entyties.CalcPrice;
import entyties.Order;
import entyties.OrderLine;
import entyties.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataAccessObject {

    private DBConnector dbc = new DBConnector();
    private Connection conn = dbc.connectDB();

    public User validateUser(String email, String password)
    {
        String sql = "select * from users where umail = ? && upass = ?;";

        try
        {
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setString(1, email);
            preStmt.setString(2, password);
            ResultSet rs = preStmt.executeQuery();
            if (rs.next())
            {

                int id = rs.getInt("uid");
                String name = rs.getString("uname");
                double balance = rs.getDouble("balance");

                return new User(id, email, name, balance);
            }

        } catch (SQLException ex)
        {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<CakeBottom> getAllCakeBottoms()
    {
        List<CakeBottom> bottomList = new ArrayList<>();
        String name;
        Double price;
        String sql = "select * from cakebottoms;";
        try
        {
            PreparedStatement preStmt = conn.prepareStatement(sql);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next())
            {
                name = rs.getString("bname");
                price = rs.getDouble("bprice");
                bottomList.add(new CakeBottom(name, price));
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bottomList;
    }

    public List<CakeTopping> getAllCakeToppings()
    {
        List<CakeTopping> bottomList = new ArrayList<>();
        String name;
        Double price;
        String sql = "select * from caketoppings;";
        try
        {
            PreparedStatement preStmt = conn.prepareStatement(sql);
            ResultSet rs = preStmt.executeQuery();
            while (rs.next())
            {
                name = rs.getString("tname");
                price = rs.getDouble("tprice");
                bottomList.add(new CakeTopping(name, price));
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bottomList;
    }

    public int getOidForAddOrder(User user)
    {
        String sql = "select * from orders where uid = ? order by oid desc;";
        try
        {
            PreparedStatement preStmt = conn.prepareStatement(sql);
            preStmt.setInt(1, user.getId());
            ResultSet rs = preStmt.executeQuery();
            if (rs.next())
            {
                return rs.getInt("oid");
            }
        } catch (SQLException ex)
        {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

//    public List<Order> getOrders(User user)
//    {
//        List<Order> orderList = new ArrayList<>();
//        String sqlOrders = "select *from orders where uid = ?;";
//        String sqlLines = "select * from odetails where oid = ?;";
//        try
//        {
//            PreparedStatement preStmt = conn.prepareStatement(sqlOrders);
//            preStmt.setInt(1, user.getId());
//            ResultSet rs = preStmt.executeQuery();
//            while (rs.next())
//            {
//                int oid = rs.getInt("oid");
//                int uid = rs.getInt("uid");
//                double price = rs.getDouble("price");
//                String date = rs.getString("odate");
//                Order order = new Order(oid, uid, price, date);
//                orderList.add(order);
//            }
//            
//            for (Order order : orderList)
//            {
//                
//            }
//
//            
//            
//
//        } catch (SQLException ex)
//        {
//            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

    public void addOrderToDatabase(List<OrderLine> cartList, User user)
    {
        CalcPrice calc = new CalcPrice(cartList, user);
        String insertOrder = "insert into orders (uid, price) values (?,?);";
        String insertOdetails = "insert into odetails values (?, ?, ? ,?)";
        String updateBalance = "update users set balance = ? where uid = ?";
        try
        {
            PreparedStatement preStmtOrder = conn.prepareStatement(insertOrder);
            preStmtOrder.setInt(1, user.getId());
            preStmtOrder.setDouble(2, calc.getTotalPrice());
            preStmtOrder.executeUpdate();

            int oid = getOidForAddOrder(user);
            for (OrderLine orderLine : cartList)
            {
                PreparedStatement preStmtDetail = conn.prepareStatement(insertOdetails);
                preStmtDetail.setInt(1, oid);
                preStmtDetail.setString(2, orderLine.getToppingName());
                preStmtDetail.setString(3, orderLine.getBottomName());
                preStmtDetail.setInt(4, orderLine.getQuantity());
                preStmtDetail.executeUpdate();
            }

            PreparedStatement preStmtBalance = conn.prepareStatement(updateBalance);
            preStmtBalance.setDouble(1, calc.getBalance());
            preStmtBalance.setInt(2, user.getId());
            preStmtBalance.executeUpdate();

        } catch (SQLException ex)
        {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
