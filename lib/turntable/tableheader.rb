#
# tableheader.rb
#

require 'set'
require 'turntable/columndefinition'

module Turntable
  
  # A Turntable::TableHeader maintains an ordered list of ColumnDefinition
  # objects. This list is implemented as a SortedSet for three reasons:
  #
  #   * It's apparently faster than Array.
  #   * The columns appear in order in IRB.
  #   * It ensures there are no duplicate column definitions.
  #
  class TableHeader

    include Enumerable

    def each
      @columns.each { |column| yield column }
    end

    attr_reader :columns

    # Creates a new TableHeader. The given column names should be symbols.
    #
    #   Turntable::TableHeader.new(:album, :artist, :year)
    #
    def initialize(*column_names)
      @columns = SortedSet.new
      column_names.each_with_index do |column, i|
        @columns << Turntable::ColumnDefinition.new(column, i)
      end
    end

    # Returns a string representing the receiver and its contents.
    #
    def inspect
      "#<%s @columns=%s>" % [
        self.class, @columns.inspect
      ]
    end

    # Returns a ColumnDefinition by specifying its position within the
    # TableHeader.
    #
    #   th = Turntable::TableHeader.new(:album, :artist, :year)
    #   th[1]   # => #<Turntable::ColumnDefinition @name=... @position=...>
    #
    def [](position)
      @columns.detect { |column| column.position == position }
    end

  end
end
