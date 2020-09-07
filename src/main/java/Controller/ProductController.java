/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.QueryParam;
import model.Product;
import model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author hyoku
 */


@Controller
@RequestMapping("/product") 
@SessionAttributes("product")
public class ProductController {
    
    
    @Autowired
    ProductService service;
    
    @RequestMapping("")
    public ModelAndView getAgents(HttpSession sess, HttpServletRequest request) {
        
        if (request.isUserInRole("USER")){
            sess.setAttribute("uname", getLoggedInUserName());
            return new ModelAndView("/allProducts", "productList", service.getAllProducts());
        }
        else {
            throw new ForbiddenException();
        }
    }
    
    
    private String getLoggedInUserName() {
        Object principal = SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        
        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        }
        return principal.toString();
    }
    
    
    
    @GetMapping("/add")
    public ModelAndView displayProductForm() {
        return new ModelAndView("/addProduct", "product", new Product());
    }

    @PostMapping("/addProduct")
    public ModelAndView addProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, ModelMap model) {

        if (result.hasErrors()) {
            return new ModelAndView("/editBrewery");
        }
        System.out.println("Add Product!!!!!!!!!!!!!!!!!!!!!!");
        service.addAProduct(product);
        return new ModelAndView("redirect:/product/");
    }
    
    
    
        
    @GetMapping("/delete")
    public ModelAndView deleteProduct(@QueryParam("code") String code) {
  
        System.out.println("delete stuff!!");
        service.deleteAProduct(code);
        return new ModelAndView("redirect:/product/", "productList", service.getAllProducts());
    }

    
    
}
