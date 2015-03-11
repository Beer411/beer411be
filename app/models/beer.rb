class Beer < ActiveRecord::Base
  has_many :glasses
  has_many :bars, through: :glasses

  validates :name, presence: true, uniqueness: true

  def self.search(query)
    if query.present?
      rank = <<-RANK
      ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(flavor_profile1), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(flavor_profile2), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(flavor_profile3), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(flavor_profile4), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(flavor_profile5), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(kind), plainto_tsquery(#{sanitize(query)})) +
      ts_rank(to_tsvector(brewery), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("name @@ :q or flavor_profile1 @@ :q or flavor_profile2 @@ :q or
            flavor_profile3 @@ :q or flavor_profile4 @@ :q or flavor_profile5 @@ :q
            kind @@ :q or brewery @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end


end
