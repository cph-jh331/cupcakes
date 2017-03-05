package entyties;

import java.util.List;

public class CalcPrice {

    private double totalPrice;
    private double balance;

    public CalcPrice(List<OrderLine> cartList, User user)
    {
        this.balance = user.getBalance();
        calculatePrice(cartList);
        calcUserBalance();
        user.setBalance(balance);

    }

    private void calculatePrice(List<OrderLine> cartList)
    {
        totalPrice = 0;
        for (OrderLine orderLine : cartList)
        {
            totalPrice += orderLine.getPrice();
        }
    }

    private void calcUserBalance()
    {
        balance = getBalance() - getTotalPrice();
    }

    /**
     * @return the totalPrice
     */
    public double getTotalPrice()
    {
        return totalPrice;
    }

    /**
     * @return the balance
     */
    public double getBalance()
    {
        return balance;
    }

}
