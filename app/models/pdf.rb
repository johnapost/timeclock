class Pdf < Prawn::Document
  def initialize user
    super top_margin: 10, page_layout: :portrait, page_size: 'A4'

    @max_width = 525
    @max_height = 800

    content user
  end

  def content user
    move_down 15
    text user.display_name
  end
end