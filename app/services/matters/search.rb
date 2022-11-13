module Matters
  class Search
    LIMIT = 5
    
    attr_accessor :params, :autocomplete

    def initialize(params = {}, autocomplete = false)
      @params = params
      @autocomplete = autocomplete
    end

    def call
      return Matter.all.order(updated_at: :desc) unless params[:title].present?

      ids = Matter.search('*', {
        fields: %i[title],
        where: where,
        order: order,
        limit: LIMIT,
        load: false
      }).map(&:id)

      Matter.find(ids)
    end

    private

    def where
      return {} unless params[:title].present?

      { title: {ilike: "%#{params[:title]}%"} }
    end

    def order
      return { updated_at: :desc } unless autocomplete

      { _score: :desc, updated_at: :desc }      
    end
  end
end