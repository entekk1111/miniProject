package com.miniProject.init.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfiguration {
	
	@Bean(name = "tilesConfigurer")
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"WEB-INF/tiles/tiles.xml"});
		configurer.setCheckRefresh(true);
		
		return configurer;
	}

	@Bean(name = "viewResolver")
	public ViewResolver viewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		resolver.setOrder(3);
		
		return resolver;
		
//		ContentNegotiatingViewResolver viewResolver = new ContentNegotiatingViewResolver();
//		viewResolver.setContentNegotiationManager(contentNegotiationManager);
//		// Add views to list
//		List<ViewResolver> resolvers = new ArrayList<>();
//		resolvers.add(totalDelegatingTilesViewResolver());
//		resolvers.add(totalDelegatingNonTilesViewResolver());
//		viewResolver.setViewResolvers(resolvers);
//		viewResolver.setOrder(1);
//		return viewResolver;
	}
}
