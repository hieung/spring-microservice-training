package com.brownfield.pss.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.brownfield.pss.book.component.BookingComponent;
import com.brownfield.pss.book.entity.BookingRecord;

@RestController
@CrossOrigin
@RequestMapping("/booking")
public class BookingController {
    private static final Logger LOG = LoggerFactory.getLogger(BookingController.class.getName());

    BookingComponent bookingComponent;

    @Autowired
    BookingController (BookingComponent bookingComponent) {
        this.bookingComponent = bookingComponent;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    long book (@RequestBody BookingRecord record) {
        LOG.info("Book : " + record);
        return bookingComponent.book(record);
    }

    @RequestMapping("/get/{id}")
    BookingRecord getBooking (@PathVariable long id) {
        LOG.info("GetBooking : " + id);
        return bookingComponent.getBooking(id);
    }
}
