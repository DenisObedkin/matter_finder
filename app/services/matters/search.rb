module Matters
  class Search
    LIMIT = 5
    class << self
      def call(params, autocomplete = false)
        return Matter.all.order(updated_at: :desc) unless params

        Matter.search(query, {
          fields: %i[title],
          where: { title: {ilike: "%#{params[:title]}%"} },
          order: { _score: :desc, updated_at: :desc },
          load: false 
        }.merge(limit)).map(&:title)
      end

      private

      def limit
        return {} unless autocomplete

        { limit: LIMIT }
      end

      def query
        params[:q].presence? || '*'
      end
    end
  end
end