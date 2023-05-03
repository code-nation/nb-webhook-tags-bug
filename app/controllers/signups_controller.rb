class SignupsController < ApplicationController
  def update
    data = NbPeople::Update.call(signup_params[:nb_id], { tags: signup_params[:tag] })
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
