require 'sinatra'
require 'dinosaurus'

Dinosaurus.configure do |config|
  config.api_key = 'b9ae339cfad1ed7ef86d37857c95e869'
end

get '/do' do
  redirect 'ipsum.html'
end

post '/process' do
  @topic = params['word']

  results = Dinosaurus.lookup(@topic)
  results2 = Dinosaurus.lookup(results["noun"]["syn"].sample)

  @nwords = params['nwords']
  @nsentences = params['nsentences']
  @npara = params['npara']
  x = @nwords.to_i
  y = @nsentences.to_i
  z = @npara.to_i

  @words = []
  @a_sentence = []
  @a_paragraph = []
  @content = []
  @contentfresh =[]

  results['noun']['syn'].each do |x|
    @words << x
  end
  results2['noun']['syn'].each do |y|
    @words << y
  end





#  z.times do
 #   a_paragraph =[]
  #  y.times do
#
 #     a_sentence = []
  #    x.times do
   #     a_sentence << @words.sample
    #  end
     # a_paragraph << a_sentence.to_s + ". "

#    end
 #   @content << a_paragraph.to_s
# end


z.times do

  @contentfresh = (1..y).map{(1..x).map{@words.sample}.join(" ")}.join(". ").to_s + "."
  @content << @contentfresh
end


  erb :view1
end