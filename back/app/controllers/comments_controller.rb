class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  
    def create
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user
      
        if @comment.save
          respond_to do |format|
            format.html { redirect_to @post, notice: "Comentário adicionado com sucesso." }
            format.turbo_stream
          end
        else
          flash[:alert] = "Erro ao adicionar comentário. Verifique o conteúdo."
          respond_to do |format|
            format.html { redirect_to @post }
            format.turbo_stream
          end
        end
    end
  
    def edit; end
  
    def update
      if @comment.update(comment_params)
        respond_to do |format|
          format.html { redirect_to @post, notice: "Comentário atualizado com sucesso." }
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.html { render :edit, status: :unprocessable_entity }
          format.turbo_stream
        end
      end
    end
  
    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: "Comentário excluído com sucesso." }
        format.turbo_stream
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_comment
      @comment = @post.comments.find(params[:id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  
    def authorize_user!
      redirect_to @post, alert: "Você não tem permissão para isso." unless @comment.user == current_user
    end
  end
  