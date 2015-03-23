class Beer < ActiveRecord::Base

  has_many :glasses
  has_many :bars, through: :glasses
  has_many :comments, :as => :commentable
  validates :name, presence: true, uniqueness: true
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  include PgSearch
  pg_search_scope :search, :against => [:name, :flavor_profile1,
                                        :flavor_profile2, :flavor_profile3,
                                        :flavor_profile4, :flavor_profile5,
                                        :kind, :brewery],
                                        :using => {
                                          :tsearch => { :prefix => true }
                                        }
  def json_bars
    self.bars.map do |bar|
      { id: bar.id, name: bar.name, address: bar.address }
    end
  end



# Although I am using PGSearch (which is super sweet), I'm keeping this for future reference
  # def self.search(query)
  #   if query.present?
  #     rank = <<-RANK
  #     ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(flavor_profile1), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(flavor_profile2), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(flavor_profile3), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(flavor_profile4), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(flavor_profile5), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(kind), plainto_tsquery(#{sanitize(query)})) +
  #     ts_rank(to_tsvector(brewery), plainto_tsquery(#{sanitize(query)}))
  #     RANK
  #     where("name @@ :q or flavor_profile1 @@ :q or flavor_profile2 @@ :q or
  #           flavor_profile3 @@ :q or flavor_profile4 @@ :q or flavor_profile5 @@ :q or
  #           kind @@ :q or brewery @@ :q", q: query).order("#{rank} desc")
  #   else
  #     all
  #   end
  # end

end
