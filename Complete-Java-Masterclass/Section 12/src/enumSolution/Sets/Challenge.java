package enumSolution.Sets;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/14/2019
 * Project: Section 12
 * Description: ...
 */

public class Challenge {

    private static Map<String, HeavenlyBody> solarSystem = new HashMap<>();
    private static Set<HeavenlyBody> planets = new HashSet<>();

    public static void main(String[] args) {
        HeavenlyBody temp = new Planet("Mercury", 88);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        temp = new Planet("Venus", 225);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        temp = new Planet("Earth", 365);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        HeavenlyBody tempMoon = new Moon("Moon", 27);
        solarSystem.put((temp.getName()+temp.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon);

        temp = new Planet("Mars", 687);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        tempMoon = new Moon("Deimos", 1.3);
        solarSystem.put((temp.getName()+temp.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Mars

        tempMoon = new Moon("Phobos", 0.3);
        solarSystem.put((temp.getName()+temp.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Mars

        temp = new Planet("Jupiter", 4332);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        tempMoon = new Moon("Io", 1.8);
        solarSystem.put((tempMoon.getName()+tempMoon.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Jupiter

        tempMoon = new Moon("Europa", 3.5);
        solarSystem.put((tempMoon.getName()+tempMoon.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Jupiter

        tempMoon = new Moon("Ganymede", 7.1);
        solarSystem.put((tempMoon.getName()+tempMoon.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Jupiter

        tempMoon = new Moon("Callisto", 16.7);
        solarSystem.put((tempMoon.getName()+tempMoon.getBodyType()), tempMoon);
        temp.addSatellite(tempMoon); // temp is still Jupiter

        temp = new Planet("Saturn", 10759);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        temp = new Planet("Uranus", 30660);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        temp = new Planet("Neptune", 165);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

        temp = new Planet("Pluto", 248);
        solarSystem.put((temp.getName()+temp.getBodyType()), temp);
        planets.add(temp);

//        // print out planets
//        System.out.println("Planets");
//        for(HeavenlyBody planet : planets) {
//            System.out.println("\t" + planet.getName());
//        }
//
//        // print out moons
//        HeavenlyBody body = solarSystem.get("Mars");
//        System.out.println("Moons of " + body.getName());
//        for(HeavenlyBody jupiterMoon: body.getSatellites()) {
//            System.out.println("\t" + jupiterMoon.getName());
//        }
//
//        Set<HeavenlyBody> moons = new HashSet<>();
//        for(HeavenlyBody planet : planets) {
//            moons.addAll(planet.getSatellites());
//        }
//
//        System.out.println("All Moons");
//        for(HeavenlyBody moon : moons) {
//            System.out.println("\t" + moon.getName());
//        }


        // Challenge Tests Start Here

        // Create new Pluto of type Dwarf Planet
        HeavenlyBody pluto = new DwarfPlanet("Pluto", 842);
        planets.add(pluto);
        solarSystem.put((pluto.getName()+pluto.getBodyType()), pluto);

        // Create Duplicate of Pluto
        HeavenlyBody plutoCopy = new DwarfPlanet("Pluto", 900);
        planets.add(plutoCopy); // should fail
        solarSystem.put((plutoCopy.getName()+plutoCopy.getBodyType()), plutoCopy); // should override

        System.out.println("Solar System Contents: (Map)");
        for(HeavenlyBody body : solarSystem.values()) {
            System.out.println(body.getName() + "\t|\tType: " + body.getBodyType() + " Orbit: " + body.getOrbitalPeriod());
        }

        System.out.println();
        System.out.println("Planets: (Set)");

        for(HeavenlyBody planet : planets) {
            System.out.println(planet.getName() + "| Type: " + planet.getBodyType() + " Orbit: " + planet.getOrbitalPeriod());
        }

    }
}
