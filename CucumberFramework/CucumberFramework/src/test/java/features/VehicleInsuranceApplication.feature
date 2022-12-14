Feature: Coletar dados para gerar proposta de seguro

  @VehicleInsurance @VehicleData
  Scenario Outline: Formulário de dados do veículo funciona corretamente

    Given usuário acessou página do formulário de dados do veículo
    When usuário selecionar <make> marca do veículo
    And usuário informar <enginePerformance> desempenho do motor
    And usuário informar <dateOfManufacture> data de fabricação
    And usuário selecionar <numberOfSeats> número de bancos
    And usuário selecionar <fuelType> tipo de combustível
    And usuário informar <listPrice> preço listado
    And usuário informar <licensePlateNumber> número da placa
    And usuário informar <annualMileage> quilometragem
    And usuário clicar no botão next da página de dados do veículo
    Then usuário será redirecionado <redirect> para formulário de dados do assegurado

    Examples:
      |TC|make|enginePerformance|dateOfManufacture|numberOfSeats|fuelType|listPrice|licensePlateNumber|annualMileage|redirect|
      |1|valor válido|1|hoje|valor válido|valor válido|500|abcde1|100|true|
      |2|- please select -|1|-50 anos|valor válido|valor válido|500|abcde|100|false|
      |3|- please select -|2000|dia anterior|- please select -|- please select -|100000|abcde|10000|false|
      |4|- please select -|0|hoje|valor válido|valor válido|0|abcde1|100000|false|
      |5|- please select -|-1|amanhã|- please select -|- please select -|499|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|99|false|
      |6|- please select -|2001|+50 anos|valor válido|valor válido|100001|ab!@/|100001|false|
      |7|- please select -|153.245.165|ddMMaaaa|- please select -|- please select -|-500|null|0|false|
      |8|- please select -|teste|MM/dd/aaaa|valor válido|valor válido|100.425.111|abcde|-1000|false|
      |9|valor válido|1|dia anterior|valor válido|- please select -|100001|null|-1000|false|
      |10|valor válido|2000|hoje|- please select -|valor válido|-500|abcde|null|false|
      |11|valor válido|0|amanhã|valor válido|- please select -|100.425.111|abcde|null|false|
      |12|valor válido|-1|+50 anos|- please select -|valor válido|teste|null|100|false|
      |13|valor válido|2001|ddMMaaaa|valor válido|- please select -|null|abcde|10000|false|
      |14|valor válido|153.245.165|MM/dd/aaaa|- please select -|- please select -|500|abcde|100000|false|
      |15|valor válido|teste|null|- please select -|valor válido|100000|abcde1|99|false|
      |16|valor válido|null|null|valor válido|- please select -|0|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|100001|false|
      |17|valor válido|null|-50 anos|- please select -|valor válido|499|ab!@/|0|false|
      |18|- please select -|2000|amanhã|- please select -|- please select -|500|abcde1|100001|false|
      |19|- please select -|0|+50 anos|valor válido|- please select -|100000|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|0|false|
      |20|- please select -|-1|ddMMaaaa|- please select -|valor válido|0|ab!@/|-1000|false|
      |21|- please select -|2001|MM/dd/aaaa|- please select -|- please select -|499|null|null|false|
      |22|- please select -|153.245.165|null|valor válido|valor válido|100001|abcde|null|false|
      |23|- please select -|teste|null|- please select -|- please select -|-500|abcde|100|false|
      |24|- please select -|null|-50 anos|valor válido|valor válido|100.425.111|null|10000|false|
      |25|- please select -|null|dia anterior|- please select -|- please select -|teste|abcde|100000|false|
      |26|- please select -|1|hoje|valor válido|valor válido|null|abcde|99|false|
      |27|valor válido|0|ddMMaaaa|- please select -|valor válido|-500|null|100000|false|
      |28|valor válido|-1|MM/dd/aaaa|valor válido|- please select -|100.425.111|abcde|99|false|
      |29|valor válido|2001|null|- please select -|valor válido|teste|abcde|100001|false|
      |30|valor válido|153.245.165|null|valor válido|- please select -|null|abcde1|0|false|
      |31|valor válido|teste|-50 anos|- please select -|valor válido|500|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|-1000|false|
      |32|valor válido|null|dia anterior|valor válido|- please select -|100000|ab!@/|null|false|
      |33|valor válido|1|amanhã|valor válido|valor válido|499|abcde|100|false|
      |34|valor válido|2000|+50 anos|- please select -|- please select -|100001|abcde|10000|false|
      |35|- please select -|-1|null|valor válido|valor válido|100000|null|100|false|
      |36|- please select -|2001|null|- please select -|- please select -|0|abcde|10000|false|
      |37|- please select -|153.245.165|-50 anos|valor válido|- please select -|499|abcde|100000|false|
      |38|- please select -|teste|dia anterior|- please select -|valor válido|100001|null|99|false|
      |39|- please select -|null|hoje|valor válido|- please select -|-500|abcde|100001|false|
      |40|- please select -|null|amanhã|- please select -|valor válido|100.425.111|abcde|0|false|
      |41|- please select -|1|+50 anos|- please select -|- please select -|teste|abcde1|-1000|false|
      |42|- please select -|2000|ddMMaaaa|valor válido|valor válido|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|false|
      |43|- please select -|0|MM/dd/aaaa|- please select -|- please select -|500|ab!@/|null|false|
      |44|valor válido|2001|-50 anos|- please select -|- please select -|100.425.111|abcde1|null|false|
      |45|valor válido|153.245.165|dia anterior|valor válido|valor válido|teste|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|false|
      |46|valor válido|teste|hoje|- please select -|- please select -|null|ab!@/|100|false|
      |47|valor válido|null|amanhã|- please select -|valor válido|500|null|10000|false|
      |48|valor válido|null|+50 anos|valor válido|- please select -|100000|abcde|100000|false|
      |49|valor válido|1|ddMMaaaa|- please select -|valor válido|0|abcde|99|false|
      |50|valor válido|2000|MM/dd/aaaa|valor válido|- please select -|499|null|100001|false|
      |51|valor válido|0|null|- please select -|- please select -|100001|abcde|0|false|
      |52|valor válido|-1|null|valor válido|valor válido|-500|abcde|-1000|false|
      |53|- please select -|153.245.165|hoje|- please select -|- please select -|0|null|0|false|
      |54|- please select -|teste|amanhã|valor válido|valor válido|499|abcde|-1000|false|
      |55|- please select -|null|+50 anos|- please select -|- please select -|100001|abcde|null|false|
      |56|- please select -|null|ddMMaaaa|valor válido|- please select -|-500|abcde1|null|false|
      |57|- please select -|1|MM/dd/aaaa|- please select -|valor válido|100.425.111|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|100|false|
      |58|- please select -|2000|null|valor válido|- please select -|teste|ab!@/|10000|false|
      |59|- please select -|0|null|- please select -|valor válido|null|null|100000|false|
      |60|- please select -|-1|-50 anos|valor válido|- please select -|500|abcde|99|false|
      |61|- please select -|2001|dia anterior|- please select -|valor válido|100000|abcde|100001|false|
      |62|valor válido|teste|+50 anos|valor válido|valor válido|teste|null|99|false|
      |63|valor válido|null|ddMMaaaa|- please select -|- please select -|null|abcde|100001|false|
      |64|valor válido|null|MM/dd/aaaa|valor válido|valor válido|500|abcde|0|false|
      |65|valor válido|1|null|- please select -|- please select -|100000|null|-1000|false|
      |66|valor válido|2000|null|valor válido|valor válido|0|abcde|null|false|
      |67|valor válido|0|-50 anos|- please select -|- please select -|499|abcde|null|false|
      |68|valor válido|-1|dia anterior|- please select -|valor válido|100001|abcde1|100|false|
      |69|valor válido|2001|hoje|valor válido|- please select -|-500|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|10000|false|
      |70|valor válido|153.245.165|amanhã|- please select -|- please select -|100.425.111|ab!@/|100000|false|
      |71|- please select -|null|MM/dd/aaaa|- please select -|valor válido|499|abcde1|10000|false|
      |72|- please select -|null|null|valor válido|- please select -|100001|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|100000|false|
      |73|- please select -|1|null|- please select -|valor válido|-500|ab!@/|99|false|
      |74|- please select -|2000|-50 anos|- please select -|- please select -|100.425.111|null|100001|false|
      |75|- please select -|0|dia anterior|valor válido|- please select -|teste|abcde|0|false|
      |76|- please select -|-1|hoje|- please select -|valor válido|null|abcde|-1000|false|
      |77|- please select -|2001|amanhã|valor válido|- please select -|500|null|null|false|
      |78|- please select -|153.245.165|+50 anos|- please select -|valor válido|100000|abcde|null|false|
      |79|- please select -|teste|ddMMaaaa|valor válido|- please select -|0|abcde|100|false|

  @VehicleInsurance @InsurantData
  Scenario Outline: Formulário de dados do responsável funciona corretamente

    Given usuário preencheu corretamente o formulário de dados do veículo
    When usuário informar <firstName> primeiro nome
    And usuário informar <lastName> último nome
    And usuário informar <dateOfBirth> data de nascimento
    And usuário selecionar <gender> gênero
    And usuário informar <streetAddress> logradouro
    And usuário selecionar <country> país
    And usuário informar <zipCode> ZIP code
    And usuário informar <city> cidade
    And usuário selecionar <occupation> ocupação
    And usuário selecionar <hobbies> seus hobbies
    And usuário informar <website> website
    And usuário realizar upload <picture> de foto
    And usuário clicar no botão next da página de dados do responsável
    Then usuário será redirecionado <redirect> para formulário de dados do produto

    Examples:
      |TC|firstName|lastName|dateOfBirth|gender|streetAddress|country|zipCode|city|occupation|hobbies|website|picture|redirect|
      |1|Joao|Joao|20 anos|male|abc 123|valor válido|12345678|abc|valor válido|1 seleção|www.google.com|.jpg 5 MB|true|
      |2|null|João|20 anos|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|12345678|abc|valor válido|null|www.google.com|.mp4|false|
      |3|null|Joao|18 anos|male|12345|- please select -|123456789|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1 seleção|https://www.google.com.br|.jpg 5 MB|false|
      |4|null|12345|17 anos|female|abc 123|valor válido|abcd|12345|valor válido|todas seleções|12345|.jpg 100 MB|false|
      |5|null|Joao@|hoje|null|null|- please select -|1234567.8|abcd@!|- please select -|null|abcd@!|null|false|
      |6|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|ddMMaaaa|male|aa|valor válido|null|null|valor válido|1 seleção|null|.pdf|false|
      |7|a|a|70 anos|null|12345|valor válido|1234567.8|null|- please select -|null|www.google.com|null|false|
      |8|a|Mi|20 anos|male|abc 123|- please select -|null|a|valor válido|1 seleção|null|.pdf|false|
      |9|a|João|18 anos|female|null|valor válido|123|ab|- please select -|null|a|.csv|false|
      |10|a|Joao|17 anos|null|aa|- please select -|1234|abc|- please select -|1 seleção|google.com|.mp4|false|
      |11|a|12345|hoje|male|abc|valor válido|12345678|null|valor válido|todas seleções|www.google.com|.jpg 5 MB|false|
      |12|a|Joao@|ddMMaaaa|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|null|a|- please select -|null|https://www.google.com.br|.jpg 100 MB|false|
      |13|a|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|MM/dd/aaaa|null|12345|- please select -|123|ab|valor válido|1 seleção|12345|null|false|
      |14|a|Mi|null|male|abc|valor válido|123456789|12345|- please select -|1 seleção|a|.mp4|false|
      |15|a|null|71 anos|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|abcd|abcd@!|valor válido|todas seleções|google.com|.jpg 5 MB|false|
      |16|Mi|Mi|18 anos|null|abc|- please select -|123|abc|valor válido|1 seleção|google.com|null|false|
      |17|Mi|João|17 anos|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1234|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|todas seleções|www.google.com|.pdf|false|
      |18|Mi|Joao|hoje|female|12345|valor válido|12345678|12345|valor válido|null|null|.csv|false|
      |19|Mi|12345|ddMMaaaa|null|null|- please select -|123456789|abcd@!|- please select -|1 seleção|a|.mp4|false|
      |20|Mi|Joao@|MM/dd/aaaa|male|aa|valor válido|abcd|null|valor válido|null|google.com|.jpg 5 MB|false|
      |21|Mi|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|null|abc|- please select -|1234567.8|a|- please select -|1 seleção|www.google.com|.jpg 100 MB|false|
      |22|Mi|null|71 anos|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|null|ab|- please select -|todas seleções|https://www.google.com.br|null|false|
      |23|Mi|a|null|female|12345|- please select -|123|abc|valor válido|null|12345|.pdf|false|
      |24|Mi|Mi|71 anos|null|abc 123|valor válido|1234|null|- please select -|1 seleção|abcd@!|.csv|false|
      |25|Mi|null|70 anos|male|null|- please select -|12345678|a|valor válido|todas seleções|null|.mp4|false|
      |26|Mi|a|20 anos|female|aa|valor válido|null|ab|- please select -|null|a|.jpg 5 MB|false|
      |27|João|João|hoje|null|aa|- please select -|null|abc|- please select -|todas seleções|a|null|false|
      |28|João|Joao|ddMMaaaa|male|abc|valor válido|123|null|valor válido|null|google.com|.pdf|false|
      |29|João|12345|MM/dd/aaaa|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1234|a|- please select -|1 seleção|www.google.com|.csv|false|
      |30|João|Joao@|null|male|12345|valor válido|12345678|ab|valor válido|todas seleções|null|.mp4|false|
      |31|João|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|71 anos|female|abc 123|- please select -|null|abc|- please select -|null|a|.jpg 5 MB|false|
      |32|João|null|null|null|null|valor válido|123|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|1 seleção|google.com|.jpg 100 MB|false|
      |33|João|a|71 anos|male|aa|- please select -|1234|12345|- please select -|null|www.google.com|null|false|
      |34|João|Mi|70 anos|female|abc|- please select -|12345678|abcd@!|valor válido|1 seleção|https://www.google.com.br|.pdf|false|
      |35|João|null|20 anos|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|123456789|null|- please select -|todas seleções|12345|.csv|false|
      |36|João|a|18 anos|male|12345|- please select -|abcd|a|- please select -|null|abcd@!|.mp4|false|
      |37|João|Mi|17 anos|female|null|valor válido|1234567.8|ab|valor válido|1 seleção|null|.jpg 5 MB|false|
      |38|Joao|Joao|MM/dd/aaaa|male|abc 123|valor válido|1234|abcd@!|- please select -|null|null|null|false|
      |39|Joao|12345|null|female|null|- please select -|12345678|null|- please select -|1 seleção|a|.pdf|false|
      |40|Joao|Joao@|71 anos|null|aa|- please select -|123456789|a|valor válido|todas seleções|google.com|.csv|false|
      |41|Joao|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|male|abc|valor válido|abcd|ab|- please select -|null|www.google.com|.mp4|false|
      |42|Joao|null|71 anos|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1234567.8|abc|valor válido|1 seleção|null|.jpg 5 MB|false|
      |43|Joao|a|70 anos|null|12345|valor válido|null|null|- please select -|todas seleções|a|.jpg 100 MB|false|
      |44|Joao|Mi|20 anos|male|null|- please select -|123|a|valor válido|null|google.com|null|false|
      |45|Joao|null|18 anos|female|aa|valor válido|1234|ab|- please select -|1 seleção|www.google.com|.pdf|false|
      |46|Joao|a|17 anos|null|abc|- please select -|12345678|abc|valor válido|null|https://www.google.com.br|.csv|false|
      |47|Joao|Mi|hoje|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1 seleção|12345|.mp4|false|
      |48|Joao|João|ddMMaaaa|null|12345|- please select -|123|12345|valor válido|todas seleções|abcd@!|.jpg 5 MB|false|
      |49|12345|12345|71 anos|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|123|ab|valor válido|1 seleção|abcd@!|null|false|
      |50|12345|Joao@|null|female|12345|- please select -|1234|abc|- please select -|todas seleções|null|.pdf|false|
      |51|12345|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|71 anos|null|null|valor válido|12345678|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|null|a|.csv|false|
      |52|12345|null|70 anos|male|aa|- please select -|null|12345|- please select -|1 seleção|google.com|.mp4|false|
      |53|12345|a|20 anos|female|abc|valor válido|123|abcd@!|- please select -|todas seleções|www.google.com|.jpg 5 MB|false|
      |54|12345|Mi|18 anos|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1234|null|valor válido|null|null|.jpg 100 MB|false|
      |55|12345|null|17 anos|male|12345|valor válido|12345678|a|- please select -|1 seleção|a|null|false|
      |56|12345|a|hoje|null|abc 123|- please select -|123456789|ab|valor válido|todas seleções|google.com|.pdf|false|
      |57|12345|Mi|ddMMaaaa|male|null|- please select -|abcd|abc|- please select -|null|www.google.com|.csv|false|
      |58|12345|João|MM/dd/aaaa|female|aa|valor válido|1234567.8|null|valor válido|1 seleção|https://www.google.com.br|.mp4|false|
      |59|12345|Joao|null|null|abc|- please select -|null|a|- please select -|null|12345|.jpg 5 MB|false|
      |60|Joao@|Joao@|71 anos|male|abc|- please select -|12345678|ab|- please select -|1 seleção|12345|null|false|
      |61|Joao@|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|70 anos|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|123456789|abc|valor válido|null|abcd@!|.pdf|false|
      |62|Joao@|null|20 anos|null|12345|- please select -|abcd|null|- please select -|1 seleção|null|.csv|false|
      |63|Joao@|a|18 anos|male|abc 123|- please select -|1234567.8|a|valor válido|todas seleções|a|.mp4|false|
      |64|Joao@|Mi|17 anos|null|null|valor válido|null|ab|- please select -|null|google.com|.jpg 5 MB|false|
      |65|Joao@|null|hoje|male|aa|- please select -|123|abc|valor válido|1 seleção|www.google.com|.jpg 100 MB|false|
      |66|Joao@|a|ddMMaaaa|female|abc|valor válido|1234|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|todas seleções|null|null|false|
      |67|Joao@|Mi|MM/dd/aaaa|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|12345678|12345|- please select -|null|a|.pdf|false|
      |68|Joao@|João|null|male|12345|valor válido|null|abcd@!|valor válido|1 seleção|google.com|.csv|false|
      |69|Joao@|Joao|71 anos|female|null|- please select -|123|null|- please select -|todas seleções|www.google.com|.mp4|false|
      |70|Joao@|12345|null|null|aa|valor válido|1234|a|valor válido|null|https://www.google.com.br|.jpg 5 MB|false|
      |71|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|20 anos|male|null|- please select -|1234|12345|valor válido|todas seleções|https://www.google.com.br|null|false|
      |72|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|18 anos|null|aa|valor válido|12345678|abcd@!|- please select -|null|12345|.pdf|false|
      |73|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|a|17 anos|male|abc|- please select -|null|null|valor válido|1 seleção|abcd@!|.csv|false|
      |74|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Mi|hoje|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|123|a|- please select -|null|null|.mp4|false|
      |75|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|ddMMaaaa|null|12345|- please select -|1234|ab|valor válido|1 seleção|a|.jpg 5 MB|false|
      |76|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|a|MM/dd/aaaa|male|null|valor válido|12345678|abc|- please select -|todas seleções|google.com|.jpg 100 MB|false|
      |77|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Mi|null|female|aa|- please select -|123456789|null|valor válido|null|www.google.com|null|false|
      |78|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|João|71 anos|null|abc|valor válido|abcd|a|- please select -|1 seleção|null|.pdf|false|
      |79|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Joao|null|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1234567.8|ab|valor válido|todas seleções|a|.csv|false|
      |80|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|12345|71 anos|female|12345|- please select -|null|abc|- please select -|null|google.com|.mp4|false|
      |81|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Joao@|70 anos|null|abc 123|valor válido|123|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|1 seleção|www.google.com|.jpg 5 MB|false|
      |82|null|null|17 anos|female|12345|valor válido|123456789|a|valor válido|null|www.google.com|null|false|
      |83|null|a|hoje|null|null|- please select -|abcd|ab|- please select -|1 seleção|https://www.google.com.br|.pdf|false|
      |84|null|Mi|ddMMaaaa|male|aa|valor válido|1234567.8|abc|- please select -|todas seleções|12345|.csv|false|
      |85|null|null|MM/dd/aaaa|female|abc|- please select -|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|null|abcd@!|.mp4|false|
      |86|null|Mi|71 anos|male|12345|valor válido|1234|abcd@!|valor válido|null|a|.jpg 100 MB|false|
      |87|null|João|null|female|abc 123|- please select -|12345678|null|- please select -|1 seleção|google.com|null|false|
      |88|null|12345|70 anos|male|aa|- please select -|123|ab|- please select -|null|null|.csv|false|
      |89|null|Joao@|20 anos|null|abc|valor válido|1234|abc|valor válido|1 seleção|a|.mp4|false|
      |90|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|18 anos|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|12345678|null|- please select -|todas seleções|google.com|.jpg 5 MB|false|
      |91|a|a|ddMMaaaa|female|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|12345678|a|- please select -|1 seleção|google.com|null|false|
      |92|a|null|null|male|abc 123|valor válido|123|abc|- please select -|null|https://www.google.com.br|.csv|false|
      |93|a|a|71 anos|female|null|- please select -|1234|null|valor válido|1 seleção|12345|.mp4|false|
      |94|a|Mi|null|null|aa|valor válido|12345678|a|- please select -|todas seleções|abcd@!|.jpg 5 MB|false|
      |95|a|João|71 anos|male|abc|- please select -|123456789|ab|- please select -|null|null|.jpg 100 MB|false|
      |96|a|Joao|70 anos|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|abcd|abc|valor válido|1 seleção|a|null|false|
      |97|a|12345|20 anos|male|12345|- please select -|1234567.8|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|null|google.com|.pdf|false|
      |98|a|Joao@|18 anos|female|null|valor válido|null|12345|valor válido|1 seleção|www.google.com|.csv|false|
      |99|a|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|17 anos|null|aa|- please select -|123|abcd@!|- please select -|todas seleções|null|.mp4|false|
      |100|a|null|hoje|male|abc|- please select -|1234|null|valor válido|null|a|.jpg 5 MB|false|
      |101|Mi|Mi|null|female|aa|- please select -|abcd|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|valor válido|todas seleções|a|null|false|
      |102|Mi|null|71 anos|null|abc|valor válido|1234567.8|12345|- please select -|null|google.com|.pdf|false|
      |103|Mi|a|null|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|null|abcd@!|valor válido|1 seleção|www.google.com|.csv|false|
      |104|Mi|Mi|71 anos|null|12345|valor válido|123|null|- please select -|todas seleções|https://www.google.com.br|.mp4|false|
      |105|Mi|João|70 anos|male|null|- please select -|1234|a|valor válido|null|12345|.jpg 5 MB|false|
      |106|Mi|Joao|20 anos|female|aa|- please select -|12345678|ab|- please select -|1 seleção|abcd@!|.jpg 100 MB|false|
      |107|Mi|12345|18 anos|null|abc|valor válido|null|abc|valor válido|todas seleções|null|null|false|
      |108|Mi|Joao@|17 anos|male|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|- please select -|123|null|- please select -|null|a|.pdf|false|
      |109|Mi|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|hoje|female|12345|valor válido|1234|a|- please select -|1 seleção|google.com|.csv|false|
      |110|Mi|null|ddMMaaaa|null|abc 123|- please select -|12345678|ab|valor válido|null|www.google.com|.mp4|false|
      |111|Mi|a|MM/dd/aaaa|male|null|valor válido|123456789|abc|- please select -|1 seleção|null|.jpg 5 MB|false|

  @VehicleInsurance @ProductData
  Scenario Outline: Formulário de dados do produto funciona corretamente

    Given usuário preencheu corretamente o formulário de dados do responsável
    When usuário informar <startDate> data de início
    And usuário selecionar <insuranceSum> valor do seguro
    And usuário selecionar <meritRating> avalição de mérito
    And usuário selecionar <damageInsurance> seguro de danos
    And usuário selecionar <optionalProducts> produtos opcionais
    And usuário selecionar <courtesyCar> carro de cortesia
    And usuário clicar no botão next da página de dados do produto
    Then usuário será redirecionado <redirect> para opções de preço

    Examples:
      |TC|startDate|insuranceSum|meritRating|damageInsurance|optionalProducts|courtesyCar|redirect|
      |1|1 mês no futuro|valor válido|valor válido|valor válido|1 valor|valor válido|true|
      |2|null|valor válido|valor válido|valor válido|null|valor válido|false|
      |3|null|- please select -|- please select -|- please select -|1 valor|- please select -|false|
      |4|null|valor válido|valor válido|valor válido|todos os valores|valor válido|false|
      |5|1 mês anterior|- please select -|valor válido|- please select -|1 valor|- please select -|false|
      |6|1 mês anterior|valor válido|- please select -|valor válido|todos os valores|valor válido|false|
      |7|1 mês anterior|- please select -|valor válido|- please select -|null|- please select -|false|
      |8|hoje|valor válido|valor válido|valor válido|null|valor válido|false|
      |9|hoje|- please select -|- please select -|- please select -|1 valor|- please select -|false|
      |10|hoje|valor válido|valor válido|valor válido|todos os valores|valor válido|false|
      |11|1 mês no futuro|- please select -|valor válido|- please select -|1 valor|- please select -|false|
      |12|1 mês no futuro|valor válido|- please select -|valor válido|todos os valores|valor válido|false|
      |13|1 mês no futuro|- please select -|valor válido|- please select -|null|- please select -|false|
      |14|30 dias no futuro|valor válido|valor válido|valor válido|null|valor válido|false|
      |15|30 dias no futuro|- please select -|- please select -|- please select -|1 valor|- please select -|false|
      |16|30 dias no futuro|valor válido|valor válido|valor válido|todos os valores|valor válido|false|
      |17|1 ano no futuro|valor válido|- please select -|valor válido|1 valor|valor válido|false|
      |18|1 ano no futuro|- please select -|valor válido|- please select -|todos os valores|- please select -|false|
      |19|1 ano no futuro|valor válido|- please select -|valor válido|null|valor válido|false|
      |20|1 ano no futuro|- please select -|valor válido|- please select -|1 valor|- please select -|false|
      |21|1 ano no futuro|valor válido|- please select -|valor válido|todos os valores|valor válido|false|
      |22|1 ano no futuro|- please select -|valor válido|- please select -|null|- please select -|false|
      |23|ddMMaaaa|- please select -|- please select -|- please select -|null|- please select -|false|
      |24|ddMMaaaa|valor válido|valor válido|valor válido|1 valor|valor válido|false|
      |25|ddMMaaaa|- please select -|- please select -|- please select -|todos os valores|- please select -|false|
      |26|ddMMaaaa|valor válido|valor válido|valor válido|null|valor válido|false|
      |27|ddMMaaaa|- please select -|- please select -|- please select -|1 valor|- please select -|false|
      |28|ddMMaaaa|valor válido|valor válido|valor válido|todos os valores|valor válido|false|
      |29|MM/dd/aaaa|valor válido|- please select -|valor válido|1 valor|valor válido|false|
      |30|MM/dd/aaaa|- please select -|valor válido|- please select -|todos os valores|- please select -|false|
      |31|MM/dd/aaaa|valor válido|- please select -|valor válido|null|valor válido|false|
      |32|MM/dd/aaaa|- please select -|valor válido|- please select -|1 valor|- please select -|false|
      |33|MM/dd/aaaa|valor válido|- please select -|valor válido|todos os valores|valor válido|false|
      |34|MM/dd/aaaa|- please select -|valor válido|- please select -|null|- please select -|false|

  @VehicleInsurance @PriceOption
  Scenario Outline: Formulário de dados do produto funciona corretamente

    Given usuário preencheu corretamente o formulário de dados do produto
    When usuário selecionar <option> opção de plano
    And usuário clicar para visualizar proposta
    And usuário clicar para baixar proposta
    And usuário clicar no botão next da página de opção de preço
    Then usuário será redirecionado <redirect> para enviar proposta

    Examples:
    |TC|option|redirect|
    |1 |silver|true    |
    |2 |gold  |true    |
    |3 |platinum|true  |
    |4 |ultimate|true  |


  @VehicleInsurance @SendQuote
  Scenario Outline: Envio da proposta funciona corretamente

    Given usuário selecionar corretamente opção de preço
    When usuário informar <email> email
    And usuário informar <phone> telefone
    And usuário informar <username> nome de usuário
    And usuário informar <password> senha
    And usuário informar <confirmPassword> senha <password> novamente
    And usuário informar <comments> comentários
    And usuário clicar no botão send
    Then proposta <status> será enviada

    Examples:
      |TC|email|phone|username|password|confirmPassword|comments|status|
      |1|teste@gmail.com|12345678901234|abcd|Abcde1|igual|abc|true|
      |2|null|1|abc|abcde|igual|abc|false|
      |3|null|1234567|abcd|abcdef|diferente|abcd@<>|false|
      |4|null|12345678|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1|null|null|false|
      |5|null|12345678901234|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1|igual|abc|false|
      |6|null|123456789012340|1abcd|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|diferente|abcd@<>|false|
      |7|null|1234567890123500|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1!@-.|null|null|false|
      |8|null|abcd|abcd1_.|null|igual|abc|false|
      |9|a@gmail.com|1|abcd|abcde1|igual|abcd@<>|false|
      |10|a@gmail.com|1234567|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1|diferente|null|false|
      |11|a@gmail.com|12345678|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|abc|false|
      |12|a@gmail.com|12345678901234|1abcd|Abcde1!@-.|igual|abcd@<>|false|
      |13|a@gmail.com|123456789012340|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|diferente|null|false|
      |14|a@gmail.com|1234567890123500|abcd1_.|abcde|null|abc|false|
      |15|a@gmail.com|abcd|abcd1_..|null|igual|abcd@<>|false|
      |16|a@gmail.com|null|null|abcde|diferente|null|false|
      |17|a@gmail.com|null|abc|abcdef|null|abc|false|
      |18|teste@gmail.com|1234567|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1!@-.|diferente|abc|false|
      |19|teste@gmail.com|12345678|1abcd|null|null|abcd@<>|false|
      |20|teste@gmail.com|12345678901234|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|igual|null|false|
      |21|teste@gmail.com|123456789012340|abcd1_.|null|diferente|abc|false|
      |22|teste@gmail.com|1234567890123500|abcd1_..|abcde|null|abcd@<>|false|
      |23|teste@gmail.com|abcd|null|abcdef|igual|null|false|
      |24|teste@gmail.com|null|abc|abcde1|diferente|abc|false|
      |25|teste@gmail.com|null|abcd|Abcde1|null|abcd@<>|false|
      |26|teste@gmail.com|1|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|igual|null|false|
      |27|teste<>!;;@gmail.com|12345678|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|null|null|false|
      |28|teste<>!;;@gmail.com|12345678901234|abcd1_.|abcde|igual|abc|false|
      |29|teste<>!;;@gmail.com|123456789012340|abcd1_..|abcdef|diferente|abcd@<>|false|
      |30|teste<>!;;@gmail.com|1234567890123500|null|abcde1|null|null|false|
      |31|teste<>!;;@gmail.com|abcd|abc|Abcde1|igual|abc|false|
      |32|teste<>!;;@gmail.com|null|abcd|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|diferente|abcd@<>|false|
      |33|teste<>!;;@gmail.com|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1!@-.|null|null|false|
      |34|teste<>!;;@gmail.com|1|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|igual|abc|false|
      |35|teste<>!;;@gmail.com|1234567|1abcd|abcde|diferente|abcd@<>|false|
      |36|teste@gmail|12345678901234|abcd1_..|abcde1|igual|abcd@<>|false|
      |37|teste@gmail|123456789012340|null|Abcde1|diferente|null|false|
      |38|teste@gmail|1234567890123500|abc|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|abc|false|
      |39|teste@gmail|abcd|abcd|Abcde1!@-.|igual|abcd@<>|false|
      |40|teste@gmail|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|diferente|null|false|
      |41|teste@gmail|null|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|null|abc|false|
      |42|teste@gmail|1|1abcd|null|igual|abcd@<>|false|
      |43|teste@gmail|1234567|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|diferente|null|false|
      |44|teste@gmail|12345678|abcd1_.|abcdef|null|abc|false|
      |45|null|123456789012340|abc|Abcde1!@-.|diferente|abc|false|
      |46|null|1234567890123500|abcd|null|null|abcd@<>|false|
      |47|null|abcd|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|igual|null|false|
      |48|null|null|1abcd|abcde|null|abcd@<>|false|
      |49|null|1|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcdef|igual|null|false|
      |50|null|1234567|abcd1_.|abcde1|diferente|abc|false|
      |51|null|12345678|abcd1_..|Abcde1|null|abcd@<>|false|
      |52|null|12345678901234|null|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|igual|null|false|
      |53|a@gmail.com|1234567890123500|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|null|null|false|
      |54|a@gmail.com|abcd|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|igual|abc|false|
      |55|a@gmail.com|null|1abcd|abcdef|diferente|abcd@<>|false|
      |56|a@gmail.com|null|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1|null|null|false|
      |57|a@gmail.com|1|abcd1_.|Abcde1|igual|abc|false|
      |58|a@gmail.com|1234567|abcd1_..|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|diferente|abcd@<>|false|
      |59|a@gmail.com|12345678|null|Abcde1!@-.|null|null|false|
      |60|a@gmail.com|12345678901234|abc|null|igual|abc|false|
      |61|a@gmail.com|123456789012340|abcd|abcde|diferente|abcd@<>|false|
      |62|teste@gmail.com|abcd|1abcd|abcde1|igual|abcd@<>|false|
      |63|teste@gmail.com|null|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|Abcde1|diferente|null|false|
      |64|teste@gmail.com|null|abcd1_.|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|null|abc|false|
      |65|teste@gmail.com|1|abcd1_..|Abcde1!@-.|igual|abcd@<>|false|
      |66|teste@gmail.com|1234567|null|null|diferente|null|false|
      |67|teste@gmail.com|12345678|abc|abcde|null|abc|false|
      |68|teste@gmail.com|12345678901234|abcd|null|igual|abcd@<>|false|
      |69|teste@gmail.com|123456789012340|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde|diferente|null|false|
      |70|teste@gmail.com|1234567890123500|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcdef|null|abc|false|
      |71|teste<>!;;@gmail.com|null|abcd1_.|Abcde1!@-.|diferente|abc|false|
      |72|teste<>!;;@gmail.com|null|abcd1_..|null|null|abcd@<>|false|
      |73|teste<>!;;@gmail.com|1|null|abcde|igual|null|false|
      |74|teste<>!;;@gmail.com|1234567|abc|null|diferente|abc|false|
      |75|teste<>!;;@gmail.com|12345678|abcd|abcde|null|abcd@<>|false|
      |76|teste<>!;;@gmail.com|12345678901234|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcdef|igual|null|false|
      |77|teste<>!;;@gmail.com|123456789012340|aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1|diferente|abc|false|
      |78|teste<>!;;@gmail.com|1234567890123500|1abcd|Abcde1|null|abcd@<>|false|
      |79|teste<>!;;@gmail.com|abcd|1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|abcde1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|igual|null|false|


