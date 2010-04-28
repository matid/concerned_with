# ConcernedWith
module ConcernedWith
  module ActiveRecord
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{name.underscore}/#{concern}"
      end
    end
  end

  module ActionController
    def concerned_with(*concerns)
      concerns.each do |concern|
        require_dependency "#{self.name.gsub(/Controller$/, '').underscore}/#{concern}"
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ConcernedWith::ActiveRecord)
ActionController::Base.send(:extend, ConcernedWith::ActionController)
