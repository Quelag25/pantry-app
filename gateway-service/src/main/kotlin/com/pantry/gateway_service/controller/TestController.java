package com.pantry.gateway_service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;

@RestController
@RequestMapping("/")
public class TestController {

    @Value("${spring.application.name}")
    private String serviceName;

    @GetMapping("/hello")
    public String hello() {
        return "Hello from " + serviceName + "!";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}
