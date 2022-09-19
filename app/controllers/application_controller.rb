class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :load_search_attributes

    def load_search_attributes
    	@cities = ["Cairo","Giza","Alexandria","Dakahlia","Red Sea","Beheira","Fayoum",
			      "Gharbiya","Ismailia","Menofia","Minya","Qaliubiya","New Valley","Suez","Aswan",
			      "Assiut","Beni Suef","Port Said","Damietta","Sharkia","South Sinai","Kafr Al-sheikh",
			      "Matrouh","Luxor","Qena","North Sinai","Sohag"].sort 
        @cities.unshift("All Cities")          

		@specialities = ["Allergist","Cardiologist","Child psychiatrist","Dermatologist",
						"Endocrinologist","Gastroenterologist","Hematologist","Immunologist","Neuropsychiatrist",
						"Neurologist","Gynaecologist","Oncologist","Ophthalmologist","Orthopedist","Urologist",
						"Otorhinolaryngologist","Paediatrician","Pathologist","Pharmacologist","Psychiatrist",
						"Radiation Oncologist","Radiologist","Rheumatologist","Stomatologist","Venereologist"].sort
        @specialities.unshift("All Specialities")                
    end	

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :title, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :title, :email, :password, :current_password) }
        end
end