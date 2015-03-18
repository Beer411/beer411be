class Bar < ActiveRecord::Base
  has_many :glasses
  has_many :beers, through: :glasses
  has_many :comments, :as => :commentable
  validates :address, uniqueness: true
  validates :name, presence: true
  include PgSearch
  pg_search_scope :search, :against => [:name, :address], :using => {
                                                                      :tsearch => {:prefix => true}
                                                                    }

  def json_beers
    self.beers.map do |beer|
      { id: beer.id, name: beer.name,
        flavor_profile1: beer.flavor_profile1,
        flavor_profile2: beer.flavor_profile2,
        flavor_profile3: beer.flavor_profile3,
        flavor_profile4: beer.flavor_profile4,
        flavor_profile5: beer.flavor_profile5,
        abv: beer.abv, kind: beer.kind,
        description: beer.description }
      end
    end


# Keeping the PostgreSql code for future reference
  # def self.search(query)
  #   if query.present?
  #     rank = <<-RANK
  #     ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(address), plainto_tsquery(#{sanitize(query)}))
  #
  #     RANK
  #     where("name @@ :q or address @@ :q", q: query).order("#{rank} desc")
  #   else
  #     all
  #   end
  # end

end
