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
      case command.upcase
      when 'I'
        initialise_new_image(*args)
      when 'C'
        clear_image
      when 'L'
        colour_pixel(*args)
      when 'V'
        vertical_strip(*args)
      when 'H'
        horizontal_strip(*args)
      when 'F'
        colour_area(*args)
      when 'S'
        @image.show
      when 'X'
        return exit 0
      end
    end

    def initialise_new_image(*args)
      @image = Image.new(*args)
    end

    def clear_image
      begin
        @image.clear# unless @image.nil?
      rescue NoMethodError => e
        puts "Image not initialized"
      end
    end

    def colour_pixel(*args)
      begin
        @image.set_pixel_colour(*args)
      rescue NoMethodError => e
        puts "Image not initialized"
      rescue ArgumentError => a
        puts "Incorrect number of arguments for command, requires x-position, y-position & colour"
      end
    end

    def vertical_strip(*args)
      begin
        @image.colour_vertical_segment(*args)
      rescue NoMethodError => e
        puts "Image not initialized"
      rescue ArgumentError => a
        puts "Incorrect number of arguments for command, requires x-position, y-start-position, y-end-position & colour"
      end
    end

    def horizontal_strip(*args)
      begin
        @image.colour_horizontal_segment(*args)
      rescue NoMethodError => e
        puts "Image not initialized"
      rescue ArgumentError => a
        puts "Incorrect number of arguments for command, requires x-start-position, x-end-position, y-position & colour"
      end
    end

    def colour_area(*args)
      begin
        @image.fill(*args)
      rescue NoMethodError => e
        puts "Image not initialized"
      rescue ArgumentError => a
        puts "Incorrect number of arguments for command, requires x-position, y-position & colour"
      end
    end
end
