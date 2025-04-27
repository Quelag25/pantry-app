package com.pantry.notification/service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DummyController {
    @GetMapping("/health")
    public String healthCheck() {
        return "notification-service is up and running!";
    }
}
