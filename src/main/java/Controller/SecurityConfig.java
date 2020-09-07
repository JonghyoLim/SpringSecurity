/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author hyoku
 */


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    
 

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
  	 auth.inMemoryAuthentication()
                                    .withUser("bob").password("pass").roles("USER", "SuperAdmin")
                                    .and()
                                    .withUser("tom").password("pass").roles("USER", "Admin")
                                    .and()
                                    .withUser("mary").password("pass").roles("USER", "User");
      
                                      
    }

    
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
  	http.csrf().disable().authorizeRequests().antMatchers("/login").permitAll()
  			.antMatchers("/", "/*product*/**").access("hasRole('USER')")
//                        .antMatchers("/", "/*product*/**").anonymous()
                        .and()
  			.formLogin().defaultSuccessUrl("/product");
                        
    } 
    
   
  
    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

}

    

