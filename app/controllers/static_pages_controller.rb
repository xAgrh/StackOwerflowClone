class StaticPagesController < ApplicationController
  def home
    
    @questions = Question.all
    
    render 'questions/index'
    
  end
end
