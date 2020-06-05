package enumSolution.Sets;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/16/2019
 * Project: Section 12
 * Description: ...
 */

public class Comet extends HeavenlyBody {
    public Comet(String name, double orbitalPeriod) {
        super(name, BodyType.COMET, orbitalPeriod);
    }
}
