package Sets;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/14/2019
 * Project: Section 12
 * Description: ...
 */

public final class HeavenlyBody {

    private final String name;
    private final int bodyType;
    private final double orbitalPeriod;
    private final Set<HeavenlyBody> satellites;

    private final static int STAR = 1;
    private final static int PLANET = 2;
    private final static int MOON = 3;
    private final static int ASTEROID = 4;
    private final static int COMET = 5;
    private final static int DWARF_PLANET = 6;

    public HeavenlyBody() {
        this("Untitled", 1, 0.00);
    }

    public HeavenlyBody(String name, int bodyType, double orbitalPeriod) {
        this.name = name;
        this.bodyType = bodyType;
        this.orbitalPeriod = orbitalPeriod;
        this.satellites = new HashSet<HeavenlyBody>();
    }

    public static HeavenlyBody createStar(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, STAR, orbitalPeriod);
    }

    public static HeavenlyBody createPlanet(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, PLANET, orbitalPeriod);
    }

    public static HeavenlyBody createMoon(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, MOON, orbitalPeriod);
    }

    public static HeavenlyBody createAsteroid(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, ASTEROID, orbitalPeriod);
    }

    public static HeavenlyBody createComet(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, COMET, orbitalPeriod);
    }

    public static HeavenlyBody createDwarfPlanet(String name, double orbitalPeriod) {
        return new HeavenlyBody(name, DWARF_PLANET, orbitalPeriod);
    }

    public String getName() {
        return name;
    }

    public int getBodyType() {
        return bodyType;
    }

    public double getOrbitalPeriod() {
        return orbitalPeriod;
    }

    public Set<HeavenlyBody> getSatellites() {
        return new HashSet<HeavenlyBody>(satellites);
    }

    public boolean addSatellite(HeavenlyBody satellite) {
        if (this.bodyType != 1 && this.bodyType != 2) {
            System.out.println("You can only add objects to orbit Stars and Planets");
            return false;
        }
        if (this.bodyType == 2 && satellite.getBodyType() != MOON) {
            System.out.println("You can only add moons to orbit planets");
            return false;
        }
        return this.satellites.add(satellite);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if ((obj == null) || (obj.getClass() != this.getClass())) {
            return false;
        }

        String objName = ((HeavenlyBody) obj).getName();
        int objType = ((HeavenlyBody) obj).getBodyType();
        return this.name.equals(objName) && this.bodyType == objType;
    }

    @Override
    public int hashCode() {
        return this.name.hashCode() + 57;
    }
}
