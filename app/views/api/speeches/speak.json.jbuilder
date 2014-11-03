json.origin @sentence.origin_sentence
json.fix @sentence.fixture_sentence
json.analyze_result do
  json.merge!(@collected_data)
end