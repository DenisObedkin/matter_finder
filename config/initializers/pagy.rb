require 'pagy/extras/bootstrap'
require 'pagy/extras/searchkick'

Searchkick.extend Pagy::Searchkick

Pagy::DEFAULT[:items] = 3