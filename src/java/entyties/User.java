package entyties;

import java.util.ArrayList;
import java.util.List;

public class User {

    private int id;
    private String email;
    private String name;
    private double balance;
    private List<OrderLine> cart;

    public User(int id, String email, String name, double balance)
    {
        this.id = id;
        this.email = email;
        this.name = name;
        this.balance = balance;
        cart = new ArrayList<>();
    }

    /**
     * @return the username
     */
    public String getName()
    {
        return name;
    }
    /**
     * @return the balance
     */
    public double getBalance()
    {
        return balance;
    }

    public String getForBal()
    {
        String str = String.format("%.2f", balance);
        return str;
    }

    /**
     * @return the id
     */
    public int getId()
    {
        return id;
    }

    /**
     * @return the email
     */
    public String getEmail()
    {
        return email;
    }

    /**
     * @return the cart
     */
    public List<OrderLine> getCart()
    {
        return cart;
    }

    /**
     * @param balance the balance to set
     */
    public void setBalance(double balance)
    {
        this.balance = balance;
    }

}
