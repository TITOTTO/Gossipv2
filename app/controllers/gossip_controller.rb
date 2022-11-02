class GossipController < ApplicationController
    # before_action :retour_accueil, only: [:new]

  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments  # Permet d'afficher ou non les commentaires s'ils existent
    @nb = @comments.count
    @like = Like.find_by(gossip_id: params[:id]) != nil # Ces 2 lignes ne servent que pour la partie Like des Gossip
    @comment = Like.find_by(comment_id: params[:id]) != nil # Pour l'instant ça marche pas, le but c'est de like/dislike les commentaires
    @commentz = Like.find_by(comment_id: params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])
    if @gossip.save
      flash[:success] = "Le Gossip a été créé"
      redirect_to '/gossip'
    else
      render inline: @gossip.errors.full_messages
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params)
    redirect_to gossip_path(params[:id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = "Le Gossip a été supprimé"
    redirect_to users_path
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content)
  end
  def retour_accueil
    if !logged_in?
      redirect_to "/users"
      flash[:success] = "Vous n'êtes pas connecté"
    end
  end
end
