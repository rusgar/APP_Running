module Authorization
    extend ActiveSupport::Concern
  
    included do
      class NotApprovedError < StandardError; end
  
      rescue_from NotApprovedError do
        redirect_to products_path, alert: t('common.not_authorized')
      end
  
      private
  
      def approved! record = nil
        is_allowed = if record
          record.user_id == Current.user.id
        else
          Current.user.admin?
        end
        raise NotApprovedError unless is_allowed
      end
    end
  end