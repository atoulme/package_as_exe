# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with this
# work for additional information regarding copyright ownership.  The ASF
# licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.

module PackageAsExe
  include Extension
  
  class NSISTask < Rake::FileTask
    
    attr_accessor :nsi, :values
    def initialize(*args) #:nodoc:
      super(*args)
      
      enhance do
        info "About to call makensis"
        # We make available one variable to the nsi script:
        # Use it like this: OutFile "${OUTPUT}"
        values.merge!({"OUTPUT" => to_s})
        command = "makensis #{values.inject([]) {|array, (key, value)| array << "-D#{key}=#{value}"; array }.join(" ")} #{nsi}"
        trace command
        system(command) or fail "Error while calling makeNSIS"  
      end
    end
    
    # :call-seq:
    #   with(options) => self
    #
    # Passes options to the task and returns self. Some tasks support additional options, for example,
    # the WarTask supports options like :manifest, :libs and :classes.
    #
    # For example:
    #   package(:jar).with(:manifest=>'MANIFEST_MF')
    def with(options)
      options.each do |key, value|
        begin
          send "#{key}=", value
        rescue NoMethodError
          raise ArgumentError, "#{self.class.name} does not support the option #{key}"
        end
      end
      self
    end
  end
    
    
  
  def package_as_exe(file_name)
    NSISTask.define_task(file_name)
  end
  
end

class Buildr::Project
  include PackageAsExe
  
end