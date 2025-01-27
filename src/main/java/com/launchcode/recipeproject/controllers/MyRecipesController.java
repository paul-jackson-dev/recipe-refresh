package com.launchcode.recipeproject.controllers;

import com.launchcode.recipeproject.data.RecipeRepository;
import com.launchcode.recipeproject.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.security.Principal;
import com.launchcode.recipeproject.services.ControllerServices;

@Controller
public class MyRecipesController {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    ControllerServices controllerServices;

    @GetMapping("/profile/myRecipes")
    public String displayMyRecipes(Model model, Principal principal){
        User user = controllerServices.getUser(principal);
//        if (user == null) {
//            model.addAttribute("title", "login");
//            return "/login";
//        }
        int userId = user.getId();
        model.addAttribute("recipes", recipeRepository.findByUserId(userId));
        return "/profile/myRecipes";
    }

    @GetMapping("/profile")
    public String displayProfile(Model model, Principal principal){
        User user = controllerServices.getUser(principal);
//        if (user == null) {
//            model.addAttribute("title", "login");
//            return "/login";
//        }
        int userId = user.getId();

        model.addAttribute("user", user);
        return "/profile/profile";
    }
}

