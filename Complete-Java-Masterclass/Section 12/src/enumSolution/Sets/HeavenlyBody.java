package enumSolution.Sets;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/14/2019
 * Project: Section 12
 * Description: ...
 */

public abstract class HeavenlyBody {

    private final String name;
    private final BodyType bodyType;
    private final double orbitalPeriod;
    private final Set<HeavenlyBody> satellites;

    public enum BodyType {
        STAR,
        PLANET,
        MOON,
        ASTEROID,
        COMET,
        DWARF_PLANET
    }

    public HeavenlyBody() {
        this("Untitled", BodyType.STAR, 0.00);
    }
    public HeavenlyBody(String name, BodyType bodyType, double orbitalPeriod) {
        this.name = name;
        this.bodyType = bodyType;
        this.orbitalPeriod = orbitalPeriod;
        this.satellites = new HashSet<HeavenlyBody>();
    }


    public String getName() {
        return name;
    }

    public BodyType getBodyType() {
        return bodyType;
    }

    public double getOrbitalPeriod() {
        return orbitalPeriod;
    }

    public Set<HeavenlyBody> getSatellites() {
        return new HashSet<HeavenlyBody>(satellites);
    }

    public boolean addSatellite(HeavenlyBody satellite) {
        return this.satellites.add(satellite);
    }

    @Override
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if ((obj == null) || (obj.getClass() != this.getClass())) {
            return false;
        }

        String objName = ((HeavenlyBody) obj).getName();
        BodyType objType = ((HeavenlyBody) obj).getBodyType();
        if (this.name.equals(objName)) {
            return this.bodyType.equals(objType);
        }
        return false;
    }

    @Override
    public final int hashCode() {
        return this.name.hashCode() + 57 + this.bodyType.hashCode();
    }

    @Override
    public String toString() {
        return this.name + ": " + this.bodyType + ", " + this.orbitalPeriod;
    }
}
