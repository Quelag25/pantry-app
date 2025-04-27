package com.pantry.analytics/service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DummyController {
    @GetMapping("/health")
    public String healthCheck() {
        return "analytics-service is up and running!";
    }
}
