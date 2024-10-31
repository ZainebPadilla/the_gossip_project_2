class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
  end


  def new
    @gossip = Gossip.new
  end

  def create
    filtered_params = params.except(:authenticity_token, :commit) # Exclure les paramètres indésirables
    @gossip = Gossip.new(filtered_params.permit(:title, :content))
    @gossip.id = Gossip.all.length + 1
    @gossip = current_user

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      flash[:notice] = 'The super potin was successfully saved!'
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
       flash[:alert] = 'Error: please check the fields below.'
       render :new # Affiche la vue `new` en cas d'erreur
    end
  end

  def gossip_params
    params.permit(:title, :content)
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:notice] = 'Potin mis à jour !'
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = 'Potin supprimé !'
    redirect_to gossips_path, notice: 'Potin supprimé avec succès !'
  end

  def like
    @gossip = Gossip.find(params[:id])
    @gossip.like! if current_user 

    redirect_to gossip_path(@gossip)
  end

  def dislike
    @gossip = Gossip.find(params[:id])
    @gossip.dislike! if current_user 
    redirect_to gossip_path(@gossip)
  end


  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end


  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
