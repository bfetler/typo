class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index; redirect_to :action => 'new' ; end
  def edit; new_or_edit;  end

  def new 
    respond_to do |format|
      format.html { new_or_edit }
      format.js { 
        @category = Category.new
      }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def new_or_edit
    puts "new_or_edit params: " + params.inspect
    @categories = Category.find(:all)
    # @category = Category.find(params[:id])  # orig
    #if params[:id]
    #  @category = Category.find(params[:id])
    #else
    #  @category = Category.new
    #end
    @category = params[:id] ? Category.find(params[:id]) : Category.new
    @category.attributes = params[:category]
    if request.post?
      respond_to do |format|
        format.html do
          puts "new_or_edit calling save_category"
          save_category
        end
        format.js do 
          @category.save
          @article = Article.new
          @article.categories << @category
          return render(:partial => 'admin/content/categories')
        end
      end
      return
    end
    render 'new'
  end

  def save_category
    #puts "save_category params: " + params.inspect
    #puts "@category: " + @category.inspect
#    if @category.save!  # orig
    if @category.save
      flash[:notice] = _('Category was successfully saved.')
    else
      puts "save_category save failed"
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'new'
  end

end
