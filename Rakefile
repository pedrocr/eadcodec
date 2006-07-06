PKG_NAME = 'eadcodec'
PKG_VERSION = '0.0.4'

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

RDOC_OPTIONS = ['-S', '-w 2', '-N', '-Axmlsubel_mult=XML Subelement Collection', 
                '-Axmlsubel=XML Subelement', '-Axmlattr=XML Attribute']
RDOC_EXTRA_FILES = ['README']
CODE_FILES = 'lib/**/*.rb'
TEST_FILES = 'test/**/*.rb'

spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.summary = "Importer/Exporter for the EAD XML format"
  s.name = PKG_NAME
  s.version = PKG_VERSION
  s.author = 'Pedro Côrte-Real'
  s.email = 'pedrocr@gmail.com'
  s.requirements << 'xmlcodec'
  s.add_dependency('xmlcodec', '>= 0.0.4')
  s.require_path = 'lib'
  s.autorequire = 'rake'
  s.files = PKG_FILES
  s.has_rdoc = true
  s.rdoc_options = RDOC_OPTIONS
  s.extra_rdoc_files = RDOC_EXTRA_FILES
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
  rd.rdoc_files.include(RDOC_EXTRA_FILES, CODE_FILES)
  rd.rdoc_dir = 'web/doc'
  rd.title = PKG_NAME+' API'
  rd.options = RDOC_OPTIONS
end

task :stats do
  code_code, code_comments = count_lines(FileList[CODE_FILES])
  test_code, test_comments = count_lines(FileList[TEST_FILES])
  
  puts "Code lines: #{code_code} code, #{code_comments} comments"
  puts "Test lines: #{test_code} code, #{test_comments} comments"
  
  ratio = test_code.to_f/code_code.to_f
  
  puts "Code to test ratio: 1:%.2f" % ratio
end

def count_lines(files)
  code = 0
  comments = 0
  files.each do |f| 
    File.open(f).each do |line|
      if line.strip[0] == '#'[0]
        comments += 1
      else
        code += 1
      end
    end
  end
  [code, comments]
end
