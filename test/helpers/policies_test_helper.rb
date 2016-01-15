module PoliciesTestHelper
  def assert_permit(user, record, action)
    msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
    assert permit(user, record, action), msg
  end

  def refute_permit(user, record, action)
    msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
    assert_not permit(user, record, action), msg
  end

  def permit(user, record, action)
    cls = self.class.to_s.gsub(/Test/, '')
    cls.constantize.new(user, record).public_send("#{action.to_s}?")
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def assert_permit_for(user, resource, opts={})
      assert_for(:assert, user, resource, opts)
    end

    def refute_permit_for(user, resource, opts={})
      assert_for(:refute, user, resource, opts)
    end

    def assert_for(assertion_type, user, resource, opts={})
      if opts.key?(:only)
        actions_to_create_method_for = opts[:only].is_a?(Array) ? opts[:only] : [opts[:only]]
      else
        actions_to_create_method_for = all_actions
      end

      if opts.key?(:except)
        remove_from_array(actions_to_create_method_for, opts[:except])
      end

      actions_to_create_method_for.each do |action|
        define_method_for(assertion_type, user, resource, action)
      end
    end

    private

    def remove_from_array(actions_to_create_method_for, exceptions)
      if not exceptions.is_a?(Array)
        exceptions = [exceptions]
      end
      exceptions.each do |exception|
        actions_to_create_method_for.delete exception
      end
    end

    def define_method_for(assertion_type, user, resource, action)
      define_method("test_#{user}_should_be_permitted_to_#{action}_#{resource}".to_sym) do
        user = instance_variable_get("@#{user}")
        resource = instance_variable_get("@#{resource}")
        if assertion_type == :assert
          assert_permit(user, resource, action)
        else
          refute_permit(user, resource, action)
        end
      end
    end

    def all_actions
      [:index, :show, :new, :edit, :create, :update, :destroy]
    end
  end
end
