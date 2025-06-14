module Score
  def render_score(global_options,options,args)
    puts "score command ran from class"
    lilypondFileName = args.first
    command = "lilypond -dmidi-extension=mid -o /tmp/My-Project #{lilypondFileName} > /dev/null 2>&1"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: Score rendering completed successfully."                                                         
    else                                                                                                              
      raise RuntimeError, "Error: Score rendering failed."                                                            
    end
  end
end
