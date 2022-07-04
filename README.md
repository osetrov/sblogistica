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