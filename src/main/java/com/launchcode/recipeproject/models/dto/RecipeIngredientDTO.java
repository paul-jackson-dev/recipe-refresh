package com.launchcode.recipeproject.models.dto;

import com.launchcode.recipeproject.models.Comment;
import com.launchcode.recipeproject.models.Ingredient;
import com.launchcode.recipeproject.models.Instruction;
import com.launchcode.recipeproject.models.Recipe;
import com.launchcode.recipeproject.models.Tag;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

public class RecipeIngredientDTO{
    @NotNull
    @Valid
    private Recipe recipe;

    @NotNull
    @Valid
    private List<Ingredient> ingredients;

    private List<Tag> tags;

    private ArrayList<Comment> comments;

    private MultipartFile image;

    @NotNull
    @Valid
    private List<Instruction> instructions;

    public RecipeIngredientDTO(Recipe recipe) {
        this.recipe = recipe;
        this.ingredients = new ArrayList<>();
    }

    public RecipeIngredientDTO() {}

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public void addIngredient(Ingredient ingredient){
        this.ingredients.add(ingredient);
    }

    //TESTING
    public ArrayList<Comment> getComments() { return comments; }

    public void setComments(ArrayList<Comment> comments) { this.comments = comments; }

    public void addComment(Comment comment){
        this.comments.add(comment);
    }
    //TESTING

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public void addTag(Tag tag){
        this.tags.add(tag);
    }

    public List<Instruction> getInstructions() {
        return instructions;
    }

    public void setInstructions(List<Instruction> instructions) {
        this.instructions = instructions;
    }
}
