package com.brownfield.pss.search.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Inventory {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "search_inventory_generator")
   	@SequenceGenerator(name = "search_inventory_generator", sequenceName = "seq_inventorysearch", allocationSize=1)
	long id;
    
    int count;
    
 
    public Inventory() {
		super();
	}

	public Inventory(int count) {
		super();
		this.count = count;
	}

 
 
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Inventory [id=" + id + ", count=" + count + "]";
	}
}
