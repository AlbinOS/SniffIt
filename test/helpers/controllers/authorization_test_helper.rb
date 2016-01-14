module AuthorizationTestHelper
  include Devise::TestHelpers

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def authorization_test_for(http_action, controller_action, user, opts={})
      define_method("test_not_authorized_should_not_#{http_action}_#{controller_action}".to_sym) do
        sign_in eval(user)
        opts.each do |opt|
          opts[opt.first] = eval(opt.last)
        end
        eval("#{http_action}('#{controller_action.to_sym}', #{opts})")
        model_name = self.class.name.underscore.split('_')[0].singularize
        assert_equal I18n.t("pundit.#{model_name}_policy.#{controller_action}?"), flash[:alert]
        assert_redirected_to root_path
      end
    end
  end
end
