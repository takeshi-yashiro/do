require 'rubygems'
require 'data_objects'

if RUBY_PLATFORM =~ /java/
  require 'do_hsqldb_ext'    # the Java extension for this DO driver
  require 'do_jdbc/hsqldb'   # the JDBC driver, packaged as a gem

  # Another way of loading the JDBC Class. This seems to be more relaible
  # than Class.forName() within the data_objects.Connection Java class,
  # which is currently not working as expected.
  require 'java'
  import 'org.hsqldb.jdbcDriver'

  module DataObjects
    module Hsqldb
      class Connection
        def self.pool_size
          20
        end
      end
    end
  end

else
  warn "do_hsqldb is only for use with JRuby"
end