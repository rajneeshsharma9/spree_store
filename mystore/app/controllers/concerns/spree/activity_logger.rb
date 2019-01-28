module Spree
  module ActivityLogger

    extend ActiveSupport::Concern

    included do
      append_around_action :log_activity
    end

    private def log_activity
      original_request_params = request.params
      yield
      unless request.get?
        Spree::UserActivityLog.create(
          user: try_spree_current_user,
          ip_address: request.remote_ip,
          response_code: response.status,
          original_request_params: original_request_params,
          updated_request_params: params,
          flash: flash.to_h,
          entity_name: entity_name,
          entity_errors: @object&.errors.to_h
        )
      end
    end

    private def entity_name
      @model_class&.name || params[:controller].split('/').last.classify
    end

  end
end
