#
# table.rb
#

require 'set'
require 'turntable/row'

module Turntable

  # Turntable::Table is Turntable's main interface. It maintains an ordered list
  # of Turntable::Row objects, according to a given Turntable::TableHeader.
  #
  # Internally, Turntable::Table implements a SortedSet. See the documentation
  # for Turntable::TableHeader for the reasons why. Additionally, the SortedSet
  # ensures that two otherwise identical rows will have differing positions
  # within the table.
  #
  # Turntable::Table includes Enumerable, so every method there is available
  # here. Also, calling Turntable::Table#rows returns the internal SortedSet, so
  # you can gain access to the instance methods available for sets that way.
  class Table

    include Enumerable

    # Iterate through all the rows contained inside this Table.
    #
    def each
      @rows.each { |row| yield row }
    end

    attr_reader :header
    attr_accessor :rows

    # Associates a TableHeader with a new, empty Table.
    #
    def initialize(header)
      @rows = SortedSet.new
      @header = header
    end

    # Returns a string representing the receiver and its contents.
    #
    def inspect
      "#<%s @rows=%s>" % [
        self.class, @rows.inspect     
      ]
    end

    # Append a new Row to the Table.
    #
    #   t = Turntable::Table.new(some_header)
    #   t.push "LP4", "Ratatat", 2010
    #
    def push(*data)
      r = Row.new(@header, get_new_position, data)
      @rows << r
    end

    # Determines the position of a new row. If there are no rows, then simply
    # return 0.
    #
    def get_new_position
      (@rows.empty?) ? (0) : (@rows.sort.last.position + 1)
    end
    private :get_new_position

    # Retreives a row by its position.
    #
    def [](position)
      @rows.detect { |row| row.position == position }
    end

  end
end
