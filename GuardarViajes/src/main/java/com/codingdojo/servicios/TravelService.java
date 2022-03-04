package com.codingdojo.servicios;

import java.util.Date;
import java.util.List;
import java.util.Optional;

//...
import org.springframework.stereotype.Service;

import com.codingdojo.modelos.Travel;
import com.codingdojo.repositorios.TravelRepository;

@Service
public class TravelService {


 // agregar el repositorio de travel como una dependencia
	private final TravelRepository travelRepository;
 
 public TravelService(TravelRepository travelRepository) {
     this.travelRepository = travelRepository;
 }
 // devuelve todos los travel
 public List<Travel> allTravels() {
     return travelRepository.findAll();
 }
 // crea un travel
 public Travel createTravel(Travel t) {
     return travelRepository.save(t);
 }
 // recupera un travel
 public Travel findTravel(Long id) {
     Optional<Travel> optionalTravel = travelRepository.findById(id);
     if(optionalTravel.isPresent()) {
         return optionalTravel.get();
     } else {
         return null;
     }
 }

 //update un travel
 public Travel updateTravel(Long id, String name, String vendor, Double amount, String description) {
		Travel travel = new Travel(id,name, vendor,amount,description);
		travel.setId(id);
		return travelRepository.save(travel);
	}
 
 public void deleteTravel(Long id) {
		travelRepository.deleteById(id);
	}
}
