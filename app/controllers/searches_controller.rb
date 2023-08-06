class SearchesController < ApplicationController
  before_action :save_to_session_symptom, only: :select_age
  before_action :save_to_session_age, only: :select_breed
  before_action :save_to_session_breed, only: :search_results

  def select_symptom
    @symptoms = Symptom.all
    @symptoms_categories = Symptom.categories.keys.push
  end

  def select_age
    @age_ranges = Blog.age_ranges
  end

  def select_breed
    @breeds = Breed.all
  end

  def save_to_session_symptom
    session[:symptom_details] = params[:symptom_details]
  end

  def save_to_session_age
    session[:age_range] = I18n.t(params[:age_range]) if params[:age_range].present?
  end

  def save_to_session_breed
    session[:breed_name] = params[:breed_name]
  end

  require "openai"

  def search_results
    symptom = session[:symptom_details]
    age_range = session[:age_range]
    cat_breed = session[:breed_name]

    @blogs = Blog.ransack(symptoms_detail_eq_any: symptom).result(distinct: true).order(created_at: :desc)

    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
    response =
      client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "あなたは日本の獣医師です。" },
            { role: "system", content: "ユーザーは飼い猫の様子で気になることがあります。" },
            { role: "system", content: "飼い猫の気になる症状を伝えるので、関連する病気があれば教えてください。" },
            { role: "system", content: "あなたは提供された情報に基づき、関連する病気の病名を提供します。" },
            { role: "system", content: "あなたは情報提供のみを行ってください。獣医学的アドバイス、診断、治療、予防などを目的としていません。" },
            { role: "system", content: "また、ユーザーには提供する情報に基づいて医学的判断を下したり、何らかの行動（薬の服用など）を行ったり中止したりしないように伝えているので、そのような注意喚起は不要です。" },
            { role: "system", content: "「病名の箇条書きをお伝えいたしますが、あくまで参考情報として扱ってください。正確な診断は獣医師に任せるべきです。」という回答は不要です。" },
            { role: "system", content: "「箇条書き形式でお伝えします。ただし、具体的な診断は獣医師に相談することをお勧めします。」という回答は不要です。" },
            { role: "system", content: "情報は端的に、病名のみでお願いします。" },
            { role: "user", content: "#{symptom.join(", ")} 、これらの症状に総合して関連する猫の病気の病名を、関連度の高い順で箇条書き形式で教えてください。" },
            { role: "user", content: "年齢層: #{age_range}、猫種: #{cat_breed}、という条件を加えて関連度が高くなる病気があれば、病名を箇条書き形式で教えてください。" },
          ],
        },
      )

    @result = response.dig("choices", 0, "message", "content")

    session[:symptom_details] = nil
    session[:age_range] = nil
    session[:breed_name] = nil
  end
end
