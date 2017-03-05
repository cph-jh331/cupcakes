package myexceptions;

public class TransactionFailureException extends Exception {

    public TransactionFailureException(String Message)
    {
        super(Message);
    }

}
