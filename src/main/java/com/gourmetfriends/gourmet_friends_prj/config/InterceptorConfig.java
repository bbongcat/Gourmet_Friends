package com.gourmetfriends.gourmet_friends_prj.config;


import com.gourmetfriends.gourmet_friends_prj.interceptor.LoginInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private LoginInterceptor authInterceptor;

    //인터셉터 설정 추가 메서드
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/board/*")
                .excludePathPatterns("/board/list","/board/get");
    }
}
