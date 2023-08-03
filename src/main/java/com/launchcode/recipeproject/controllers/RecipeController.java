package com.launchcode.recipeproject.controllers;

import com.launchcode.recipeproject.data.IngredientRepository;
import com.launchcode.recipeproject.data.RecipeRepository;
import com.launchcode.recipeproject.data.TagRepository;
import com.launchcode.recipeproject.data.UserRepository;
import com.launchcode.recipeproject.exceptions.ResourceNotFoundException;
import com.launchcode.recipeproject.models.Ingredient;
import com.launchcode.recipeproject.models.Recipe;
import com.launchcode.recipeproject.models.Tag;
import com.launchcode.recipeproject.models.User;
import com.launchcode.recipeproject.models.dto.RecipeIngredientDTO;
import com.launchcode.recipeproject.services.JpaUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Created by Sean Feuerhelm
 */

@Controller
@RequestMapping("recipe")
public class RecipeController {

    //Repositories----------------------------------
    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private IngredientRepository ingredientRepository;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    JpaUserDetailsService jpaUserDetailsService;

    @GetMapping("create")
    public String displayCreateRecipeForm(Model model){
        model.addAttribute("title", "Create Recipe");
        model.addAttribute("form", new RecipeIngredientDTO());
        model.addAttribute("tags", tagRepository.findAll());
        return "recipe/create";
    }

    @PostMapping("create")
    public String processCreateRecipeForm(@ModelAttribute ("form") @Valid RecipeIngredientDTO form,
                                          Errors errors, Model model, Principal principal) throws IOException{
        if(errors.hasErrors()){
            model.addAttribute("title", "Create Recipe");
            model.addAttribute("form", form);
            model.addAttribute("tags", tagRepository.findAll());
            return "recipe/create";
        }

        //For Loop to connect all ingredient objects to the recipe objects
        for (Ingredient ingredient : form.getIngredients()){
            ingredient.setRecipe(form.getRecipe());
            form.getRecipe().addIngredient(ingredient);
        }

        //For Loop to connect the tags to the recipe
        ArrayList<Tag> allTags = (ArrayList<Tag>) tagRepository.findAll();
        if (allTags.size() > 0){
            for (Tag tag : form.getTags()){
                form.getRecipe().addTag(tag);
            }
        }


        //Get user information and set it in the recipe
        User user; //TODO create a fake user until we turn on security
        Optional<User> result = userRepository.findByUsername("Temp_User");
        if (result.isPresent()){user = result.get();}
        else{user = new User("Temp_User", "Temp_User_Email@none.com", "Temp_Pass", "ROLE_USER"); userRepository.save(user);}
//        if (principal != null){ // TODO uncomment when security is turned on
//            System.out.println(principal.getName());
//            User user = jpaUserDetailsService.getUsername(principal.getName()); // send username, get back User or null
//        }

        form.getRecipe().setUser(user);
        user.addRecipe(form.getRecipe());

        // Add image path to Recipe and save the image
        String absolutePath = form.getRecipe().getUPLOAD_DIRECTORY() + form.getImage().getOriginalFilename();
        Files.write(Path.of((absolutePath)), form.getImage().getBytes()); // write image to hard drive
        form.getRecipe().setImagePath(form.getRecipe().getRELATIVE_PATH() + form.getImage().getOriginalFilename());

        //Must save recipe object before ingredient due to One-to-many relationship
        recipeRepository.save(form.getRecipe());
        ingredientRepository.saveAll(form.getIngredients());
        userRepository.save(user);

        return "redirect:view/" + form.getRecipe().getId();
    }

    @GetMapping("view/{recipeId}")
    public String displayRecipe(Model model, @PathVariable int recipeId){
        Optional optRecipe = recipeRepository.findById(recipeId);
        if (optRecipe.isPresent()){
            Recipe recipe = (Recipe)optRecipe.get();
            model.addAttribute("recipe", recipe);
            model.addAttribute("tags", tagRepository.findAll());
            model.addAttribute("title", "View Recipe");
            return "recipe/view";
        } else {
            model.addAttribute("title", "Recipe does not exist"); //TODO place holder for title
            return "recipe/notFound";
        }

    }

    //Editing Controllers ------------------------------------------------------

