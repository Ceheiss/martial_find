class AddAttachmentGymImgToGyms < ActiveRecord::Migration[5.1]
  def self.up
    change_table :gyms do |t|
      t.attachment :gym_img
    end
  end

  def self.down
    remove_attachment :gyms, :gym_img
  end
end
