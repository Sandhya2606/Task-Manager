class NotificationMailer < ApplicationMailer
  def due_date_reminder(user, task)
    @task = task
    mail(to: user.email, subject: "Reminder: Task Due Soon - #{@task.title}")
  end
end
