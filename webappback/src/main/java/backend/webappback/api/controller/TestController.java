package backend.webappback.api.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class TestController {

    @PostMapping("/test")
    public String testApi() {
        try {
            String val = "자동감지가능?";
            
            return val;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
}




