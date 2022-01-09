package tw.finalproject.config;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	// 判斷權限
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	}
	

	// 判斷過濾器
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers(HttpMethod.GET, "/users/**").authenticated()
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST, "/users/**").authenticated()
		.antMatchers(HttpMethod.POST).permitAll()
		.anyRequest().authenticated()
		.and()
		.rememberMe()
		.tokenValiditySeconds(86400)
		.key("rememberMe-key")
		.and()
		.csrf().disable()
		.formLogin().loginPage("/login/page")
		.defaultSuccessUrl("/login/welcome");
	}
	
	// 判斷網址
	@Override
	public void configure(WebSecurity web) throws Exception {
	}
	
	
}
