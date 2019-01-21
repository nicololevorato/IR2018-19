rprec=ones(50,4);
map=ones(50,4);
p10=ones(50,4);
for c =1:4
    eval = fopen(strcat('eval', num2str(c),'.txt')); % open the file
    evalArray = textscan(eval,'%s %s %s');
    fclose(eval);
    j=1;
    x=1;
    y=1;
    for i = 1:length(evalArray{1,1})
        if (strcmp('Rprec',evalArray{1,1}{i,1}) & not(strcmp('all',evalArray{1,2}{i,1})))
            rprec(j,c) = str2double(evalArray{1,3}{i,1});
            j=j+1;
        end
        if (strcmp('map',evalArray{1,1}{i,1}) & not(strcmp('all',evalArray{1,2}{i,1})))
            map(x,c) = str2double(evalArray{1,3}{i,1});
            x=x+1;
        end
        if (strcmp('P_10',evalArray{1,1}{i,1}) & not(strcmp('all',evalArray{1,2}{i,1})))
            p10(y,c) = str2double(evalArray{1,3}{i,1});
            y=y+1;
        end
    end
end
runID = {'BM25_PS', 'BM25_PS_ST', 'TF_IDF', 'TF_IDF_PS_ST'};
save('data.mat','p10','map','rprec','runID');

