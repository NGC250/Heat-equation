fig = figure('Visible','off');
parfor i=0:200
    read_name = sprintf("../data/status/bath%d.dat" , i);
    save_name = sprintf("../data/images/bath%d.png" , i);

    data = readmatrix(read_name);

    imagesc(data);
    colorbar();
    saveas(fig , save_name);
    clf(fig);
end
close(fig)