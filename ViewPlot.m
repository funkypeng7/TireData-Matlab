for i=1:25
    if(i==3)
        continue
    end
    load(sprintf('Source/B1965raw%d', i))
    plot(ET, NFY)
    input('')
end