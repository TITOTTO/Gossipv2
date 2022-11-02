class LikesController < ApplicationController
    def create
        if params[:like][:gossip_id].class != NilClass
            @like = current_user.likes.new(gossip_id: params[:like][:gossip_id])
            like = params[:like][:gossip_id]
            @like.save
            redirect_to gossip_path(like)
        else
            @like = current_user.likes.new(comment_id: params[:like][:comment_id])
            like = params[:like][:gossips_id]
            @like.save
            redirect_to gossip_path(like)
        end
    end

    def destroy
        if params[:like][:gossip_id].class != NilClass
            @like = current_user.likes.find_by(gossip_id: params[:like][:gossip_id])
            gossip = params[:like][:gossip_id]
            @like.destroy
            redirect_to gossip_path(gossip)
        else
            @like = current_user.likes.find_by(comment_id: params[:like][:comment_id])
            like = params[:like][:gossips_id]
            @like.destroy
            redirect_to gossip_path(like)
        end
    end
end
