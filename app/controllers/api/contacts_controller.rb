class Api::ContactsController < ApplicationController
    def index
      contacts = Contact.all
      render json: contacts
    end
  
    def create
      contact = Contact.new(contact_params)
      if contact.save
        render json: contact
      else
        render json: { errors: contact.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      contact = Contact.find(params[:id])
      contact.destroy
      head :no_content
    end
  
    private
  
    def contact_params
      params.permit(:name, :phone, :address, :gender, :age)
    end
  end
  