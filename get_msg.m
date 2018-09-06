function msg = get_msg(filename)
    msg = fileread(filename);
%     fileId = fopen(filename, 'r');
%     msg = fscanf(fileId, '%s');
%     fclose(fileId);
end