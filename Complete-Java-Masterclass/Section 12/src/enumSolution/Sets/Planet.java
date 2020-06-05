package enumSolution.Sets;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class Planet extends HeavenlyBody {
    public Planet(String name, double orbitalPeriod) {
        super(name, BodyType.PLANET, orbitalPeriod);
    }

    @Override
    public boolean addSatellite(HeavenlyBody satellite) {
        if (satellite.getBodyType() == BodyType.MOON) {
            return super.addSatellite(satellite);
        } else {
            System.out.println("You can only add Moons to orbit a planet.");
            return false;
        }
    }
}
