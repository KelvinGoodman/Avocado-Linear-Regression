package avocado;

public class AvocadoRequest {
    private double price;
    private double dayOfYear;
    private boolean individual;
    private double zipCodeIncome;
    private double longCircumference;
    private double shortCircumference;
    private double weight;
    private boolean stem;
    private double googleRating;
    private boolean organic;
    private boolean mexicoGrown;
    private boolean peruGrown;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDayOfYear() {
        return dayOfYear;
    }

    public void setDayOfYear(double dayOfYear) {
        this.dayOfYear = dayOfYear;
    }

    public boolean isIndividual() {
        return individual;
    }

    public void setIndividual(boolean individual) {
        this.individual = individual;
    }

    public double getZipCodeIncome() {
        return zipCodeIncome;
    }

    public void setZipCodeIncome(double zipCodeIncome) {
        this.zipCodeIncome = zipCodeIncome;
    }

    public double getLongCircumference() {
        return longCircumference;
    }

    public void setLongCircumference(double longCircumference) {
        this.longCircumference = longCircumference;
    }

    public double getShortCircumference() {
        return shortCircumference;
    }

    public void setShortCircumference(double shortCircumference) {
        this.shortCircumference = shortCircumference;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public boolean isStem() {
        return stem;
    }

    public void setStem(boolean stem) {
        this.stem = stem;
    }

    public double getGoogleRating() {
        return googleRating;
    }

    public void setGoogleRating(double googleRating) {
        this.googleRating = googleRating;
    }

    public boolean isOrganic() {
        return organic;
    }

    public void setOrganic(boolean organic) {
        this.organic = organic;
    }

    public boolean isMexicoGrown() {
        return mexicoGrown;
    }

    public void setMexicoGrown(boolean mexicoGrown) {
        this.mexicoGrown = mexicoGrown;
    }

    public boolean isPeruGrown() {
        return peruGrown;
    }

    public void setPeruGrown(boolean peruGrown) {
        this.peruGrown = peruGrown;
    }
}