    @GetMapping("edit/{recipeId}")
    public String displayEditForm (Model model, @PathVariable int recipeId){

        Optional optRecipe = recipeRepository.findById(recipeId);

        if (optRecipe.isPresent()){
            Recipe recipeToEdit = (Recipe)optRecipe.get();
            RecipeIngredientDTO editForm = new RecipeIngredientDTO();
            editForm.setRecipe(recipeToEdit);
            editForm.setTags(recipeToEdit.getTags());
            editForm.setIngredients(recipeToEdit.getIngredientList());

            model.addAttribute("editForm", editForm);
            model.addAttribute("tags", tagRepository.findAll());
            model.addAttribute("title", "Edit Recipe");
            return "recipe/edit";
        } else {
            throw new ResourceNotFoundException("No recipe exists with the id: " + recipeId);
        }
    }

    @PostMapping("edit/{recipeId}")
    public String updateRecipe(@ModelAttribute ("editForm") @Valid RecipeIngredientDTO recipeDetails,
                               Errors errors, Model model,
                               @PathVariable int recipeId){

        if(errors.hasErrors()){
            model.addAttribute("title", "Edit Recipe");
            model.addAttribute("editForm", recipeDetails);
            model.addAttribute("tags", tagRepository.findAll());
            return "recipe/edit";
        }

        //Check if entry is in database, if not, throws exception
        Optional optRecipe = recipeRepository.findById(recipeId);
        if (optRecipe.isPresent()){
            //Converts optional into a recipe object
            Recipe recipeToEdit = (Recipe)optRecipe.get();

            //Separates DTO into more readable objects
            Recipe editedRecipe = recipeDetails.getRecipe();
            List<Ingredient> editedIngs = recipeDetails.getIngredients();

            //Uses getters and setter to update the original database object
            recipeToEdit.setName(editedRecipe.getName());
            recipeToEdit.setInstructions(editedRecipe.getInstructions());
            recipeToEdit.setPortionNum(editedRecipe.getPortionNum());

            //For each loop for updating each individual ingredient with getters and setters
            //TODO Allow Users to add new ingredients while editing
            int index = 0;
            for (Ingredient ing : recipeToEdit.getIngredientList()) {
                Optional optIng = ingredientRepository.findById(ing.getId());
                if (optIng.isPresent()) {
                    Ingredient ingToEdit = (Ingredient)optIng.get();
                    ingToEdit.setName(editedIngs.get(index).getName());
                    ingToEdit.setMeasurement(editedIngs.get(index).getMeasurement());
                    ingToEdit.setQuantity(editedIngs.get(index).getQuantity());
                    index++;
                }
            }
//            for (Ingredient newIng : editedIngs){
//                recipeToEdit.addIngredient(newIng);
//            }


            //Clear existing tags before Adding the updated tags
            recipeToEdit.clearTags();
            if (recipeDetails.getTags() != null) {
                for (Tag tag : recipeDetails.getTags()) {
                    recipeToEdit.addTag(tag);
                }
            }

            //Saves the updated ingredients and recipe
            recipeRepository.save(recipeToEdit);
            ingredientRepository.saveAll(recipeToEdit.getIngredientList());


            //redirects you to the updated view page
            return "redirect:view/" + recipeId;
        } else {
           throw new ResourceNotFoundException("No recipe exists with the id: " + recipeId);
        }
    }

    @GetMapping("delete/{recipeId}")
    private String deleteRecipe (@PathVariable int recipeId, Model model){
        Optional optRecipe = recipeRepository.findById(recipeId);
        if (optRecipe.isPresent()){
            recipeRepository.deleteById(recipeId);
        }
        model.addAttribute("title", "Recipe does not exist"); //TODO place holder for title
        return "recipe/notFound";
    }

    @PostMapping("convert/{recipeId}")
    private String convertRecipe (@PathVariable int recipeId,
                                  @ModelAttribute("portionNum") int newPortionNum,
                                  Model model){
        Optional optRecipe = recipeRepository.findById(recipeId);
        if (optRecipe.isPresent()){
            Recipe convertedRecipe = (Recipe) optRecipe.get();
            int oldPortionNum = convertedRecipe.getPortionNum();
            for (Ingredient ingredient : convertedRecipe.getIngredientList()){
                double convertedIngQuantity = (ingredient.getQuantity() / oldPortionNum) * newPortionNum;
                double convertedIngQuantityRounded = (Math.round(convertedIngQuantity*100)) / (double)100;
                ingredient.setQuantity(convertedIngQuantityRounded);
            }
            convertedRecipe.setPortionNum(newPortionNum);
            model.addAttribute("recipe", convertedRecipe);
            model.addAttribute("title", "Converted Recipe");
            model.addAttribute("tags", tagRepository.findAll());
            return "recipe/view";
        }
        model.addAttribute("title", "Recipe does not exist"); //TODO place holder for title
        return "recipe/notFound";
    }
}
