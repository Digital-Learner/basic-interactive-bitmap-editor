require_relative 'image'

class BitmapCLI

  def run
    parse(get_user_input)
  end

  private

    def get_user_input
      print "> "
      gets.chomp
    end

    def parse(input)
      command, *args = input.split(' ').map{|arg| (arg == "0" || arg.to_i != 0) ? arg.to_i : arg}
      puts "command => #{command} : args => #{args}"
      case command.upcase
      when 'I'
        initialise_new_image(*args)
      when 'C'
        clear_image
      when 'L'
        puts 'L'
      when 'V'
        puts 'Vertical Line'
      when 'H'
        puts 'Horizontal Line'
      when 'F'
        puts 'Request to Fill area'
      when 'S'
        puts "Request to show"
      when 'X'
        return exit 0
      end
    end

    def initialise_new_image(*args)
      @image = Image.new(*args)
    end

    def clear_image
      @image.clear
    end
end
