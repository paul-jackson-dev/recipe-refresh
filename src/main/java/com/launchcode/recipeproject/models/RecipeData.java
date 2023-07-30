package com.launchcode.recipeproject.models;

import java.util.*;

public class RecipeData {

    public static ArrayList<Recipe> findByColumnAndValue(String column, String value, Iterable<Recipe> allRecipes) {

        ArrayList<Recipe> results = new ArrayList<>();

        if (value.toLowerCase().equals("all")){
            return (ArrayList<Recipe>) allRecipes;
        }

        if (column.equals("all")){
            results = findByValue(value, allRecipes);
            return results;
        }
        for (Recipe recipe : allRecipes) {

            String aValue = getFieldValue(recipe, column);

            if (aValue != null && aValue.toLowerCase().contains(value.toLowerCase())) {
                results.add(recipe);
            }
        }

        return results;
    }

    public static String getFieldValue(Recipe recipe, String fieldName) {
        String theValue;
        if (fieldName.equals("name")){
            theValue = recipe.getName();
            System.out.println(recipe.getName());
        } else if (fieldName.equals("ingredients")){
            theValue = recipe.getIngredientList().toString();
            System.out.println(recipe.getIngredientList().toString());
        } else { //prints [com.launchcode.recipeproject.models.Tag@20] instead of tags
            theValue = recipe.getTags().toString().toString();
            System.out.println(recipe.getTags().toString().toString());
        }

        return theValue;
    }

    public static ArrayList<Recipe> findByValue(String value, Iterable<Recipe> allRecipes) {
        String lower_val = value.toLowerCase();

        ArrayList<Recipe> results = new ArrayList<>();

        for (Recipe recipe : allRecipes) {

            if (recipe.getName().toLowerCase().contains(lower_val)) {
                results.add(recipe);
            } else if (recipe.getIngredientList().toString().toLowerCase().contains(lower_val)) {
                results.add(recipe);
            } else if (recipe.getTags().toString().toLowerCase().contains(lower_val)) {
                results.add(recipe);
            } else if (recipe.toString().toLowerCase().contains(lower_val)) {
                results.add(recipe);
            }

        }

        return results;
    }

}
