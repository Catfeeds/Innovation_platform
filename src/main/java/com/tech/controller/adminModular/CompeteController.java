package com.tech.controller.adminModular;

import com.tech.service.CompeteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CompeteController {
    @Autowired
    CompeteService competeService;
}
