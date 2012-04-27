module DietBlock
  class Engine < ::Rails::Engine
    isolate_namespace DietBlock

    class << self
      def load_decorators
        Dir[Rails.root.join('app', 'decorators', '**', '*_decorator.rb')].each do |decorator|
          Rails.application.config.cache_classes ? require(decorator) : load(decorator)
        end
      end
    end

    config.to_prepare &method(:load_decorators).to_proc
  end
end
