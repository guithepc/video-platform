package com.fmu.br.videoplatform;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class VideoplatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(VideoplatformApplication.class, args);
	}

}
