PKG_NAME = 'eadcodec'
PKG_VERSION = '0.0.2'

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rubygems'

task :default => ['test']

PKG_FILES = FileList['lib/**/*.rb',
                     'test/**/*.rb',
                     'test/examples/**/*.xml',
                     'README*',
                     'LICENSE',
                     'Rakefile']

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = "Importer/Exporter for the EAD XML format"
  s.name = PKG_NAME
  s.version = PKG_VERSION
  s.author = 'Pedro Côrte-Real'
  s.email = 'pedrocr@gmail.com'
  s.requirements << 'xmlcodec'
  s.add_dependency('xmlcodec', '>= 0.0.2')
  s.require_path = 'lib'
  s.autorequire = 'rake'
  s.files = PKG_FILES
  s.description = <<EOF
An exporter and importer for the Encoded Archival Description XML format. See
http://www.loc.gov/ead/ for more information about the format.
EOF
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/Test*.rb'].exclude('test/TestEAD.rb')
  t.libs = ['../lib','..']
  t.ruby_opts = ['-xtest']
  t.verbose = true
end

Rake::RDocTask.new do |rd|
  rd.main = "README"
  rd.name = :docs
  rd.rdoc_files.include("README", "lib/**/*.rb")
  rd.rdoc_dir = 'web/doc'
  rd.title = PKG_NAME+' API"'
  rd.options = ['-S', '-w 2', '-N']
end
