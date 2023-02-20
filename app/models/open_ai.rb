require 'net/http'
require 'uri'
require 'json'

class OpenAi
  API_ENDPOINT = 'https://api.openai.com/v1/engines/davinci-codex/completions'

  attr_reader :client

  def initialize(client: OpenAI::Client.new)
    @client = client
  end

  def copy(keyword:, name:, voice: "amigável e profissional")
    prompt = prepare_prompt(keyword:, name:, voice:)
    send_prompt(prompt)
  end

  def prepare_prompt(keyword:, name:, voice:)
    "Utilize a seguinte estrutura para escrever uma copy de landing page em pt-BR:
    - Hero section:
      - Compelling headline que enfatizam minha UVP (unique value proposition)
      - Subheadline
      - forte e motivacional CTA
    - Main Benefit
      - Compelling Headline
      - Subheadline
    - Secondary Main Benefit
      - Compelling headline
      - Subheadline
    - CTA Section
      - Title
      - Subheadline
      - CTA
    
    instruções extras:
    - é importante que cada subheadline seja escrita em 1 ou 2 sentenças curtas (14-20 palavras).
      - Exemplos de subheadlines:
        - AI PageFactory's intelligent system will create great landing pages for you in minutes. Save time and energy creating pages without any coding experience.
        - AI PageFactory allows you to automate and customize pages easily. Spend less time managing and more time focusing on your business.
        - FitFemme offers expert advice and customized plans tailored to help you reach your health and fitness goals.
        - With FitFemme, you can find the perfect balance between diet, exercise, and healthy lifestyle habits that work for you.
        - Get back your smile and oral health with the power of dental implants.
        - Dental implants are the easiest way to fix tooth replacement. Implantor will help you find a dentist that can provide a painless, reliable solution.
        - With Implantor, you can save time and money by finding the perfect dentist who can offer a long-term solution to your dental needs.
    - é importante também que os ganchos tenham uma pegada emocional.
    - responda em formato de JSON com máximo de 1000 caracteres.
    
    Use as seguintes informações para escrever a copy:
    - Descrição: #{keyword}
    - Nome do produto/Serviço: #{name}
    - Tom de voz: #{voice}".squish
  end

  def send_prompt(prompt)
    client.completions(
      parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          max_tokens: 1000
      }
    )
  end
end