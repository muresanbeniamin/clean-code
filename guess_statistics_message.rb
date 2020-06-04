class GuessStatisticsMessage
	attr_reader :candidate, :count

	def initialize(candidate, count)
		@candidate = candidate
		@count = count
	end

	def self.make(candidate, count)
		new(candidate, count).make
	end

	def make
		create_plural_dependent_message_parts(count)
		puts "There #{@@verb} #{@@number} #{candidate}#{@@plural_modifier}"
	end

	private

	def create_plural_dependent_message_parts(count)
		return there_are_no_letters if count == 0
		return there_is_one_letter if count == 1
		there_are_many_letters(count)
	end

	def there_are_no_letters
		@@number = 'no'
		@@verb = 'are'
		@@plural_modifier = 's'
	end

	def there_is_one_letter
		@@number = '1'
		@@verb = 'is'
		@@plural_modifier = ''
	end

	def there_are_many_letters(count)
		@@number = count.to_s
		@@verb = 'are'
		@@plural_modifier = 's'
	end
end

GuessStatisticsMessage.make('onion', 4)