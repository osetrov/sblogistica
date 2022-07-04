# Sblogistica

API wrapper для Сберлогистики [API](https://lk.sblogistica.ru/api/swagger-ui.html).

# <a name="install"></a> Установка

## Ruby
    $ gem install sblogistica
## Rails
добавьте в Gemfile:
gem 'sblogistica'

и запустите `bundle install`.

Затем:
rails g sblogistica:install

## <a name="using_rails"></a> Использование Rails

В файл `config/sblogistica.yml` вставьте ваши данные

```ruby
p Sblogistica::Request.ext.v1.warehouses.retrieve.body
# =>
#   {:anyAddressAllowed=>true,
#    :warehouses=>
#      [{:uuid=>"68d9713a-a647-4a85-ad96-9a5a6c2ff1f8",
#        :address=>
#          {:kladrSettlement=>"7800000000000",
#           :country=>"Россия",
#           :administrativeArea=>"г Санкт-Петербург",
#           :settlement=>"г Санкт-Петербург",
#           :street=>"ул Профессора Попова",
#           :house=>"37",
#           :apartment=>"611",
#           :postalCode=>"197136"},
#        :contactPersons=>[{:uuid=>"0b16c6bb-bd39-4e01-9e59-dfe89d8cba48", :name=>"***", :phone=>"***"}]}]}

```

```ruby
p Sblogistica::Request.no_auth.banks.suggest.create(body: {query: "044030704"}).body
#=> [{:name=>"Ф. ОПЕРУ БАНКА ВТБ (ПАО) В САНКТ-ПЕТЕРБУРГЕ", :bic=>"044030704", :inn=>"7702070139", :kpp=>"783543011", :correspondentAccount=>"30101810200000000704", :status=>"ACTIVE", :type=>"BANK_BRANCH"}]
```

```ruby
p Sblogistica::Request.sbl_tariff.api.clients.retrieve(params: {size: 1}).body
# =>
#   {:content=>
#      [{:id=>11,
#        :uuid=>"3f4b1c10-9fb6-9515-0630-9aadbcfbe16d",
#        :createdAt=>"10.01.2020 14:10",
#        :name=>"ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ \"СБЕРЛОГИСТИКА\"",
#        :phone=>"+79144172823",
#        :actualAddressMatchLegal=>false,
#        :inn=>"7736322345",
#        :kpp=>"773601001",
#        :corrAccountNumber=>"00000000000000000000",
#        :accountNumber=>"00000000000000000000",
#        :bic=>"000000000",
#        :passport=>nil,
#        :snils=>nil,
#        :contactPerson=>nil,
#        :ndsRate=>20,
#        :organizationEmail=>nil,
#        :contactEmail=>nil,
#        :contactPhone=>nil,
#        :bankName=>"00000000000000000000",
#        :ceo=>nil,
#        :siteUrl=>nil,
#        :ogrn=>"1197746348458",
#        :ogrnip=>nil,
#        :useCostCenters=>false,
#        :status=>"ACTIVE",
#        :statusLastUpdate=>"2020-01-10T14:10:00",
#        :statusComment=>"+",
#        :managerUsername=>"Kirsanov.M.A",
#        :managerName=>"Кирсанов М.А.",
#        :region=>"г Москва",
#        :registrationType=>"LK_REGISTRATION",
#        :useOnlineBalance=>true,
#        :legalForm=>"OTHER"}],
#    :pageable=>{:sort=>{:sorted=>false, :unsorted=>true, :empty=>true}, :pageNumber=>0, :pageSize=>1, :offset=>0, :paged=>true, :unpaged=>false},
#    :last=>false,
#    :totalElements=>20756,
#    :totalPages=>20756,
#    :sort=>{:sorted=>false, :unsorted=>true, :empty=>true},
#    :numberOfElements=>1,
#    :first=>true,
#    :size=>1,
#    :number=>0,
#    :empty=>false}
```
