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

Gem::Specification.new do |spec|
  spec.name           = 'buildr-package-as-exe'
  spec.version        = '1.0.0'
  spec.author         = 'Antoine Toulme'
  spec.email          = "atoulme@intalio.com"
  spec.homepage       = "http://www.github.com/intalio/package_as_exe"
  spec.summary        = "A plugin for creating .exe installers with Buildr and makeNSIS."
  spec.description    = <<-TEXT
A plugin for creating .exe installers with Buildr and makeNSIS.
You still are in full control, creating your nsi file, but you can wire it easily to your build system.
TEXT
  # Rakefile needs to create spec for both platforms (ruby and java), using the
  # $platform global variable.  In all other cases, we figure it out from RUBY_PLATFORM.
  spec.platform       = $platform || RUBY_PLATFORM[/java/] || 'ruby'
  spec.files          = Dir['{doc,etc,lib,rakelib,spec}/**/*', '*.{gemspec,buildfile}'] +
                        ['LICENSE', 'NOTICE', 'README.rdoc']
  spec.require_paths  = ['lib']
  spec.has_rdoc         = true
  spec.extra_rdoc_files = 'README.rdoc', 'LICENSE', 'NOTICE'
  spec.post_install_message = "Thanks for installing the .exe packaging extension for Buildr"
end