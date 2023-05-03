class SignupsController < ApplicationController
  def update
    random_string = ('a'..'z').to_a.shuffle[0,8].join
    attributes = {
      tags: signup_params[:tag],
      church: random_string # update a core person field to trigger a webhook 
    }
    data = NbPeople::Update.call(signup_params[:nb_id], attributes)

    if data['id'].blank?
      redirect_to root_path, alert: "Please enter a valid signup ID and try again"
    else
      redirect_to root_path, notice: "The profile with ID #{data['id']} was updated successfully"
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:nb_id, :tag)
  end
end
