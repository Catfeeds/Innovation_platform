package com.tech.service;

import com.tech.dao.CompeteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompeteService {
    @Autowired
    CompeteMapper competeMapper;

}
