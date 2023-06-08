module Basicons
  class Basicon
    SVG_SIZES = {
      small: 16,
      medium: 32,
      large: 64
    }.freeze

    attr_reader :data, :size
    attr_reader :symbol, :options

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      @options = options.dup

      if @data = Basicons::SVG_DATA[@symbol]
        @options.merge!({
          class: classes,
          width: svg_size,
          height: svg_size,
          viewBox: '0 0 24 24',
          stroke: 'currentColor',
          fill: 'none'
        })

        @options.delete(:size)
        @options['stroke-width'] = 2
        @options['stroke-linecap'] = 'round'
        @options['stroke-linejoin'] = 'round'
        @options['xmlns'] = 'http://www.w3.org/2000/svg'
      else
        raise "<#{@symbol}> not found"
      end
    end

    def to_svg
      "<svg #{html_attributes}>#{@data}</svg>"
    end

    private

    def html_attributes(result = '')
      @options.each { |key, value| result += "#{key}=\"#{value}\" " }
      result.strip
    end

    def svg_size
      return @size unless @size.nil?

      @size = @options[:size].to_i
      value = @options[:size].to_s

      if value.match?(/small|medium|large/)
        @size = SVG_SIZES[value.to_sym]
      end

      @size = 24 if @size.zero?
      @size
    end

    def classes
      "basicon basicon-#{@symbol} #{@options[:class]}".strip
    end
  end
end
