class addressController < ActionController::API
    before_action :set_contact

     def create
        @contact.address = Address.new(address_params)

     if @contact.save
        render json: @contact.address, status: :create, location: contact_address_url(@contact)
    
     else
        render json: @contact.errors, status: :unprocessable_entity  
     end
    end

    end


   def update
    if @contact.address.update.(address_params)
        render json: @contact.address
    else
        render json: @contact.errors,
    end
end

    def show
        render json: @contact.address 
    end

    def destroy
        @contact.address.destroy
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_contact
        
          @address = Contact.find(params[:contact_id])
    
      end
def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
end
    end