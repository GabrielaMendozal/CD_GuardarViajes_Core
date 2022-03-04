package com.codingdojo.controladores;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.modelos.Travel;
import com.codingdojo.servicios.TravelService;

@Controller
public class TravelController {
	private final TravelService travelService;
	
	public TravelController(TravelService travelService){   //constructor
        this.travelService = travelService;
    }
	
//empiezo a definir rutas
    
	@RequestMapping(value ="/", method = RequestMethod.GET)
    public String despliegaIndex(Model model, @ModelAttribute("travel")Travel newTravel) {  //model atributo de lista
    	List<Travel> listaTravels = travelService.allTravels();
    	model.addAttribute("listaTravels", listaTravels);
    	return "index.jsp";
    }
    
   
    
    @RequestMapping(value ="/expenses", method = RequestMethod.GET)
    public String despliegaTravels(Model model, @ModelAttribute("travel")Travel newTravel) {  //model atributo de lista
    	List<Travel> listaTravels = travelService.allTravels();
    	model.addAttribute("listaTravels", listaTravels);
    	return "index.jsp";
    }
    
    
    @RequestMapping( value="/expenses/registrar", method=RequestMethod.POST)
	public String registrarTravel(Model model, @Valid @ModelAttribute("travel")Travel newTravel,BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("ENTRANDO AL");
			List<Travel> listaTravels = travelService.allTravels();
			model.addAttribute("listaTravels", listaTravels);
			return "index.jsp";
		}
		else {
		//System.out.println(nuevoUsuario.getNombre());
			travelService.createTravel(newTravel);
			
			return "redirect:/expenses";
	    }	
	}
    
    @RequestMapping( value="/expenses/{id}", method = RequestMethod.GET)
	public String showTravel(@PathVariable("id") Long id, Model model) {
    	Travel travel = travelService.findTravel(id);
    	model.addAttribute("travel", travel);
		return "show.jsp";
	}
    
    @RequestMapping(value="/expenses/edit/{id}", method = RequestMethod.GET)
    public String despliegaEdicionTravel(@PathVariable("id") Long id, Model model) {
    	Travel travel = travelService.findTravel(id);
    	model.addAttribute("travel", travel);
    	return "edit.jsp";
    }
    
    @RequestMapping( value="/expenses/{id}/editar", method = RequestMethod.PUT)
	public String editarTravel(@Valid @PathVariable("id") Long id, Model model, @ModelAttribute("travel")Travel editarTravel) {
    	travelService.updateTravel(editarTravel.getId(), editarTravel.getName(), editarTravel.getVendor(), editarTravel.getAmount(), editarTravel.getDescription());
		return "redirect:/expenses";
	}
    
    @RequestMapping( value="/eliminar/{id}", method = RequestMethod.DELETE)
	public String eliminarTravel(@PathVariable("id") Long id ) {
		travelService.deleteTravel(id);
		return "redirect:/expenses";
	}
	
}
