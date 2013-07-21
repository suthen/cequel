require 'active_support/core_ext'

# If a version of Cassandra is specified in the cequel require, propagate that
# requirement to cassandra-cql. Otherwise, use the default that cassandra-cql
# uses (i.e. Cassandara 1.1)
if Cequel.respond_to?(:CASSANDRA_VERSION)
  require "cassandra-cql/#{Cequel.CASSANDRA_VERSION}"
else
  require 'cassandra-cql'
end

require 'connection_pool'

require 'cequel/batch'
require 'cequel/errors'
require 'cequel/cql_row_specification'
require 'cequel/data_set'
require 'cequel/keyspace'
require 'cequel/row_specification'
require 'cequel/statement'

module Cequel
  def self.connect(configuration = nil)
    Keyspace.new(configuration || {})
  end
end
