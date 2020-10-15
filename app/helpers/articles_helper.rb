module ArticlesHelper
  def persisted_comments(comments)
    comments.reject { |comment| comment.new_record? }

  end

   def fill_in_trix_editor(id, with:)
    find(:css, "##{id}").click.set(with)
  end
end
