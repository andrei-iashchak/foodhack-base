require 'net/http'
class TelegramController < Telegram::Bot::UpdatesController
  # use callbacks like in any other controllers
  # around_action :with_locale

  # Every update can have one of: message, inline_query, chosen_inline_result,
  # callback_query, etc.
  # # Define method with same name to respond to this updates.
  def message(message)
    # message can be also accessed via instance method
    message == self.payload # true
    if message[:photo].present?
      link = I18n.t(:link, telegram_token: ENV["TELEGRAM_TOKEN"], file_id: message[:photo].last[:file_id])
      respond_with :message, text: link
    else
      recipt = Ingredient.includes(:recipts)
        .find_by(name: ['tomato'])
        .recipts.first
      respond_with :message, text: message.to_json
    end
    # respond_with :message, text: I18n.t(:recipt, name: recipt.name, link: recipt.link), parse_mode: 'Markdown'
  end

  # This basic methods receives commonly used params:
  #
  #   message(payload)
  #   inline_query(query, offset)
  #   chosen_inline_result(result_id, query)
  #   callback_query(data)

  # Define public methods to respond to commands.
  # Command arguments will be parsed and passed to the method.
  # Be sure to use splat args and default values to not get errors when
  # someone passed more or less arguments in the message.
  #
  # For some commands like /message or /123 method names should start with
  # `on_` to avoid conflicts.
  def start(data = nil, *)
    # do_smth_with(data)

    # There are `chat` & `from` shortcut methods.
    # For callback queries `chat` if taken from `message` when it's available.
    response = from ? "Привет #{from['username']}!" : 'Здарова!'
    # There is `respond_with` helper to set `chat_id` from received message:
    respond_with :message, text: response
    # `reply_with` also sets `reply_to_message_id`:
    # reply_with :photo, photo: File.open('party.jpg')
  end

  # private
  # def with_locale(&block)
  #   I18n.with_locale(locale_for_update, &block)
  # end

  # def locale_for_update
  #   if from
  #     # locale for user
  #   elsif chat
  #     # locale for chat
  #   end
  # end
end
