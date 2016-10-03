class AuthorController < ActionController::Base
  def index
    @author = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params.require(:author).permit(:name, :phone_number))
    @author.save
    redirect_to author_path(@author)
  end

  def update
    @author = Author.find(params[:id])
    @author.update(params.require(:author).permit(:name, :bio))
    redirect_to author_path(@author)
  end

  def edit
    @author = Author.find(params[:id])
  end

  private

  def post_params(*args)
    params.require(:author).permit(*args)
  end
end
