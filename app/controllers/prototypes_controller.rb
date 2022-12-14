class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create, :edit]
  before_action :move_to_index, only: [:destroy, :edit]



 def index
  @prototypes = Prototype.all
 end

 def new
  @prototype = Prototype.new
 end

 def create
  @prototype = Prototype.create(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render new_prototype_path
  end
  end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments

end

def edit
  @prototype = Prototype.find(params[:id])
end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to root_path
  else
    render :edit
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  render :index
end

 private
 def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

def move_to_index
  @prototype = Prototype.find(params[:id])
  unless current_user == @prototype_user
    redirect_to action: :index
  end
end

end