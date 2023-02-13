module V1
  class ContactsController < ApplicationController
    include ErrorSerializer

    before_action :set_contact, only: [:show, :update, :destroy]

    def index
      page_number = params[:page].try(:[], :number)
      per_page = params[:page].try(:[], :size)

      @contacts = Contact.all.page(page_number).per(per_page)


      if stale?(etag: @contacts)
        render  json: @contacts 
      end
    end

    def show
      render json: @contact 
    end

    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address],  status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors) # @contact.errors, status: :unprocessable_entity
      end
    end

    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end


    def destroy
      @contact.destroy
    end

    private
     
      def set_contact
        @contact = Contact.find(params[:id])
      end

      def contact_params
     
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end