import consumer from "./consumer";

const initChatroomCable = () => {
  const comments = `   <div id='comments' class='col-sm-12 col-md-12 col-lg-12'>
    <% if @article.comments.any? %>
      <% persisted_comments(@comments).each do |comment| %>
      <div  data-comment-id='<%= comment.id %>'>
    <div class='comment-body'>
      <%= comment.body %>
    </div>
    <div class='comment-time'>
      <p class='author'> <%= time_ago_in_words(comment.created_at).capitalize %>
      ago by <strong><%= comment.user.email %></strong></p>
    </div>
  </div>
    <hr>
      <% end %>
    <% else %>
      There are no comments to show.
    <% end %>
  </div>`
  const commentsContainer = document.getElementById("comments");
  const submitButton = document.querySelector('#submit-button input');
  submitButton.addEventListener('click', (event) => {
  event.preventDefault();

  commentsContainer.insertAdjacentHTML("beforeend", comments )
  console.log('test')
});
}


export { initChatroomCable };
