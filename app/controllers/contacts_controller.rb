class ContactsController < ApplicationController
    
    #GET request to /contact
    def new
        @contact = Contact.new 
    end
    
     # POST request to /contact
    def create
        @contact = Contact.new(contact_params) #Mass assignment of form fields into Contact object
        if @contact.save
            # store form fields via params
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comment]
        
            ContactMailer.contact_email(name,email,body) # email method and send mail
            
            flash[:success] = "Message sent"
            redirect_to new_contact_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private
        #to collect data from forms, need to use strong params and whitelist form fields.
        def contact_params
            params.require(:contact).permit(:name, :email, :comment)
        end
end