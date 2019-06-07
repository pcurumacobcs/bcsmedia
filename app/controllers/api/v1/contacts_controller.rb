class Api::V1::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]
  before_action :authorize_request
  # find contacts
  before_action :find_contact, :only => [:update, :destroy]

  # GET /contacts
  def get_contacts
    @contacts = Contact.all

    if !@contacts.any?
      resource_not_found
    else
      render json: { 'data': @contacts, 'status': 1 }
    end
  end

  # POST /contacts
  def create
    @contact = Contact.new(contacts_params)

    if @contact.save
      render json: @contact, status: :created
    end
  end

  # PUT /contacts
  def update
    unless @contact.update(contacts_params)
      render json: { errors: @contact.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      render json: @contact
    end
  end

  # DELETE /contacts
  def destroy
    unless @contact.destroy
      render json: { errors: @contact.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find contacts contact
  def find_contact
    @contact = Contact.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params contacts
  def contacts_params
    params.permit(
      :name,
      :phone_number,
      :cell_phone_number,
      :status,
    )
  end
end
