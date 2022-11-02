class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @user = User.all
    puts session.loaded?
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:mail, :password, :password_confirmation, :city_id, :first_name)
    @user = User.new(user_params)

    if @user.save
     flash[:success] = "Tu es bien inscrit."
     redirect_to "/users/#{current_user}"
    else
      flash[:success] = "Une erreur est survenu"
      puts @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end

  private

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
