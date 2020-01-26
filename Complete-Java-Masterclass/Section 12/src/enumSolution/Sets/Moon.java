package enumSolution.Sets;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class Moon extends HeavenlyBody {
    public Moon(String name, double orbitalPeriod) {
        super(name, BodyType.MOON, orbitalPeriod);
    }
}
