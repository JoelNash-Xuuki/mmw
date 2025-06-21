module Score
  def build_score(global_options,options,args)
    puts "score command to build ly file"
    sheetName = args.first
    command = "sheetbuilder Track-10 xuuki song-title vyvn patches/testPatch-3 test-song > /dev/null 2>&1 && rm Track-10_*"
    # command = "lilypond -dmidi-extension=mid -o /tmp/My-Project #{lilypondFileName} > /dev/null 2>&1"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: .ly file built"                                                         
    else                                                                                                              
      raise RuntimeError, "Error: Score build failed."                                                            
    end
  end

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
