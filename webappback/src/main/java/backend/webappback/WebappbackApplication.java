package backend.webappback;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {
    DataSourceAutoConfiguration.class
})
public class WebappbackApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebappbackApplication.class, args);
	}

}
