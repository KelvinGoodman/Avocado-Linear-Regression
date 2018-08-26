package avocado;

public class AvocadoResponse {

    private final long id;
    private final double predictedRating;

    public AvocadoResponse(long id, double predictedRating) {
        this.id = id;
        this.predictedRating = predictedRating;
    }

    public long getId() {
        return id;
    }

    public double getPredictedRating() {
        return predictedRating;
    }
}