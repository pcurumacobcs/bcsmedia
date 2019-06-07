class Api::V1::CustomerContactsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]
  before_action :authorize_request
  # find
  before_action :find_customer_contact, :only => [:destroy]

  # POST /customers/contacts
  def create
    @customer_contact = CustomerContact.new(customer_contact_params)

    if @customer_contact.save
      render json: @customer_contact, status: :created
    end
  end

  # DELETE /customers/contacts
  def destroy
    unless @customer_contact.destroy
      render json: { errors: @customer_contact.errors.full_messages, status: 0 },
             status: :unprocessable_entity
    else
      resource_deleted
    end
  end

  private

  # find customers contacts
  def find_customer_contact
    @customer_contact = CustomerContact.where(customer_id: params[:customer_id], contact_id: params[:contact_id]).first
    if @customer_contact.nil?
      resource_not_found
    end
  rescue ActiveRecord::RecordNotFound
    resource_not_found
  end

  # params customers contacts
  def customer_contact_params
    params.permit(
      :customer_id,
      :contact_id,
    )
  end
end
