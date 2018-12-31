require 'google_search_results'

module Lita
  module Handlers
    class SearchHandler < Handler
      route(/search.*/, :search, command: false, help: {
        "search QUERY": "searches for query"
      })

      def search(response)
        query = response.args.join(" ")

        response.reply "Pesquisando..."

        results = GoogleSearchResults.new(q: query)
                    .get_hash[:organic_results]

        results.each do |result|
          response.reply <<~RESPONSE
            #{result[:title]}
            #{result[:snippet]}
            #{result[:link]}
          RESPONSE
        end
      end

      Lita.register_handler(self)
    end
  end
end
