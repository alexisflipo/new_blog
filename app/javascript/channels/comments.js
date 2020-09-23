import consumer from "./consumer";

const initChatroomCable = () => {
  const commentsContainer = document.getElementById('comments');
  if (commentsContainer) {
    const id = commentsContainer.dataset.commentId;

    consumer.subscriptions.create({ comment: "CommentsChannel", id: id }, {
      received(data) {
       commentsContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initChatroomCable };
