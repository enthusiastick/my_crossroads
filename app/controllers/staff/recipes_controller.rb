class Staff::RecipesController < ApplicationController
  before_action :authenticate_staff!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    @recipe = Recipe.new(params)
  end





end
