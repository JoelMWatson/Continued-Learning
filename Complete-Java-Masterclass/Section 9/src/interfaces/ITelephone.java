package interfaces;

public interface ITelephone {
    public void powerOn();
    public void dial(String phoneNumber);
    public void answer();
    public boolean callPhone(String phoneNumber);
    public boolean isRinging();
}
