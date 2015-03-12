class Bar < ActiveRecord::Base
  has_many :glasses
  has_many :beers, through: :glasses

  validates :address, uniqueness: true
  validates :name, presence: true

  def self.search(query)
    if query.present?
      rank = <<-RANK
      ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(address), plainto_tsquery(#{sanitize(query)}))

      RANK
      where("name @@ :q or address @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end

  def json_beers
    self.beers.map do |b|
      {id: b.id, name: b.name, abv: b.abv, brewery: b.brewery}
    end
  end
end
