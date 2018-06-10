package com.brownfield.pss.fares.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.brownfield.pss.fares.component.FaresComponent;
import com.brownfield.pss.fares.entity.Fare;

@RestController
@CrossOrigin
@RequestMapping("/fares")
public class FaresController {
    private static final Logger LOG = LoggerFactory.getLogger(FaresController.class);

    FaresComponent faresComponent;

    @Autowired
    FaresController (FaresComponent faresComponent) {
        this.faresComponent = faresComponent;
    }

    @RequestMapping("/get")
    Fare getFare (@RequestParam(value = "flightNumber") String flightNumber,
                  @RequestParam(value = "flightDate") String flightDate) {
        LOG.info("GetFare : " + flightNumber, flightDate);
        return faresComponent.getFare(flightNumber, flightDate);
    }
}
