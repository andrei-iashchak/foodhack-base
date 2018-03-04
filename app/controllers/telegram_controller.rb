require 'net/http'
require 'rest-client'

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
      link = I18n.t(:get_link_path, telegram_token: ENV["TELEGRAM_TOKEN"], file_id: message[:photo].last[:file_id])
      response = RestClient.get link, content_type: :json
      cntnt = JSON.parse(response.body)
      if cntnt["result"].present?
        response = ask_nn(cntnt["result"]["file_path"])
        respond_with :message, text: response.to_json
        # recipt = Ingredient.includes(:recipts)
        #   .where(id: [response])
        #   .recipts.first
        # anwsers = I18n.t(:recipt, name: recipt.name, link: recipt.link), parse_mode: 'Markdown'
        # respond_with :message, text: anwsers || I18n.t(:fetching_error)
      else
        respond_with :message, text: I18n.t(:error_of_photo_downloading)
      end
    else
      respond_with :message, text: I18n.t(:please_send_photo)
    end

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
    response = from ? I18n.t(:welcome, username: from['username']) : 'Здарова!'
    respond_with :message, text: response
  end

  private

    def ask_nn(file_path)
      begin
        img_url = I18n.t(:get_file_path, telegram_token: ENV["TELEGRAM_TOKEN"], file_path: file_path)
        request = RestClient.get "http://recognition:5000/?url=#{img_url}", content_type: :json
        content = JSON.parse(request.body)["result"]
        # return [1,2,3,4,5]
      rescue
        return nil
      end
    end
    #
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
