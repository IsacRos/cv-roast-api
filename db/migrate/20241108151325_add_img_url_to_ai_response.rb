class AddImgUrlToAiResponse < ActiveRecord::Migration[7.0]
  def change
    add_column :ai_responses, :img_url, :string
  end
end
