package avocado;

import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AvocadoController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    @RequestMapping("/avocado")
    public AvocadoResponse avocado(@RequestBody AvocadoRequest request) {
        return new AvocadoResponse(counter.incrementAndGet(), AvocadoRater.rate(request));
    }
}