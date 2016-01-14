module AuthenticationTestHelper

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def authentification_test_for(http_action, controller_action, opts={})
      define_method("test_not_authenticated_should_not_#{http_action}_#{controller_action}".to_sym) do
        eval("#{http_action}('#{controller_action.to_sym}', #{opts})")
        assert_response :redirect
        assert_redirected_to new_user_session_path
        assert_equal I18n.t('devise.failure.unauthenticated'), flash[:alert]
      end
    end
  end
end
