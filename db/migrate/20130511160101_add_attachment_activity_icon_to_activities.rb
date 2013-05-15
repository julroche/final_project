class AddAttachmentActivityIconToActivities < ActiveRecord::Migration
  def self.up
    change_table :activities do |t|
      t.attachment :activity_icon
    end
  end

  def self.down
    drop_attached_file :activities, :activity_icon
  end
end
