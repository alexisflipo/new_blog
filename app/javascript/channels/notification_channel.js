
import consumer from "./consumer";

const initNotificationCable = () => {
  consumer.subscriptions.create("NotificationChannel", {
  receive(notifications) {
    console.log(notifications)
    // new Notification(data["title"], body: data["body"])
  }
})
}

export { initNotificationCable };
