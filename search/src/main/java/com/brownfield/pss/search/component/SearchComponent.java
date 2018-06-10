package com.brownfield.pss.search.component;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.brownfield.pss.search.controller.SearchQuery;
import com.brownfield.pss.search.entity.Flight;
import com.brownfield.pss.search.entity.Inventory;
import com.brownfield.pss.search.repository.FlightRepository;

@Component
public class SearchComponent {
	private FlightRepository flightRepository;
	private static final Logger logger = LoggerFactory.getLogger(SearchComponent.class);

	@Autowired
	public SearchComponent(FlightRepository flightRepository) {
		this.flightRepository = flightRepository;
	}

	public List<Flight> search(SearchQuery query) {
		List<Flight> flights = flightRepository.findByOriginAndDestinationAndFlightDate(query.getOrigin(),
				query.getDestination(), query.getFlightDate());
		List<Flight> searchResult = new ArrayList<Flight>();
		searchResult.addAll(flights);
		flights.forEach(flight -> {
			flight.getFares();
			int inv = flight.getInventory().getCount();
			if (inv < 0) {
				logger.info("Flight :" + flight.toString());
				searchResult.remove(flight);
			}
		});
		return searchResult;
	}

	public void updateInventory(String flightNumber, String flightDate, int inventory) {
		logger.info("Updating inventory for flight " + flightNumber + " innventory " + inventory);
		Flight flight = flightRepository.findByFlightNumberAndFlightDate(flightNumber, flightDate);
		Inventory inv = flight.getInventory();
		System.out.println("XXXX INVENTORY-"+inventory);
		inv.setCount(inventory);
		flightRepository.save(flight);
	}
}
