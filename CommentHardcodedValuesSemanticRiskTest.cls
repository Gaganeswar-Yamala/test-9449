/**
 * Test class for verifying comment hardcoded values semantic risk behavior.
 */
public class CommentHardcodedValuesSemanticRiskTest {

    public Decimal getRate() {
        return 0.18;
    }

    public Decimal getAmount() {
        return 99.99;
    }

    public Integer getCount() {
        return 7;
    }

    public Integer getLimit() {
        return 100;
    }

    public Integer getTimeout() {
        return 30;
    }

    public Integer getWindow() {
        return 15;
    }

    public String getStatus() {
        return 'ACTIVE';
    }

    public String getCode() {
        return 'A1';
    }

    public String getType() {
        return 'STANDARD';
    }

    public Boolean isEnabled() {
        return true;
    }

    public Decimal calculateValue(Decimal inputValue) {
        return inputValue * 1.25;
    }

    public Integer calculateScore(Integer baseScore) {
        return baseScore + 42;
    }

    public String buildKey(String prefixValue) {
        return prefixValue + '-DEFAULT';
    }
}
