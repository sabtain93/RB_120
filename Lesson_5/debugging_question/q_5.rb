
class File
  attr_accessor :name, :byte_content

  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}"
  end
end

class MarkdownFile < File
  
  FORMAT = :md
end

class VectorGraphicsFile < File

  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

# blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
# blog_post.write('Content will be added soon!'.bytes)

# puts blog_post

MarkdownFile.new('ss')
VectorGraphicsFile.new('tt')
MP3File.new('pp')

