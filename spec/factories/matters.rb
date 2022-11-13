# frozen_string_literal: true

FactoryBot.define do
  factory :matter do
    code { 'DSTZN' }
    title { 'Awesome matter' }
    text { 'A lot of words about awesome matter' }
    author { 'Ivan Ivanov' }
  end
end
