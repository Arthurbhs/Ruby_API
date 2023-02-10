class ApplicationController < ActionController::API

def ensure_json_request
    return if reuest.headers["Accept"] =~ /vnd\.api\+json/
    render :nothing => true, :status => 406
end

end
