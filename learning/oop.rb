class Book
	def initialize(name = "new book", title = "new title")
		@title = title
		@name = name
	end

	protected
	def book_name
		"protected testing"
	end
end

class Author < Book
	attr_reader :name
	def initialize(name, age)
		@name = name
		@age = age
	end

	def age
		@age
	end

	def age=(age)
		self.age = age
	end

	def checking_public_method
		p checking_private_method
		"public method called"
		book_name
	end

	
	private
	def checking_private_method
		"private method called"
	end

	protected
	def checking_protected_method
		"protected method called"
	end
end


b = Book.new("book1", "title1")
p b

a = Author.new("silambarasan",  28)
p a.age, a.name
p a.checking_public_method
#p a.checking_private_method => give error when tring to call from console
#p a.checking_protected_method