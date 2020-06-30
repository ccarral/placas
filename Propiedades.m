function vec = Propiedades(R)
% Regresa un vector de propiedades en el siguiente orden:
% [ Hu1 hu2 hu3 hu4 hu5 hu6 hu7 Area MinorAxisLength MajorAxisLength]

  Hu = HuMom(R);
  props = regionprops(R,'Area', 'MinorAxisLength', 'MajorAxisLength','Centroid');
  
  vec = [Hu(1) Hu(2) Hu(3) Hu(4) Hu(5) Hu(6) Hu(7) props.Area props.MinorAxisLength props.MajorAxisLength props.Centroid(2)];

end

