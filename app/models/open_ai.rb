require 'json'

class OpenAi
  API_ENDPOINT = 'https://api.openai.com/v1/engines/davinci-codex/completions'

  attr_reader :client

  def initialize(client: OpenAI::Client.new)
    @client = client
  end

  def copy(keyword:, name:, voice: "startup")
    prompt = prepare_prompt(keyword:, name:, voice:)
    response = send_prompt(prompt)

    JSON.parse(safe_response(response).call.to_json, object_class: OpenStruct)
  end

  def safe_response(response)
    proc {
      $SAFE = 4
      eval(response["choices"][0]["text"])
    }
  end

  def prepare_prompt(keyword:, name:, voice:)
    "Please disregard all prior instructions. Utilize a seguinte estrutura de hash em ruby para escrever uma copy de landing page em pt-BR:
    ```ruby
    {
      'hero' => {
        'headline' => 'short headline to bring the most desired unique value proposition (creative)'
        'subheadline' => '1-2 short sentences subheadline',
        'cta' => 'strong short cta',
        'testimonial' => {
          'name' => 'random author name for testimonal',
          'testimonial' => 'short emotional testimonial that solved main pain'
        }
      },
      'benefits' => [{
        'headline' => 'compelling headline for the main benefit',
        'subheadline' => '1-2 short sentences subheadline for main benefit'
      }, {
        'headline' => 'compelling headline for the second main benefit',
        'subheadline' => '1-2 short sentences subheadline for second main benefit'
      }],
      'cta' => {
        'headline' => 'compelling headline for the main cta',
        'subheadline' => 'subheadline for main cta',
        'cta' => 'strong and urgent cta label for button'
      }
    }
    ```
    
    instruções extras:
    1. exemplos de headlines:
      - Rent people's homes. Experience a city like a true local
      - Unlock the potential of your business with Analyzr
      - Get your buildings up in no time
      - Get the justice you deserve with LawWise
      - Find the perfect smile with ImplantClinix
    2. exemplos de subheadlines:
      - AI PageFactory's intelligent system will create great landing pages for you in minutes. Save time and energy creating pages without any coding experience.
      - AI PageFactory allows you to automate and customize pages easily. Spend less time managing and more time focusing on your business.
      - FitFemme offers expert advice and customized plans tailored to help you reach your health and fitness goals.
      - With FitFemme, you can find the perfect balance between diet, exercise, and healthy lifestyle habits that work for you.
      - Get back your smile and oral health with the power of dental implants.
      - Dental implants are the easiest way to fix tooth replacement. Implantor will help you find a dentist that can provide a painless, reliable solution.
      - With Implantor, you can save time and money by finding the perfect dentist who can offer a long-term solution to your dental needs.
      - With ImplantClinix, you can restore your smile and find the perfect fit for your teeth.
    3. exemplos de cta:
      - Start Building
      - Setup your account
      - Schedule a meeting
      - Find a Rental
      - Lets talk
    4. é importante também que os ganchos tenham uma pegada emocional.
    5. altere apenas o valor da hash em ruby

    Use os exemplos anteriores e as seguintes informações para escrever a copy:
    - Descrição: #{keyword}
    - Nome do produto/Serviço: #{name}
    - Tom de voz: #{voice}
    - Sua resposta deve vir formatada em um objeto (substitua os valores da estrutura citada)".squish
  end

  def send_prompt(prompt)
    client.completions(
      parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          temperature: 0.6,
          max_tokens: 1000
      }
    )
  end
end