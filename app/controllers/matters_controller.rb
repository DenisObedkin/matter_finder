class MattersController < ApplicationController
  before_action :find_matter, only: [:show, :edit, :update]

  def index
    matters = Matter.all.order(updated_at: :desc)

    @pagy, @matters = pagy(matters)
  end

  def new
    @matter = Matter.new()
  end

  def show;  end

  def create
    matter = Matter.new(matter_params)

    if matter.valid?
      matter.save!

      redirect_to root_path
    else
      redirect_to new_matter_path
    end
  end

  def edit; end

  def update
    if @matter.update(matter_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def autocomplete
    Matter.search(query, {
      fields: %i[title],
      where: { title: {ilike: "%#{params[:title]}%"} },
      order: { updated_at: :desc },
      limit: 5,
      load: false 
    }).map(&:title)
  end

  private

  def query
    params[:q].presence? || '*'
  end

  def find_matter
    @matter = Matter.find(params[:id])
  end

  def matter_params
    params.require(:matter).permit(
      [
        :title,
        :text,
        :author
      ]
    )
  end
end
