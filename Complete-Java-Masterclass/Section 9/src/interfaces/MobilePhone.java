package interfaces;

public class MobilePhone implements ITelephone {

    private String myNumber;
    private boolean isRinging;
    private boolean isOn;

    public MobilePhone(String myNumber) {
        this.myNumber = myNumber;
        this.isRinging = false;
        this.isOn = false;
    }

    @Override
    public void powerOn() {
        this.isOn = true;
        System.out.println("Mobile phone turned on.");
    }

    @Override
    public void dial(String phoneNumber) {
        if (isOn) {
            System.out.println("Now ringing " + phoneNumber + " on mobile phone");
        } else {
            System.out.println("Phone is not powered on.");
        }
    }

    @Override
    public void answer() {
        if (this.isRinging) {
            System.out.println("Answering the mobile phone");
            this.isRinging = false;
        }
    }

    @Override
    public boolean callPhone(String phoneNumber) {
        if (phoneNumber.equals(myNumber) && isOn) {
            this.isRinging = true;
            System.out.println("Melody Playing");
        } else {
            this.isRinging = false;
        }
        return false;
    }

    @Override
    public boolean isRinging() {
        return this.isRinging;
    }
}
