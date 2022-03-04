package com.codingdojo.repositorios;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;


import com.codingdojo.modelos.Travel;

//...
@Repository
public interface TravelRepository extends CrudRepository<Travel, Long>{
 // este método recupera todos los travel de bd
 List<Travel> findAll();
 // este método encuentra travel con el ID
 List<Travel> findById(long id);
 // este método cuenta cuántos 
 Long countByNameContaining(String search);
 
 // este método elimina un libro que comienza con un título específico
 //Long deleteByTitleStartingWith(String search);
 
 //este método crea y puede auctualizar un registro
 @SuppressWarnings("unchecked")
	Travel save(Travel newTravel);
 
 //este método elimina 
 @Transactional
	Long deleteById (long id);
 
}
