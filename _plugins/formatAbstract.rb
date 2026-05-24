# Formats structured abstracts for the publication detail pages.
#
# Two formatting signals are supported:
#
#   1. An authored paragraph separator "||" splits the abstract into
#      paragraphs. (BibTeX collapses real newlines to spaces, so this
#      explicit token is how we preserve paragraph breaks.)
#
#   2. Section labels are bolded. Two cases are handled:
#        a. Inline canonical labels (e.g. "Background: ... Methods: ...")
#           anywhere in a paragraph, matched against the curated HEADERS
#           list so incidental "Word:" fragments are left alone.
#        b. A short paragraph-leading label of any wording (e.g.
#           "Introduction (10 minutes): ..."), which is safe to bold
#           because it sits at the very start of an authored paragraph.
#
# Abstracts with neither signal render as a single paragraph.
module Jekyll
  module FormatAbstract
    # Longest / most-specific headers first: Ruby alternation is ordered,
    # so "Background and methods" must precede "Background".
    HEADERS = [
      'Background and methods', 'Background and Objective',
      'Introduction and Objectives', 'Introduction and Aims',
      'Materials and methods', 'Method and Materials', 'Methods Used',
      'Rationale and objectives', 'Results and Discussion',
      'Results and Conclusions', 'Discussion and Conclusions',
      'Summary of Results', 'Session Description', 'Capability Description',
      'Clinical Relevance', 'Anticipated Results', 'Anticipated Conclusion',
      'Expected Impact', 'Applicability and Significance', 'Purpose of Study',
      'Case Presentation', 'Background', 'Objectives', 'Objective',
      'Purpose', 'Introduction', 'Methods', 'Method', 'Results',
      'Discussion', 'Conclusions', 'Conclusion', 'Description',
      'Approach', 'Evaluation', 'Rationale'
    ].freeze

    ALT = HEADERS.map { |h| Regexp.escape(h) }.join('|')
    # A canonical header sits at the start of the string or after
    # whitespace and is immediately followed by a colon.
    SPLIT_RE = /(?:\A|\s)(#{ALT})\s*:\s*/i
    LEAD_RE  = /\A(#{ALT})\s*:\s*(.*)\z/im
    # A generic short label at the very start of an authored paragraph.
    # Disallows '.' in the label so a full sentence ending in a colon
    # is not mistaken for a header.
    PARA_LABEL_RE = /\A([^:.]{2,60}):\s+(.+)\z/m
    DELIM = "\u0000".freeze
    PARA_SEP = /\s*\|\|\s*/.freeze

    def formatAbstract(input)
      return '' if input.nil?
      text = input.to_s.strip
      return '' if text.empty?

      text.split(PARA_SEP).reject { |p| p.strip.empty? }.map { |para|
        format_paragraph(para.strip)
      }.join("\n")
    end

    private

    def format_paragraph(para)
      marked = para.gsub(SPLIT_RE) { "#{DELIM}#{$1.strip}: " }
      pieces = marked.split(DELIM).map(&:strip).reject(&:empty?)

      if pieces.length > 1 || (pieces.length == 1 && para =~ LEAD_RE)
        # Canonical inline headers found.
        return pieces.map { |p|
          if (m = p.match(LEAD_RE))
            "<p><strong>#{m[1].strip}:</strong> #{m[2].strip}</p>"
          else
            "<p>#{p}</p>"
          end
        }.join("\n")
      end

      # No canonical header: bold a short paragraph-leading label if present.
      if (m = para.match(PARA_LABEL_RE))
        "<p><strong>#{m[1].strip}:</strong> #{m[2].strip}</p>"
      else
        "<p>#{para}</p>"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::FormatAbstract)
