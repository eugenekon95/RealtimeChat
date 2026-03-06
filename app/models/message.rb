class Message < ApplicationRecord
  belongs_to :user
  belongs_to :messageable, polymorphic: true

  after_create_commit :broadcast_creation
  after_destroy_commit :broadcast_destroy

  private

  def broadcast_creation
    return unless self.messageable.present?

    Turbo::StreamsChannel.broadcast_append_to(
      self.messageable, #Room or Group instances
      target: "messages",
      partial: "messages/message",
      locals: { message: self }
    )
  end

  def broadcast_destroy
    broadcast_remove_to self.messageable if self.messageable.present?
  end
end
