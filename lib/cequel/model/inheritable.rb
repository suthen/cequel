module Cequel

  module Model

    module Inheritable

      module SubclassMethods

        def all
          super.where(@_cequel.type_column.name => name)
        end

      end

      def inherited(subclass)
        unless @_cequel.type_column
          raise ArgumentError,
            "Can't subclass model class that does not define a type column"
        end
        subclass._cequel = SubclassInternals.new(subclass, @_cequel)
        subclass.extend(SubclassMethods)
      end

      protected

      attr_writer :_cequel

    end

  end

end