module Score
  def render_score(global_options,options,args)
    puts "score command ran from class"
    lilypondFileName = args.first
    command = "lilypond -dmidi-extension=mid #{lilypondFileName}"
    @output = `#{command}`
  end
end
