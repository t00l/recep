class RestController < ApplicationController

  def verify_user
    email = params[:email]
    user = User.find_by(email: email)
    if compare(user.image, params[:image])
        ok = {"message": "OK" }.to_json
        render json: ok, status: :ok
    else
        error = {"message": "No Autorizado" }.to_json
        render json: error , status: :unauthorized
    end
  end

  private

  def compare(image1,image2)
    percentage = image1.similar(image2)
    if percentage >= 90
      true
    else
      false
    end
  end

end
