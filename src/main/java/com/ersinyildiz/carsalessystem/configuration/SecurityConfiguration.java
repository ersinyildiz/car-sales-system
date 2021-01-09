package com.ersinyildiz.carsalessystem.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

import javax.sql.DataSource;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private DataSource dataSource;

    private final String USERS_QUERY = "select username, password, enabled from users where username=?";
    private final String ROLES_QUERY = "select u.username, r.name from users u \n" +
            "inner join user_roles ur on(u.id=ur.user_id) \n" +
            "inner join roles r on(ur.role_id=r.id) \n" +
            "where u.username=?";
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //http.authorizeRequests().antMatchers("/**/favicon.ico","/css/**","/js/**","/images/**","/login.html","/register","/","/index").permitAll();
        //http.authorizeRequests().antMatchers("/dashboard/**","/actuator/**").access("hasRole('ADMIN')");
        //http.authorizeRequests().anyRequest().authenticated();
        http.csrf().disable();
        http.authorizeRequests().antMatchers(HttpMethod.DELETE,"/owner/**").permitAll();
        http.formLogin().loginPage("/login.html").loginProcessingUrl("/login").failureUrl("/login.html?loginFailed=true");
        http.rememberMe().userDetailsService(userDetailsService);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .usersByUsernameQuery(USERS_QUERY)
                .authoritiesByUsernameQuery(ROLES_QUERY)
                .dataSource(dataSource);
    }
}
