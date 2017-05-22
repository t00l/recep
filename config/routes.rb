Rails.application.routes.draw do

  scope :rest do
    post "/verify_user" => "rest#verify_user"
  end

end
