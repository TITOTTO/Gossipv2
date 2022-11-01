class GossipController < ApplicationController
  def index
    @gossip = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
  end

  def new
    @gossip = Gossip.new
    @user_id = params[:user_id]
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: params[:user_id])
    if @gossip.save
      flash[:success] = "Le Gossip a été créé"
      redirect_to '/gossip'
    else
      puts @gossip.errors.full_messages
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
    puts "SSSSSSSSSSSSSSSSSSS"
    puts @gossip
    @gossip.destroy
    flash[:success] = "Le Gossip a été supprimé"
    redirect_to gossip_path(params[:id])
  end

  private

  def post_params
    params.require(:gossip).permit(:title, :content)
  end
end
