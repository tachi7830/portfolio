class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      #お問合せ内容が保存できたらsend_mailのアドレス宛にメールを送信
      ContactMailer.send_mail(@contact).deliver
      redirect_to contacts_thanks_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
