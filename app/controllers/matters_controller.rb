class MattersController < ApplicationController
  before_action :find_matter, only: [:show, :edit, :update]

  def index
    @pagy, @matters = pagy(
      Matters::Search.new(params).()
    )
  end

  def new
    @matter = Matter.new()
  end

  def show;  end

  def create
    matter = Matter.new(matter_params)

    if matter.valid?
      redirect_to root_path if matter.save!
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
    @matters = Matters::Search.new(params, autocomplete: true).()
  end

  private

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
