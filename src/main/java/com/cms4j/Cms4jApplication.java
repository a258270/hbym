package com.cms4j;

import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;

@SpringBootApplication
public class Cms4jApplication extends SpringBootServletInitializer {

	@Value("${spring.profiles.active}")
	private String active;

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		return (container -> {
			ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401");
			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404");
			ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500");

			container.addErrorPages(error401Page, error404Page, error500Page);
		});
	}

	@Bean
	public EmbeddedServletContainerFactory servletContainerFactory() {
		TomcatEmbeddedServletContainerFactory factory =
			new TomcatEmbeddedServletContainerFactory() {
				@Override
				protected void postProcessContext(Context context) {
					//SecurityConstraint必须存在，可以通过其为不同的URL设置不同的重定向策略。
					SecurityConstraint securityConstraint = new SecurityConstraint();
					securityConstraint.setUserConstraint("CONFIDENTIAL");
					SecurityCollection collection = new SecurityCollection();
					collection.addPattern("/*");
					securityConstraint.addCollection(collection);
					context.addConstraint(securityConstraint);
				}
			};
		factory.addAdditionalTomcatConnectors(createHttpConnector());
		return factory;
	}

	private Connector createHttpConnector() {
		Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
		connector.setScheme("http");
		connector.setSecure(false);
		if("dev".equals(active)) {
			connector.setPort(80);
			connector.setRedirectPort(443);
		}
		else if("pro".equals(active)) {
			connector.setPort(8080);
			connector.setRedirectPort(443);
		}

		return connector;
	}

	public static void main(String[] args) {
		SpringApplication.run(Cms4jApplication.class, args);
	}
}
