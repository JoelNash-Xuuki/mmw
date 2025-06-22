module Score
  def build_score(global_options,options,args)
    sheetName = options[:filename]
    location = global_options[:n]
   
    command = "sheetbuilder #{sheetName} xuuki song-title vyvn patches/testPatch-3 test-song > /dev/null 2>&1 && rm #{sheetName}_* && mv #{sheetName}.ly #{location}"

    @output = `#{command}`

    if $?.exitstatus == 0                                                                                             
       puts "Success: .ly file built"                                                         
    else                                                                                                              
      raise RuntimeError, "Error: Score build failed."                                                            
    end
  end

  def render_score(global_options,options,args)
    lilypondFileName = options[:filename]
    location = global_options[:n]
    puts "#{location}/#{lilypondFileName}.ly"
    command = "lilypond -dmidi-extension=mid -o #{location} #{location}/#{lilypondFileName}.ly > /dev/null 2>&1"
    @output = `#{command}`
    if $?.exitstatus == 0                                                                                             
       puts "Success: Score rendering completed successfully."                                                         
    else                                                                                                              
      raise RuntimeError, "Error: Score rendering failed."                                                            
    end
  end
end
