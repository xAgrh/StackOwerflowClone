class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
  
  def create
    @tag = Tag.new(tag_params)
    
    if @tag.save
      redirect_to tags_path
    else
      flash[:alert] = "Tag '#{@tag.name}' " + @tag.errors.messages[:name].to_s.gsub(/[^\w,\s,(!,?,.)]/, '')
    end
    
  end
  
  def tag_params
    params.require(:tag).permit(:name, :question_id)
  end
end
