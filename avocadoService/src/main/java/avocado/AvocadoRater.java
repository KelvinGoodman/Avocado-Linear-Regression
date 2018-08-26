package avocado;

public class AvocadoRater {
    private static final double INTERCEPT_TERM =  -1.169669;
    private static final double COEF_PRICE =  -0.484528;
    private static final double COEF_DOY =  1.113860;
    private static final double COEF_INDIVIDUAL = 1.115386;
    private static final double COEF_ZIP_CODE_INCOME = 0.000008;
    private static final double COEF_LONG_CIRC = 0.215826;
    private static final double COEF_SHORT_CIRC =  -0.560548;
    private static final double COEF_LONG_TO_SHORT = -1.530362;
    private static final double COEF_WEIGHT =  0.068578;
    private static final double COEF_VOLUME =  -0.052601;
    private static final double COEF_DENSITY = -1.402387;
    private static final double COEF_STEM =  -0.192826;
    private static final double COEF_GOOGLE_RATING = 2.848769;
    private static final double COEF_ORGANIC = 0.580801;
    private static final double COEF_MEXICO = -0.535751;
    private static final double COEF_PERU = -0.633918;

    public static double rate (AvocadoRequest request){
        double rating = INTERCEPT_TERM;
        rating += request.getPrice() * COEF_PRICE;
        rating += continuousDOY(request.getDayOfYear()) * COEF_DOY;
        rating = request.isIndividual() ? rating + COEF_INDIVIDUAL : rating;
        rating += request.getZipCodeIncome() * COEF_ZIP_CODE_INCOME;
        rating += request.getLongCircumference() * COEF_LONG_CIRC;
        rating += request.getShortCircumference() * COEF_SHORT_CIRC;
        rating += (request.getLongCircumference() / request.getShortCircumference()) * COEF_LONG_TO_SHORT;
        rating += request.getWeight() * COEF_WEIGHT;
        rating += approxVolume(request.getLongCircumference(), request.getShortCircumference()) * COEF_VOLUME;
        rating += approxDensity(request.getLongCircumference(), request.getShortCircumference(), request.getWeight()) * COEF_DENSITY;
        rating = request.isStem() ? rating + COEF_STEM : rating;
        rating += request.getGoogleRating() * COEF_GOOGLE_RATING;
        rating = request.isOrganic() ? rating + COEF_ORGANIC : rating;
        rating = request.isMexicoGrown() ? rating + COEF_MEXICO : rating;
        rating = request.isPeruGrown() ? rating + COEF_PERU : rating;
        return rating;
    }

    private static double approxVolume(double longCirc, double shortCirc){
        double longR = longCirc / (2 * Math.PI);
        double shortR = shortCirc / (2 * Math.PI);

        double volume = (Math.PI * 4 / 3) * Math.pow((longR + shortR) / 2, 3);
        return volume;
    }

    private static double approxDensity(double longCirc, double shortCirc, double weight){
        return weight / approxVolume(longCirc, shortCirc);
    }

    private static double continuousDOY(double day){
        return Math.cos((2 * Math.PI * day / 365) + Math.PI) + 1;
    }
}
