class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def new_contact_information
    @contact_information = Contact_information.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {　user: @user.attributes　}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @contact_information = @user.build_contact_information
    render :new_contact_information
  end

  def create_contact_information
    @user = User.new(session["devise.regist_data"]["user"])
    @contact_information = ContactInformation.new(contact_information_params)
    unless @contact_information.valid?
      flash.now[:alert] = @contact_information.errors.full_messages
      render :new_contact_information and return
    end
    @user.build_contact_information(@contact_information.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def contact_information_params
    params.require(:contact_information).permit(:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
 
end
