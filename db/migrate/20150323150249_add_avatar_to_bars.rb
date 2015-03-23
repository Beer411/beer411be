class AddAvatarToBars < ActiveRecord::Migration
  def self.up
    add_attachment :bars, :avatar
  end

  def self.down
    remove_attachment :bars, :avatar
  end
end
