function merged = mergeMat(source, dest)

    % Por cada k  en source, verificar si está en dest

    nRows = height(source);

    for i=1:nRows
        rowInSource = source(i,:);
        currentKey = rowInSource.key;
        rowsInDest = dest(strcmp(dest.key,currentKey),:);
        n = height(rowsInDest);

        if n > 0
            % Si existe un registro, actualizar con valores de source

            rowsInDest.hu_1 = rowsInDest.hu_1 + rowInSource.hu_1;
            rowsInDest.hu_2 = rowsInDest.hu_2 + rowInSource.hu_2;
            rowsInDest.hu_3 = rowsInDest.hu_3 + rowInSource.hu_3;
            rowsInDest.hu_4 = rowsInDest.hu_4 + rowInSource.hu_4;
            rowsInDest.hu_5 = rowsInDest.hu_5 + rowInSource.hu_5;
            rowsInDest.hu_6 = rowsInDest.hu_6 + rowInSource.hu_6;
            rowsInDest.hu_7 = rowsInDest.hu_7 + rowInSource.hu_7;

            rowsInDest.Area = rowsInDest.Area + rowInSource.Area;
            rowsInDest.MajorAxisLength = rowsInDest.MajorAxisLength + rowInSource.MajorAxisLength;
            rowsInDest.MinorAxisLength = rowsInDest.MinorAxisLength + rowInSource.MinorAxisLength;

            rowsInDest.Count = rowsInDest.Count + rowInSource.Count;

            dest(strcmp(dest.key,currentKey),:) = rowsInDest;

            

        else
            % Otro, agregar nueva fila con valores
            dest = [dest;rowInSource];
        end

    end
    
    merged = dest;

end

